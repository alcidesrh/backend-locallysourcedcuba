<?php

namespace App\Entity;

use App\Repository\HouseSeasonRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * @ORM\Entity(repositoryClass=HouseSeasonRepository::class)
 */
#[ApiResource]
class HouseSeason
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $startDate;

    /**
     * @ORM\Column(type="datetime")
     */
    private $endDate;

    /**
     * @ORM\OneToMany(targetEntity=HouseSeasonRoom::class, mappedBy="houseSeason", orphanRemoval=true)
     */
    private $seasonRooms;

    /**
     * @ORM\ManyToOne(targetEntity=House::class, inversedBy="houseSeasons")
     * @ORM\JoinColumn(nullable=false)
     */
    private $house;

    public function __construct()
    {
        $this->seasonRooms = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;

        return $this;
    }

    /**
     * @return Collection|HouseSeasonRoom[]
     */
    public function getSeasonRooms(): Collection
    {
        return $this->seasonRooms;
    }

    public function addSeasonRoom(HouseSeasonRoom $seasonRoom): self
    {
        if (!$this->seasonRooms->contains($seasonRoom)) {
            $this->seasonRooms[] = $seasonRoom;
            $seasonRoom->setHouseSeason($this);
        }

        return $this;
    }

    public function removeSeasonRoom(HouseSeasonRoom $seasonRoom): self
    {
        if ($this->seasonRooms->removeElement($seasonRoom)) {
            // set the owning side to null (unless already changed)
            if ($seasonRoom->getHouseSeason() === $this) {
                $seasonRoom->setHouseSeason(null);
            }
        }

        return $this;
    }

    public function getHouse(): ?House
    {
        return $this->house;
    }

    public function setHouse(?House $house): self
    {
        $this->house = $house;

        return $this;
    }
}
