<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Beer;
use App\Form\BeerType;
use App\Repository\BeerRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

/**
 * @Route("/beer")
 */
class BeerController extends AbstractController
{
    /**
     * @Route("/add")
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $beer = new Beer;

        // Creation du formulaire et envoi de l'entitée $beer
        $form = $this->createForm(BeerType::class, $beer);

         // Insérer l'objet Request dans le formulaire pour obtenir les données $_POST
         $form->handleRequest($request);

         // Test si le formulaire a bien été envoyé ET s'il est valide
         if ($form->isSubmitted() && $form->isValid()) {
             // Persiste l'objet Article, indique à doctrine qu'on va ajouter un objet (ne fait pas de requête INSERT)
             $entityManager->persist($beer);
 
             // Enregistrement de l'objet (exécute la requête)
             $entityManager->flush();
 
             // Générer un message flash
            //  $this->addFlash('success', $translator->trans('article.new.success', ['%title%' => $article->getTitle()]));
 
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
    public function index(Request $request, BeerRepository $repository, $page = 1): Response
    {
        $search = $request->get('search', '');
        $countPerPage = 30;
        if (empty($search)) {
            $beers = $repository->findAll($page, $countPerPage);
        } else {
            $beers = $repository->findBySearch($search, $page, $countPerPage);
        }
        // Calcul du nombre de page
        $nbPages = ($beers->count() / $countPerPage);
        return $this->render('beer/index.html.twig', ['beers' => $beers, 'nbPages' => $nbPages, 'page' => $page]);
    }

    /**
     * @Route("/{id}/edit", requirements = {"id": "\d+"})
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
}
