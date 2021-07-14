<?php

namespace App\Entity;

use App\Repository\NotificationTourTemplateRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * @ORM\Entity(repositoryClass=NotificationTourTemplateRepository::class)
 */
#[ApiResource]
class NotificationTourTemplate
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=TourTemplate::class, inversedBy="notifications")
     * @ORM\JoinColumn(nullable=false)
     */
    private $tourTemplate;

    /**
     * @ORM\ManyToOne(targetEntity=Notification::class, inversedBy="tourTemplateNotifications")
     * @ORM\JoinColumn(nullable=false)
     */
    private $notification;

    /**
     * @ORM\Column(type="smallint")
     */
    private $days;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTourTemplate(): ?TourTemplate
    {
        return $this->tourTemplate;
    }

    public function setTourTemplate(?TourTemplate $tourTemplate): self
    {
        $this->tourTemplate = $tourTemplate;

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
}
