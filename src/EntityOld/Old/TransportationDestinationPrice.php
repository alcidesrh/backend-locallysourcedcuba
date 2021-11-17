<?php

// namespace App\Entity\Old;

// use ApiPlatform\Core\Annotation\ApiResource;
// use Doctrine\ORM\Mapping as ORM;
// use Symfony\Component\Serializer\Annotation\Groups;

// /**
//  * @ApiResource()
//  * @ORM\Entity()
//  */
// class TransportationDestinationPrice implements \JsonSerializable
// {
//     /**
//      * @ORM\Id()
//      * @ORM\GeneratedValue()
//      * @ORM\Column(type="integer")
//      * @Groups("read_transportation")
//      */
//     private $id;

//     /**
//      * @ORM\ManyToOne(targetEntity="App\Entity\Old\TransportationDestination")
//      * @ORM\JoinColumn(nullable=false)
//      * @Groups("read_transportation")
//      */
//     private $startDestination;

//     /**
//      * @ORM\ManyToOne(targetEntity="App\Entity\Old\TransportationDestination")
//      * @ORM\JoinColumn(nullable=false)
//      * @Groups("read_transportation")
//      */
//     private $endDestination;

//     /**
//      * @ORM\Column(type="smallint", nullable=true)
//      * @Groups("read_transportation")
//      */
//     private $kms;

//     public function getId(): ?int
//     {
//         return $this->id;
//     }

//     public function getStartDestination(): ?TransportationDestination
//     {
//         return $this->startDestination;
//     }

//     public function setStartDestination(?TransportationDestination $startDestination): self
//     {
//         $this->startDestination = $startDestination;

//         return $this;
//     }

//     public function getEndDestination(): ?TransportationDestination
//     {
//         return $this->endDestination;
//     }

//     public function setEndDestination(?TransportationDestination $endDestination): self
//     {
//         $this->endDestination = $endDestination;

//         return $this;
//     }

//     public function getKms(): ?int
//     {
//         return $this->kms;
//     }

//     public function setKms(?int $kms): self
//     {
//         $this->kms = $kms;

//         return $this;
//     }

//     public function jsonSerialize()
//     {
//         return [
//             'id' => $this->id,
//             'startDestination' => $this->startDestination,
//             'endDestination' => $this->endDestination,
//             'kms' => $this->kms
//         ];
//     }
// }
