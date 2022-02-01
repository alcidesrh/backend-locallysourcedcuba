<?php

namespace App\Repository;

use App\Entity\Service;
use App\Entity\BookingTransfer;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use DateTime;

/**
 * @method BookingTransfer|null find($id, $lockMode = null, $lockVersion = null)
 * @method BookingTransfer|null findOneBy(array $criteria, array $orderBy = null)
 * @method BookingTransfer[]    findAll()
 * @method BookingTransfer[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookingTransferRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BookingTransfer::class);
    }

    // /**
    //  * @return BookingTransfer[] Returns an array of BookingTransfer objects
    //  */
    public function findByBooking(array $bookingsId)
    {
        $qb = $this->createQueryBuilder('t');
        foreach ($bookingsId as $id) {
            $qb->orWhere('t.bookingIn = :id')->orWhere('t.bookingOut = :id')->setParameter('id', $id);
        }
        return $qb->getQuery()
            ->getResult();
    }

    function list(Service $service, \DateTime$from = null, \DateTime $to = null, $nocanceled = null, $needle = null,  $notification = null, $notificationComplete = null, $driver = null, $type = null) {

        $from = $from ?? new DateTime();
        $from->setTime(0, 0, 0);
        $query = $this->createQueryBuilder('transfer');
        if ($needle) {
            $needle = strtolower($needle);
            $query->leftJoin('transfer.bookingIn', 'b');
            $query->leftJoin('transfer.driver', 'd');
            $query->where("(LOWER(b.name) LIKE '%$needle%' OR LOWER(d.name) LIKE '%$needle%')");
        }
        if ($type) {
            $query->andWhere("transfer.type = '$type'");
        }
        $query->andWhere('transfer.date >= :param')->setParameter(
            'param',
            $from
        );
        if ($to) {
            $to->setTime(23, 59, 59);
            $query->andWhere('transfer.date <= :date2')->setParameter('date2', $to);
        } else {
            $date2 = clone $from;
            $date2->add(new \DateInterval("P" . $service->getDaysToShow() . "D"));
            $date2->setTime(23, 59, 59);
            $query->andWhere('transfer.date <= :date2')->setParameter('date2', $date2);
        }
        if ($nocanceled) {
            $query->andWhere('transfer.canceled IS NULL OR transfer.canceled = 0');
        }
        if ($driver) {
            $query->andWhere('transfer.driver = :driver')->setParameter('driver', $driver);
        }
        if ( !empty( $notification ) ) {
            if(in_array("sent-to-driver", $notification)){
                if($notificationComplete)
                    $query->andWhere( 'transfer.sent = :true' )->setParameter('true', true);
                else
                    $query->andWhere( "transfer.sent IS NULL OR transfer.sent = '0'" );
            }
            if(in_array("accommodation-in-transfer", $notification)){
                if($notificationComplete)
                    $query->join('transfer.houses', 'h');
                else{
                    $ids = array_map(fn($x) => $x['id'], $this->createQueryBuilder('transfer2')->select('transfer2.id')->join('transfer2.houses', 'h')->groupBy('transfer2.id')->getQuery()->getResult());
                    $query->andWhere($query->expr()->notIn('transfer.id', $ids));
                }
            }
            if(in_array("flight-data", $notification)){
                if($notificationComplete)
                     $query->andWhere( "transfer.flightData IS NOT NULL OR transfer.flightData != ''" );
                    else
                     $query->andWhere( "transfer.flightData IS NULL OR transfer.flightData = ''" );

                }
        }
        return $query->groupBy('transfer.id')->orderBy('transfer.date', 'ASC')->getQuery()->getResult();
    }

    public function getbookingTransferIncomplete()
    {
        return $this->createQueryBuilder('t')
            ->andWhere("t.sent IS NUll OR t.flightData IS NULL")
            ->getQuery()
            ->getResult()
        ;
    }
}
