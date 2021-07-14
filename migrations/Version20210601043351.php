<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210601043351 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE transportation_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE transportation_price_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE transportation_route_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE transportation (id INT NOT NULL, driver_id INT DEFAULT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_9B1722DC3423909 ON transportation (driver_id)');
        $this->addSql('CREATE TABLE transportation_price (id INT NOT NULL, transportation_id INT DEFAULT NULL, min SMALLINT NOT NULL, max SMALLINT NOT NULL, price DOUBLE PRECISION NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_D2CF7972F7BB88E4 ON transportation_price (transportation_id)');
        $this->addSql('CREATE TABLE transportation_route (id INT NOT NULL, location_from_id INT DEFAULT NULL, location_to_id INT NOT NULL, transportation_id INT DEFAULT NULL, kms SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_1AC37BD2968BCAAF ON transportation_route (location_from_id)');
        $this->addSql('CREATE INDEX IDX_1AC37BD246690F40 ON transportation_route (location_to_id)');
        $this->addSql('CREATE INDEX IDX_1AC37BD2F7BB88E4 ON transportation_route (transportation_id)');
        $this->addSql('ALTER TABLE transportation ADD CONSTRAINT FK_9B1722DC3423909 FOREIGN KEY (driver_id) REFERENCES driver (id) NOT DEFERRABLE INITIALLY IMMEDIATE');       
        $this->addSql('ALTER TABLE transportation_price ADD CONSTRAINT FK_D2CF7972F7BB88E4 FOREIGN KEY (transportation_id) REFERENCES transportation (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE transportation_route ADD CONSTRAINT FK_1AC37BD2968BCAAF FOREIGN KEY (location_from_id) REFERENCES location (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE transportation_route ADD CONSTRAINT FK_1AC37BD246690F40 FOREIGN KEY (location_to_id) REFERENCES location (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE transportation_route ADD CONSTRAINT FK_1AC37BD2F7BB88E4 FOREIGN KEY (transportation_id) REFERENCES transportation (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE transportation_price DROP CONSTRAINT FK_D2CF7972F7BB88E4');
        $this->addSql('ALTER TABLE transportation_route DROP CONSTRAINT FK_1AC37BD2F7BB88E4');
        $this->addSql('DROP SEQUENCE transportation_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE transportation_price_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE transportation_route_id_seq CASCADE');
        $this->addSql('DROP TABLE transportation');
        $this->addSql('DROP TABLE transportation_price');
        $this->addSql('DROP TABLE transportation_route');
    }
}
