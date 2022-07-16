<?php

namespace App\DataFixtures;

use App\Entity\Driver;
use App\Entity\LocationDistance;
use App\Entity\Transportation;
use App\Entity\TransportationPrice;
use App\Entity\TransportationRoute;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class TransportationFixtures extends Fixture implements FixtureGroupInterface, DependentFixtureInterface {

    public function __construct(private EntityManagerInterface $em)
{}

    public function getDependencies()
    {
        return [
            DriverFixtures::class,
        ];
    }

public static function getGroups(): array
{
    return ['main'];
}
public function load(ObjectManager $manager)
{
    $drivers = $manager->getRepository(Driver::class)->findAll();
    for ($i = 0; $i < 40; $i++) {
    
        $item = new Transportation();
        $item->setName('Transportation'. $i + 1)->setDriver($drivers[rand(0, count($drivers) - 1)]);

        for ($j = 1, $l = 0; $j < mt_rand(1, 7); $j++, $l += 5) {

            $locationDistance = $this->em->createQueryBuilder()
                ->select('u')
                ->from(LocationDistance::class, 'u')
                ->setFirstResult(mt_rand(0, 13000))
                ->setMaxResults(1)->getQuery()->getSingleResult();

            $item->addPrice((new TransportationPrice())->setMin($j + $l)->setMax($j + $l + 5)->setPrice($j * 5))
                ->addRoute((new TransportationRoute())->setLocationFrom($locationDistance->getLocation1())->setLocationTo($locationDistance->getLocation2())->setKms($locationDistance->getKms()));

        }

        $manager->persist($item);
        $manager->flush();
    }

}

// public function getDependencies()
// {
//     return [
//         DriverFixtures::class,
//     ];
// }
}
