<?php

namespace App\GraphqlResolver;

use App\Entity\BookingAccommodation;
use ApiPlatform\Core\GraphQl\Resolver\MutationResolverInterface;

final class BookingCreateResolver implements MutationResolverInterface
{
    public function __invoke($booking, array $context)
    {
        $tour = $booking->getTour();
        $dateIn = $tour->getStartDate();
        foreach ($tour->getItineraries() as $itinerary) {
            $bookingAccommodation = (new BookingAccommodation())->setItinerary($itinerary);
            if($dateIn){
                $dateOut = (clone $dateIn)->add(new \DateInterval("P{$itinerary->getDays()}D"));
                $bookingAccommodation->setDateIn($dateIn)->setDateOut($dateOut);
                $dateIn = $dateOut;
            }
            $booking->addBookingAccommodation($bookingAccommodation);
        }

        return $booking;
    }
}
