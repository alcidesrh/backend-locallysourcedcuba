<?php

namespace App\EntityOld\Old\AbstractClasses;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\MappedSuperclass()
 */
abstract class NameAbstract
{
    /**
     * @var string
     *
     * @ORM\Column(type="string", nullable=true)
     * @Groups({"read_activity", "read_htc_template", "read_transfer_price", "read_accommodation", "read_transportation"})
     */
    protected $name;

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName( $name )
    {
        $this->name = $name;
    }
}
