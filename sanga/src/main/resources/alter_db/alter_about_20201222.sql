ALTER TABLE `sanga`.`about` 
CHANGE COLUMN `description` `description` VARCHAR(10000) NULL DEFAULT NULL ,
CHANGE COLUMN `description_kr` `description_kr` VARCHAR(10000) NULL DEFAULT NULL COMMENT 'Description (KR)' ;