<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use App\Entity\Service;
use App\Entity\Tour;
use App\Repository\TourRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;

final class TourListScheduleWithoutGuideResolver implements QueryCollectionResolverInterface
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
        return $this->tourRepository->listSchedule();
    }
}
