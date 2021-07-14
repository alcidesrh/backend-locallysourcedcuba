<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210622045511 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE notification_tour_template_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE notification_tour_template (id INT NOT NULL, tour_template_id INT NOT NULL, notification_id INT NOT NULL, days SMALLINT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_5B2D8C79658C5D7B ON notification_tour_template (tour_template_id)');
        $this->addSql('CREATE INDEX IDX_5B2D8C79EF1A9D84 ON notification_tour_template (notification_id)');
        $this->addSql('ALTER TABLE notification_tour_template ADD CONSTRAINT FK_5B2D8C79658C5D7B FOREIGN KEY (tour_template_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE notification_tour_template ADD CONSTRAINT FK_5B2D8C79EF1A9D84 FOREIGN KEY (notification_id) REFERENCES notification (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE notification_tour_template_id_seq CASCADE');
        $this->addSql('DROP TABLE notification_tour_template');
    }
}
