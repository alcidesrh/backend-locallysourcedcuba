<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211202064542 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE booking_house_booking_house_room');
        $this->addSql('ALTER TABLE booking_house_room ADD booking_house_id INT NOT NULL');
        $this->addSql('ALTER TABLE booking_house_room ADD CONSTRAINT FK_B36B1CC05083DB98 FOREIGN KEY (booking_house_id) REFERENCES booking_house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_B36B1CC05083DB98 ON booking_house_room (booking_house_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('CREATE TABLE booking_house_booking_house_room (booking_house_id INT NOT NULL, booking_house_room_id INT NOT NULL, PRIMARY KEY(booking_house_id, booking_house_room_id))');
        $this->addSql('CREATE INDEX idx_6553bbecbf9b64e ON booking_house_booking_house_room (booking_house_room_id)');
        $this->addSql('CREATE INDEX idx_6553bbe5083db98 ON booking_house_booking_house_room (booking_house_id)');
        $this->addSql('ALTER TABLE booking_house_booking_house_room ADD CONSTRAINT fk_6553bbe5083db98 FOREIGN KEY (booking_house_id) REFERENCES booking_house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_booking_house_room ADD CONSTRAINT fk_6553bbecbf9b64e FOREIGN KEY (booking_house_room_id) REFERENCES booking_house_room (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_room DROP CONSTRAINT FK_B36B1CC05083DB98');
        $this->addSql('DROP INDEX IDX_B36B1CC05083DB98');
        $this->addSql('ALTER TABLE booking_house_room DROP booking_house_id');
    }
}
