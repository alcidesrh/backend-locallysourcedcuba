<?php

namespace App\DataFixtures;

use App\Entity\Service;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;

class ServiceFixtures extends Fixture implements FixtureGroupInterface
{
    public static function getGroups(): array
    {
        return ['main'];
    }
    public function load(ObjectManager $manager)
    {
        $services = [
            ['HTC Tours', 'htc', 20],
            ['LS Tour', 'ls', 20],
            ['Transfer', 'transfer', 20]
        ];
        for ($i = 0; $i < count($services); $i++) {
            $service = new Service();
            $service->setName($services[$i][0])->setCode($services[$i][1])->setDaysToShow(20);
            $manager->persist($service);
            $manager->flush();
        }

    }
}
