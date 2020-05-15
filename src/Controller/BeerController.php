<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Beer;
use App\Repository\BeerRepository;


/**
 * @Route("/beer", name="beer_")
 */
class BeerController extends AbstractController
{
    /**
     * @Route("/new")
     */
    public function new(EntityManagerInterface $entityManager): Response
    {
        // Il est possible d'obtenir le service entityManager comme ceci:
        // $entityManager = $this->getDoctrine()->getManager();
        $beer = (new Beer())
            ->setName('Bière Symfony')
            ->setOrigin("France");
        // Persist l'objet Beer, indique à Doctrine que vous allez ajouter cet beer (pas encore de requête)
        $entityManager->persist($beer);
        // Enregistre l'objet (exécution de requête)
        $entityManager->flush();
        // Ne pas oublier de créer le fichier twig
        return $this->render('beer/add.html.twig', ['beer' => $beer]);
    }

    /**
     * @Route("/index")
     */
    public function index(BeerRepository $repository): Response
    {
        // Peut également être appellé comme ceci
        // $repository = $this->getDoctrine()->getManager()->getRepository(Beer::class);
        $beers = $repository->findAll();
        return $this->render('beer/index.html.twig', ['beers' => $beers]);
    }

    /**
     * @Route("/{id}", requirements = {"id": "\d+"})
     */
    public function show(Beer $beer): Response
    {
        return $this->render('beer/show.html.twig', ['beer' => $beer]);
    }
}
