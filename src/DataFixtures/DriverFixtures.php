<?php

namespace App\DataFixtures;

use App\Entity\Driver;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class DriverFixtures extends Fixture implements FixtureGroupInterface
{

    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {

        $faker = Factory::create();
        for ($i = 0; $i < 40; $i++) {
            $item = new Driver();
            $item->setName($faker->name())->setPhone(substr($faker->phoneNumber(), 0, 15))
                ->setPax(rand(1, 15));
            $manager->persist($item);
        }
        $manager->flush();

    }
}
