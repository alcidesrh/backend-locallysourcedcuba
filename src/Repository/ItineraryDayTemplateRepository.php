<?php

namespace App\Repository;

use App\Entity\ItineraryDayTemplate;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ItineraryDayTemplate|null find($id, $lockMode = null, $lockVersion = null)
 * @method ItineraryDayTemplate|null findOneBy(array $criteria, array $orderBy = null)
 * @method ItineraryDayTemplate[]    findAll()
 * @method ItineraryDayTemplate[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ItineraryDayTemplateRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ItineraryDayTemplate::class);
    }

    // /**
    //  * @return ItineraryDayTemplate[] Returns an array of ItineraryDayTemplate objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('i.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ItineraryDayTemplate
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
