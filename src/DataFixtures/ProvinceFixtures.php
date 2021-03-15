<?php

namespace App\DataFixtures;

use App\Entity\Province;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Bundle\FixturesBundle\FixtureGroupInterface;
use Doctrine\Persistence\ObjectManager;

class ProvinceFixtures extends Fixture implements FixtureGroupInterface
{
    public static function getGroups(): array
    {
        return ['province'];
    }
    public function load(ObjectManager $manager)
    {
        $provinces = [
            'Pinar del Río',
            'Artemisa',
            'La Habana',
            'Mayabeque',
            'Matanzas',
            'Cienfuegos',
            'Villa Clara',
            'Sancti Spíritus',
            'Ciego de Ávila',
            'Camagüey',
            'Las Tunas',
            'Granma',
            'Holguín',
            'Santiago de Cuba',
            'Guantánamo',
            'Isla de la Juventud',
        ];
        for ($i = 0; $i < 16; $i++) {
            $province = new Province();
            $province->setName($provinces[$i]);
            $manager->persist($province);
            $manager->flush();
        }

    }
}
