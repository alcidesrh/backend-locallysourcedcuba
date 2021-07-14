<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210525054539 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE activity_combo ADD parent_id INT NOT NULL');
        $this->addSql('ALTER TABLE activity_combo ADD CONSTRAINT FK_AF3E06F9727ACA70 FOREIGN KEY (parent_id) REFERENCES activity (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_AF3E06F9727ACA70 ON activity_combo (parent_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE activity_combo DROP CONSTRAINT FK_AF3E06F9727ACA70');
        $this->addSql('DROP INDEX IDX_AF3E06F9727ACA70');
        $this->addSql('ALTER TABLE activity_combo DROP parent_id');
    }
}
