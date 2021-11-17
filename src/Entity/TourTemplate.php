<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use App\Repository\TourTemplateRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=TourTemplateRepository::class)
 */
#[ApiResource]
#[ApiFilter(SearchFilter::class, properties:['tourType' => 'exact'])]
class TourTemplate
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=30, nullable=true, unique=true)
     */
    private $code;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $type;

    /**
     * @ORM\Column(type="string", length=5, nullable=true)
     */
    private $tourType;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $guideWage;

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
     * @ORM\ManyToOne(targetEntity=TourTemplate::class)
     * @ORM\JoinColumn(name="template1_id", referencedColumnName="id", onDelete="SET NULL")
     */
    private $template1;

    /**
     * @ORM\ManyToOne(targetEntity=TourTemplate::class)
     * @ORM\JoinColumn(name="template2_id", referencedColumnName="id", onDelete="SET NULL")
     */
    private $template2;

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
     * @ORM\OneToMany(targetEntity=ItineraryTemplate::class, mappedBy="tourTemplate", orphanRemoval=true, cascade={"persist"})
     */
    private $itineraries;

    /**
     * @ORM\OneToMany(targetEntity=NotificationTourTemplate::class, mappedBy="tourTemplate", orphanRemoval=true, cascade={"persist"})
     */
    private $notifications;

    /**
     * @ORM\OneToMany(targetEntity=Tour::class, mappedBy="template")
     */
    private $tours;

    public function __construct()
    {
        $this->activities = new ArrayCollection();
        $this->itineraries = new ArrayCollection();
        $this->notifications = new ArrayCollection();
        $this->tours = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(?string $code): self
    {
        $this->code = $code;

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

    public function getTourType(): ?string
    {
        return $this->tourType;
    }

    public function setTourType(?string $tourType): self
    {
        $this->tourType = $tourType;

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

    public function getTemplate1(): ?self
    {
        return $this->template1;
    }

    public function setTemplate1(?self $template1): self
    {
        $this->template1 = $template1;

        return $this;
    }

    public function getTemplate2(): ?self
    {
        return $this->template2;
    }

    public function setTemplate2(?self $template2): self
    {
        $this->template2 = $template2;

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

    public function addItinerary(ItineraryTemplate $itinerary): self
    {
        if (!$this->itineraries->contains($itinerary)) {
            $this->itineraries[] = $itinerary;
            $itinerary->setTourTemplate($this);
        }

        return $this;
    }

    public function removeItinerary(ItineraryTemplate $itinerary): self
    {
        if ($this->itineraries->removeElement($itinerary)) {
            // set the owning side to null (unless already changed)
            if ($itinerary->getTourTemplate() === $this) {
                $itinerary->setTourTemplate(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|NotificationTourTemplate[]
     */
    public function getNotifications(): Collection
    {
        return $this->notifications;
    }

    public function addNotification(NotificationTourTemplate $notification): self
    {
        if (!$this->notifications->contains($notification)) {
            $this->notifications[] = $notification;
            $notification->setTourTemplate($this);
        }

        return $this;
    }

    public function removeNotification(NotificationTourTemplate $notification): self
    {
        if ($this->notifications->removeElement($notification)) {
            // set the owning side to null (unless already changed)
            if ($notification->getTourTemplate() === $this) {
                $notification->setTourTemplate(null);
            }
        }

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
            $tour->setTemplate($this);
        }

        return $this;
    }

    public function removeTour(Tour $tour): self
    {
        if ($this->tours->removeElement($tour)) {
            // set the owning side to null (unless already changed)
            if ($tour->getTemplate() === $this) {
                $tour->setTemplate(null);
            }
        }

        return $this;
    }
}
