<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\LocationDistanceRepository;
use App\GraphqlResolver\LocationDistanceCollectionResolver;

/**
 * @ORM\Entity(repositoryClass=LocationDistanceRepository::class)
 */
#[ApiResource(
    graphql:[

        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'list' => [
            'collection_query' => LocationDistanceCollectionResolver::class,
            'pagination_enabled' => true,
            'pagination_type' => 'page',
            'args' => [
                'page' => ['type' => 'Int'],
                'itemsPerPage' => ['type' => 'Int'],
                'needle' => ['type' => 'String'],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\LocationDistance'],
            ],
        ],
    ]
)]
class LocationDistance
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Location::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $location1;

    /**
     * @ORM\ManyToOne(targetEntity=Location::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $location2;

    /**
     * @ORM\Column(type="smallint")
     */
    private $kms;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLocation1(): ?Location
    {
        return $this->location1;
    }

    public function setLocation1(?Location $location1): self
    {
        $this->location1 = $location1;

        return $this;
    }

    public function getLocation2(): ?Location
    {
        return $this->location2;
    }

    public function setLocation2(?Location $location2): self
    {
        $this->location2 = $location2;

        return $this;
    }

    public function getKms(): ?int
    {
        return $this->kms;
    }

    public function setKms(int $kms): self
    {
        $this->kms = $kms;

        return $this;
    }
}
