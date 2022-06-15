CREATE TABLE `Users` (
                         `user_id` BIGINT(20) NULL DEFAULT NULL,
                         `phone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
                         `password` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
                         `created_at` TIMESTAMP NULL DEFAULT NULL,
                         `number_of_atempts` INT(11) NULL DEFAULT NULL
)
    COLLATE='utf8_general_ci'
ENGINE=InnoDB
;