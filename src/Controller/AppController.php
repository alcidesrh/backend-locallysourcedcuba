<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
    
    #[Route('/', name: 'home')]
    #[Route('/{any}', name: 'home2')]
    #[Route('/{tour}/edit/{id}', name: 'edit_tour')]
    public function index(): Response
    {
        return $this->render('app/index.html.twig');
    }
}
