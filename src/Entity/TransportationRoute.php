<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\TransportationRouteRepository;
use App\GraphqlResolver\TransportationRouteResolver;

/**
 * @ORM\Entity(repositoryClass=TransportationRouteRepository::class)
 */
#[ApiResource(
    graphql:[
        
        'item_query',
        'collection_query',
        'create' => [
            'mutation' => TransportationRouteResolver::class,
        ],
        'update' => [
            'mutation' => TransportationRouteResolver::class,
        ],
        'delete',
    ]
)]
class TransportationRoute
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Location::class)
     */
    private $locationFrom;

    /**
     * @ORM\ManyToOne(targetEntity=Location::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $locationTo;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $kms;

    /**
     * @ORM\ManyToOne(targetEntity=Transportation::class, inversedBy="routes")
     */
    private $transportation;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLocationFrom(): ?Location
    {
        return $this->locationFrom;
    }

    public function setLocationFrom(?Location $locationFrom): self
    {
        $this->locationFrom = $locationFrom;

        return $this;
    }

    public function getLocationTo(): ?Location
    {
        return $this->locationTo;
    }

    public function setLocationTo(?Location $locationTo): self
    {
        $this->locationTo = $locationTo;

        return $this;
    }

    public function getKms(): ?int
    {
        return $this->kms;
    }

    public function setKms(?int $kms): self
    {
        $this->kms = $kms;

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
}
