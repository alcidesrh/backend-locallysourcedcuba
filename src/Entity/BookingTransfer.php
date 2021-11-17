<?php

namespace App\Entity;

use App\Repository\BookingTransferRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * @ORM\Entity(repositoryClass=BookingTransferRepository::class)
 */
#[ApiResource]
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

    public function getHour(): ?\DateTimeInterface
    {
        return $this->hour;
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

    public function getFromHour(): ?\DateTimeInterface
    {
        return $this->fromHour;
    }

    public function setFromHour(?\DateTimeInterface $fromHour): self
    {
        $this->fromHour = $fromHour;

        return $this;
    }

    public function getToHour(): ?\DateTimeInterface
    {
        return $this->toHour;
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
}
