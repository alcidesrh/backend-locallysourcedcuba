<?php

namespace App\Entity;

use App\Repository\HouseRoomTypeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=HouseRoomTypeRepository::class)
 */
#[ApiResource]
class HouseRoomType
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
     * @ORM\OneToMany(targetEntity=HouseRoom::class, mappedBy="room", orphanRemoval=true)
     */
    private $houseRooms;

    public function __construct()
    {
        $this->houseRooms = new ArrayCollection();
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
     * @return Collection|HouseRoom[]
     */
    public function getHouseRooms(): Collection
    {
        return $this->houseRooms;
    }

    public function addHouseRoom(HouseRoom $houseRoom): self
    {
        if (!$this->houseRooms->contains($houseRoom)) {
            $this->houseRooms[] = $houseRoom;
            $houseRoom->setRoom($this);
        }

        return $this;
    }

    public function removeHouseRoom(HouseRoom $houseRoom): self
    {
        if ($this->houseRooms->removeElement($houseRoom)) {
            // set the owning side to null (unless already changed)
            if ($houseRoom->getRoom() === $this) {
                $houseRoom->setRoom(null);
            }
        }

        return $this;
    }
}
