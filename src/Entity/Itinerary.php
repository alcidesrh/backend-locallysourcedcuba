<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity()
 */
#[ApiResource]
class Itinerary
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="smallint")
     */
    private $days;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class)
     */
    private $destination;

    /**
     * @ORM\OneToMany(targetEntity=ItineraryDay::class, mappedBy="itinerary", orphanRemoval=true, cascade={"persist"})
     */
    private $itineraryDays;

    /**
     * @ORM\ManyToOne(targetEntity=House::class)
     */
    private $house;

    /**
     * @ORM\ManyToOne(targetEntity=Tour::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $tour;

    public function __construct()
    {
        $this->itineraryDays = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDays(): ?int
    {
        return $this->days;
    }

    public function setDays(int $days): self
    {
        $this->days = $days;

        return $this;
    }

    public function getDestination(): ?Destination
    {
        return $this->destination;
    }

    public function setDestination(?Destination $destination): self
    {
        $this->destination = $destination;

        return $this;
    }

    /**
     * @return Collection|ItineraryDay[]
     */
    public function getItineraryDays(): Collection
    {
        return $this->itineraryDays;
    }

    public function addItineraryDay(ItineraryDay $itineraryDay): self
    {
        if (!$this->itineraryDays->contains($itineraryDay)) {
            $this->itineraryDays[] = $itineraryDay;
            $itineraryDay->setItinerary($this);
        }

        return $this;
    }

    public function removeItineraryDay(ItineraryDay $itineraryDay): self
    {
        if ($this->itineraryDays->removeElement($itineraryDay)) {
            // set the owning side to null (unless already changed)
            if ($itineraryDay->getItinerary() === $this) {
                $itineraryDay->setItinerary(null);
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

    public function getTour(): ?Tour
    {
        return $this->tour;
    }

    public function setTour(?Tour $tour): self
    {
        $this->tour = $tour;

        return $this;
    }
}
