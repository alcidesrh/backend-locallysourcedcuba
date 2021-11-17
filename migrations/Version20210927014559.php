<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210927014559 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tour DROP CONSTRAINT FK_6AD1F9695DA0FB8');
        $this->addSql('ALTER TABLE tour ADD canceled BOOLEAN DEFAULT NULL');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F9695DA0FB8 FOREIGN KEY (template_id) REFERENCES tour_template (id) ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE tour DROP CONSTRAINT fk_6ad1f9695da0fb8');
        $this->addSql('ALTER TABLE tour DROP canceled');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT fk_6ad1f9695da0fb8 FOREIGN KEY (template_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }
}
