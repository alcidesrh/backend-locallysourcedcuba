<?php

namespace App\DataFixtures;

use App\Entity\Booking;
use App\Entity\BookingAccommodation;
use App\Entity\BookingTransfer;
use App\Entity\Destination;
use App\Entity\Driver;
use App\Entity\Guide;
use App\Entity\House;
use App\Entity\HouseType;
use App\Entity\Itinerary;
use App\Entity\ItineraryDay;
use App\Entity\NotificationTour;
use App\Entity\Service;
use App\Entity\Tour;
use App\Entity\TourTemplate;
use App\Entity\Transportation;
use DateInterval;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class TourFixtures extends Fixture implements FixtureGroupInterface //, DependentFixtureInterface

{
    // public function getDependencies()
    // {
    //     return [
    //         TourTemplateFixtures::class,
    //     ];
    // }

    public static function getGroups(): array
    {
        return ['main', 'tour'];
    }
    public function load(ObjectManager $manager)
    {

        // foreach ($manager->getRepository(Tour::class)->findAll() as $value) {

        // $value->setEndDate((clone $value->getStartDate())->add(new DateInterval("P{$value->getDays()}D")))
        //     ->setStartDay($value->getEndDate()->format('N'));

        // $manager->persist($value);
        //     $manager->remove($value);

        // }

        // $manager->flush();
        // return;
        $faker = Factory::create();
        $guides = $manager->getRepository(Guide::class)->findAll();
        $serviceType = ['htc', 'ls'];

        $destinations = $manager->getRepository(Destination::class)->findAll();
        $transportations = $manager->getRepository(Transportation::class)->findAll();
        $housesType = $manager->getRepository(HouseType::class)->findAll();
        $drivers = $manager->getRepository(Driver::class)->findAll();
        $houses = $manager->getRepository(House::class)->findAll();

        for ($i = 0, $days = mt_rand(0, 30); $i < 60; $i++, $days = mt_rand(0, 30)) {

            $service = $manager->getRepository(Service::class)->findOneBy(['code' => $serviceType[mt_rand(0, 1)]]);
            $templates = $manager->getRepository(TourTemplate::class)->findBy(['tourType' => $service->getCode()]);
            $template = $templates[mt_rand(0, count($templates) - 1)];
            $item = (new Tour())->setTemplate($template)->setName($template->getName())->setColor($template->getColor())->setStartDate((new \DateTime())->add(new \DateInterval("P{$days}D")))->setAgent(mt_rand(0, 1))
                ->setDescription($faker->paragraph())->setGuide($guides[mt_rand(0, count($guides) - 1)]);

            if ($service->getCode() == 'htc') {
                $item->setDays(1)->setService($service)->setStartPlace($template->getStartPlace())->setFinishPlace($template->getFinishPlace());
                $activities = $template->getActivities();
                for ($j = 0; $j < count($activities); $j++) {
                    $item->addActivity($activities[$j]);
                }
                $notifications = $template->getNotifications();
                for ($j = 0; $j < count($notifications); $j++) {
                    $item->addNotification((new NotificationTour)->setDays($notifications[$j]->getDays())->setNotification($notifications[$j]->getNotification()));
                }
            } else {

                $days = [6, 8, 10, 15, 20][mt_rand(0, 4)];
                $add = $days + 1;
                $item->setEndDate((clone $item->getStartDate())->add(new DateInterval("P{$add}D")))->setService($service)->setGuideWage(mt_rand(5, 15))->setBonus(mt_rand(5, 15))->setDays($days)
                    ->setStartDay($item->getEndDate()->format('N'))->setTransferIn($destinations[mt_rand(0, count($destinations) - 1)])->setTransferOut($destinations[mt_rand(0, count($destinations) - 1)])
                    ->setTransportation($transportations[mt_rand(0, count($transportations) - 1)])->setHouseType($housesType[mt_rand(0, count($housesType) - 1)]);

                for ($k = 0, $j = $item->getDays(), $dayCount = 0; $k < $j; $k++) {
                    $days = mt_rand(1, $j);
                    $j -= $days - 1;
                    $itinerary = (new Itinerary())->setDays($days)->setDestination($destinations[mt_rand(0, count($destinations) - 1)]);
                    $houses = $itinerary->getDestination()->getHouses();
                    $activities = $itinerary->getDestination()->getActivities();

                    if (count($houses)) {
                        $itinerary->setHouse($houses[mt_rand(0, count($houses) - 1)]);
                    }

                    for ($p = 0; $p < $itinerary->getDays(); $p++) {

                        $itineraryDay = (new ItineraryDay)->setDate((clone $item->getStartDate())->modify("+{$dayCount} day"))->setDay(++$dayCount)->setNoGuide(([true, false])[mt_rand(0, 1)]);

                        if (count($activities)) {
                            for ($r = 0; $r < mt_rand(0, count($activities) - 1); $r++) {
                                $itineraryDay->addActivity($activities[mt_rand(0, count($activities) - 1)]);
                            }
                        }

                        $itinerary->addItineraryDay($itineraryDay);
                    }
                    $item->addItinerary($itinerary);
                }

                $notifications = $template->getNotifications();
                for ($p = 0; $p < count($notifications) - 1; $p++) {
                    $item->addNotification((new NotificationTour)->setDays($notifications[$p]->getDays())->setNotification($notifications[$p]->getNotification()));
                }
            }

            $code = $this->generateCode($item);

            if ($items = $manager->getRepository(Tour::class)->findByCode($code)) {
                $last = $items[count($items) - 1];
                if ($pos = strrpos($last->getCode(), '-')) {
                    $aux = substr($last->getCode(), $pos + 1);
                }

                $code .= $pos && is_numeric($aux) ? '-' . ((int) $aux + 1) : '-' . intval(count($items) + 1);
                $item->setCode($code);
            } else {
                $item->setCode($code);
            }

            for ($j = 0; $j < mt_rand(0, 10); $j++) {
                $booking = new Booking();
                if ($service->getCode() != 'htc') {
                    $dateIn = $item->getStartDate();
                    foreach ($item->getItineraries() as $itinerary) {
                        $bookingAccommodation = (new BookingAccommodation())->setItinerary($itinerary);
                        if ($dateIn) {
                            $dateOut = (clone $dateIn)->add(new \DateInterval("P{$itinerary->getDays()}D"));
                            $bookingAccommodation->setDateIn($dateIn)->setDateOut($dateOut);
                            $dateIn = $dateOut;
                        }
                        $booking->addBookingAccommodation($bookingAccommodation);
                    }
                }
                $item->addBooking($booking->setName($faker->name())->setPax(mt_rand(1, 8))->setLp(mt_rand(0, 10)));

                $manager->persist($item);

                $manager->flush();

                if ($service->getCode() != 'htc') {
                    $dateIn = $item->getStartDate();
                    $dateOut = (clone $dateIn)->add(new \DateInterval("P{$item->getDays()}D"));
                    foreach (['In', 'Out'] as $type) {
                        $transfer = (new BookingTransfer)->setContact($faker->name)
                            ->setCharge(mt_rand(1, 5))->setDate($type == 'In' ? $dateIn : $dateOut)->setFlightData($faker->sentence())
                            ->setFromHour($type == 'In' ? $dateIn : $dateOut)->setHour($type == 'In' ? $dateIn : $dateOut)->setPrice(mt_rand(1, 5))
                            ->setToHour($type == 'In' ? $dateIn : $dateOut)->setType($type)->setPersons($booking->getPax())
                            ->setDestination($destinations[mt_rand(0, count($destinations) - 1)])
                            ->setDriver($drivers[mt_rand(0, count($drivers) - 1)])->setNote($faker->paragraph());
                        for ($j = 0; $j < mt_rand(2, 5); $j++) {
                            $transfer->addHouse($houses[mt_rand(0, count($houses) - 1)]);
                        }
                        if ($transfer->getType() == 'In') {
                            $transfer->setBookingIn($booking);
                        } else {
                            $transfer->setBookingOut($booking);
                        }

                        $manager->persist($transfer);
                    }
                }
            }

            $manager->persist($item);

            $manager->flush();
        }
    }

    public function generateCode(Tour $tour, $ext = false)
    {
        $serviceCode = strtoupper($tour->getService()->getCode());
        $date = str_replace('-', '', $tour->getStartDate()->format("d-m-y"));
        // $private = ($type == 'private' && $template && $template->getType() == 'group') ? '-P' : '';
        $agent = ($tour->getAgent()) ? '-A' : '';
        $templateCode = $tour->getTemplate()->getCode();
        // ($template) ? $template->getCode() : $em->getRepository('App:CodeTourOneDay')->findOneBy(
        //     []
        // )->getName();

        return $serviceCode . $date . $templateCode . $agent;
    }
}
