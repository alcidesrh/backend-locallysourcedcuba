<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\Service;
use App\Entity\Activity;
use App\Entity\HouseType;
use App\Entity\Destination;
use App\Entity\TourTemplate;
use App\Entity\Transportation;
use App\Entity\ItineraryTemplate;
use App\Entity\ItineraryDayTemplate;
use App\DataFixtures\ActivityFixtures;
use Doctrine\Persistence\ObjectManager;
use App\Entity\NotificationTourTemplate;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class TourTemplateFixtures extends Fixture implements FixtureGroupInterface, DependentFixtureInterface
{
    public function getDependencies()
    {
        return [
            ActivityFixtures::class,
        ];
    }

    public static function getGroups(): array
    {
        return ['main', 'tour'];
    }
    public function load(ObjectManager $manager)
    {

        foreach ($manager->getRepository(TourTemplate::class)->findAll() as $value) {
            $manager->remove($value);
        }
        $manager->flush();
        // return;

        $faker = Factory::create();
        $destinations = $manager->getRepository(Destination::class)->findAll();
        $transportations = $manager->getRepository(Transportation::class)->findAll();
        $housesType = $manager->getRepository(HouseType::class)->findAll();

        $codes = [];

        for ($i = 0; $i < 40; $i++) {
            $item = new TourTemplate();
            $item->setName($faker->sentence(mt_rand(2, 5)))->setColor($faker->hexColor())
                ->setDescription($faker->paragraph())->setType((['Group', 'Private', 'Tailor Made', 'Mixed'])[mt_rand(0, 3)])
                ->setTourType((['ls', 'htc'])[mt_rand(0, 1)]);

            $code = strtoupper($faker->randomLetter() . $faker->randomLetter());
            while (true) {
                if (in_array($code, $codes) && $manager->getRepository(TourTemplate::class)->findOneBy(['code' => $code])) {
                    $code = strtoupper($faker->randomLetter() . $faker->randomLetter());
                } else {
                    break;
                }

            }
            $codes[] = $code;
            $item->setCode($code);

            if ($item->getTourType() == 'htc') {
                $item->setDays(1)->setStartPlace($faker->address())->setFinishPlace($faker->address());
                $activities = $manager->getRepository(Activity::class)->findAll();
                $notifications = $manager->getRepository(Service::class)->findOneBy(['code' => 'htc'])->getNotifications();
                for ($j = 0; $j < mt_rand(1, count($notifications)); $j++) {
                    $item->addNotification((new NotificationTourTemplate)->setDays($notifications[$j]->getDays())->setNotification($notifications[$j]));
                }
                for ($j = 0; $j < mt_rand(1, count($activities) - 1); $j++) {
                    $item->addActivity($activities[mt_rand(0, count($activities) - 1)]);
                }

            } else {

                $item->setGuideWage(mt_rand(5, 15))->setBonus(mt_rand(5, 15))->setDays(([6, 8, 10, 15, 20])[mt_rand(0, 4)])
                    ->setStartDay(([1, 2, 3, 4, 5, 6, 7])[mt_rand(0, 6)])->setTransferIn($destinations[mt_rand(0, count($destinations) - 1)])->setTransferOut($destinations[mt_rand(0, count($destinations) - 1)])
                    ->setTransportation($transportations[mt_rand(0, count($transportations) - 1)])->setHouseType($housesType[mt_rand(0, count($housesType) - 1)]);

                for ($k = 0, $j = $item->getDays(), $dayCount = 1; $k < $j; $k++) {
                    $days = mt_rand(1, $j);
                    $j -= $days - 1;
                    $itinerary = (new ItineraryTemplate())->setDays($days)->setDestination($destinations[mt_rand(0, count($destinations) - 1)]);
                    $houses = $itinerary->getDestination()->getHouses();
                    $activities = $itinerary->getDestination()->getActivities();

                    if (count($houses)) {
                        $itinerary->setHouse($houses[mt_rand(0, count($houses) - 1)]);
                    }

                    for ($p = 0; $p < $itinerary->getDays(); $p++) {

                        $itineraryDay = (new ItineraryDayTemplate)->setDay($dayCount++)->setNoGuide(([true, false])[mt_rand(0, 1)]);

                        if (count($activities)) {
                            for ($r = 0; $r < mt_rand(1, count($activities)); $r++) {
                                $itineraryDay->addActivity($activities[mt_rand(0, count($activities) - 1)]);
                            }
                        }

                        $itinerary->addItineraryDay($itineraryDay);
                    }
                    $item->addItinerary($itinerary);
                }

                $notifications = $manager->getRepository(Service::class)->findOneBy(['code' => 'ls'])->getNotifications();
                for ($p = 0; $p < mt_rand(count($notifications) - 2, count($notifications) - 1); $p++) {
                    $item->addNotification((new NotificationTourTemplate)->setDays($notifications[$p]->getDays())->setNotification($notifications[$p]));
                }

            }
            $manager->persist($item);

            $manager->flush();
        }

        

    }
}
