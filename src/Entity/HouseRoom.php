<?php

namespace App\Entity;

use App\Repository\HouseRoomRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=HouseRoomRepository::class)
 */
#[ApiResource]
class HouseRoom
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
    private $price;

    /**
     * @ORM\ManyToOne(targetEntity=HouseRoomType::class, inversedBy="houseRooms")
     * @ORM\JoinColumn(nullable=false)
     */
    private $roomType;

    /**
     * @ORM\ManyToOne(targetEntity=House::class, inversedBy="rooms")
     */
    private $house;

    /**
     * @ORM\OneToMany(targetEntity=HouseSeasonRoom::class, mappedBy="room", orphanRemoval=true)
     */
    private $houseSeasonRooms;

    public function __construct()
    {
        $this->houseSeasonRooms = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(?int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getRoomType(): ?HouseRoomType
    {
        return $this->roomType;
    }

    public function setRoomType(?HouseRoomType $room): self
    {
        $this->roomType = $room;

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

    /**
     * @return Collection|HouseSeasonRoom[]
     */
    public function getHouseSeasonRooms(): Collection
    {
        return $this->houseSeasonRooms;
    }

    public function addHouseSeasonRoom(HouseSeasonRoom $houseSeasonRoom): self
    {
        if (!$this->houseSeasonRooms->contains($houseSeasonRoom)) {
            $this->houseSeasonRooms[] = $houseSeasonRoom;
            $houseSeasonRoom->setRoom($this);
        }

        return $this;
    }

    public function removeHouseSeasonRoom(HouseSeasonRoom $houseSeasonRoom): self
    {
        if ($this->houseSeasonRooms->removeElement($houseSeasonRoom)) {
            // set the owning side to null (unless already changed)
            if ($houseSeasonRoom->getRoom() === $this) {
                $houseSeasonRoom->setRoom(null);
            }
        }

        return $this;
    }
}
