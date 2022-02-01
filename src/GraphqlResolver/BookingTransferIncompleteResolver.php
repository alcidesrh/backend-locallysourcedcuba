<?php

namespace App\GraphqlResolver;

use DateTime;
use App\Entity\Tour;
use App\Entity\Service;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\BookingTransferRepository;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;

final class BookingTransferIncompleteResolver implements QueryCollectionResolverInterface
{
    public function __construct(private BookingTransferRepository $bookingTransferRepository, private EntityManagerInterface $em)
    {
    }
    /**
     * @param iterable<Tour> $collection
     *
     * @return iterable<Tour>
     */
    public function __invoke(iterable $collection, array $context): iterable
    {
        return $this->bookingTransferRepository->getbookingTransferIncomplete();
    }
}
