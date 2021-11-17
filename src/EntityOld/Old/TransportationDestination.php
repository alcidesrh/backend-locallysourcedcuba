<?php

// namespace App\Entity\Old;

// use ApiPlatform\Core\Annotation\ApiResource;
// use App\Entity\Old\AbstractClasses\NameAbstract;
// use Doctrine\ORM\Mapping as ORM;
// use Symfony\Component\Serializer\Annotation\Groups;

// /**
//  * @ApiResource()
//  * @ORM\Entity()
//  */
// class TransportationDestination extends NameAbstract implements \JsonSerializable
// {
//     /**
//      * @ORM\Id
//      * @ORM\GeneratedValue
//      * @ORM\Column(type="integer")
//      * @Groups("read_transportation")
//      */
//     private $id;

//     /**
//      * @return mixed
//      */
//     public function getId()
//     {
//         return $this->id;
//     }

//     /**
//      * @param mixed $id
//      */
//     public function setId( $id )
//     {
//         $this->id = $id;
//     }

//     public function jsonSerialize()
//     {
//       return [
//           'id' => $this->id,
//           'name' => $this->getName()
//       ];
//     }
// }
