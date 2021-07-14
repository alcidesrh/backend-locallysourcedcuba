<?php

namespace App\Entity;

use App\Repository\HouseSeasonRoomRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=HouseSeasonRoomRepository::class)
 */
#[ApiResource]
class HouseSeasonRoom
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
     * @ORM\ManyToOne(targetEntity=HouseRoom::class, inversedBy="houseSeasonRooms")
     * @ORM\JoinColumn(nullable=false)
     */
    private $room;

    /**
     * @ORM\ManyToOne(targetEntity=HouseSeason::class, inversedBy="seasonRooms")
     * @ORM\JoinColumn(nullable=false)
     */
    private $houseSeason;

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

    public function getRoom(): ?HouseRoom
    {
        return $this->room;
    }

    public function setRoom(?HouseRoom $room): self
    {
        $this->room = $room;

        return $this;
    }

    public function getHouseSeason(): ?HouseSeason
    {
        return $this->houseSeason;
    }

    public function setHouseSeason(?HouseSeason $houseSeason): self
    {
        $this->houseSeason = $houseSeason;

        return $this;
    }
}
