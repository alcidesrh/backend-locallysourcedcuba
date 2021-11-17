<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210906051854 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE itinerary_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE itinerary_day_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE itinerary (id INT NOT NULL, destination_id INT DEFAULT NULL, house_id INT DEFAULT NULL, tour_id INT NOT NULL, days SMALLINT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_FF2238F6816C6140 ON itinerary (destination_id)');
        $this->addSql('CREATE INDEX IDX_FF2238F66BB74515 ON itinerary (house_id)');
        $this->addSql('CREATE INDEX IDX_FF2238F615ED8D43 ON itinerary (tour_id)');
        $this->addSql('CREATE TABLE itinerary_day (id INT NOT NULL, itinerary_id INT NOT NULL, no_guide BOOLEAN DEFAULT NULL, date TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT NULL, day SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_AB0E649415F737B2 ON itinerary_day (itinerary_id)');
        $this->addSql('CREATE TABLE itinerary_day_activity (itinerary_day_id INT NOT NULL, activity_id INT NOT NULL, PRIMARY KEY(itinerary_day_id, activity_id))');
        $this->addSql('CREATE INDEX IDX_62886B397A725613 ON itinerary_day_activity (itinerary_day_id)');
        $this->addSql('CREATE INDEX IDX_62886B3981C06096 ON itinerary_day_activity (activity_id)');
        $this->addSql('ALTER TABLE itinerary ADD CONSTRAINT FK_FF2238F6816C6140 FOREIGN KEY (destination_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary ADD CONSTRAINT FK_FF2238F66BB74515 FOREIGN KEY (house_id) REFERENCES house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary ADD CONSTRAINT FK_FF2238F615ED8D43 FOREIGN KEY (tour_id) REFERENCES tour (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day ADD CONSTRAINT FK_AB0E649415F737B2 FOREIGN KEY (itinerary_id) REFERENCES itinerary (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day_activity ADD CONSTRAINT FK_62886B397A725613 FOREIGN KEY (itinerary_day_id) REFERENCES itinerary_day (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day_activity ADD CONSTRAINT FK_62886B3981C06096 FOREIGN KEY (activity_id) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE itinerary_day DROP CONSTRAINT FK_AB0E649415F737B2');
        $this->addSql('ALTER TABLE itinerary_day_activity DROP CONSTRAINT FK_62886B397A725613');
        $this->addSql('DROP SEQUENCE itinerary_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE itinerary_day_id_seq CASCADE');
        $this->addSql('DROP TABLE itinerary');
        $this->addSql('DROP TABLE itinerary_day');
        $this->addSql('DROP TABLE itinerary_day_activity');
        $this->addSql('ALTER TABLE house ALTER phone TYPE VARCHAR(50)');
        $this->addSql('ALTER TABLE house ALTER email TYPE VARCHAR(100)');
    }
}
