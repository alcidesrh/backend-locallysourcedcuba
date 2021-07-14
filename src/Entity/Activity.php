<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\ActivityRepository;
use ApiPlatform\Core\Annotation\ApiFilter;
use App\GraphqlResolver\ActivityCollectionResolver;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;

/**
 * @ORM\Entity(repositoryClass=ActivityRepository::class)
 */
#[ApiResource(
    graphql:[
        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'list' => [
            'collection_query' => ActivityCollectionResolver::class,
            'args' => [
                'order' => ['type' => 'ActivityFilter_order'],
                'needle' => ['type' => 'String'],
                'properties' => ['type' => '[String]', 'defaultValue' => ['name']],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\Activity'],
            ]
        ],
    ]
)]
#[ApiFilter(OrderFilter::class, properties:['name'], arguments:['orderParameterName' => 'order'])]
class Activity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class, inversedBy="activities")
     */
    private $destination;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $personCost;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $guideCost;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $carCost;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $personPerCar;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $type;

    /**
     * @ORM\OneToMany(targetEntity=ActivityCombo::class, mappedBy="parent", orphanRemoval=true)
     * @ORM\OrderBy({"priority" = "ASC"})
     */
    private $activities;

    /**
     * @ORM\OneToMany(targetEntity=ActivityCombo::class, mappedBy="activity", orphanRemoval=true)
     * @ORM\OrderBy({"priority" = "ASC"})
     */
    private $activitiesItems;

    public function __construct()
    {
        $this->activities = new ArrayCollection();
        $this->activitiesItems = new ArrayCollection();
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

    public function getDestination(): ?Destination
    {
        return $this->destination;
    }

    public function setDestination(?Destination $destination): self
    {
        $this->destination = $destination;

        return $this;
    }

    public function getPersonCost(): ?int
    {
        return $this->personCost;
    }

    public function setPersonCost(?int $personCost): self
    {
        $this->personCost = $personCost;

        return $this;
    }

    public function getGuideCost(): ?int
    {
        return $this->guideCost;
    }

    public function setGuideCost(?int $guideCost): self
    {
        $this->guideCost = $guideCost;

        return $this;
    }

    public function getCarCost(): ?int
    {
        return $this->carCost;
    }

    public function setCarCost(?int $carCost): self
    {
        $this->carCost = $carCost;

        return $this;
    }

    public function getPersonPerCar(): ?int
    {
        return $this->personPerCar;
    }

    public function setPersonPerCar(?int $personPerCar): self
    {
        $this->personPerCar = $personPerCar;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(?string $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return Collection|ActivityCombo[]
     */
    public function getActivities(): Collection
    {
        return $this->activities;
    }

    public function addActivity(ActivityCombo $activity): self
    {
        if (!$this->activities->contains($activity)) {
            $this->activities[] = $activity;
            $activity->setActivity($this);
        }

        return $this;
    }

    public function removeActivity(ActivityCombo $activity): self
    {
        if ($this->activities->removeElement($activity)) {
            // set the owning side to null (unless already changed)
            if ($activity->getActivity() === $this) {
                $activity->setActivity(null);
            }
        }

        return $this;
    }
}
