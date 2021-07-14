<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210528053328 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE location_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE location_distance_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE location (id INT NOT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE location_distance (id INT NOT NULL, location1_id INT NOT NULL, location2_id INT NOT NULL, kms SMALLINT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_CDC7B863DC6ACE95 ON location_distance (location1_id)');
        $this->addSql('CREATE INDEX IDX_CDC7B863CEDF617B ON location_distance (location2_id)');
        $this->addSql('ALTER TABLE location_distance ADD CONSTRAINT FK_CDC7B863DC6ACE95 FOREIGN KEY (location1_id) REFERENCES location (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE location_distance ADD CONSTRAINT FK_CDC7B863CEDF617B FOREIGN KEY (location2_id) REFERENCES location (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE location_distance DROP CONSTRAINT FK_CDC7B863DC6ACE95');
        $this->addSql('ALTER TABLE location_distance DROP CONSTRAINT FK_CDC7B863CEDF617B');
        $this->addSql('DROP SEQUENCE location_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE location_distance_id_seq CASCADE');
        $this->addSql('DROP TABLE location');
        $this->addSql('DROP TABLE location_distance');
    }
}
