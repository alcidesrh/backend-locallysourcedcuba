<?php

namespace App\Repository;

use App\Entity\Service;
use App\Entity\Tour;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Tour|null find($id, $lockMode = null, $lockVersion = null)
 * @method Tour|null findOneBy(array $criteria, array $orderBy = null)
 * @method Tour[]    findAll()
 * @method Tour[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TourRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Tour::class);
    }

    // /**
    //  * @return Tour[] Returns an array of Tour objects
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

    function list(Service $service, \DateTime $from = null, \DateTime $to = null, $nocanceled = null, $needle = null, $template = null, $notification = null, $notificationComplete = null)
    {

        $from = $from ?? new DateTime();
        $from->setTime(0, 0, 0);
        $query = $this->createQueryBuilder('tour')
            ->join('tour.service', 's', Join::WITH, "s.code = '{$service->getCode()}'");
        if ($needle) {
            $needle = strtolower($needle);
            $query->leftJoin('tour.bookings', 'b');
            $query->leftJoin('tour.guide', 'g');
            $query->where("(LOWER(tour.code) LIKE '%$needle%' OR LOWER(b.name) LIKE '%$needle%' OR LOWER(g.name) LIKE '%$needle%')");
        }
        $query->andWhere('tour.startDate >= :param')->setParameter(
            'param',
            $from
        );
        if ($to) {
            $to->setTime(23, 59, 59);
            $query->andWhere('tour.startDate <= :date2')->setParameter('date2', $to);
        } else {
            $date2 = clone $from;
            $date2->add(new \DateInterval("P" . $service->getDaysToShow() . "D"));
            $date2->setTime(23, 59, 59);
            $query->andWhere('tour.startDate <= :date2')->setParameter('date2', $date2);
        }
        if ($nocanceled) {
            $query->andWhere("tour.canceled IS NULL OR tour.canceled = '0'");
        }
        if ($template) {
            $query->andWhere('tour.template = :template')->setParameter('template', $template);
        }
        if ($notification) {
            $notification = implode(',', $notification);
            $query->leftJoin('tour.notifications', 'n')->andWhere("n.notification IN ($notification)"); //->andWhere("tour IN (SELECT IDENTITY(nt.tour) FROM App:NotificationTour nt WHERE nt.notification IN ($notification))");
            if (!is_null($notificationComplete)) {
                if ($notificationComplete) {
                    $query->andWhere('n.complete = :notificationComplete')->setParameter('notificationComplete', $notificationComplete);
                } else {
                    $query->andWhere('(n.complete = :notificationComplete OR n.complete IS NULL)')->setParameter('notificationComplete', $notificationComplete);
                }
            }
        }
        return $query->groupBy('tour.id')->orderBy('tour.startDate', 'ASC')->getQuery()->getResult();
    }

    public function findByCode($value, $id = false)
    {
        $return = $this->createQueryBuilder('tour')->select('tour')->where('tour.code LIKE :value');
        if ($id) {
            $return->andWhere('tour.id != :id')->setParameter('id', "$id");
        }

        return $return->setParameter('value', "%$value%")->getQuery()->getResult();
    }

    function listSchedule(\DateTime $from = null, \DateTime $to = null, $nocanceled = null, $needle = null, $template = null, $notification = null, $notificationComplete = null, $hasGuide = null)
    {
        $query = $this->createQueryBuilder('tour');

        if ($hasGuide) {

            $query->where('tour.guide IS NOT NULL');

            $from->setTime(0, 0, 0);
            $to->setTime(23, 59, 59);

            if ($needle) {
                $needle = strtolower($needle);
                $query->leftJoin('tour.bookings', 'b');
                $query->leftJoin('tour.guide', 'g');
                $query->where("(LOWER(tour.code) LIKE '%$needle%' OR LOWER(b.name) LIKE '%$needle%' OR LOWER(g.name) LIKE '%$needle%')");
            }
            $query->andWhere('((tour.startDate >= :from OR (tour.startDate <= :from AND tour.endDate >= :from)) AND tour.startDate <= :to)')->setParameters([
                'from' => $from,
                'to' => $to
            ]);

            if ($nocanceled) {
                $query->andWhere("tour.canceled IS NULL OR tour.canceled = '0'");
            }
            if ($template) {
                $query->andWhere('tour.template = :template')->setParameter('template', $template);
            }
            if ($notification) {
                $notification = implode(',', $notification);
                $query->leftJoin('tour.notifications', 'n')->andWhere("n.notification IN ($notification)"); //->andWhere("tour IN (SELECT IDENTITY(nt.tour) FROM App:NotificationTour nt WHERE nt.notification IN ($notification))");
                if (!is_null($notificationComplete)) {
                    if ($notificationComplete) {
                        $query->andWhere('n.complete = :notificationComplete')->setParameter('notificationComplete', $notificationComplete);
                    } else {
                        $query->andWhere('(n.complete = :notificationComplete OR n.complete IS NULL)')->setParameter('notificationComplete', $notificationComplete);
                    }
                }
            }
        } else {
            $query->where('tour.guide IS NULL');
        }
        return $query->groupBy('tour.id')->orderBy('tour.startDate', 'ASC')->getQuery()->getResult();
    }
}
