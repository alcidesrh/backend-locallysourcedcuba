<?php

namespace App\EntityOld\Old;

use App\EntityOld\Old\AbstractClasses\NameAbstract;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
/**
 * @ORM\Entity()
 */
class Province extends NameAbstract
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    public function __construct() {
        $this->destinations = new ArrayCollection();
    }

    /**
     * @return mixed
     */
    public function getId()
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

    public function addDestinations(Destination ...$destinations): void
    {
        foreach ($destinations as $destination) {
            if (!$this->destinations->contains($destination)) {
                $this->destinations->add($destination);
            }
        }
    }

    public function removedestinations(Destination $destination): void
    {
        $this->destinations->removeElement($destination);
    }

    public function getDestinations()
    {
        return $this->destinations;
    }
}
