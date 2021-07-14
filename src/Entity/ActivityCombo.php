<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\GraphqlResolver\ActivityPriorityResolver;
use App\GraphqlResolver\CollectionResolver;
use App\Repository\ActivityComboRepository;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Event\LifecycleEventArgs;

/**
 * @ORM\Entity(repositoryClass=ActivityComboRepository::class)
 * @ORM\HasLifecycleCallbacks()
 */
#[ApiResource(
    attributes: [
        'order' => ['priority' => 'ASC']
    ],
    graphql:[
        
        'item_query',
        'collection_query' => [
            'query' => CollectionResolver::class,
        ],
        'create' => [
            'mutation' => ActivityPriorityResolver::class,
        ],
        'update',
        'delete',
        'priority' => [
            'mutation' => ActivityPriorityResolver::class,
            'args' => [
                'id' => ['type' => 'ID!'],
                'up' => ['type' => 'Boolean!'],
                'entity' => ['type' => 'String!', 'defaultValue' => 'App\Entity\ActivityCombo'],
            ],
        ]
    ]
)]
// #[ApiFilter(OrderFilter::class, properties:['name', 'priority' => 'ASC'], arguments:['orderParameterName' => 'order'])]
class ActivityCombo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $priority;

    /**
     * @ORM\ManyToOne(targetEntity=Activity::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $activity;

    /**
     * @ORM\ManyToOne(targetEntity=Activity::class, inversedBy="activities")
     * @ORM\JoinColumn(nullable=false)
     */
    private $parent;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPriority(): ?int
    {
        return $this->priority;
    }

    public function setPriority(?int $priority): self
    {
        $this->priority = $priority;

        return $this;
    }

    public function getActivity(): ?Activity
    {
        return $this->activity;
    }

    public function setActivity(?Activity $activity): self
    {
        $this->activity = $activity;

        return $this;
    }

    public function getParent(): ?Activity
    {
        return $this->parent;
    }

    public function setParent(?Activity $parent): self
    {
        $this->parent = $parent;

        return $this;
    }

    /**
     * @ORM\PostRemove()
     */
    public function postRemove(LifecycleEventArgs $event)
    {
        if ($items = $this->getParent()->getActivities()) {
        
            $priority = 0;
            foreach ($items as $item) {
                if(!($id = $item->getId()))break;
                $qb = $event->getEntityManager()->createQueryBuilder();
                $qb->update('App\Entity\ActivityCombo', 'ac')->where("ac.id = $id")->set('ac.priority', $priority++)->getQuery()->execute();
            }
        }
    }
}
