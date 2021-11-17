<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity()
 */
#[ApiResource(order: ["notification.priority" => "ASC"])]
class NotificationTour
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Tour::class, inversedBy="notifications", cascade={"persist"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $tour;

    /**
     * @ORM\ManyToOne(targetEntity=Notification::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $notification;

    /**
     * @ORM\Column(type="smallint")
     */
    private $days;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $complete;

    public function getId(): ?int
    {
        return  $this->id;
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

    public function getNotification(): ?Notification
    {
        return $this->notification;
    }

    public function setNotification(?Notification $notification): self
    {
        $this->notification = $notification;

        return $this;
    }

    public function getDays(): ?int
    {
        return $this->days ?? $this->notification->getDays();
    }

    public function setDays(int $days): self
    {
        $this->days = $days;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->notification->getName();
    }

    public function getIcon(): ?string
    {
        return $this->notification->getIcon();
    }

    public function getComplete(): ?bool
    {
        return $this->complete;
    }

    public function setComplete(?bool $complete): self
    {
        $this->complete = $complete;

        return $this;
    }
}
