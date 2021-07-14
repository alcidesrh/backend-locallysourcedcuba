<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210523200815 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE activity_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE activity (id INT NOT NULL, destination_id INT DEFAULT NULL, name VARCHAR(100) NOT NULL, person_cost SMALLINT DEFAULT NULL, guide_cost SMALLINT DEFAULT NULL, car_cost SMALLINT DEFAULT NULL, person_per_car SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_AC74095A816C6140 ON activity (destination_id)');
        $this->addSql('CREATE TABLE activity_activity (activity_source INT NOT NULL, activity_target INT NOT NULL, PRIMARY KEY(activity_source, activity_target))');
        $this->addSql('CREATE INDEX IDX_C7EB954DFC9F73 ON activity_activity (activity_source)');
        $this->addSql('CREATE INDEX IDX_C7EB9541419CFFC ON activity_activity (activity_target)');
        $this->addSql('ALTER TABLE activity ADD CONSTRAINT FK_AC74095A816C6140 FOREIGN KEY (destination_id) REFERENCES destination (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE activity_activity ADD CONSTRAINT FK_C7EB954DFC9F73 FOREIGN KEY (activity_source) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE activity_activity ADD CONSTRAINT FK_C7EB9541419CFFC FOREIGN KEY (activity_target) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER INDEX idx_2af17fb154177093 RENAME TO IDX_2AF17FB1296E3073');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE activity_activity DROP CONSTRAINT FK_C7EB954DFC9F73');
        $this->addSql('ALTER TABLE activity_activity DROP CONSTRAINT FK_C7EB9541419CFFC');
        $this->addSql('DROP SEQUENCE activity_id_seq CASCADE');
        $this->addSql('DROP TABLE activity');
        $this->addSql('DROP TABLE activity_activity');
        $this->addSql('ALTER INDEX idx_2af17fb1296e3073 RENAME TO idx_2af17fb154177093');
    }
}
