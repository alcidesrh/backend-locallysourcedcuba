<?php

namespace App\Entity;

use App\Repository\HouseFeatureRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=HouseFeatureRepository::class)
 */
#[ApiResource]
class HouseFeature
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
     * @ORM\ManyToMany(targetEntity=House::class, mappedBy="features")
     */
    private $houses;

    public function __construct()
    {
        $this->houses = new ArrayCollection();
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

    /**
     * @return Collection|House[]
     */
    public function getHouses(): Collection
    {
        return $this->houses;
    }

    public function addHouse(House $room): self
    {
        if (!$this->houses->contains($room)) {
            $this->houses[] = $room;
            $room->addFeature($this);
        }

        return $this;
    }

    public function removeHouse(House $room): self
    {
        if ($this->houses->removeElement($room)) {
            $room->removeFeature($this);
        }

        return $this;
    }
}
