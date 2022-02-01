<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\BookingRepository;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use App\GraphqlResolver\BookingCreateResolver;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ORM\Entity(repositoryClass=BookingRepository::class)
 */
#[ApiResource(
    graphql:[
        'item_query',
        'collection_query',
        'create' => [
            'mutation' => BookingCreateResolver::class,
        ],
        'update',
        'delete'
    ]
)]
#[ApiFilter(SearchFilter::class, properties:['tour' => 'exact'])]

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
     * @ORM\ManyToOne(targetEntity=Tour::class, inversedBy="bookings", cascade={"persist"})
     */
    private $tour;

    /**
     * @ORM\OneToMany(targetEntity=BookingTransfer::class, mappedBy="bookingIn", orphanRemoval=true, cascade={"persist"})
     */
    private $transfersIn;

    /**
     * @ORM\OneToMany(targetEntity=BookingTransfer::class, mappedBy="bookingOut", orphanRemoval=true, cascade={"persist"})
     */
    private $transfersOut;

    public function __construct()
    {
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

    public function getTour(): ?Tour
    {
        return $this->tour;
    }

    public function setTour(?Tour $tour): self
    {
        $this->tour = $tour;

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
            $transfersIn->setBookingIn($this);
        }

        return $this;
    }

    public function removeTransfersIn(BookingTransfer $transfersIn): self
    {
        if ($this->transfersIn->removeElement($transfersIn)) {
            // set the owning side to null (unless already changed)
            if ($transfersIn->getBookingIn() === $this) {
                $transfersIn->setBookingIn(null);
            }
        }

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
            $transfersOut->setBookingTransferOut($this);
        }

        return $this;
    }

    public function removeTransfersOut(BookingTransfer $transfersOut): self
    {
        if ($this->transfersOut->removeElement($transfersOut)) {
            // set the owning side to null (unless already changed)
            if ($transfersOut->getBookingTransferOut() === $this) {
                $transfersOut->setBookingTransferOut(null);
            }
        }

        return $this;
    }
}
