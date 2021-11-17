<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\TourRepository;
use App\GraphqlResolver\TourListResolver;
use App\GraphqlResolver\TourCreateResolver;
use App\GraphqlResolver\TourLsListResolver;
use App\GraphqlResolver\TourUpdateResolver;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass=TourRepository::class)
 */
#[ApiResource(
    graphql:[
        'item_query',
        'collection_query',
        'create' => [
            'mutation' => TourCreateResolver::class,
        ],
        'update' => [
            'mutation' => TourUpdateResolver::class,
        ],
        'delete',
        'list' => [
            'collection_query' => TourListResolver::class,
            'args' => [
                'service' => ['type' => 'String'],
                'needle' => ['type' => 'String'],
                'from' => ['type' => 'String'],
                'to' => ['type' => 'String'],
                'notification' => ['type' => '[Int]', 'defaultValue' => null],
                'notificationComplete' => ['type' => 'Boolean', 'defaultValue' => null],
                'template' => ['type' => 'Int', 'defaultValue' => null],
            ],
        ],
        'listLs' => [
            'collection_query' => TourLsListResolver::class,
            'args' => [
                'service' => ['type' => 'String'],
                'needle' => ['type' => 'String'],
                'from' => ['type' => 'String'],
                'to' => ['type' => 'String'],
                'notification' => ['type' => '[Int]', 'defaultValue' => null],
                'notificationComplete' => ['type' => 'Boolean', 'defaultValue' => null],
                'template' => ['type' => 'Int', 'defaultValue' => null],
            ],
        ]
    ]
)]
// #[ApiFilter(SearchFilter::class, properties:['service.code' => 'exact'])]
class Tour
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=30, nullable=true, unique=true)
     */
    private $code;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $guideWage;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Guide")
     * @ORM\JoinColumn(name="guide_id", referencedColumnName="id", nullable=true, onDelete="SET NULL")
     */
    protected $guide;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $color;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $startPlace;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $finishPlace;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\ManyToMany(targetEntity=Activity::class)
     */
    private $activities;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $bonus;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $days;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $startDay;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class)
     */
    private $transferIn;

    /**
     * @ORM\ManyToOne(targetEntity=Destination::class)
     */
    private $transferOut;

    /**
     * @ORM\ManyToOne(targetEntity=Transportation::class)
     */
    private $transportation;

    /**
     * @ORM\ManyToOne(targetEntity=HouseType::class)
     */
    private $houseType;

    /**
     * @ORM\OneToMany(targetEntity=Itinerary::class, mappedBy="tour", orphanRemoval=true, cascade={"persist"})
     */
    private $itineraries;

    /**
     * @ORM\OneToMany(targetEntity=NotificationTour::class, mappedBy="tour", orphanRemoval=true, cascade={"persist"})
     */
    private $notifications;

    /**
     * @ORM\ManyToOne(targetEntity=TourTemplate::class, inversedBy="tours")
     * @ORM\JoinColumn(name="template_id", referencedColumnName="id", onDelete="SET NULL")
     */
    private $template;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $agent;

    /**
     * @ORM\ManyToOne(targetEntity=Service::class, inversedBy="tours")
     */
    private $service;

    /**
     * @ORM\ManyToMany(targetEntity=Booking::class, inversedBy="tours", orphanRemoval=true, cascade={"persist"})
     */
    private $bookings;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $startDate;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $canceled;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $endDate;

    public function __construct()
    {
        $this->activities = new ArrayCollection();
        $this->itineraries = new ArrayCollection();
        $this->notifications = new ArrayCollection();
        $this->bookings = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(?string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getGuideWage(): ?float
    {
        return $this->guideWage;
    }

    public function setGuideWage(?float $guideWage): self
    {
        $this->guideWage = $guideWage;

        return $this;
    }

    public function getGuide(): ?Guide
    {
        return $this->guide;
    }

    public function setGuide(?Guide $guide): self
    {
        $this->guide = $guide;

        return $this;
    }

    public function getColor(): ?string
    {
        return $this->color;
    }

    public function setColor(?string $color): self
    {
        $this->color = $color;

        return $this;
    }

    public function getStartPlace(): ?string
    {
        return $this->startPlace;
    }

    public function setStartPlace(?string $startPlace): self
    {
        $this->startPlace = $startPlace;

        return $this;
    }

    public function getFinishPlace(): ?string
    {
        return $this->finishPlace;
    }

    public function setFinishPlace(?string $finishPlace): self
    {
        $this->finishPlace = $finishPlace;

        return $this;
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

    public function getBonus(): ?int
    {
        return $this->bonus;
    }

    public function setBonus(?int $bonus): self
    {
        $this->bonus = $bonus;

        return $this;
    }

    public function getDays(): ?int
    {
        return $this->days;
    }

    public function setDays(?int $days): self
    {
        $this->days = $days;

        return $this;
    }

    public function getStartDay(): ?int
    {
        return $this->startDay;
    }

    public function setStartDay(?int $startDay): self
    {
        $this->startDay = $startDay;

        return $this;
    }

    public function getTransferIn(): ?Destination
    {
        return $this->transferIn;
    }

    public function setTransferIn(?Destination $transferIn): self
    {
        $this->transferIn = $transferIn;

        return $this;
    }

    public function getTransferOut(): ?Destination
    {
        return $this->transferOut;
    }

    public function setTransferOut(?Destination $transferOut): self
    {
        $this->transferOut = $transferOut;

        return $this;
    }

    public function getTransportation(): ?Transportation
    {
        return $this->transportation;
    }

    public function setTransportation(?Transportation $transportation): self
    {
        $this->transportation = $transportation;

        return $this;
    }

    public function getHouseType(): ?HouseType
    {
        return $this->houseType;
    }

    public function setHouseType(?HouseType $houseType): self
    {
        $this->houseType = $houseType;

        return $this;
    }

    /**
     * @return Collection|ItineraryTemplate[]
     */
    public function getItineraries(): Collection
    {
        return $this->itineraries;
    }

    public function addItinerary(Itinerary $itinerary): self
    {
        if (!$this->itineraries->contains($itinerary)) {
            $this->itineraries[] = $itinerary;
            $itinerary->setTour($this);
        }

        return $this;
    }

    public function removeItinerary(Itinerary $itinerary): self
    {
        if ($this->itineraries->removeElement($itinerary)) {
            // set the owning side to null (unless already changed)
            if ($itinerary->getTour() === $this) {
                $itinerary->setTour(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|NotificationTour[]
     */
    public function getNotifications(): Collection
    {
        return $this->notifications;
    }

    public function addNotification(NotificationTour $notification): self
    {
        if (!$this->notifications->contains($notification)) {
            $this->notifications[] = $notification;
            $notification->setTour($this);
        }

        return $this;
    }

    public function removeNotification(NotificationTour $notification): self
    {
        if ($this->notifications->removeElement($notification)) {
            // set the owning side to null (unless already changed)
            if ($notification->getTour() === $this) {
                $notification->setTour(null);
            }
        }

        return $this;
    }

    public function getTemplate(): ?TourTemplate
    {
        return $this->template;
    }

    public function setTemplate(?TourTemplate $template): self
    {
        $this->template = $template;

        return $this;
    }

    public function getAgent(): ?bool
    {
        return $this->agent;
    }

    public function setAgent(?bool $agent): self
    {
        $this->agent = $agent;

        return $this;
    }

    public function getService(): ?Service
    {
        return $this->service;
    }

    public function setService(?Service $service): self
    {
        $this->service = $service;

        return $this;
    }

    /**
     * @return Collection|Booking[]
     */
    public function getBookings(): Collection
    {
        return $this->bookings;
    }

    public function addBooking(Booking $booking): self
    {
        if (!$this->bookings->contains($booking)) {
            $this->bookings[] = $booking;
        }

        return $this;
    }

    public function removeBooking(Booking $booking): self
    {
        $this->bookings->removeElement($booking);

        return $this;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(?\DateTimeInterface$startDate): self
    {
        $this->startDate = $startDate;

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

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(?\DateTimeInterface $endDate): self
    {
        $this->endDate = $endDate;

        return $this;
    }
}
