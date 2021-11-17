<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210805061109 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE itinerary_day_template ADD day SMALLINT DEFAULT NULL');
        $this->addSql('ALTER TABLE itinerary_template ADD house_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE itinerary_template ADD CONSTRAINT FK_B6822B426BB74515 FOREIGN KEY (house_id) REFERENCES house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_B6822B426BB74515 ON itinerary_template (house_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE itinerary_template DROP CONSTRAINT FK_B6822B426BB74515');
        $this->addSql('DROP INDEX IDX_B6822B426BB74515');
        $this->addSql('ALTER TABLE itinerary_template DROP house_id');
        $this->addSql('ALTER TABLE itinerary_day_template DROP day');
    }
}
