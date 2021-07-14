<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\Bridge\Doctrine\Orm\Paginator;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use App\Entity\Destination;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\Pagination\Paginator as DoctrinePaginator;

final class LocationDistanceCollectionResolver implements QueryCollectionResolverInterface
{
    /**
     * @param iterable<Destination> $collection
     *
     * @return iterable<GuDestinationide>
     */
    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke(iterable $collection, array $context): iterable
    {

        $args = $context['args'];

        $qb = $this->em->createQueryBuilder()->select('e')->from('App\Entity\LocationDistance', 'e');

        if (!empty($args['needle'])) {

            $qb->join('e.location1', 'l1')->join('e.location2', 'l2');

            $xor = [];
            foreach (['l1.name', 'l2.name'] as $field) {
                $xor[] = $qb->expr()->like($qb->expr()->lower("$field"), strtolower("'%{$args['needle']}%'"));
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

        return new Paginator(new DoctrinePaginator($qb->groupBy('e.id')->getQuery()));
    }
}
