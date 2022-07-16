<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\House;
use App\Entity\HouseRoom;
use App\Entity\HouseType;
use App\Entity\Destination;
use App\Entity\HouseFeature;
use App\Entity\HouseRoomType;
use App\Entity\HouseSeason;
use App\Entity\HouseSeasonRoom;
use DateInterval;
use DateTime;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class HouseFixtures extends Fixture implements FixtureGroupInterface, DependentFixtureInterface
{

    public function getDependencies()
    {
        return [
            DestinationFixtures::class
        ];
    }

    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {

        $types = ['Standar', 'Updraded', 'Premiun', 'Hotel'];

        $rooms = ['Single', 'Twing', 'Double', 'Triple', 'Family'];

        $features = ['Internet', 'Pool', 'Stairs', 'Elevator', 'Ground Floor'];

        foreach ($types as $value) {
            $manager->persist((new HouseType)->setName($value));
        }
        foreach ($rooms as $value) {
            $manager->persist((new HouseRoomType)->setName($value));
        }
        foreach ($features as $value) {
            $manager->persist((new HouseFeature)->setName($value));
        }
        $manager->flush();

        $destinations = $manager->getRepository(Destination::class)->findAll();
        $houseTypes = $manager->getRepository(HouseType::class)->findAll();
        $houseRooms = $manager->getRepository(HouseRoomType::class)->findAll();
        $houseFeature = $manager->getRepository(HouseFeature::class)->findAll();

        $faker = Factory::create();

        foreach ($destinations as $destination) {

            for ($i = 0; $i < 5; $i++) {
                $item = new House();
                $item->setName($faker->sentence(mt_rand(2, 3)))->setPhone($faker->phoneNumber())
                    ->setAddress($faker->address())->setDescription($faker->paragraph())
                    ->setDestination($destination)->setEmail($faker->email())
                    ->setType($houseTypes[mt_rand(0, count($houseTypes) - 1)]);

                    for ($j = 0; $j < mt_rand(0, count($houseFeature)); $j++) {
                        $item->addFeature($houseFeature[mt_rand(0, count($houseFeature) - 1)]);
                    }

                    for ($j = 0; $j < mt_rand(0, count($houseRooms)); $j++) {
                        $room = (new HouseRoom())->setRoomType($houseRooms[mt_rand(0, count($houseRooms) - 1)])->setPrice(mt_rand(5, 30));
                        $item->addRoom($room);

                        $from = $j + 3;
                        $to = $from + 3;
                        $houseSeason = (new HouseSeason())->setStartDate((new DateTime())->add(new DateInterval("P{$from}M")))
                        ->setEndDate((new DateTime())->add(new DateInterval("P{$to}M")))->addSeasonRoom((new HouseSeasonRoom)->setRoom($room)->setPrice(mt_rand(5, 30)));

                        $item->addHouseSeason($houseSeason);
                    }

                $manager->persist($item);
            }
        }

        $manager->flush();

    }
}
