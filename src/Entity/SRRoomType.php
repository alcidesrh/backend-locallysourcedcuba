<?php

namespace App\Entity;

use App\Repository\SRRoomTypeRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=SRRoomTypeRepository::class)
 */
#[ApiResource]
class SRRoomType
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=HouseRoomType::class)
     */
    private $roomType;

    /**
     * @ORM\ManyToOne(targetEntity=SleepingRequirement::class, inversedBy="sRRoomTypes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $sleepingRequirement;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $cant;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRoomType(): ?HouseRoomType
    {
        return $this->roomType;
    }

    public function setRoomType(?HouseRoomType $roomType): self
    {
        $this->roomType = $roomType;

        return $this;
    }

    public function getSleepingRequirement(): ?SleepingRequirement
    {
        return $this->sleepingRequirement;
    }

    public function setSleepingRequirement(?SleepingRequirement $sleepingRequirement): self
    {
        $this->sleepingRequirement = $sleepingRequirement;

        return $this;
    }

    public function getCant(): ?int
    {
        return $this->cant;
    }

    public function setCant(?int $cant): self
    {
        $this->cant = $cant;

        return $this;
    }
}
