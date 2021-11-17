<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use App\Entity\Service;
use App\Entity\Tour;
use App\Repository\TourRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;

final class TourListResolver implements QueryCollectionResolverInterface
{
    public function __construct(private TourRepository $tourRepository, private EntityManagerInterface $em)
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
        return $this->tourRepository->list(
            $this->em->getRepository(Service::class)->findOneBy(['code' => $args['service']]),
            needle:$args['needle'] ?? null,
            from:$args['from'] ? new DateTime($args['from']) : null,
            to:$args['to'] ? new DateTime($args['to']) : null,
            notification:$args['notification'] ?? null,
            notificationComplete:$args['notificationComplete'] ?? null,
            template:$args['template'] ?? null,
        );
    }
}
