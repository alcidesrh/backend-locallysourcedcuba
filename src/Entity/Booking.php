<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\BookingRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BookingRepository::class)
 */
#[ApiResource]

class Booking
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $pax;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $lp;

    /**
     * @ORM\ManyToMany(targetEntity=Tour::class, mappedBy="bookings")
     */
    private $tours;

    /**
     * @ORM\OneToOne(targetEntity=SleepingRequirement::class, inversedBy="booking", cascade={"persist", "remove"})
     */
    private $sleepingRequirement;

    /**
     * @ORM\OneToMany(targetEntity=BookingAccommodation::class, mappedBy="booking", orphanRemoval=true, cascade={"persist"})
     */
    private $bookingAccommodations;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $note;

    /**
     * @ORM\ManyToMany(targetEntity=BookingTransfer::class)
     * @ORM\JoinTable(name="booking_booking_transfersin")
     */
    private $transfersIn;

    /**
     * @ORM\ManyToMany(targetEntity=BookingTransfer::class)
     * @ORM\JoinTable(name="booking_booking_transfersout")
     */
    private $transfersOut;

    public function __construct()
    {
        $this->tours = new ArrayCollection();
        $this->bookingAccommodations = new ArrayCollection();
        $this->transfersIn = new ArrayCollection();
        $this->transfersOut = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getPax(): ?int
    {
        return $this->pax;
    }

    public function setPax(?int $pax): self
    {
        $this->pax = $pax;

        return $this;
    }

    public function getLp(): ?int
    {
        return $this->lp;
    }

    public function setLp(?int $lp): self
    {
        $this->lp = $lp;

        return $this;
    }

    /**
     * @return Collection|Tour[]
     */
    public function getTours(): Collection
    {
        return $this->tours;
    }

    public function addTour(Tour $tour): self
    {
        if (!$this->tours->contains($tour)) {
            $this->tours[] = $tour;
            $tour->addBooking($this);
        }

        return $this;
    }

    public function removeTour(Tour $tour): self
    {
        if ($this->tours->removeElement($tour)) {
            $tour->removeBooking($this);
        }

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

    /**
     * @return Collection|BookingAccommodation[]
     */
    public function getBookingAccommodations(): Collection
    {
        return $this->bookingAccommodations;
    }

    public function addBookingAccommodation(BookingAccommodation $bookingAccommodation): self
    {
        if (!$this->bookingAccommodations->contains($bookingAccommodation)) {
            $this->bookingAccommodations[] = $bookingAccommodation;
            $bookingAccommodation->setBooking($this);
        }

        return $this;
    }

    public function removeBookingAccommodation(BookingAccommodation $bookingAccommodation): self
    {
        if ($this->bookingAccommodations->removeElement($bookingAccommodation)) {
            // set the owning side to null (unless already changed)
            if ($bookingAccommodation->getBooking() === $this) {
                $bookingAccommodation->setBooking(null);
            }
        }

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(?string $note): self
    {
        $this->note = $note;

        return $this;
    }

    /**
     * @return Collection|BookingTransfer[]
     */
    public function getTransfersIn(): Collection
    {
        return $this->transfersIn;
    }

    public function addTransfersIn(BookingTransfer $transfersIn): self
    {
        if (!$this->transfersIn->contains($transfersIn)) {
            $this->transfersIn[] = $transfersIn;
        }

        return $this;
    }

    public function removeTransfersIn(BookingTransfer $transfersIn): self
    {
        $this->transfersIn->removeElement($transfersIn);

        return $this;
    }

    /**
     * @return Collection|BookingTransfer[]
     */
    public function getTransfersOut(): Collection
    {
        return $this->transfersOut;
    }

    public function addTransfersOut(BookingTransfer $transfersOut): self
    {
        if (!$this->transfersOut->contains($transfersOut)) {
            $this->transfersOut[] = $transfersOut;
        }

        return $this;
    }

    public function removeTransfersOut(BookingTransfer $transfersOut): self
    {
        $this->transfersOut->removeElement($transfersOut);

        return $this;
    }
}
