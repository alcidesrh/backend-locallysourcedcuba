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
class ItineraryDay
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Itinerary::class, inversedBy="itineraryDays")
     * @ORM\JoinColumn(nullable=false)
     */
    private $itinerary;

    /**
     * @ORM\ManyToMany(targetEntity=Activity::class)
     */
    private $activities;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $noGuide;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $day;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $date;

    public function __construct()
    {
        $this->activities = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getItinerary(): ?Itinerary
    {
        return $this->itinerary;
    }

    public function setItinerary(?Itinerary $itinerary): self
    {
        $this->itinerary = $itinerary;

        return $this;
    }

    /**
     * @return Collection|Activity[]
     */
    public function getActivities(): Collection
    {
        return $this->activities;
    }

    public function setActivities(?Collection $activities): self
    {
        $this->activities = $activities;
        return $this;
    }

    public function addActivity(Activity $activity): self
    {
        if (!$this->activities->contains($activity)) {
            $this->activities[] = $activity;
        }

        return $this;
    }

    public function removeActivity(Activity $activity): self
    {
        $this->activities->removeElement($activity);

        return $this;
    }

    public function getNoGuide(): ?bool
    {
        return $this->noGuide ?? false;
    }

    public function setNoGuide(?bool $noGuide): self
    {
        $this->noGuide = $noGuide;

        return $this;
    }

    public function getDay(): ?int
    {
        return $this->day;
    }

    public function setDay(?int $day): self
    {
        $this->day = $day;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }
}
