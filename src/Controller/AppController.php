<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

class AppController extends AbstractController
{
    /**
     * Page d'accueil
     *
     * @Route("/")
     */
    public function home(): Response
    {
        return $this->render('app/home.html.twig');
    }
}
