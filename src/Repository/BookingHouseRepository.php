<?php

namespace App\Repository;

use App\Entity\BookingHouse;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BookingHouse|null find($id, $lockMode = null, $lockVersion = null)
 * @method BookingHouse|null findOneBy(array $criteria, array $orderBy = null)
 * @method BookingHouse[]    findAll()
 * @method BookingHouse[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookingHouseRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BookingHouse::class);
    }

    // /**
    //  * @return BookingHouse[] Returns an array of BookingHouse objects
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
    public function findOneBySomeField($value): ?BookingHouse
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
