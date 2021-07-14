<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\Bridge\Doctrine\Orm\Paginator;
use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use App\Entity\Destination;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\Pagination\Paginator as DoctrinePaginator;

final class HouseCollectionResolver implements QueryCollectionResolverInterface
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

        if (!empty($context['args']['needle'])) {

            $args = $context['args'];

            $qb = $this->em->createQueryBuilder()->select('e')->from($args['entity'], 'e')->join('e.destination', 'd')->join('e.type', 't');

            $xor = [];
            foreach (['name', 'address', 'phone', 'email'] as $field) {
                $xor[] = $qb->expr()->like($qb->expr()->lower("e.$field"), strtolower("'%{$args['needle']}%'"));
            }
            $xor[] = $qb->expr()->like($qb->expr()->lower("d.name"), strtolower("'%{$args['needle']}%'"));
            $xor[] = $qb->expr()->like($qb->expr()->lower("t.name"), strtolower("'%{$args['needle']}%'"));

            $qb->where($qb->expr()->orX(...$xor));
            $qb->setFirstResult(($args['page'] - 1) * $args['itemsPerPage'])->setMaxResults($args['itemsPerPage']);

            if (isset($args['order']) && !empty($args['order'])) {
                foreach ($args['order'] as $value) {
                    foreach ($value as $field => $order) {
                        $qb->addOrderBy("e.$field", $order);
                    }

                }
            }
            $qb->addOrderBy('e.id', 'ASC');

            return new Paginator(new DoctrinePaginator($qb->getQuery()));
        }

        return $collection;
    }
}
