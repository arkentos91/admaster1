
DELIMITER $$
DROP FUNCTION IF EXISTS time_ago;
CREATE FUNCTION time_ago (ts datetime) 
RETURNS varchar(255)
DETERMINISTIC
BEGIN 
    DECLARE utx INT SIGNED DEFAULT 1;
    DECLARE nowutx INT SIGNED DEFAULT 1;
    DECLARE dif INT SIGNED DEFAULT 1;
    DECLARE method varchar(255);
    DECLARE cnt varchar(255);
    DECLARE plural tinyint(11);
    DECLARE future tinyint(11);
    SET utx := UNIX_TIMESTAMP(ts);
    SET nowutx := UNIX_TIMESTAMP(NOW());
    SET future := utx > nowutx;
    SET dif := IF(future, utx - nowutx, nowutx - utx);
        SET method := IF(dif < 60, 'seconds', IF(
                                    dif < (60 * 60), 'minutes', IF(
                                        dif < (60 * 60 * 24), 'hours', IF(
                                            dif < (60 * 60 * 24 * 7), 'days' , IF(
                                                dif < (60 * 60 * 24 * 365), 'week', 'year')))));

        SET cnt := IF(dif < 60, dif, IF(
                                    dif < (60 * 60), floor(dif / 60), IF(
                                        dif < (60 * 60 * 24), floor(dif / (60 * 60)), IF(
                                            dif < (60 * 60 * 24 * 7), floor(dif / (60 * 60 * 24)) , IF(
                                                dif < (60 * 60 * 24 * 365) , floor(dif / (60 * 60 * 24 * 7)), floor(dif / (60 * 60 * 24 * 365)))))));

        SET plural := cnt != 1;

        return CONCAT(IF(future, 'In ', ''), cnt, ' ',method, IF(plural, 's', '') , IF(future, ' From Now', ' ago'));
END$$
DELIMITER ;
