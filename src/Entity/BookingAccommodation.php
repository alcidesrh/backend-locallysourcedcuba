<?php

namespace App\Entity;

use App\Repository\BookingAccommodationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
    
/**
 * @ORM\Entity(repositoryClass=BookingAccommodationRepository::class)
 */
#[ApiResource]

class BookingAccommodation
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateIn;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateOut;

    /**
     * @ORM\ManyToOne(targetEntity=Booking::class, inversedBy="bookingAccommodations")
     * @ORM\JoinColumn(nullable=false)
     */
    private $booking;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $canceled;

    /**
     * @ORM\OneToMany(targetEntity=BookingHouse::class, mappedBy="bookingAccommodation", orphanRemoval=true, cascade={"persist"})
     */
    private $houses;

    /**
     * @ORM\ManyToOne(targetEntity=Itinerary::class)
     */
    private $itinerary;


    public function __construct()
    {
        $this->houses = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateIn(): ?\DateTimeInterface
    {
        return $this->dateIn;
    }

    public function setDateIn(?\DateTimeInterface $dateIn): self
    {
        $this->dateIn = $dateIn;

        return $this;
    }

    public function getDateOut(): ?\DateTimeInterface
    {
        return $this->dateOut;
    }

    public function setDateOut(?\DateTimeInterface $dateOut): self
    {
        $this->dateOut = $dateOut;

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

    public function getCanceled(): ?bool
    {
        return $this->canceled;
    }

    public function setCanceled(?bool $canceled): self
    {
        $this->canceled = $canceled;

        return $this;
    }

    /**
     * @return Collection|BookingHouse[]
     */
    public function getHouses(): Collection
    {
        return $this->houses;
    }

    public function addHouse(BookingHouse $house): self
    {
        if (!$this->houses->contains($house)) {
            $this->houses[] = $house;
            $house->setBookingAccommodation($this);
        }

        return $this;
    }

    public function removeHouse(BookingHouse $house): self
    {
        if ($this->houses->removeElement($house)) {
            // set the owning side to null (unless already changed)
            if ($house->getBookingAccommodation() === $this) {
                $house->setBookingAccommodation(null);
            }
        }

        return $this;
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
}
