<?php

namespace App\DataFixtures;

use App\Entity\Destination;
use App\EntityOld\Old\Destination as DestinationOld;
use App\Entity\Province;
use Doctrine\Persistence\ObjectManager;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class DestinationFixtures extends Fixture implements FixtureGroupInterface, DependentFixtureInterface
{
    public function getDependencies()
    {
        return [
            ProvinceFixtures::class,
        ];
    }

    public function __construct(private EntityManagerInterface $oldEntityManager)
    {}

    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {

        foreach ($this->oldEntityManager->getRepository(DestinationOld::class)->findAll() as $value) {

            $province = $manager->getRepository(Province::class)->findOneBy(['name' => $value->getProvince()->getName()]);

            $location = new Destination();
            $location->setName($value->getName())->setProvince($province);
            $manager->persist($location);
        }
        $manager->flush();    
    }
}
