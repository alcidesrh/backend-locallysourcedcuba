<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\GraphqlResolver\PriorityResolver;
use ApiPlatform\Core\Annotation\ApiFilter;
use App\Repository\NotificationRepository;
use Doctrine\ORM\Event\LifecycleEventArgs;
use App\GraphqlResolver\CollectionResolver;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ORM\Entity(repositoryClass=NotificationRepository::class)
 * @ORM\HasLifecycleCallbacks()
 */
#[ApiResource(
    graphql:[        
        'item_query',
        'collection_query',
        'create' => [
            'mutation' => PriorityResolver::class,
        ],
        'update',
        'delete',
        'priority' => [
            'mutation' => PriorityResolver::class,
            'args' => [
                'id' => ['type' => 'ID!'],
                'up' => ['type' => 'Boolean!'],
            ],
        ],
        'list' => [
            'collection_query' => CollectionResolver::class,
            'pagination_enabled' => true,
            'pagination_type' => 'page',
            'args' => [
                'page' => ['type' => 'Int'],
                'itemsPerPage' => ['type' => 'Int'],
                'order' => ['type' => 'NotificationFilter_order'],
                'needle' => ['type' => 'String'],
                'properties' => ['type' => '[String]', 'defaultValue' => ['name']],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\Notification'],
                'orderPriority' => ['type' => '[String]', 'defaultValue' => ['field' => 'priority', 'order' => 'ASC']],
            ],
        ],
    ]
)]
#[ApiFilter(OrderFilter::class, properties:['name', 'priority' => 'ASC'], arguments:['orderParameterName' => 'order'])]
#[ApiFilter(SearchFilter::class, properties: ['services.code' => 'exact'])]
class Notification
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $icon;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $days;

    /**
     * @ORM\Column(type="smallint", nullable=true, options={"default": 0})
     */
    private $priority;

    /**
     * @ORM\ManyToMany(targetEntity=Service::class, inversedBy="notifications")
     */
    private $services;

    /**
     * @ORM\OneToMany(targetEntity=Notification::class, mappedBy="notification", orphanRemoval=true)
     */
    private $tourTemplateNotifications;

    public function __construct()
    {
        $this->services = new ArrayCollection();
        $this->tourTemplateNotifications = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getIcon(): ?string
    {
        return $this->icon;
    }

    public function setIcon(?string $icon): self
    {
        $this->icon = $icon;

        return $this;
    }

    public function getDays(): ?int
    {
        return $this->days;
    }

    public function setDays(?int $days): self
    {
        $this->days = $days;

        return $this;
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

    /**
     * @return Collection|Service[]
     */
    public function getServices(): Collection
    {
        return $this->services;
    }

    public function addService(Service $service): self
    {
        if (!$this->services->contains($service)) {
            $this->services[] = $service;
        }

        return $this;
    }

    public function removeService(Service $service): self
    {
        $this->services->removeElement($service);

        return $this;
    }

    /**
     * @ORM\PostRemove()
     */
    public function postRemove(LifecycleEventArgs $event)
    {
        $em = $event->getEntityManager();
        if ($items = $em->createQueryBuilder()->select(array('e'))->from('App\Entity\Notification', 'e')->orderBy('e.priority', 'ASC')->getQuery()->getResult()) {
            $priority = 0;
            foreach ($items as $item) {
                $item->setPriority($priority++);
                $em->persist($item);
            }
            $em->flush();
        }
    }

    public function getNotification(): ?self
    {
        return $this->notification;
    }

    public function setNotification(?self $notification): self
    {
        $this->notification = $notification;

        return $this;
    }

    /**
     * @return Collection|self[]
     */
    public function getTourTemplateNotifications(): Collection
    {
        return $this->tourTemplateNotifications;
    }

    public function addTourTemplateNotification(self $tourTemplateNotification): self
    {
        if (!$this->tourTemplateNotifications->contains($tourTemplateNotification)) {
            $this->tourTemplateNotifications[] = $tourTemplateNotification;
            $tourTemplateNotification->setNotification($this);
        }

        return $this;
    }

    public function removeTourTemplateNotification(self $tourTemplateNotification): self
    {
        if ($this->tourTemplateNotifications->removeElement($tourTemplateNotification)) {
            // set the owning side to null (unless already changed)
            if ($tourTemplateNotification->getNotification() === $this) {
                $tourTemplateNotification->setNotification(null);
            }
        }

        return $this;
    }
}
