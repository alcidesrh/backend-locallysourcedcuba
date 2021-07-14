<?php

namespace App\Repository;

use App\Entity\HouseRoomType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method HouseRoomType|null find($id, $lockMode = null, $lockVersion = null)
 * @method HouseRoomType|null findOneBy(array $criteria, array $orderBy = null)
 * @method HouseRoomType[]    findAll()
 * @method HouseRoomType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HouseRoomTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, HouseRoomType::class);
    }

    // /**
    //  * @return HouseRoomType[] Returns an array of HouseRoomType objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?HouseRoomType
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
