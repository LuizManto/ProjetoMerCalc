-- =====================================================
-- MerCalc - schema inicial do banco
-- Requer MySQL 8.0.16+ (CHECK e DEFAULT (CURRENT_DATE))
-- =====================================================

CREATE DATABASE IF NOT EXISTS `MerCalcDb`
	CHARACTER SET utf8mb4;

USE `MerCalcDb`;

CREATE TABLE IF NOT EXISTS `usuarios` (
	`id_usuario` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(50) NOT NULL,
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`hash_senha` VARCHAR(255) NOT NULL,
	`criado_em` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `listas_mercado` (
	`id_lista` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_usuario` INTEGER UNSIGNED NOT NULL,
	`criada_em` DATE NOT NULL DEFAULT (CURRENT_DATE),
	`comprada_em` DATE,
	`status` ENUM('em_andamento', 'finalizada', 'cancelada', 'planejada') NOT NULL DEFAULT 'planejada',
	PRIMARY KEY(`id_lista`)
);

CREATE TABLE IF NOT EXISTS `itens_lista` (
	`id_item_lista` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	`id_lista` INTEGER UNSIGNED NOT NULL,
	`item` VARCHAR(50) NOT NULL,
	`quantidade` DECIMAL(8,3) NOT NULL CHECK(quantidade > 0),
	`valor_item` DECIMAL(10, 2) CHECK(valor_item >= 0),
	`pego` BOOLEAN NOT NULL DEFAULT false,
	`item_fora` BOOLEAN NOT NULL DEFAULT false,
	PRIMARY KEY(`id_item_lista`)
);

ALTER TABLE `listas_mercado`
	ADD CONSTRAINT `fk_listas_mercado_usuarios`
	FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`)
	ON UPDATE NO ACTION ON DELETE CASCADE;

ALTER TABLE `itens_lista`
	ADD CONSTRAINT `fk_itens_lista_listas_mercado`
	FOREIGN KEY(`id_lista`) REFERENCES `listas_mercado`(`id_lista`)
	ON UPDATE NO ACTION ON DELETE CASCADE;
