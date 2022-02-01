<?php

namespace App\GraphqlResolver;

use App\Entity\Destination;
use App\Repository\ServiceRepository;
use App\Repository\NotificationTourRepository;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;

final class NotificationTourIncompleteCollectionResolver implements QueryCollectionResolverInterface
{
    /**
     * @param iterable<Destination> $collection
     *
     * @return iterable<GuDestinationide>
     */
    public function __construct(private NotificationTourRepository $notificationTourRepository, private ServiceRepository $serviceRepository)
    {
    }
    public function __invoke(iterable $collection, array $context): iterable
    {

        if (!empty($context['args']['service'])) {
            return $this->notificationTourRepository->getPendingNotification($this->serviceRepository->findOneBy(['code' => $context['args']['service']]));
        }

        return $collection;
    }
}
