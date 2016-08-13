DROP PROCEDURE IF EXISTS new_procedure;
DROP PROCEDURE IF EXISTS get_subscribers;
DELIMITER $$
CREATE PROCEDURE `new_procedure`(custom_field_ids varchar(500),group_ids varchar(500))
BEGIN
DECLARE ids varchar(50);
SELECT  GROUP_CONCAT(DISTINCT
        CONCAT('MAX(CASE WHEN custom_field_id = ''',
               custom_field_id,
               ''' THEN Value END) AS ',
               CONCAT('`', custom_field_id, '`')
               )) INTO @sql
FROM custom_field_values where FIND_IN_SET(custom_field_id,custom_field_ids);


SET @sql = CONCAT('SELECT   a.name AS name,a.email as email,a.id as subscriber_id,a.subscriber_group_id as subscriber_group_id, ', @sql, '
                    FROM    subscribers a
                            LEFT JOIN custom_field_values b
                                ON a.id = b.subscriber_id where FIND_IN_SET(a.subscriber_group_id,"',group_ids,'") and is_active=1
                    GROUP   BY a.email');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;
DELIMITER $$
CREATE  PROCEDURE `get_subscribers`(in group_ids varchar(50))
BEGIN
select name,email,id as subscriber_id,subscriber_group_id from subscribers where FIND_IN_SET(subscriber_group_id,group_ids) and is_active=1;
END$$
DELIMITER ;
