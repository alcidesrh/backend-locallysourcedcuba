<?php

namespace App\Repository;

use App\Entity\BookingTransfer;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BookingTransfer|null find($id, $lockMode = null, $lockVersion = null)
 * @method BookingTransfer|null findOneBy(array $criteria, array $orderBy = null)
 * @method BookingTransfer[]    findAll()
 * @method BookingTransfer[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookingTransferRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BookingTransfer::class);
    }

    // /**
    //  * @return BookingTransfer[] Returns an array of BookingTransfer objects
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
    public function findOneBySomeField($value): ?BookingTransfer
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
