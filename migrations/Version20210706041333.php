<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210706041333 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT FK_D9F46B013D3CC22');
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT FK_D9F46B016663CC');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B013D3CC22 FOREIGN KEY (template1_id) REFERENCES tour_template (id) ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT FK_D9F46B016663CC FOREIGN KEY (template2_id) REFERENCES tour_template (id) ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT fk_d9f46b013d3cc22');
        $this->addSql('ALTER TABLE tour_template DROP CONSTRAINT fk_d9f46b016663cc');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT fk_d9f46b013d3cc22 FOREIGN KEY (template1_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE tour_template ADD CONSTRAINT fk_d9f46b016663cc FOREIGN KEY (template2_id) REFERENCES tour_template (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }
}
