<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Beer;
use App\Entity\BeerScoreComment;
use App\Form\BeerType;
use App\Repository\BeerRepository;
use App\Repository\BeerScoreCommentRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Contracts\Translation\TranslatorInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/beer")
 */
class BeerController extends AbstractController
{
    /**
     * @Route("/add")
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function add(Request $request, EntityManagerInterface $entityManager): Response
    {
        $beer = new Beer;
        $beer->setUser($this->getUser());

        // Creation du formulaire et envoi de l'entitée $beer
        $form = $this->createForm(BeerType::class, $beer);

         // Insérer l'objet Request dans le formulaire pour obtenir les données $_POST
         $form->handleRequest($request);

         // Test si le formulaire a bien été envoyé ET s'il est valide
         if ($form->isSubmitted() && $form->isValid()) {
             // Persiste l'objet Beer, indique à doctrine qu'on va ajouter un objet (ne fait pas de requête INSERT)
             $entityManager->persist($beer);
 
             // Enregistrement de l'objet (exécute la requête)
             $entityManager->flush();
 
             // Générer un message flash
            //  $this->addFlash('success', $translator->trans('beer.add.success', ['%title%' => $beer->getTitle()]));
 
             // redirection
             return $this->redirectToRoute('app_beer_index');
         }

        // Ne pas oublier de créer le fichier twig
        return $this->render('beer/add.html.twig', [
        'beer' => $beer,
        'form' => $form->createView(),
        ]);


    }

 

    /**
     * @route("/index/{page}", requirements = {"page" : "\d+"}, defaults = {"page" : 1})
     */
    public function index(Request $request, BeerRepository $repository, int $page): Response
    {
        $search = $request->get('search', '');
        $countPerPage = 6;
        if (empty($search)) {
            $beers = $repository->findAll($page, $countPerPage);
        } else {
            $beers = $repository->findBySearch($search, $page, $countPerPage);
        }
        // Calcul du nombre de page
        $nbPages = ceil($beers->count() / $countPerPage);
        return $this->render('beer/index.html.twig', ['beers' => $beers, 'nbPages' => $nbPages, 'page' => $page]);
    }

    /**
     * @route("/admin/{page}", requirements = {"page" : "\d+"}, defaults = {"page" : 1})
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function admin(Request $request, BeerRepository $repository, $page = 1): Response
    {
        $search = $request->get('search', '');
        $countPerPage = 10;
        if (empty($search)) {
            $beers = $repository->findAll($page, $countPerPage);
        } else {
            $beers = $repository->findBySearch($search, $page, $countPerPage);
        }
        // Calcul du nombre de page
        $nbPages = ceil($beers->count() / $countPerPage);
        return $this->render('beer/admin.html.twig', ['beers' => $beers, 'nbPages' => $nbPages, 'page' => $page]);
    }

    /**
     * @Route("/{id}/edit", requirements = {"id": "\d+"})
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function edit(Request $request, EntityManagerInterface $entityManager, Beer $beer): Response
    {
        $form = $this->createForm(BeerType::class, $beer);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Bière modifiée');
            return $this->redirectToRoute('app_beer_index');
        }
        // Ne pas oublier de créer le fichier twig
        return $this->render('beer/edit.html.twig', ['beer' => $beer, 'form' => $form->createView()]);
    }

    /**
     * @Route("/{id}/delete", requirements = {"id": "\d+"})
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function delete(Request $request, EntityManagerInterface $entityManager, Beer $beer): Response
    {
        $form = $this->createFormBuilder()
            ->add('delete', SubmitType::class, [
                'label' => 'Supprimer',
            ])
            ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->remove($beer);
            $entityManager->flush();
            $this->addFlash('success', 'Bière supprimée');
            return $this->redirectToRoute('app_beer_index');
        }
        // Ne pas oublier de créer le fichier twig
        return $this->render('beer/delete.html.twig', ['beer' => $beer, 'form' => $form->createView()]);   
    }

    /**
     * @Route("/{id}", requirements = {"id": "\d+"})
     */
    public function show(Beer $beer): Response
    {
        return $this->render('beer/show.html.twig', ['beer' => $beer]);
    }

    /**
     * @Route("/{id}/score.{_format}", requirements={"id": "\d+", "_format": "html|json"}, defaults={"_format": "html"})
     * @Security("is_granted('ROLE_USER')")
     */
    public function score(Request $request, Beer $beer, TranslatorInterface $translator, BeerScoreCommentRepository $asRepository, EntityManagerInterface $entityManager, string $_format): Response
    {
        $user = $this->getUser(); // Utilisateur connecté
        /*
            Test d'abord si l'utilisateur a déjà entré un score (findOneByBeerUser)
            Si oui on modifie ce score
            Si non on ajoute un nouveau score
        */

        // Test si le token csrf est valide
        if ($this->isCsrfTokenValid('score'.$beer->getId(), $request->request->get('_token'))) {
            // Récupére le score entré par l'utilisateur
            $score = $asRepository->findOneByBeerUser($beer, $user);
            if (null == $score) { // Pas encore entré de score
                $score = (new BeerScoreComment()) // Crée une nouvelle entité score
                    ->setUser($user)
                    ->setBeer($beer)
                ;
            }
            // intval converti une chaîne en nombre entier
            $score->setScore(intval($request->request->get('score')));
            $score->setComment($request->request->get('comment'));

            $entityManager->persist($score);
            $entityManager->flush();
            if ($request->isXmlHttpRequest()) {
            // $this->addFlash('success', $translator->trans('beer.score.success'));
            } else {
            if ($request->isXmlHttpRequest()) {
            // $this->addFlash('error', $translator->trans('beer.score.error'));
            }
                    }

            // Test si la requête s'est faite en AJAX
            if ($request->isXmlHttpRequest() || 'json' == $_format) {
            return new JsonResponse(['status' => 'success', 'message' => $translator->trans('beer.score.success'), 'comment'=>[
                'score' => $score->getScore(),
                'content' => $score->getComment()
            ]]);
            }

        return $this->redirectToRoute('app_beer_show', ['id' => $beer->getId()]);
        }
    }
}

