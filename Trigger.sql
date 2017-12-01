DELIMITER //
CREATE TRIGGER after_includedParts_insert 
AFTER INSERT ON included_parts
FOR EACH ROW
BEGIN
UPDATE parts 
SET part_num_in_inventory = part_num_in_inventory - 1 
where part_id  = NEW.part_id 
and part_num_in_inventory > 0;
END
//
DELIMITER ;