<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220131070215 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE booking_transfer ADD tour_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking_transfer ADD CONSTRAINT FK_7B003D4D15ED8D43 FOREIGN KEY (tour_id) REFERENCES tour (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_7B003D4D15ED8D43 ON booking_transfer (tour_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE booking_transfer DROP CONSTRAINT FK_7B003D4D15ED8D43');
        $this->addSql('DROP INDEX IDX_7B003D4D15ED8D43');
        $this->addSql('ALTER TABLE booking_transfer DROP tour_id');
    }
}
