<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\MutationResolverInterface;
use Doctrine\ORM\EntityManagerInterface;

final class TransportationRouteResolver implements MutationResolverInterface
{

    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke($item, array $context)
    {
        if ($result = $this->em->createQueryBuilder()->select('e')->from( 'App\Entity\LocationDistance', 'e')
        ->where("(e.location1 = :location1 and e.location2 = :location2) or (e.location1 = :location2 and e.location2 = :location1)")
        ->setParameters(['location1' => $item->getLocationFrom(), 'location2' => $item->getLocationTo()])->getQuery()->setMaxResults(1)->getOneOrNullResult()) {
            $item->setKms($result->getKms());
        }
        return $item;
    }
}
