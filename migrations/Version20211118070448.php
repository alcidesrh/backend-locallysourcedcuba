<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211118070448 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE booking_accommodation ADD itinerary_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking_accommodation ADD CONSTRAINT FK_260114D215F737B2 FOREIGN KEY (itinerary_id) REFERENCES itinerary (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_260114D215F737B2 ON booking_accommodation (itinerary_id)');
        $this->addSql('ALTER TABLE house_room ADD cant SMALLINT DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE house_room DROP cant');
        $this->addSql('ALTER TABLE booking_accommodation DROP CONSTRAINT FK_260114D215F737B2');
        $this->addSql('DROP INDEX IDX_260114D215F737B2');
        $this->addSql('ALTER TABLE booking_accommodation DROP itinerary_id');
    }
}
