<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\BookingTransferRepository;
use Doctrine\Common\Collections\ArrayCollection;
use App\GraphqlResolver\BookingTransferListResolver;
use App\GraphqlResolver\TransfersPerBookingResolver;
use App\GraphqlResolver\BookingTransferIncompleteResolver;
/**
 * @ORM\Entity(repositoryClass=BookingTransferRepository::class)
 */
#[ApiResource(
    graphql:[
        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'per_booking' => [
            'collection_query' => TransfersPerBookingResolver::class,
            'read' => false,
            'args' => [
                'bookings' => ['type' => '[Int]', 'defaultValue' => null]
            ],
        ],
        'list' => [
            'collection_query' => BookingTransferListResolver::class,
            'read' => false,
            'args' => [
                'needle' => ['type' => 'String'],
                'from' => ['type' => 'String'],
                'to' => ['type' => 'String'],
                'notification' => ['type' => '[String]', 'defaultValue' => null],
                'notificationComplete' => ['type' => 'Boolean', 'defaultValue' => null],
                'driver' => ['type' => 'Int'],
                'type' => ['type' => 'String'],
            ],
        ],
        'incomplete' => [
            'collection_query' => BookingTransferIncompleteResolver::class,
            'read' => false
        ],
    ]
)]
class BookingTransfer
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
    private $contact;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $persons;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $date;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $hour;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $flightData;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class)
     */
    private $destination;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $price;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $fromHour;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $toHour;

    /**
     * @ORM\ManyToMany(targetEntity=House::class)
     */
    private $houses;

    /**
     * @ORM\ManyToOne(targetEntity=Driver::class)
     */
    private $driver;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $charge;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $sent;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $canceled;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $note;

    /**
     * @ORM\Column(type="string", length=3, nullable=true)
     */
    private $type;

    /**
     * @ORM\ManyToOne(targetEntity=Booking::class, inversedBy="transfersIn")
     */
    private $bookingIn;

    /**
     * @ORM\ManyToOne(targetEntity=Booking::class, inversedBy="transfersOut")
     */
    private $bookingOut;

    /**
     * @ORM\ManyToOne(targetEntity=Tour::class, inversedBy="bookingTransfers")
     */
    private $tour;

    public function __construct()
    {
        $this->houses = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContact(): ?string
    {
        return $this->contact;
    }

    public function setContact(?string $contact): self
    {
        $this->contact = $contact;

        return $this;
    }

    public function getPersons(): ?int
    {
        return $this->persons;
    }

    public function setPersons(?int $persons): self
    {
        $this->persons = $persons;

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

    public function getHour(): ?string
    {
        return $this->hour ? $this->hour->format('H:i'):  null;
    }

    public function setHour(?\DateTimeInterface $hour): self
    {
        $this->hour = $hour;

        return $this;
    }

    public function getFlightData(): ?string
    {
        return $this->flightData;
    }

    public function setFlightData(?string $flightData): self
    {
        $this->flightData = $flightData;

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

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(?int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getFromHour(): ?string
    {
        return $this->fromHour ? $this->fromHour->format('H:i'): null;
    }

    public function setFromHour(?\DateTimeInterface $fromHour): self
    {
        $this->fromHour = $fromHour;

        return $this;
    }

    public function getToHour(): ?string
    {
        return $this->toHour ? $this->toHour->format('H:i'): null;
    }

    public function setToHour(?\DateTimeInterface $toHour): self
    {
        $this->toHour = $toHour;

        return $this;
    }

    /**
     * @return Collection|House[]
     */
    public function getHouses(): Collection
    {
        return $this->houses;
    }

    public function addHouse(House $house): self
    {
        if (!$this->houses->contains($house)) {
            $this->houses[] = $house;
        }

        return $this;
    }

    public function removeHouse(House $house): self
    {
        $this->houses->removeElement($house);

        return $this;
    }

    public function getDriver(): ?Driver
    {
        return $this->driver;
    }

    public function setDriver(?Driver $driver): self
    {
        $this->driver = $driver;

        return $this;
    }

    public function getCharge(): ?int
    {
        return $this->charge;
    }

    public function setCharge(?int $charge): self
    {
        $this->charge = $charge;

        return $this;
    }

    public function getSent(): ?bool
    {
        return $this->sent;
    }

    public function setSent(?bool $sent): self
    {
        $this->sent = $sent;

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

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(?string $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(?string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getBookingIn(): ?Booking
    {
        return $this->bookingIn;
    }

    public function setBookingIn(?Booking $bookingIn): self
    {
        $this->bookingIn = $bookingIn;
        $this->tour = $bookingIn->getTour();

        return $this;
    }

    public function getBookingOut(): ?Booking
    {
        return $this->bookingOut;
    }

    public function setBookingOut(?Booking $bookingOut): self
    {
        $this->bookingOut = $bookingOut;
        $this->tour = $bookingOut->getTour();

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
