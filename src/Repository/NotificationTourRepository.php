<?php

namespace App\Repository;

use App\Entity\NotificationTour;
use App\Entity\Service;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method NotificationTour|null find($id, $lockMode = null, $lockVersion = null)
 * @method NotificationTour|null findOneBy(array $criteria, array $orderBy = null)
 * @method NotificationTour[]    findAll()
 * @method NotificationTour[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NotificationTourRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, NotificationTour::class);
    }

    // /**
    //  * @return NotificationTour[] Returns an array of NotificationTour objects
    //  */
    public function getPendingNotification(Service $service)
    {
        return $this->createQueryBuilder('n')
            ->leftJoin('n.tour', 't')
            ->andWhere("n.days >= DATE_DIFF(DATE_ADD(t.startDate, t.days, 'DAY'), CURRENT_DATE())")
            ->andWhere("t.service = :service")->setParameter('service', $service)
            ->andWhere("t.canceled IS NULL OR t.canceled = :false")
            ->andWhere("n.complete IS NULL OR n.complete = :false")->setParameter('false', false)
            ->getQuery()
            ->getResult()
        ;
    }

    /*
    public function findOneBySomeField($value): ?NotificationTour
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
