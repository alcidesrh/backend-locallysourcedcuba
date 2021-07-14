<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210511051625 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE house_season_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE house_season_room_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE house_season (id INT NOT NULL, house_id INT NOT NULL, start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, end_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_4359C2206BB74515 ON house_season (house_id)');
        $this->addSql('CREATE TABLE house_season_room (id INT NOT NULL, room_id INT NOT NULL, house_season_id INT NOT NULL, price SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_8A0621F054177093 ON house_season_room (room_id)');
        $this->addSql('CREATE INDEX IDX_8A0621F0B577DF0F ON house_season_room (house_season_id)');
        $this->addSql('ALTER TABLE house_season ADD CONSTRAINT FK_4359C2206BB74515 FOREIGN KEY (house_id) REFERENCES house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_season_room ADD CONSTRAINT FK_8A0621F054177093 FOREIGN KEY (room_id) REFERENCES house_room (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_season_room ADD CONSTRAINT FK_8A0621F0B577DF0F FOREIGN KEY (house_season_id) REFERENCES house_season (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE house_season_room DROP CONSTRAINT FK_8A0621F0B577DF0F');
        $this->addSql('DROP SEQUENCE house_season_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE house_season_room_id_seq CASCADE');
        $this->addSql('DROP TABLE house_season');
        $this->addSql('DROP TABLE house_season_room');
    }
}
