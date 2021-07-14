<?php

namespace App\DataFixtures;

use App\Entity\Location;
use App\Entity\LocationDistance;
use App\Entity\Old\TransportationDestination;
use App\Entity\Old\TransportationDestinationPrice;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ObjectManager;

class LocationFixtures extends Fixture implements FixtureGroupInterface
{

    public function __construct(private EntityManagerInterface $oldEntityManager)
    {}

    public static function getGroups(): array
    {
        return ['location'];
    }
    public function load(ObjectManager $manager)
    {

        foreach ($this->oldEntityManager->getRepository(TransportationDestination::class)->findAll() as $value) {

            $location = new Location();
            $location->setName($value->getName());
            $manager->persist($location);
        }
        $manager->flush();

        foreach ($this->oldEntityManager->getRepository(TransportationDestinationPrice::class)->findAll() as $value) {

            $locationDistance = new LocationDistance();
            $locationDistance->setLocation1($manager->getRepository(Location::class)->find($value->getStartDestination()->getId()))
            ->setLocation2($manager->getRepository(Location::class)->find($value->getEndDestination()->getId()))
            ->setKms($value->getKms());
            $manager->persist($locationDistance);
        }
        $manager->flush();

    }
}
