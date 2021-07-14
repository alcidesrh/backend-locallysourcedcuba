<?php

namespace App\Repository;

use App\Entity\TourTemplate;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TourTemplate|null find($id, $lockMode = null, $lockVersion = null)
 * @method TourTemplate|null findOneBy(array $criteria, array $orderBy = null)
 * @method TourTemplate[]    findAll()
 * @method TourTemplate[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TourTemplateRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TourTemplate::class);
    }

    // /**
    //  * @return TourTemplate[] Returns an array of TourTemplate objects
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
    public function findOneBySomeField($value): ?TourTemplate
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
