ALTER TABLE `sanga`.`employee` 
CHANGE COLUMN `project` `project` LONGTEXT NULL DEFAULT NULL ,
CHANGE COLUMN `profile_kr` `profile_kr` LONGTEXT NULL DEFAULT NULL COMMENT 'Profile (KR): ' ,
CHANGE COLUMN `project_kr` `project_kr` LONGTEXT NULL DEFAULT NULL COMMENT 'Project (KR)' ,
CHANGE COLUMN `profile` `profile` LONGTEXT NULL DEFAULT NULL ;