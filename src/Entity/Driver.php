<?php

namespace App\Entity;

use App\Repository\DriverRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiFilter;
use App\GraphqlResolver\CollectionResolver;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;

/**
 * @ORM\Entity(repositoryClass=DriverRepository::class)
 */
#[ApiResource(
    graphql:[
        
        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'list' => [
            'collection_query' => CollectionResolver::class,
            'pagination_enabled' => true,
            'pagination_type' => 'page',
            'args' => [
                'page' => ['type' => 'Int'],
                'itemsPerPage' => ['type' => 'Int'],
                'order' => ['type' => 'DriverFilter_order'],
                'needle' => ['type' => 'String'],
                'properties' => ['type' => '[String]', 'defaultValue' => ['name']],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\Driver'],
            ]
        ],
    ]
)]
#[ApiFilter(OrderFilter::class, properties:['name'], arguments:['orderParameterName' => 'order'])]
class Driver
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
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    private $phone;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $pax;
    /**
     * @ORM\OneToMany(targetEntity=Transportation::class, mappedBy="driver")
     */
    private $transportations;

    public function __construct()
    {
        $this->transportations = new ArrayCollection();
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

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getPax(): ?int
    {
        return $this->pax;
    }

    public function setPax(?int $pax): self
    {
        $this->pax = $pax;

        return $this;
    }

    /**
     * @return Collection|Transportation[]
     */
    public function getTransportations(): Collection
    {
        return $this->transportations;
    }

    public function addTransportation(Transportation $transportation): self
    {
        if (!$this->transportations->contains($transportation)) {
            $this->transportations[] = $transportation;
            $transportation->setDriver($this);
        }

        return $this;
    }

    public function removeTransportation(Transportation $transportation): self
    {
        if ($this->transportations->removeElement($transportation)) {
            // set the owning side to null (unless already changed)
            if ($transportation->getDriver() === $this) {
                $transportation->setDriver(null);
            }
        }

        return $this;
    }
}
