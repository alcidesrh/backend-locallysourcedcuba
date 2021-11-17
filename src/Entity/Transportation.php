<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\TransportationRepository;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass=TransportationRepository::class)
 */
#[ApiResource]
class Transportation
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity=Driver::class, inversedBy="transportations")
     */
    private $driver;

    /**
     * @ORM\OneToMany(targetEntity=TransportationPrice::class, mappedBy="transportation", orphanRemoval=true, cascade={"persist"})
     */
    private $prices;

    /**
     * @ORM\OneToMany(targetEntity=TransportationRoute::class, mappedBy="transportation", orphanRemoval=true, cascade={"persist"})
     */
    private $routes;

    public function __construct()
    {
        $this->prices = new ArrayCollection();
        $this->routes = new ArrayCollection();
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

    public function getDriver(): ?Driver
    {
        return $this->driver;
    }

    public function setDriver(?Driver $driver): self
    {
        $this->driver = $driver;

        return $this;
    }

    /**
     * @return Collection|TransportationPrice[]
     */
    public function getPrices(): Collection
    {
        return $this->prices;
    }

    public function addPrice(TransportationPrice $price): self
    {
        if (!$this->prices->contains($price)) {
            $this->prices[] = $price;
            $price->setTransportation($this);
        }

        return $this;
    }

    public function removePrice(TransportationPrice $price): self
    {
        if ($this->prices->removeElement($price)) {
            // set the owning side to null (unless already changed)
            if ($price->getTransportation() === $this) {
                $price->setTransportation(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|TransportationRoute[]
     */
    public function getRoutes(): Collection
    {
        return $this->routes;
    }

    public function addRoute(TransportationRoute $route): self
    {
        if (!$this->routes->contains($route)) {
            $this->routes[] = $route;
            $route->setTransportation($this);
        }

        return $this;
    }

    public function removeRoute(TransportationRoute $route): self
    {
        if ($this->routes->removeElement($route)) {
            // set the owning side to null (unless already changed)
            if ($route->getTransportation() === $this) {
                $route->setTransportation(null);
            }
        }

        return $this;
    }
}
