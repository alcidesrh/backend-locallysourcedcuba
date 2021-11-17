<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211101044257 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE booking_accommodation_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE booking_house_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE booking_transfer_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE sleeping_requirement_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE srroom_type_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE booking_booking_transfersin (booking_id INT NOT NULL, booking_transfer_id INT NOT NULL, PRIMARY KEY(booking_id, booking_transfer_id))');
        $this->addSql('CREATE INDEX IDX_6D04DBCB3301C60 ON booking_booking_transfersin (booking_id)');
        $this->addSql('CREATE INDEX IDX_6D04DBCB74EB9366 ON booking_booking_transfersin (booking_transfer_id)');
        $this->addSql('CREATE TABLE booking_booking_transfersout (booking_id INT NOT NULL, booking_transfer_id INT NOT NULL, PRIMARY KEY(booking_id, booking_transfer_id))');
        $this->addSql('CREATE INDEX IDX_240AF2633301C60 ON booking_booking_transfersout (booking_id)');
        $this->addSql('CREATE INDEX IDX_240AF26374EB9366 ON booking_booking_transfersout (booking_transfer_id)');
        $this->addSql('CREATE TABLE booking_accommodation (id INT NOT NULL, booking_id INT NOT NULL, date_in DATE DEFAULT NULL, date_out DATE DEFAULT NULL, canceled BOOLEAN DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_260114D23301C60 ON booking_accommodation (booking_id)');
        $this->addSql('CREATE TABLE booking_house (id INT NOT NULL, house_id INT DEFAULT NULL, booking_accommodation_id INT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_F6A9C4286BB74515 ON booking_house (house_id)');
        $this->addSql('CREATE INDEX IDX_F6A9C428B1E5C38B ON booking_house (booking_accommodation_id)');
        $this->addSql('CREATE TABLE booking_house_house_room (booking_house_id INT NOT NULL, house_room_id INT NOT NULL, PRIMARY KEY(booking_house_id, house_room_id))');
        $this->addSql('CREATE INDEX IDX_75B266FA5083DB98 ON booking_house_house_room (booking_house_id)');
        $this->addSql('CREATE INDEX IDX_75B266FAC0C0F68E ON booking_house_house_room (house_room_id)');
        $this->addSql('CREATE TABLE booking_transfer (id INT NOT NULL, destination_id INT DEFAULT NULL, driver_id INT DEFAULT NULL, contact VARCHAR(255) DEFAULT NULL, persons SMALLINT DEFAULT NULL, date DATE DEFAULT NULL, hour TIME(0) WITHOUT TIME ZONE DEFAULT NULL, flight_data VARCHAR(255) DEFAULT NULL, price SMALLINT DEFAULT NULL, from_hour TIME(0) WITHOUT TIME ZONE DEFAULT NULL, to_hour TIME(0) WITHOUT TIME ZONE DEFAULT NULL, charge SMALLINT DEFAULT NULL, sent BOOLEAN DEFAULT NULL, canceled BOOLEAN DEFAULT NULL, note TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_7B003D4D816C6140 ON booking_transfer (destination_id)');
        $this->addSql('CREATE INDEX IDX_7B003D4DC3423909 ON booking_transfer (driver_id)');
        $this->addSql('CREATE TABLE booking_transfer_house (booking_transfer_id INT NOT NULL, house_id INT NOT NULL, PRIMARY KEY(booking_transfer_id, house_id))');
        $this->addSql('CREATE INDEX IDX_5F3E373574EB9366 ON booking_transfer_house (booking_transfer_id)');
        $this->addSql('CREATE INDEX IDX_5F3E37356BB74515 ON booking_transfer_house (house_id)');
        $this->addSql('CREATE TABLE sleeping_requirement (id INT NOT NULL, accommodation_type_id INT DEFAULT NULL, description TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_413AD3EA8978F869 ON sleeping_requirement (accommodation_type_id)');
        $this->addSql('CREATE TABLE srroom_type (id INT NOT NULL, room_type_id INT DEFAULT NULL, sleeping_requirement_id INT NOT NULL, rooms SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_F7287958296E3073 ON srroom_type (room_type_id)');
        $this->addSql('CREATE INDEX IDX_F7287958AE2DDF69 ON srroom_type (sleeping_requirement_id)');
        $this->addSql('ALTER TABLE booking_booking_transfersin ADD CONSTRAINT FK_6D04DBCB3301C60 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersin ADD CONSTRAINT FK_6D04DBCB74EB9366 FOREIGN KEY (booking_transfer_id) REFERENCES booking_transfer (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersout ADD CONSTRAINT FK_240AF2633301C60 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersout ADD CONSTRAINT FK_240AF26374EB9366 FOREIGN KEY (booking_transfer_id) REFERENCES booking_transfer (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_accommodation ADD CONSTRAINT FK_260114D23301C60 FOREIGN KEY (booking_id) REFERENCES booking (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house ADD CONSTRAINT FK_F6A9C4286BB74515 FOREIGN KEY (house_id) REFERENCES house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house ADD CONSTRAINT FK_F6A9C428B1E5C38B FOREIGN KEY (booking_accommodation_id) REFERENCES booking_accommodation (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_house_room ADD CONSTRAINT FK_75B266FA5083DB98 FOREIGN KEY (booking_house_id) REFERENCES booking_house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_house_house_room ADD CONSTRAINT FK_75B266FAC0C0F68E FOREIGN KEY (house_room_id) REFERENCES house_room (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer ADD CONSTRAINT FK_7B003D4D816C6140 FOREIGN KEY (destination_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer ADD CONSTRAINT FK_7B003D4DC3423909 FOREIGN KEY (driver_id) REFERENCES driver (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer_house ADD CONSTRAINT FK_5F3E373574EB9366 FOREIGN KEY (booking_transfer_id) REFERENCES booking_transfer (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer_house ADD CONSTRAINT FK_5F3E37356BB74515 FOREIGN KEY (house_id) REFERENCES house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE sleeping_requirement ADD CONSTRAINT FK_413AD3EA8978F869 FOREIGN KEY (accommodation_type_id) REFERENCES house_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE srroom_type ADD CONSTRAINT FK_F7287958296E3073 FOREIGN KEY (room_type_id) REFERENCES house_room_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE srroom_type ADD CONSTRAINT FK_F7287958AE2DDF69 FOREIGN KEY (sleeping_requirement_id) REFERENCES sleeping_requirement (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking ADD sleeping_requirement_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking ADD note TEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking ADD CONSTRAINT FK_E00CEDDEAE2DDF69 FOREIGN KEY (sleeping_requirement_id) REFERENCES sleeping_requirement (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_E00CEDDEAE2DDF69 ON booking (sleeping_requirement_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE booking_house DROP CONSTRAINT FK_F6A9C428B1E5C38B');
        $this->addSql('ALTER TABLE booking_house_house_room DROP CONSTRAINT FK_75B266FA5083DB98');
        $this->addSql('ALTER TABLE booking_booking_transfersin DROP CONSTRAINT FK_6D04DBCB74EB9366');
        $this->addSql('ALTER TABLE booking_booking_transfersout DROP CONSTRAINT FK_240AF26374EB9366');
        $this->addSql('ALTER TABLE booking_transfer_house DROP CONSTRAINT FK_5F3E373574EB9366');
        $this->addSql('ALTER TABLE booking DROP CONSTRAINT FK_E00CEDDEAE2DDF69');
        $this->addSql('ALTER TABLE srroom_type DROP CONSTRAINT FK_F7287958AE2DDF69');
        $this->addSql('DROP SEQUENCE booking_accommodation_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE booking_house_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE booking_transfer_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE sleeping_requirement_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE srroom_type_id_seq CASCADE');
        $this->addSql('DROP TABLE booking_booking_transfersin');
        $this->addSql('DROP TABLE booking_booking_transfersout');
        $this->addSql('DROP TABLE booking_accommodation');
        $this->addSql('DROP TABLE booking_house');
        $this->addSql('DROP TABLE booking_house_house_room');
        $this->addSql('DROP TABLE booking_transfer');
        $this->addSql('DROP TABLE booking_transfer_house');
        $this->addSql('DROP TABLE sleeping_requirement');
        $this->addSql('DROP TABLE srroom_type');
        $this->addSql('DROP INDEX UNIQ_E00CEDDEAE2DDF69');
        $this->addSql('ALTER TABLE booking DROP sleeping_requirement_id');
        $this->addSql('ALTER TABLE booking DROP note');
    }
}
