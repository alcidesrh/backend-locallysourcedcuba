<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\QueryCollectionResolverInterface;
use App\Entity\Destination;
use Doctrine\ORM\EntityManagerInterface;

final class ActivityCollectionResolver implements QueryCollectionResolverInterface
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

            $qb = $this->em->createQueryBuilder()->select('e')->from($args['entity'], 'e')->join('e.destination', 'd');

            $xor = [];
            foreach (['name'] as $field) {
                $xor[] = $qb->expr()->like($qb->expr()->lower("e.$field"), strtolower("'%{$args['needle']}%'"));
            }
            $xor[] = $qb->expr()->like($qb->expr()->lower("d.name"), strtolower("'%{$args['needle']}%'"));

            $qb->where($qb->expr()->orX(...$xor));

            if (isset($args['order']) && !empty($args['order'])) {
                foreach ($args['order'] as $value) {
                    foreach ($value as $field => $order) {
                        $qb->addOrderBy("e.$field", $order);
                    }

                }
            }
            $qb->addOrderBy('e.id', 'ASC');

            return $qb->getQuery()->getResult();
        }

        return $collection;
    }
}
