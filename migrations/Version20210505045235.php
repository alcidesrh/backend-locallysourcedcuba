<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210505045235 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE house_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE house_feature_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE house_room_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE house_type_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE house_room_type_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE house (id INT NOT NULL, type_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, address VARCHAR(255) DEFAULT NULL, phone VARCHAR(15) DEFAULT NULL, email VARCHAR(50) DEFAULT NULL, description TEXT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_67D5399DC54C8C93 ON house (type_id)');
        $this->addSql('CREATE TABLE house_house_feature (house_id INT NOT NULL, house_feature_id INT NOT NULL, PRIMARY KEY(house_id, house_feature_id))');
        $this->addSql('CREATE INDEX IDX_4B7736006BB74515 ON house_house_feature (house_id)');
        $this->addSql('CREATE INDEX IDX_4B773600174F074 ON house_house_feature (house_feature_id)');
        $this->addSql('CREATE TABLE house_feature (id INT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE house_room (id INT NOT NULL, room_type_id INT NOT NULL, house_id INT DEFAULT NULL, price SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_2AF17FB154177093 ON house_room (room_id)');
        $this->addSql('CREATE INDEX IDX_2AF17FB16BB74515 ON house_room (house_id)');
        $this->addSql('CREATE TABLE house_type (id INT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE house_room_type (id INT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE house ADD CONSTRAINT FK_67D5399DC54C8C93 FOREIGN KEY (type_id) REFERENCES house_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_house_feature ADD CONSTRAINT FK_4B7736006BB74515 FOREIGN KEY (house_id) REFERENCES house (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_house_feature ADD CONSTRAINT FK_4B773600174F074 FOREIGN KEY (house_feature_id) REFERENCES house_feature (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_room ADD CONSTRAINT FK_2AF17FB154177093 FOREIGN KEY (room_id) REFERENCES house_room_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE house_room ADD CONSTRAINT FK_2AF17FB16BB74515 FOREIGN KEY (house_id) REFERENCES house (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE house_house_feature DROP CONSTRAINT FK_4B7736006BB74515');
        $this->addSql('ALTER TABLE house_room DROP CONSTRAINT FK_2AF17FB16BB74515');
        $this->addSql('ALTER TABLE house_house_feature DROP CONSTRAINT FK_4B773600174F074');
        $this->addSql('ALTER TABLE house DROP CONSTRAINT FK_67D5399DC54C8C93');
        $this->addSql('ALTER TABLE house_room DROP CONSTRAINT FK_2AF17FB154177093');
        $this->addSql('DROP SEQUENCE house_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE house_feature_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE house_room_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE house_type_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE house_room_type_id_seq CASCADE');
        $this->addSql('DROP TABLE house');
        $this->addSql('DROP TABLE house_house_feature');
        $this->addSql('DROP TABLE house_feature');
        $this->addSql('DROP TABLE house_room');
        $this->addSql('DROP TABLE house_type');
        $this->addSql('DROP TABLE house_room_type');
    }
}
