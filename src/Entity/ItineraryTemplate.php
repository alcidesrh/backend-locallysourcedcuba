<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\ItineraryTemplateRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ItineraryTemplateRepository::class)
 */
#[ApiResource]
class ItineraryTemplate
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
     * @ORM\OneToMany(targetEntity=ItineraryDayTemplate::class, mappedBy="itinerary", orphanRemoval=true, cascade={"persist"})
     */
    private $itineraryDays;

    /**
     * @ORM\ManyToOne(targetEntity=House::class)
     */
    private $house;

    /**
     * @ORM\ManyToOne(targetEntity=TourTemplate::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $tourTemplate;

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
     * @return Collection|ItineraryDayTemplate[]
     */
    public function getItineraryDays(): Collection
    {
        return $this->itineraryDays;
    }

    public function addItineraryDay(ItineraryDayTemplate $itineraryDay): self
    {
        if (!$this->itineraryDays->contains($itineraryDay)) {
            $this->itineraryDays[] = $itineraryDay;
            $itineraryDay->setItinerary($this);
        }

        return $this;
    }

    public function removeItineraryDay(ItineraryDayTemplate $itineraryDay): self
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

    public function getTourTemplate(): ?TourTemplate
    {
        return $this->tourTemplate;
    }

    public function setTourTemplate(?TourTemplate $tourTemplate): self
    {
        $this->tourTemplate = $tourTemplate;

        return $this;
    }
}
