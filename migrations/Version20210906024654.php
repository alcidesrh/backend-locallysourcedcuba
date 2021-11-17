<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210906024654 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE booking_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE notification_tour_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE tour_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE booking (id INT NOT NULL, name VARCHAR(255) DEFAULT NULL, pax SMALLINT DEFAULT NULL, lp SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE notification_tour (id INT NOT NULL, tour_id INT NOT NULL, notification_id INT NOT NULL, days SMALLINT NOT NULL, complete BOOLEAN DEFAULT 0, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_D2EDB25315ED8D43 ON notification_tour (tour_id)');
        $this->addSql('CREATE INDEX IDX_D2EDB253EF1A9D84 ON notification_tour (notification_id)');
        $this->addSql('CREATE TABLE tour (id INT NOT NULL, transfer_in_id INT DEFAULT NULL, transfer_out_id INT DEFAULT NULL, transportation_id INT DEFAULT NULL, house_type_id INT DEFAULT NULL, template_id INT DEFAULT NULL, service_id INT DEFAULT NULL, code VARCHAR(30) DEFAULT NULL, guide_wage DOUBLE PRECISION DEFAULT NULL, color VARCHAR(10) DEFAULT NULL, start_place VARCHAR(255) DEFAULT NULL, finish_place VARCHAR(255) DEFAULT NULL, description TEXT DEFAULT NULL, bonus SMALLINT DEFAULT NULL, days SMALLINT DEFAULT NULL, start_day SMALLINT DEFAULT NULL, agent BOOLEAN DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_6AD1F96977153098 ON tour (code)');
        $this->addSql('CREATE INDEX IDX_6AD1F969B37D8B6B ON tour (transfer_in_id)');
        $this->addSql('CREATE INDEX IDX_6AD1F969611C0549 ON tour (transfer_out_id)');
        $this->addSql('CREATE INDEX IDX_6AD1F969F7BB88E4 ON tour (transportation_id)');
        $this->addSql('CREATE INDEX IDX_6AD1F969519B0A8E ON tour (house_type_id)');
        $this->addSql('CREATE INDEX IDX_6AD1F9695DA0FB8 ON tour (template_id)');
        $this->addSql('CREATE INDEX IDX_6AD1F969ED5CA9E6 ON tour (service_id)');
        $this->addSql('CREATE TABLE tour_activity (tour_id INT NOT NULL, activity_id INT NOT NULL, PRIMARY KEY(tour_id, activity_id))');
        $this->addSql('CREATE INDEX IDX_368B506915ED8D43 ON tour_activity (tour_id)');
        $this->addSql('CREATE INDEX IDX_368B506981C06096 ON tour_activity (activity_id)');
        $this->addSql('CREATE TABLE tour_booking (tour_id INT NOT NULL, booking_id INT NOT NULL, PRIMARY KEY(tour_id, booking_id))');
        $this->addSql('CREATE INDEX IDX_A0E6685F15ED8D43 ON tour_booking (tour_id)');
        $this->addSql('CREATE INDEX IDX_A0E6685F3301C60 ON tour_booking (booking_id)');
        $this->addSql('ALTER TABLE notification_tour ADD CONSTRAINT FK_D2EDB25315ED8D43 FOREIGN KEY (tour_id) REFERENCES tour (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE notification_tour ADD CONSTRAINT FK_D2EDB253EF1A9D84 FOREIGN KEY (notification_id) REFERENCES notification (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969B37D8B6B FOREIGN KEY (transfer_in_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969611C0549 FOREIGN KEY (transfer_out_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969F7BB88E4 FOREIGN KEY (transportation_id) REFERENCES transportation (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969519B0A8E FOREIGN KEY (house_type_id) REFERENCES house_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F9695DA0FB8 FOREIGN KEY (template_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969ED5CA9E6 FOREIGN KEY (service_id) REFERENCES service (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_activity ADD CONSTRAINT FK_368B506915ED8D43 FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_activity ADD CONSTRAINT FK_368B506981C06096 FOREIGN KEY (activity_id) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_booking ADD CONSTRAINT FK_A0E6685F15ED8D43 FOREIGN KEY (tour_id) REFERENCES tour (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_booking ADD CONSTRAINT FK_A0E6685F3301C60 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE tour_booking DROP CONSTRAINT FK_A0E6685F3301C60');
        $this->addSql('ALTER TABLE notification_tour DROP CONSTRAINT FK_D2EDB25315ED8D43');
        $this->addSql('ALTER TABLE tour_activity DROP CONSTRAINT FK_368B506915ED8D43');
        $this->addSql('ALTER TABLE tour_booking DROP CONSTRAINT FK_A0E6685F15ED8D43');
        $this->addSql('DROP SEQUENCE booking_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE notification_tour_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE tour_id_seq CASCADE');
        $this->addSql('DROP TABLE booking');
        $this->addSql('DROP TABLE notification_tour');
        $this->addSql('DROP TABLE tour');
        $this->addSql('DROP TABLE tour_activity');
        $this->addSql('DROP TABLE tour_booking');
        $this->addSql('ALTER TABLE house ALTER phone TYPE VARCHAR(50)');
        $this->addSql('ALTER TABLE house ALTER email TYPE VARCHAR(100)');
    }
}
