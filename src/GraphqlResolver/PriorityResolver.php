<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\MutationResolverInterface;
use Doctrine\ORM\EntityManagerInterface;

final class PriorityResolver implements MutationResolverInterface
{

    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke($item, array $context)
    {
        $args = $context['args']['input'];

        if (isset($args['up'])) {
            $priority = $item->getPriority();
            $item->setPriority($args['up'] ? --$priority : ++$priority);
            if ($slibing = $this->em->createQueryBuilder()->select('e')->from( get_class($item), 'e')->andWhere("e.priority = $priority")->getQuery()->setMaxResults(1)->getOneOrNullResult()) {
                $slibing->setPriority($args['up'] ? ++$priority : --$priority);
                $this->em->persist($slibing);
            }
        } else {
            if ($n = $this->em->createQueryBuilder()->select('e')->from( get_class($item), 'e')->orderBy('e.priority', 'DESC')->getQuery()->setMaxResults(1)->getOneOrNullResult()) {
                $item->setPriority($n->getPriority() + 1);
            } else {
                $item->setPriority(0);
            }
        }
        return $item;
    }
}
