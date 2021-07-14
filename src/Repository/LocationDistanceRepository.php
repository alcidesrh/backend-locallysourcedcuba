<?php

namespace App\Repository;

use App\Entity\LocationDistance;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method LocationDistance|null find($id, $lockMode = null, $lockVersion = null)
 * @method LocationDistance|null findOneBy(array $criteria, array $orderBy = null)
 * @method LocationDistance[]    findAll()
 * @method LocationDistance[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LocationDistanceRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, LocationDistance::class);
    }

    // /**
    //  * @return LocationDistance[] Returns an array of LocationDistance objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('l.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?LocationDistance
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
