<?php

namespace App\Repository;

use App\Entity\Beer;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Tools\Pagination\Paginator;

/**
 * @method Beer|null find($id, $lockMode = null, $lockVersion = null)
 * @method Beer|null findOneBy(array $criteria, array $orderBy = null)
 * @method Beer[]    findAll()
 * @method Beer[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BeerRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Beer::class);
    }

    public function findBySearch(string $search): array
    {
        $search = trim($search);
        // createQueryBuilder demande un alias de la table (FROM beer AS b)
        // dans une requête Doctrine on n'écrit pas les noms de colonne mais bien les propriétés de l'objet Beer
        // Doctrine va ainsi générer la requête en fonction du moteur de base de données
        $query = $this->createQueryBuilder('b')
            ->where('b.origin LIKE :search')
            ->setParameter(':search', '%' . $search . '%')
            ->orderBy('b.name', 'desc')
            ->getQuery();
        // Retourne le résultat sous forme d'array d'objet Beer
        return $query->getResult();
    }

    public function findAll($page = 1, $countPerPage = 30): Paginator
    {
        $firstResult = ($page - 1) * $countPerPage;
        $query = $this->createQueryBuilder('b')
            ->orderBy('b.name', 'desc')
            ->setFirstResult($firstResult) // OFFSET
            ->setMaxResults($countPerPage) // LIMIT
            ->getQuery();
        // Paginator va générer une requête pour obtenir le nombre total d'éléments
        return new Paginator($query);
    }

    // /**
    //  * @return Beer[] Returns an array of Beer objects
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
    public function findOneBySomeField($value): ?Beer
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
