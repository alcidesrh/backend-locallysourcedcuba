<?php

namespace App\GraphqlResolver;

use DateTime;
use App\Entity\Tour;
use App\Entity\Service;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\BookingTransferRepository;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;

final class BookingTransferListResolver implements QueryCollectionResolverInterface
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
        $args = $context['args'];
        return $this->bookingTransferRepository->list(
            $this->em->getRepository(Service::class)->findOneBy(['code' => 'transfer']),
            needle: $args['needle'] ?? null,
            from: $args['from'] ? new DateTime($args['from']) : null,
            to: $args['to'] ? new DateTime($args['to']) : null,
            notification: $args['notification'] ?? null,
            notificationComplete: $args['notificationComplete'] ?? null,
            driver: $args['driver'] ?? null,
            type: $args['type'] ?? null,
        );
    }
}
