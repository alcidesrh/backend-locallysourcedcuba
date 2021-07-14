<?php

namespace App\Repository;

use App\Entity\ActivityCombo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ActivityCombo|null find($id, $lockMode = null, $lockVersion = null)
 * @method ActivityCombo|null findOneBy(array $criteria, array $orderBy = null)
 * @method ActivityCombo[]    findAll()
 * @method ActivityCombo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ActivityComboRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ActivityCombo::class);
    }

    // /**
    //  * @return ActivityCombo[] Returns an array of ActivityCombo objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ActivityCombo
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
