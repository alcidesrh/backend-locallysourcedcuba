<?php

namespace App\Repository;

use App\Entity\TransportationRoute;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TransportationRoute|null find($id, $lockMode = null, $lockVersion = null)
 * @method TransportationRoute|null findOneBy(array $criteria, array $orderBy = null)
 * @method TransportationRoute[]    findAll()
 * @method TransportationRoute[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TransportationRouteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TransportationRoute::class);
    }

    // /**
    //  * @return TransportationRoute[] Returns an array of TransportationRoute objects
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
    public function findOneBySomeField($value): ?TransportationRoute
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
