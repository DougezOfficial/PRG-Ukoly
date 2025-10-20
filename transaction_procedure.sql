-- Active: 1760958514261@@127.0.0.1@3306@mysql
CREATE TABLE vehicle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    speed INT NOT NULL,
    horse_power INT NOT NULL
);
DELIMITER //

CREATE PROCEDURE insert_vehicle (
    IN p_model VARCHAR(50),
    IN p_speed INT,
    IN p_horse_power INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Chyba při vkládání záznamu' AS zprava;
    END;

    START TRANSACTION;
        INSERT INTO vehicle (model, speed, horse_power)
        VALUES (p_model, p_speed, p_horse_power);
    COMMIT;
END//

DELIMITER ;

CALL insert_vehicle('BMW X6', 250, 200);
/*Dotaz proběhl úspěšně*/


CALL insert_vehicle('Velorex', NULL, 16);
/*Dotaz vyhodil chybu a trensakce se přerušila kvůli NULL hodnotě namísto rychlosti
/*Chyba při vkládání záznamu*/