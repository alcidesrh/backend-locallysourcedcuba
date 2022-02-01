<?php

namespace App\GraphqlResolver;

use App\Entity\Tour;
use App\Repository\BookingTransferRepository;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;

final class TransfersPerBookingResolver implements QueryCollectionResolverInterface
{
    public function __construct(private BookingTransferRepository $bookingTransferRepository)
    {
    }
    /**
     * @param iterable<Tour> $collection
     *
     * @return iterable<Tour>
     */
    public function __invoke(iterable $collection, array $context): iterable
    {
        if(!empty($context['args']['bookings'])){
            return $this->bookingTransferRepository->findByBooking($context['args']['bookings']);
        }
        return [];
    }
}
