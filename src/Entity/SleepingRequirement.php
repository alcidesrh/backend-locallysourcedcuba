<?php

namespace App\Entity;

use App\Repository\SleepingRequirementRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
/**
 * @ORM\Entity(repositoryClass=SleepingRequirementRepository::class)
 */
#[ApiResource]
#[ApiFilter(SearchFilter::class, properties:['booking' => 'exact'])]
class SleepingRequirement
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity=HouseType::class)
     */
    private $accommodationType;

    /**
     * @ORM\OneToMany(targetEntity=SRRoomType::class, mappedBy="sleepingRequirement", orphanRemoval=true, cascade={"persist"})
     */
    private $sRRoomTypes;

    /**
     * @ORM\OneToOne(targetEntity="Booking", mappedBy="sleepingRequirement", cascade={"persist"})
     */
    private $booking;

    public function __construct()
    {
        $this->sRRoomTypes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getAccommodationType(): ?HouseType
    {
        return $this->accommodationType;
    }

    public function setAccommodationType(?HouseType $accommodationType): self
    {
        $this->accommodationType = $accommodationType;

        return $this;
    }

    /**
     * @return Collection|SRRoomType[]
     */
    public function getSRRoomTypes(): Collection
    {
        return $this->sRRoomTypes;
    }

    public function addSRRoomType(SRRoomType $sRRoomType): self
    {
        if (!$this->sRRoomTypes->contains($sRRoomType)) {
            $this->sRRoomTypes[] = $sRRoomType;
            $sRRoomType->setSleepingRequirement($this);
        }

        return $this;
    }

    public function removeSRRoomType(SRRoomType $sRRoomType): self
    {
        if ($this->sRRoomTypes->removeElement($sRRoomType)) {
            // set the owning side to null (unless already changed)
            if ($sRRoomType->getSleepingRequirement() === $this) {
                $sRRoomType->setSleepingRequirement(null);
            }
        }

        return $this;
    }

    public function getBooking(): ?Booking
    {
        return $this->booking;
    }

    public function setBooking(?Booking $booking): self
    {
        $this->booking = $booking;

        return $this;
    }
}
