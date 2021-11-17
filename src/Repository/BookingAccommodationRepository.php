<?php

namespace App\Repository;

use App\Entity\BookingAccommodation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method BookingAccommodation|null find($id, $lockMode = null, $lockVersion = null)
 * @method BookingAccommodation|null findOneBy(array $criteria, array $orderBy = null)
 * @method BookingAccommodation[]    findAll()
 * @method BookingAccommodation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookingAccommodationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BookingAccommodation::class);
    }

    // /**
    //  * @return BookingAccommodation[] Returns an array of BookingAccommodation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('h.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?BookingAccommodation
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
