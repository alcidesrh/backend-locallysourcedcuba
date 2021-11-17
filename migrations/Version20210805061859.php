<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210805061859 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE itinerary_template ADD tour_template_id INT NOT NULL');
        $this->addSql('ALTER TABLE itinerary_template ADD CONSTRAINT FK_B6822B42658C5D7B FOREIGN KEY (tour_template_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_B6822B42658C5D7B ON itinerary_template (tour_template_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE itinerary_template DROP CONSTRAINT FK_B6822B42658C5D7B');
        $this->addSql('DROP INDEX IDX_B6822B42658C5D7B');
        $this->addSql('ALTER TABLE itinerary_template DROP tour_template_id');
    }
}
