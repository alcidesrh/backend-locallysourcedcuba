<?php

namespace App\Repository;

use App\Entity\HouseBooking;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method HouseBooking|null find($id, $lockMode = null, $lockVersion = null)
 * @method HouseBooking|null findOneBy(array $criteria, array $orderBy = null)
 * @method HouseBooking[]    findAll()
 * @method HouseBooking[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HouseBookingRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, HouseBooking::class);
    }

    // /**
    //  * @return HouseBooking[] Returns an array of HouseBooking objects
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
    public function findOneBySomeField($value): ?HouseBooking
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
