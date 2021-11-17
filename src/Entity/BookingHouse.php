<?php

namespace App\Entity;

use App\Repository\BookingHouseRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=BookingHouseRepository::class)
 */
#[ApiResource]
class BookingHouse
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=House::class)
     */
    private $house;

    /**
     * @ORM\ManyToMany(targetEntity=HouseRoom::class)
     */
    private $rooms;

    /**
     * @ORM\ManyToOne(targetEntity=BookingAccommodation::class, inversedBy="houses")
     */
    private $bookingAccommodation;

    public function __construct()
    {
        $this->rooms = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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
        }

        return $this;
    }

    public function removeRoom(HouseRoom $room): self
    {
        $this->rooms->removeElement($room);

        return $this;
    }

    public function getBookingAccommodation(): ?BookingAccommodation
    {
        return $this->bookingAccommodation;
    }

    public function setBookingAccommodation(?BookingAccommodation $bookingAccommodation): self
    {
        $this->bookingAccommodation = $bookingAccommodation;

        return $this;
    }
}
