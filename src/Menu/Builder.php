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

        // ajout des catégories - utilisation de CategoryRepository
        $categories = $this->categoryRepository->findAll();
        // sous-menu (dropdown)
        $menuCat = $menu->addChild('menu.category', ['uri' => '#']);

        foreach ($categories as $cat) {
            $menuCat->addChild($cat->getName(), [
                'route' => 'category_show', 
                'routeParameters' => ['id' => $cat->getId()],
                ])->setExtra('translation_domain', false); // élément du menu à ne pas traduire
        }

        $categories = $this->categoryRepository->findAll();
        // $menuCat = $menu->addChild('category', ['uri' => '#']);
        foreach ($categories as $category) {
            $menuCat->addChild($category->getName(), ['route' => 'category_show', 'routeParameters' => ['id' => $category->getId()]]);
        }

        // Utilisation du service security pour tester le rôle
        if ($this->security->isGranted('ROLE_ADMIN')) {
            $menu->addChild('menu.admin', ['route' => 'app_beer_admin']);
        }
        
        if ($this->security->isGranted('ROLE_USER')) {
            $menu->addChild('menu.logout', ['route' => 'app_logout']);
        } else {
            // menu inscription et connexion
            $menu->addChild('menu.register', ['route' => 'app_register']);
            $menu->addChild('menu.login', ['route' => 'app_login']);
        }

        return $menu;
    }

    // menu admin
    public function adminMenu(array $options)
    {
        // racine
        $menu = $this->factory->createItem('root');

        $menu->addChild('menu.beers', ['route' => 'app_beer_admin']);
        $menu->addChild('menu.category', ['route' => 'category_index']);
        $menu->addChild('menu.images', ['route' => 'image_index']);
        $menu->addChild('menu.users', ['route' => 'user_index']);
        $menu->addChild('menu.back', ['route' => 'app_app_home']);

        return $menu;
    }
}
