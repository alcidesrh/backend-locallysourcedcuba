<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210929050045 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tour ADD guide_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969D7ED1D4B FOREIGN KEY (guide_id) REFERENCES guide (id) ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_6AD1F969D7ED1D4B ON tour (guide_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE tour DROP CONSTRAINT FK_6AD1F969D7ED1D4B');
        $this->addSql('DROP INDEX IDX_6AD1F969D7ED1D4B');
        $this->addSql('ALTER TABLE tour DROP guide_id');
    }
}
