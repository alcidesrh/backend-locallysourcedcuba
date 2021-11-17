<?php

namespace App\Repository;

use App\Entity\SRRoomType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SRRoomType|null find($id, $lockMode = null, $lockVersion = null)
 * @method SRRoomType|null findOneBy(array $criteria, array $orderBy = null)
 * @method SRRoomType[]    findAll()
 * @method SRRoomType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SRRoomTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SRRoomType::class);
    }

    // /**
    //  * @return SRRoomType[] Returns an array of SRRoomType objects
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
    public function findOneBySomeField($value): ?SRRoomType
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
