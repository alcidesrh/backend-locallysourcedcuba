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
     * @ORM\ManyToOne(targetEntity=BookingAccommodation::class, inversedBy="houses")
     */
    private $bookingAccommodation;

    /**
     * @ORM\OneToMany(targetEntity=BookingHouseRoom::class, mappedBy="bookingHouse", orphanRemoval=true)
     */
    private $bookingHouseRooms;

    public function __construct()
    {
        $this->bookingHouseRooms = new ArrayCollection();
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

    public function getBookingAccommodation(): ?BookingAccommodation
    {
        return $this->bookingAccommodation;
    }

    public function setBookingAccommodation(?BookingAccommodation $bookingAccommodation): self
    {
        $this->bookingAccommodation = $bookingAccommodation;

        return $this;
    }

    /**
     * @return Collection|BookingHouseRoom[]
     */
    public function getBookingHouseRooms(): Collection
    {
        return $this->bookingHouseRooms;
    }

    public function addBookingHouseRoom(BookingHouseRoom $bookingHouseRoom): self
    {
        if (!$this->bookingHouseRooms->contains($bookingHouseRoom)) {
            $this->bookingHouseRooms[] = $bookingHouseRoom;
            $bookingHouseRoom->setBookingHouse($this);
        }

        return $this;
    }

    public function removeBookingHouseRoom(BookingHouseRoom $bookingHouseRoom): self
    {
        if ($this->bookingHouseRooms->removeElement($bookingHouseRoom)) {
            // set the owning side to null (unless already changed)
            if ($bookingHouseRoom->getBookingHouse() === $this) {
                $bookingHouseRoom->setBookingHouse(null);
            }
        }

        return $this;
    }
}
