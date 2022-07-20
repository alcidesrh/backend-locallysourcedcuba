<?php

namespace App\EntityOld\Old;

use App\EntityOld\Old\AbstractClasses\NameAbstract;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity()
 */
class Destination extends NameAbstract
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"read_activity", "read_transfer_price", "read_accommodation", "read_transportation"})
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Province", cascade={"persist"})
     * @ORM\JoinColumn(name="province_id", referencedColumnName="id", onDelete="CASCADE")
     */
    private $province;
    /**
     * @return mixed
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId( $id )
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getProvince(): Province
    {
        return $this->province;
    }

    /**
     * @param mixed $province
     */
    public function setProvince( Province $province ): void
    {
        $this->province = $province;
    }

}
