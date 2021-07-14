<?php

namespace App\Repository;

use App\Entity\HouseRoom;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method HouseRoom|null find($id, $lockMode = null, $lockVersion = null)
 * @method HouseRoom|null findOneBy(array $criteria, array $orderBy = null)
 * @method HouseRoom[]    findAll()
 * @method HouseRoom[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HouseRoomRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, HouseRoom::class);
    }

    // /**
    //  * @return HouseRoom[] Returns an array of HouseRoom objects
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
    public function findOneBySomeField($value): ?HouseRoom
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
