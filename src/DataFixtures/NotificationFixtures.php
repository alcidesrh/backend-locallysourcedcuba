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
use App\Entity\Notification;
use App\Entity\Service;
use DateInterval;
use DateTime;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;

class NotificationFixtures extends Fixture implements FixtureGroupInterface
{

    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {

        $values = [
            ['Send to driver', 10, ['transfer'], 'email', 1],
            ['Accommodation in transfer', 10, ['transfer'], 'home', 2],
            ['Flight Data', 10, ['transfer'], 'flight_takeoff', 3],
            ['Sent to a Guide', 15, ['ls', 'htc'], 'send', 4],
            ['Done', 18, ['ls', 'htc'], 'done', 5],
            ['Asigned to Guide', 30, ['ls', 'htc'], 'how_to_reg', 6],
            ['Tour Extra', 20, ['ls'], 'done_all', 7],
            ['Internal Flights', 90, ['ls'], 'flight', 8],
            ['Include Activities', 16, ['ls'], 'local_activity', 9],
            ['Transport', 20, ['ls'], 'airport_shuttle', 10],
        ];

        foreach ([['HTC Tours', 'htc'], ['LS Tours', 'ls'], ['Transfer', 'transfer']] as $value) {
            $manager->persist((new Service)->setName($value[0])->setCode($value[1])->setDaysToShow(20));
        }

        $manager->flush();

        foreach ($values as $value) {

            $item = (new Notification)->setName($value[0])
            ->setDays($value[1])->setIcon($value[3])->setPriority($value[4]);

            foreach ($value[2] as $code) {
                $item->addService($manager->getRepository(Service::class)->findOneBy(['code' => $code]));
            }
            $manager->persist($item);
        }

        $manager->flush();

    }
}
