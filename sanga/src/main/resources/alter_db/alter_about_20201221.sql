ALTER TABLE `sanga`.`about` 
CHANGE COLUMN `description` `description` LONGTEXT NULL DEFAULT NULL ,
CHANGE COLUMN `description_kr` `description_kr` LONGTEXT NULL DEFAULT NULL COMMENT 'Description (KR)' ;
