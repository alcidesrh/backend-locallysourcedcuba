<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity()
 */
#[ApiResource]
class BookingHouseRoom
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
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $cant;

    /**
     * @ORM\ManyToOne(targetEntity=HouseRoom::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $houseRoom;

    /**
     * @ORM\ManyToOne(targetEntity=BookingHouse::class, inversedBy="bookingHouseRooms")
     * @ORM\JoinColumn(nullable=false)
     */
    private $bookingHouse;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrice(): ?int
    {
        return $this->price ?? $this->houseRoom?->getPrice();
    }

    public function setPrice(?int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getCant(): ?int
    {
        return $this->cant ?? $this->houseRoom?->getCant();
    }

    public function setCant(?int $cant): self
    {
        $this->cant = $cant;

        return $this;
    }

    public function getHouseRoom(): ?HouseRoom
    {
        return $this->houseRoom;
    }

    public function setHouseRoom(?HouseRoom $houseRoom): self
    {
        $this->houseRoom = $houseRoom;

        return $this;
    }

    public function getBookingHouse(): ?BookingHouse
    {
        return $this->bookingHouse;
    }

    public function setBookingHouse(?BookingHouse $bookingHouse): self
    {
        $this->bookingHouse = $bookingHouse;

        return $this;
    }
}
