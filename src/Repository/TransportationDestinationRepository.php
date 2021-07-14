<?php

namespace App\Repository;

use App\Entity\TransportationDestination;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TransportationDestination|null find($id, $lockMode = null, $lockVersion = null)
 * @method TransportationDestination|null findOneBy(array $criteria, array $orderBy = null)
 * @method TransportationDestination[]    findAll()
 * @method TransportationDestination[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransportationDestinationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TransportationDestination::class);
    }

    // /**
    //  * @return TransportationDestination[] Returns an array of TransportationDestination objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TransportationDestination
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
