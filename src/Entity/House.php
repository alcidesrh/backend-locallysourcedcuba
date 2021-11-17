<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use App\GraphqlResolver\HouseCollectionResolver;
use App\Repository\HouseRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=HouseRepository::class)
 */
#[ApiResource(
    graphql:[

        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'list' => [
            'collection_query' => HouseCollectionResolver::class,
            'pagination_enabled' => true,
            'pagination_type' => 'page',
            'args' => [
                'page' => ['type' => 'Int'],
                'itemsPerPage' => ['type' => 'Int'],
                'order' => ['type' => 'HouseFilter_order'],
                'needle' => ['type' => 'String'],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\House'],
            ],
        ],
    ]
)]
#[ApiFilter(OrderFilter::class, properties:['name'], arguments:['orderParameterName' => 'order'])]
#[ApiFilter(SearchFilter::class, properties:['destination' => 'exact'])]
class House
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
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $address;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     */
    private $email;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity=HouseType::class, inversedBy="houses")
     */
    private $type;

    /**
     * @ORM\ManyToMany(targetEntity=HouseFeature::class, inversedBy="houses", orphanRemoval=true, cascade={"persist"})
     */
    private $features;

    /**
     * @ORM\OneToMany(targetEntity=HouseRoom::class, mappedBy="house", orphanRemoval=true, cascade={"persist"})
     */
    private $rooms;

    /**
     * @ORM\OneToMany(targetEntity=HouseSeason::class, mappedBy="house", orphanRemoval=true, cascade={"persist"})
     */
    private $houseSeasons;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class, inversedBy="houses")
     */
    private $destination;

    public function __construct()
    {
        $this->features = new ArrayCollection();
        $this->rooms = new ArrayCollection();
        $this->houseSeasons = new ArrayCollection();
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

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getType(): ?HouseType
    {
        return $this->type;
    }

    public function setType(?HouseType $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return Collection|HouseFeature[]
     */
    public function getFeatures(): Collection
    {
        return $this->features;
    }

    public function addFeature(HouseFeature $feature): self
    {
        if (!$this->features->contains($feature)) {
            $this->features[] = $feature;
        }

        return $this;
    }

    public function removeFeature(HouseFeature $feature): self
    {
        $this->features->removeElement($feature);

        return $this;
    }

    /**
     * @return Collection|HouseRoom[]
     */
    public function getRooms(): Collection
    {
        return $this->rooms;
    }

    public function addRoom(HouseRoom $room): self
    {
        if (!$this->rooms->contains($room)) {
            $this->rooms[] = $room;
            $room->setHouse($this);
        }

        return $this;
    }

    public function removeRoom(HouseRoom $room): self
    {
        if ($this->rooms->removeElement($room)) {
            // set the owning side to null (unless already changed)
            if ($room->getHouse() === $this) {
                $room->setHouse(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|HouseSeason[]
     */
    public function getHouseSeasons(): Collection
    {
        return $this->houseSeasons;
    }

    public function addHouseSeason(HouseSeason $houseSeason): self
    {
        if (!$this->houseSeasons->contains($houseSeason)) {
            $this->houseSeasons[] = $houseSeason;
            $houseSeason->setHouse($this);
        }

        return $this;
    }

    public function removeHouseSeason(HouseSeason $houseSeason): self
    {
        if ($this->houseSeasons->removeElement($houseSeason)) {
            // set the owning side to null (unless already changed)
            if ($houseSeason->getHouse() === $this) {
                $houseSeason->setHouse(null);
            }
        }

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
}
