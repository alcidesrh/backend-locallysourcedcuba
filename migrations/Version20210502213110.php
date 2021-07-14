<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210502213110 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE notification_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE service_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE notification (id INT NOT NULL, name VARCHAR(255) NOT NULL, icon VARCHAR(50) DEFAULT NULL, days SMALLINT DEFAULT NULL, priority SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE notification_service (notification_id INT NOT NULL, service_id INT NOT NULL, PRIMARY KEY(notification_id, service_id))');
        $this->addSql('CREATE INDEX IDX_F4831065EF1A9D84 ON notification_service (notification_id)');
        $this->addSql('CREATE INDEX IDX_F4831065ED5CA9E6 ON notification_service (service_id)');
        $this->addSql('CREATE TABLE service (id INT NOT NULL, name VARCHAR(100) NOT NULL, code VARCHAR(10) DEFAULT NULL, days_to_show INT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE notification_service ADD CONSTRAINT FK_F4831065EF1A9D84 FOREIGN KEY (notification_id) REFERENCES notification (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE notification_service ADD CONSTRAINT FK_F4831065ED5CA9E6 FOREIGN KEY (service_id) REFERENCES service (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE notification_service DROP CONSTRAINT FK_F4831065EF1A9D84');
        $this->addSql('ALTER TABLE notification_service DROP CONSTRAINT FK_F4831065ED5CA9E6');
        $this->addSql('DROP SEQUENCE notification_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE service_id_seq CASCADE');
        $this->addSql('DROP TABLE notification');
        $this->addSql('DROP TABLE notification_service');
        $this->addSql('DROP TABLE service');
    }
}
