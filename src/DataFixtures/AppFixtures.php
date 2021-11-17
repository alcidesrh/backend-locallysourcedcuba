<?php

namespace App\DataFixtures;

use App\Entity\Province;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = Factory::create();
        $product = new Province();
        $product->setName($faker->name());
        $manager->persist($product);
        $manager->flush();
    }
}
//php bin/console doctrine:fixtures:load --group=NotificationFixtures --append --purge-exclusions=province --purge-exclusions=location --purge-exclusions=location_distance --purge-exclusions=driver --purge-exclusions=guide --purge-exclusions=destination --purge-exclusions=activity --purge-exclusions=activity_combo --purge-exclusions=house --purge-exclusions=house_feature --purge-exclusions=house_house_feature --purge-exclusions=house_room --purge-exclusions=house_room_type --purge-exclusions=house_season --purge-exclusions=house_season_room --purge-exclusions=house_type 