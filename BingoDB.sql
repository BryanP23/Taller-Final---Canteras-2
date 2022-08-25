-- -----------------------------------------------------
-- Schema BingoDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BingoDB` DEFAULT CHARACTER SET utf8 ;
USE `BingoDB` ;

-- -----------------------------------------------------
-- Table `BingoDB`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BingoDB`.`player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_Player_U` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BingoDB`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BingoDB`.`game` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE INDEX `game_id_U` (`game_id` ASC) VISIBLE,
  INDEX `BD_game_player_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `BG_game_player`
    FOREIGN KEY (`player_id`)
    REFERENCES `BingoDB`.`player` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BingoDB`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BingoDB`.`card` (
  `card_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`card_id`),
  INDEX `BG_card_player1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `BG_card_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `BingoDB`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BingoDB`.`card_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BingoDB`.`card_detail` (
  `card_detail_id` INT NOT NULL AUTO_INCREMENT,
  `card_id` INT UNSIGNED NOT NULL,
  `line` INT NOT NULL,
  `b` INT NULL,
  `i` INT NULL,
  `n` INT NULL,
  `g` INT NULL,
  `o` INT NULL,
  `is_b` TINYINT(1) NULL DEFAULT 0,
  `is_i` TINYINT(1) NULL DEFAULT 0,
  `is_n` TINYINT(1) NULL DEFAULT 0,
  `is_g` TINYINT(1) NULL DEFAULT 0,
  `is_o` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`card_detail_id`),
  INDEX `BG_card_detail_card1_idx` (`card_id` ASC) INVISIBLE,
  CONSTRAINT `BG_card_detail_card1`
    FOREIGN KEY (`card_id`)
    REFERENCES `BingoDB`.`card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BingoDB`.`Random_Number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BingoDB`.`Random_Number` (
  `Random_Number_id` INT NOT NULL AUTO_INCREMENT,
  `game_game_id` INT NOT NULL,
  `Random_Number` INT NULL,
  PRIMARY KEY (`Random_Number_id`),
  UNIQUE INDEX `Random_Number_id_UNIQUE` (`Random_Number_id` ASC) VISIBLE,
  INDEX `BD_Random_Number_game1_idx` (`game_game_id` ASC) VISIBLE,
  CONSTRAINT `BD_Random_Number_game1`
    FOREIGN KEY (`game_game_id`)
    REFERENCES `BingoDB`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Valores iniciales para testeo
-- -----------------------------------------------------
INSERT INTO BingoDB.player (email)
VALUES ('admin123@hotmail.com');
INSERT INTO BingoDB.game (player_id)
VALUES (1);
INSERT INTO BingoDB.Random_Number (game_game_id, Random_Number)
VALUES (1, 15),
       (1, 20),
       (1, 30),
       (1, 1),
       (1, 54),
       (1, 87),
       (1, 96),
       (1, 53),
       (1, 37),
       (1, 9);
INSERT INTO BingoDB.card (player_id)
VALUES (1);
INSERT INTO BingoDB.card_detail (card_id, line, b, i, n, g, o, is_b, is_i, is_n, is_g, is_o)
VALUES (1, 1, 3, 15, 30, 45, 60, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       (1, 2, 7, 16, 33, 49, 63, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       (1, 3, 10, 18, 36, 46, 65, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       (1, 4, 14, 20, 39, 52, 69, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       (1, 5, 8, 29, 42, 57, 75, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);