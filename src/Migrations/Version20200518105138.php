<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200518105138 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666AD68011AFE');
        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666AD9777D11E');
        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666AD9D86650F');
        $this->addSql('DROP INDEX IDX_58F666AD9D86650F ON beer');
        $this->addSql('DROP INDEX UNIQ_58F666AD68011AFE ON beer');
        $this->addSql('DROP INDEX IDX_58F666AD9777D11E ON beer');
        $this->addSql('ALTER TABLE beer ADD category_id INT NOT NULL, ADD user_id INT NOT NULL, ADD image_id INT NOT NULL, DROP image_id_id, DROP category_id_id, DROP user_id_id');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666AD12469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666ADA76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666AD3DA5256D FOREIGN KEY (image_id) REFERENCES image (id)');
        $this->addSql('CREATE INDEX IDX_58F666AD12469DE2 ON beer (category_id)');
        $this->addSql('CREATE INDEX IDX_58F666ADA76ED395 ON beer (user_id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_58F666AD3DA5256D ON beer (image_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666AD12469DE2');
        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666ADA76ED395');
        $this->addSql('ALTER TABLE beer DROP FOREIGN KEY FK_58F666AD3DA5256D');
        $this->addSql('DROP INDEX IDX_58F666AD12469DE2 ON beer');
        $this->addSql('DROP INDEX IDX_58F666ADA76ED395 ON beer');
        $this->addSql('DROP INDEX UNIQ_58F666AD3DA5256D ON beer');
        $this->addSql('ALTER TABLE beer ADD image_id_id INT NOT NULL, ADD category_id_id INT NOT NULL, ADD user_id_id INT NOT NULL, DROP category_id, DROP user_id, DROP image_id');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666AD68011AFE FOREIGN KEY (image_id_id) REFERENCES image (id)');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666AD9777D11E FOREIGN KEY (category_id_id) REFERENCES category (id)');
        $this->addSql('ALTER TABLE beer ADD CONSTRAINT FK_58F666AD9D86650F FOREIGN KEY (user_id_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_58F666AD9D86650F ON beer (user_id_id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_58F666AD68011AFE ON beer (image_id_id)');
        $this->addSql('CREATE INDEX IDX_58F666AD9777D11E ON beer (category_id_id)');
    }
}
