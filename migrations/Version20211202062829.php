<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211202062829 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE booking_house_room_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE booking_house_booking_house_room (booking_house_id INT NOT NULL, booking_house_room_id INT NOT NULL, PRIMARY KEY(booking_house_id, booking_house_room_id))');
        $this->addSql('CREATE INDEX IDX_6553BBE5083DB98 ON booking_house_booking_house_room (booking_house_id)');
        $this->addSql('CREATE INDEX IDX_6553BBECBF9B64E ON booking_house_booking_house_room (booking_house_room_id)');
        $this->addSql('CREATE TABLE booking_house_room (id INT NOT NULL, house_room_id INT NOT NULL, price SMALLINT DEFAULT NULL, cant SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_B36B1CC0C0C0F68E ON booking_house_room (house_room_id)');
        $this->addSql('ALTER TABLE booking_house_booking_house_room ADD CONSTRAINT FK_6553BBE5083DB98 FOREIGN KEY (booking_house_id) REFERENCES booking_house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_booking_house_room ADD CONSTRAINT FK_6553BBECBF9B64E FOREIGN KEY (booking_house_room_id) REFERENCES booking_house_room (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_room ADD CONSTRAINT FK_B36B1CC0C0C0F68E FOREIGN KEY (house_room_id) REFERENCES house_room (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE booking_house_house_room');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE booking_house_booking_house_room DROP CONSTRAINT FK_6553BBECBF9B64E');
        $this->addSql('DROP SEQUENCE booking_house_room_id_seq CASCADE');
        $this->addSql('CREATE TABLE booking_house_house_room (booking_house_id INT NOT NULL, house_room_id INT NOT NULL, PRIMARY KEY(booking_house_id, house_room_id))');
        $this->addSql('CREATE INDEX idx_75b266fac0c0f68e ON booking_house_house_room (house_room_id)');
        $this->addSql('CREATE INDEX idx_75b266fa5083db98 ON booking_house_house_room (booking_house_id)');
        $this->addSql('ALTER TABLE booking_house_house_room ADD CONSTRAINT fk_75b266fa5083db98 FOREIGN KEY (booking_house_id) REFERENCES booking_house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_house_room ADD CONSTRAINT fk_75b266fac0c0f68e FOREIGN KEY (house_room_id) REFERENCES house_room (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE booking_house_booking_house_room');
        $this->addSql('DROP TABLE booking_house_room');
    }
}
