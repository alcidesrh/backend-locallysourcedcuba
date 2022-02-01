<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211215073745 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE booking_booking_transfersin');
        $this->addSql('DROP TABLE booking_booking_transfersout');
        $this->addSql('ALTER TABLE booking_transfer ADD booking_in_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking_transfer ADD booking_out_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE booking_transfer ADD type VARCHAR(3) DEFAULT NULL');
        $this->addSql('ALTER TABLE booking_transfer ADD CONSTRAINT FK_7B003D4D81858386 FOREIGN KEY (booking_in_id) REFERENCES booking (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer ADD CONSTRAINT FK_7B003D4DBF956384 FOREIGN KEY (booking_out_id) REFERENCES booking (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_7B003D4D81858386 ON booking_transfer (booking_in_id)');
        $this->addSql('CREATE INDEX IDX_7B003D4DBF956384 ON booking_transfer (booking_out_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('CREATE TABLE booking_booking_transfersin (booking_id INT NOT NULL, booking_transfer_id INT NOT NULL, PRIMARY KEY(booking_id, booking_transfer_id))');
        $this->addSql('CREATE INDEX idx_6d04dbcb74eb9366 ON booking_booking_transfersin (booking_transfer_id)');
        $this->addSql('CREATE INDEX idx_6d04dbcb3301c60 ON booking_booking_transfersin (booking_id)');
        $this->addSql('CREATE TABLE booking_booking_transfersout (booking_id INT NOT NULL, booking_transfer_id INT NOT NULL, PRIMARY KEY(booking_id, booking_transfer_id))');
        $this->addSql('CREATE INDEX idx_240af26374eb9366 ON booking_booking_transfersout (booking_transfer_id)');
        $this->addSql('CREATE INDEX idx_240af2633301c60 ON booking_booking_transfersout (booking_id)');
        $this->addSql('ALTER TABLE booking_booking_transfersin ADD CONSTRAINT fk_6d04dbcb3301c60 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersin ADD CONSTRAINT fk_6d04dbcb74eb9366 FOREIGN KEY (booking_transfer_id) REFERENCES booking_transfer (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersout ADD CONSTRAINT fk_240af2633301c60 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_booking_transfersout ADD CONSTRAINT fk_240af26374eb9366 FOREIGN KEY (booking_transfer_id) REFERENCES booking_transfer (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE booking_transfer DROP CONSTRAINT FK_7B003D4D81858386');
        $this->addSql('ALTER TABLE booking_transfer DROP CONSTRAINT FK_7B003D4DBF956384');
        $this->addSql('DROP INDEX IDX_7B003D4D81858386');
        $this->addSql('DROP INDEX IDX_7B003D4DBF956384');
        $this->addSql('ALTER TABLE booking_transfer DROP booking_in_id');
        $this->addSql('ALTER TABLE booking_transfer DROP booking_out_id');
        $this->addSql('ALTER TABLE booking_transfer DROP type');
    }
}
