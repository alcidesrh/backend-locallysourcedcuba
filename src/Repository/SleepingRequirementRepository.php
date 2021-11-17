<?php

namespace App\Repository;

use App\Entity\SleepingRequirement;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SleepingRequirement|null find($id, $lockMode = null, $lockVersion = null)
 * @method SleepingRequirement|null findOneBy(array $criteria, array $orderBy = null)
 * @method SleepingRequirement[]    findAll()
 * @method SleepingRequirement[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SleepingRequirementRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SleepingRequirement::class);
    }

    // /**
    //  * @return SleepingRequirement[] Returns an array of SleepingRequirement objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SleepingRequirement
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
