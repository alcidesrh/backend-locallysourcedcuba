<?php

namespace App\DataFixtures;

use App\Entity\Guide;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class GuideFixtures extends Fixture implements FixtureGroupInterface
{

    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {

        $faker = Factory::create();
        for ($i = 0; $i < 40; $i++) {
            $item = new Guide();
            $item->setName($faker->name())->setPhone($faker->phoneNumber())
                ->setBonus(rand(1, 15))->setEmail($faker->email())->setLastName($faker->lastName());
            $manager->persist($item);
            $manager->flush();
        }

    }
}
