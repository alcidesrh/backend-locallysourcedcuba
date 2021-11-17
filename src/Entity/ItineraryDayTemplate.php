<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\ItineraryDayTemplateRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ItineraryDayTemplateRepository::class)
 */
#[ApiResource]
class ItineraryDayTemplate
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=ItineraryTemplate::class, inversedBy="itineraryDays")
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

    public function __construct()
    {
        $this->activities = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getItinerary(): ?ItineraryTemplate
    {
        return $this->itinerary;
    }

    public function setItinerary(?ItineraryTemplate $itinerary): self
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
}
