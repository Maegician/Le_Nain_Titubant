<?php

namespace App\Menu;

use App\Repository\CategoryRepository;
use Knp\Menu\FactoryInterface;
use Symfony\Component\Security\Core\Security;

class Builder
{
    /**
     * Objet pour construire un menu
     */
    private $factory;
    private $security;
    private $categoryRepository;

    public function __construct(FactoryInterface $factory, Security $security, CategoryRepository $categoryRepository)
    {
        $this->factory = $factory;
        $this->security = $security;
        $this->categoryRepository = $categoryRepository;
    }

    /**
     * Génère le menu principal
     */
    public function mainMenu(array $options)
    {
        // Créer une racine
        $menu = $this->factory->createItem('root');

        // Ajout d'un item
        $menu->addChild('menu.beers', ['route' => 'app_beer_index']);

        // Utilisation du service security pour tester le rôle
        if ($this->security->isGranted('ROLE_ADMIN')) {
            $menu->addChild('menu.admin', ['route' => 'app_app_home']);
        }

        // Ajout du menu "Se connecter" ou "Se déconnecter"
        // Ajout du menu d'inscription
        // $menu->addChild('menu.register', ['route' => 'app_register']);
        
        // if ($this->security->isGranted('ROLE_USER')) {
        //     $menu->addChild('menu.logout', ['route' => 'app_logout']);
        // } else { $menu->addChild('menu.login', ['route' => 'app_login']);

        // }

        // Ajout des catégories
        // On a besoin du CategoryRepository
        $categories = $this->categoryRepository->findAll();
        // Créer un sous menu (dropdown)
        $menuCat = $menu->addChild('menu.categories', ['uri'=> '#']); // uri est un lien

        foreach ($categories as $cat) {
            $menuCat->addChild($cat->getName(), [
                'route' => 'category_show', 
                'routeParameters' => ['id' => $cat->getId()],
            ])->setExtra('translation_domain', false); // Indique qu'il ne faut pas traduire cet élément de menu
        }

        return $menu;
    }

    /**
     * Génère le menu admin
     */
    public function adminMenu(array $options)
    {
        // Créer une racine
        $menu = $this->factory->createItem('root');

        $menu->addchild('menu.beers', ['route' =>'app_beer_index']);
        $menu->addchild('menu.categories', ['route' =>'category_index']);
        $menu->addchild('menu.images', ['route' =>'image_index']);
        $menu->addChild('menu.users', ['route' => 'user_index']);

        return $menu;
    }
}
