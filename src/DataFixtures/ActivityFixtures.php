<?php

namespace App\DataFixtures;

use App\Entity\Activity;
use App\Entity\Destination;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Faker\Factory;
use App\Entity\ActivityCombo;

class ActivityFixtures extends Fixture implements FixtureGroupInterface //, DependentFixtureInterface {
{

    public static function getGroups(): array
    {
        return ['main', 'tour'];
    }
    public function load(ObjectManager $manager)
    {
        foreach ($manager->getRepository(Activity::class)->findAll() as $value) {
            $manager->remove($value);

        }
        $manager->flush();
        // return;

        $faker = Factory::create();
        $destinations = $manager->getRepository(Destination::class)->findAll();
        for ($i = 0; $i < count($destinations); $i++) {
            $destination = $destinations[$i]; //$destinations[mt_rand(0, count($destinations) - 1)];

            for ($j = 0; $j < mt_rand(2, 5); $j++) {
                $item = new Activity();
                $item->setName($faker->sentence(mt_rand(2, 5)))->setPersonCost(mt_rand(1, 20))
                    ->setGuideCost(mt_rand(1, 20))->setDestination($destination)
                    ->setType('normal');
                $manager->persist($item);
            }

            for ($j = 0; $j < mt_rand(2, 5); $j++) {
                $item = new Activity();
                $item->setName($faker->sentence(mt_rand(2, 5)))->setCarCost(mt_rand(1, 20))
                    ->setPersonPerCar(mt_rand(1, 20))->setDestination($destination)
                    ->setType('transport');
                $manager->persist($item);
            }
        }

        $manager->flush();


        for ($i = 0; $i < 10; $i++) {
            $destination = $destinations[mt_rand(0, count($destinations) - 1)];
            $activities = $destination->getActivities();

            $item = new Activity();
            $item->setName($faker->sentence(mt_rand(2, 5)))->setDestination($destination)
            ->setType('combo');
            $manager->persist($item);
            for ($j = 0; $j < mt_rand(0, count($activities)); $j++){
                $item2 = new ActivityCombo();
                $item2->setPriority($j + 1)->setActivity($activities[mt_rand(0, count($activities) - 1)])->setParent($item);
                $manager->persist($item2);
            }
            
        }

        $manager->flush();
    }
}
