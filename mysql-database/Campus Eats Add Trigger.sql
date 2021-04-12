use campus_eats_fall2020;

DROP TABLE IF EXISTS driver_rating_audit;
CREATE TABLE driver_rating_audit
(
  rating_id           INT     NOT NULL,
  courteous_rating    INT     NOT NULL,
  ontime_rating       INT     NOT NULL,
  action_type         VARCHAR(50)     NOT NULL,
  action_date         DATETIME        NOT NULL
);

DROP TRIGGER IF EXISTS driver_rating_after_insert;
DROP TRIGGER IF EXISTS driver_rating_after_delete;

DELIMITER //
CREATE TRIGGER driver_rating_after_insert
  AFTER INSERT ON driver_rating
  FOR EACH ROW
BEGIN
    INSERT INTO driver_rating_audit VALUES
    (NEW.rating_id, NEW.courteous_rating, NEW.ontime_rating, 'INSERTED', NOW());
END//

CREATE TRIGGER driver_rating_after_delete
  AFTER DELETE ON driver_rating
  FOR EACH ROW
BEGIN
    INSERT INTO driver_rating_audit VALUES
    (OLD.rating_id, OLD.courteous_rating, OLD.ontime_rating, 'DELETED', NOW());
END//
DELIMITER ;

DELETE FROM driver_rating where rating_id = 3; 
INSERT INTO driver_rating VALUES (3,2,1,"orci, adipiscing non, luctus");
SELECT * FROM driver_rating_audit;



