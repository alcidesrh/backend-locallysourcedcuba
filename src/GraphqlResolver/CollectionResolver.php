<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\Bridge\Doctrine\Orm\Paginator;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\Pagination\Paginator as DoctrinePaginator;

final class CollectionResolver implements QueryCollectionResolverInterface
{
    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke(iterable $collection, array $context): iterable
    {

        $args = $context['args'];

        $qb = $this->em->createQueryBuilder()->select('e')->from($args['entity'], 'e');

        if (!empty($args['needle']) && isset($args['properties']) && !empty($args['properties'])) {
            $xor = [];
            foreach ($args['properties'] as $field) {
                $xor[] = $qb->expr()->like($qb->expr()->lower("e.$field"), strtolower("'%{$args['needle']}%'"));
            }
            $qb->where($qb->expr()->orX(...$xor));
        }

        if (isset($args['page']) && $args['itemsPerPage']) {
            $qb->setFirstResult(($args['page'] - 1) * $args['itemsPerPage'])->setMaxResults($args['itemsPerPage']);
        }

        if (isset($args['order']) && !empty($args['order'])) {
            foreach ($args['order'] as $value) {
                foreach ($value as $field => $order) {
                    $qb->addOrderBy("e.$field", $order);
                }

            }
        } else if (isset($args['orderPriority'])) {
            $qb->addOrderBy("e." . $args['orderPriority']['field'], $args['orderPriority']['order']);
        } else {
            $qb->addOrderBy('e.id', 'ASC');
        }

        return new Paginator(new DoctrinePaginator($qb->getQuery()));
    }
}
