<?php

namespace App\Repository;

use App\Entity\TransportationDestinationPrice;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TransportationDestinationPrice|null find($id, $lockMode = null, $lockVersion = null)
 * @method TransportationDestinationPrice|null findOneBy(array $criteria, array $orderBy = null)
 * @method TransportationDestinationPrice[]    findAll()
 * @method TransportationDestinationPrice[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransportationDestinationPriceRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TransportationDestinationPrice::class);
    }

    // /**
    //  * @return TransportationDestinationPrice[] Returns an array of TransportationDestinationPrice objects
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
    public function findOneBySomeField($value): ?TransportationDestinationPrice
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
