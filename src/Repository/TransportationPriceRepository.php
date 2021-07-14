<?php

namespace App\Repository;

use App\Entity\TransportationPrice;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TransportationPrice|null find($id, $lockMode = null, $lockVersion = null)
 * @method TransportationPrice|null findOneBy(array $criteria, array $orderBy = null)
 * @method TransportationPrice[]    findAll()
 * @method TransportationPrice[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransportationPriceRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TransportationPrice::class);
    }

    // /**
    //  * @return TransportationPrice[] Returns an array of TransportationPrice objects
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
    public function findOneBySomeField($value): ?TransportationPrice
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
