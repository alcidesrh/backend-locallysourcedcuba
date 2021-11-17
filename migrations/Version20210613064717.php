<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210613064717 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE itinerary_day_template_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE itinerary_template_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE tour_template_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE itinerary_day_template (id INT NOT NULL, itinerary_id INT NOT NULL, tour_template_id INT NOT NULL, no_guide BOOLEAN DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_599C7DE015F737B2 ON itinerary_day_template (itinerary_id)');
        $this->addSql('CREATE INDEX IDX_599C7DE0658C5D7B ON itinerary_day_template (tour_template_id)');
        $this->addSql('CREATE TABLE itinerary_day_template_activity (itinerary_day_template_id INT NOT NULL, activity_id INT NOT NULL, PRIMARY KEY(itinerary_day_template_id, activity_id))');
        $this->addSql('CREATE INDEX IDX_8C3E0CE7AC8BCD1D ON itinerary_day_template_activity (itinerary_day_template_id)');
        $this->addSql('CREATE INDEX IDX_8C3E0CE781C06096 ON itinerary_day_template_activity (activity_id)');
        $this->addSql('CREATE TABLE itinerary_template (id INT NOT NULL, destination_id INT DEFAULT NULL, days SMALLINT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_B6822B42816C6140 ON itinerary_template (destination_id)');
        $this->addSql('CREATE TABLE tour_template (id INT NOT NULL, template1_id INT DEFAULT NULL, template2_id INT DEFAULT NULL, transfer_in_id INT DEFAULT NULL, transfer_out_id INT DEFAULT NULL, transportation_id INT DEFAULT NULL, house_type_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, code VARCHAR(30) DEFAULT NULL, type VARCHAR(50) DEFAULT NULL, tour_type VARCHAR(5) DEFAULT NULL, guide_wage DOUBLE PRECISION DEFAULT NULL, color VARCHAR(10) DEFAULT NULL, start_place VARCHAR(255) DEFAULT NULL, finish_place VARCHAR(255) DEFAULT NULL, description TEXT DEFAULT NULL, bonus SMALLINT DEFAULT NULL, days SMALLINT DEFAULT NULL, start_day SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_D9F46B013D3CC22 ON tour_template (template1_id)');
        $this->addSql('CREATE INDEX IDX_D9F46B016663CC ON tour_template (template2_id)');
        $this->addSql('CREATE INDEX IDX_D9F46B0B37D8B6B ON tour_template (transfer_in_id)');
        $this->addSql('CREATE INDEX IDX_D9F46B0611C0549 ON tour_template (transfer_out_id)');
        $this->addSql('CREATE INDEX IDX_D9F46B0F7BB88E4 ON tour_template (transportation_id)');
        $this->addSql('CREATE INDEX IDX_D9F46B0519B0A8E ON tour_template (house_type_id)');
        $this->addSql('CREATE TABLE tour_template_activity (tour_template_id INT NOT NULL, activity_id INT NOT NULL, PRIMARY KEY(tour_template_id, activity_id))');
        $this->addSql('CREATE INDEX IDX_803C52C6658C5D7B ON tour_template_activity (tour_template_id)');
        $this->addSql('CREATE INDEX IDX_803C52C681C06096 ON tour_template_activity (activity_id)');
        $this->addSql('ALTER TABLE itinerary_day_template ADD CONSTRAINT FK_599C7DE015F737B2 FOREIGN KEY (itinerary_id) REFERENCES itinerary_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day_template ADD CONSTRAINT FK_599C7DE0658C5D7B FOREIGN KEY (tour_template_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day_template_activity ADD CONSTRAINT FK_8C3E0CE7AC8BCD1D FOREIGN KEY (itinerary_day_template_id) REFERENCES itinerary_day_template (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_day_template_activity ADD CONSTRAINT FK_8C3E0CE781C06096 FOREIGN KEY (activity_id) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE itinerary_template ADD CONSTRAINT FK_B6822B42816C6140 FOREIGN KEY (destination_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B013D3CC22 FOREIGN KEY (template1_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B016663CC FOREIGN KEY (template2_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B0B37D8B6B FOREIGN KEY (transfer_in_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B0611C0549 FOREIGN KEY (transfer_out_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B0F7BB88E4 FOREIGN KEY (transportation_id) REFERENCES transportation (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B0519B0A8E FOREIGN KEY (house_type_id) REFERENCES house_type (id) NOT DEFERRABLE INITIALLY IMMEDIATE');       
        $this->addSql('ALTER TABLE tour_template_activity ADD CONSTRAINT FK_803C52C6658C5D7B FOREIGN KEY (tour_template_id) REFERENCES tour_template (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template_activity ADD CONSTRAINT FK_803C52C681C06096 FOREIGN KEY (activity_id) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE itinerary_day_template_activity DROP CONSTRAINT FK_8C3E0CE7AC8BCD1D');
        $this->addSql('ALTER TABLE itinerary_day_template DROP CONSTRAINT FK_599C7DE015F737B2');
        $this->addSql('ALTER TABLE itinerary_day_template DROP CONSTRAINT FK_599C7DE0658C5D7B');
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT FK_D9F46B013D3CC22');
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT FK_D9F46B016663CC');
        $this->addSql('ALTER TABLE tour_template_activity DROP CONSTRAINT FK_803C52C6658C5D7B');
        $this->addSql('DROP SEQUENCE itinerary_day_template_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE itinerary_template_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE tour_template_id_seq CASCADE');
        $this->addSql('DROP TABLE itinerary_day_template');
        $this->addSql('DROP TABLE itinerary_day_template_activity');
        $this->addSql('DROP TABLE itinerary_template');
        $this->addSql('DROP TABLE tour_template');
        $this->addSql('DROP TABLE tour_template_activity');
    }
}
