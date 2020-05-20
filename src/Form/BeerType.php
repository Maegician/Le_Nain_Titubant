<?php

namespace App\Form;

use App\Entity\Beer;
use App\Entity\Category;
use App\Form\ImageType;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;


class BeerType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        // Ajout des champs dans le formulaire
        $builder
            ->add('name')
            ->add('origin')
            ->add('alcohol')
            ->add('brewing_type')


            ->add('image', ImageType::class, ['label' => false])
            

            ->add('category', EntityType::class, [
                  'label' => 'beer.category',
                  'class' => Category::class,
                  'multiple' => false,
                  'expanded' => true,
                  'query_builder' => function (EntityRepository $er) {
                        // Modifie la requête d'affichage de la liste des catégories
                        return $er->createQueryBuilder('c')
                        ->orderBy('c.name', 'asc')
                        ;
                        }
            ])

            // Ajout du submit
            ->add('save', SubmitType::class);
    }
    public function configureOptions(OptionsResolver $resolver)
    {
        // Indique que ce formulaire utilise des objets Beer
        $resolver->setDefaults([
            'data_class' => Beer::class,
        ]);
    }
}
