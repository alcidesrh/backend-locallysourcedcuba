<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210525031512 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE activity_combo_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE activity_combo (id INT NOT NULL, activity_id INT NOT NULL, priority SMALLINT DEFAULT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_AF3E06F981C06096 ON activity_combo (activity_id)');
        $this->addSql('ALTER TABLE activity_combo ADD CONSTRAINT FK_AF3E06F981C06096 FOREIGN KEY (activity_id) REFERENCES activity (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE activity_activity');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE activity_combo_id_seq CASCADE');
        $this->addSql('CREATE TABLE activity_activity (activity_source INT NOT NULL, activity_target INT NOT NULL, PRIMARY KEY(activity_source, activity_target))');
        $this->addSql('CREATE INDEX idx_c7eb9541419cffc ON activity_activity (activity_target)');
        $this->addSql('CREATE INDEX idx_c7eb954dfc9f73 ON activity_activity (activity_source)');
        $this->addSql('ALTER TABLE activity_activity ADD CONSTRAINT fk_c7eb954dfc9f73 FOREIGN KEY (activity_source) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE activity_activity ADD CONSTRAINT fk_c7eb9541419cffc FOREIGN KEY (activity_target) REFERENCES activity (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('DROP TABLE activity_combo');
    }
}
