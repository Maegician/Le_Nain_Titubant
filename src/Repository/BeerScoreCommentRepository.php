<?php

namespace App\Repository;

use App\Entity\BeerScoreComment;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BeerScoreComment|null find($id, $lockMode = null, $lockVersion = null)
 * @method BeerScoreComment|null findOneBy(array $criteria, array $orderBy = null)
 * @method BeerScoreComment[]    findAll()
 * @method BeerScoreComment[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BeerScoreCommentRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BeerScoreComment::class);
    }

    // /**
    //  * @return BeerScoreComment[] Returns an array of BeerScoreComment objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?BeerScoreComment
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
