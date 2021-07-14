<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\LocationRepository;
use ApiPlatform\Core\Annotation\ApiFilter;
use App\GraphqlResolver\CollectionResolver;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
/**
 * @ORM\Entity(repositoryClass=LocationRepository::class)
 */
#[ApiResource(
    graphql:[        
        'item_query',
        'collection_query',
        'create',
        'update',
        'delete',
        'list' => [
            'collection_query' => CollectionResolver::class,
            'pagination_enabled' => true,
            'pagination_type' => 'page',
            'args' => [
                'page' => ['type' => 'Int'],
                'itemsPerPage' => ['type' => 'Int'],
                'order' => ['type' => 'LocationFilter_order'],
                'needle' => ['type' => 'String'],
                'properties' => ['type' => '[String]', 'defaultValue' => ['name']],
                'entity' => ['type' => 'String', 'defaultValue' => 'App\Entity\Location']
            ],
        ],
    ]
)]
#[ApiFilter(OrderFilter::class, properties:['name'], arguments:['orderParameterName' => 'order'])]
class Location
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
     * @ORM\OneToMany(targetEntity=LocationDistance::class, mappedBy="location1", orphanRemoval=true)
     */
    private $from;

    /**
     * @ORM\OneToMany(targetEntity=LocationDistance::class, mappedBy="location2", orphanRemoval=true)
     */
    private $to;

    public function __construct()
    {
        $this->from = new ArrayCollection();
        $this->to = new ArrayCollection();
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
}
