<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\MutationResolverInterface;
use App\Entity\Itinerary;
use App\Entity\ItineraryDay;
use App\Entity\NotificationTour;
use App\Entity\Tour;
use Doctrine\ORM\EntityManagerInterface;

final class TourCreateResolver implements MutationResolverInterface
{

    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke($item, array $context)
    {

        $code = $this->generateCode($item);

        if ($items = $this->em->getRepository(Tour::class)->findByCode($code, $item->getId())) {
            for ($i = count($items) - 1, $aux = $code; true; $i--) {
                $last = $items[$i];
                if ($pos = strrpos($last->getCode(), '-')) {
                    $count = substr($last->getCode(), $pos + 1);
                }

                $aux .= $pos && is_numeric($count) ? '-' . ((int) $count + 1) : '-' . intval(count($items) + 1);

                if (empty($this->em->getRepository(Tour::class)->findByCode($aux, $item->getId()))) {
                    $code = $aux;
                    break;
                } else {
                    $aux = $code;
                }

            }

            $item->setCode($code);
        } else if (!$item->getCode()) {
            $item->setCode($code);
        }

        $item->setName($item->getTemplate()->getName());

        $template = $item->getTemplate();

        foreach ($template->getNotifications() as $n) {
            $item->addNotification((new NotificationTour())->setDays($n->getDays())->setNotification($n->getNotification()));
        }

        foreach ($template->getActivities() as $a) {
            $item->addActivity($a);
        }

        foreach ($template->getItineraries() as $i) {
            $itinerary = (new Itinerary())->setDays($i->getDays())->setDestination($i->getDestination())->setHouse($i->getHouse());
            foreach ($i->getItineraryDays() as $i) {
                $itinerary->addItineraryDay((new ItineraryDay)->setDate((clone $item->getStartDate())->modify("+{$i->getDay()} day"))->setDay($i->getDay())->setNoGuide($i->getNoGuide())->setActivities($i->getActivities()));
            }
            $item->addItinerary($itinerary);
        }

        return $item;
    }

    public function generateCode(Tour $tour, $ext = false)
    {
        $serviceCode = strtoupper($tour->getService()->getCode());
        $date = str_replace('-', '', $tour->getStartDate()->format("d-m-y"));
        // $private = ($type == 'private' && $template && $template->getType() == 'group') ? '-P' : '';
        $agent = ($tour->getAgent()) ? '-A' : '';
        $templateCode = $tour->getTemplate()->getCode();
        // ($template) ? $template->getCode() : $em->getRepository('App:CodeTourOneDay')->findOneBy(
        //     []
        // )->getName();

        return $serviceCode . $date . $templateCode . $agent;
    }
}
