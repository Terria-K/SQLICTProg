accept x NUMBER PROMPT 'Welcome to input                 Choose your cards                      [1] - Attack [2] - Heal [3] - Reset'

DECLARE
    EASY CONSTANT NUMBER := 1;
    NORMAL CONSTANT NUMBER := 1.5;
    HARD CONSTANT NUMBER := 2;
    winState CONSTANT NUMBER := 1;
    loseState CONSTANT NUMBER := 2;
    damage_input CONSTANT NUMBER := 1;
    heal_input CONSTANT NUMBER := 2;
    reset_input CONSTANT NUMBER := 3;

    input NUMBER := TO_NUMBER('&x');
    hp PLAYERDB.DP%TYPE;
    enemyHp PLAYERDB.DP%TYPE;
    damageTook NUMBER;
    healTook NUMBER;
    state NUMBER;
    currentRound NUMBER;

    -- Configuration --
    maxHP CONSTANT NUMBER := 100;
    maxDamage CONSTANT NUMBER := 50;
    minDamage CONSTANT NUMBER := 10;
    difficulty NUMBER := EASY;

    PROCEDURE updateAllDb(damage NUMBER, id NUMBER) IS
    BEGIN
        UPDATE PLAYERDB
        SET DP = damage
        WHERE ID = id;
    END;

    PROCEDURE printLine(inp VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(inp);
    END;

    FUNCTION randomize(minDamage NUMBER, maxDamage NUMBER)
    RETURN NUMBER IS
        rng NUMBER(8);
    BEGIN
        rng := CEIL(DBMS_RANDOM.VALUE(minDamage, maxDamage));
        RETURN rng;
    END;

    FUNCTION clamp(value NUMBER, minimum NUMBER, maximum NUMBER) 
    RETURN NUMBER IS
        someValue NUMBER(8);
    BEGIN
        someValue := value;
        IF (someValue < minimum) THEN 
            someValue := minimum;
        ELSIF (someValue > maximum) THEN
            someValue := maximum;
        END IF;
        RETURN someValue;
    END;

BEGIN
    SELECT DP INTO hp
    FROM PLAYERDB
    WHERE ID = 0;
    SELECT DP INTO enemyHp
    FROM PLAYERDB
    WHERE ID = 1;
    SELECT "Round" INTO currentRound
    FROM "PGame";

    printLine('Round: ' || currentRound);
    CASE currentRound
    WHEN 15 THEN
        IF (difficulty NOT LIKE HARD) THEN
            difficulty := NORMAL;
        END IF;
    WHEN 30 THEN
        difficulty := HARD;
    ELSE
        difficulty := difficulty;
    END CASE;

    CASE difficulty
    WHEN 1 THEN
        printLine('Difficulty: EASY');
    WHEN 1.5 THEN
        printLine('Difficulty: NORMAL');
    ELSE
        printLine('Difficulty: HARD');
    END CASE;
    
    printLine('-----------------------------------');

    CASE input
    WHEN damage_input THEN
        damageTook := randomize(minDamage, maxDamage);
        enemyHp := enemyHp - damageTook;
        printLine('Took ' || damageTook || ' to enemy!');
        UPDATE PLAYERDB
        SET DP = enemyHp
        WHERE ID = 1;
    WHEN heal_input THEN
        healTook := randomize(10, 70) * difficulty;
        hp := clamp(hp + healTook, 0, 100);
        UPDATE PLAYERDB
        SET DP = hp
        WHERE ID = 0;
        printLine('You healed with ' || healTook || 'hp');
        printLine('Your current hp: ' || hp);
    WHEN reset_input THEN
        updateAllDb(maxHP, 0);
        UPDATE "PGame"
        SET "Round" = 1;
        printLine('Battle Resetted!');
        RETURN;
    ELSE
        printLine('Wrong Input!');
    END CASE;

    printLine('-----------------------------------');
    IF (enemyHp < 1) THEN
        state := winState;
        printLine('You Win!');
    ELSE
        printLine('Enemy Turn!');

        damageTook := randomize(minDamage, maxDamage) * difficulty;
        hp := hp - damageTook;
        printLine('Took ' || damageTook || ' to player!');
        UPDATE PLAYERDB
        SET DP = hp
        WHERE ID = 0;
    END IF;
    printLine('-----------------------------------');

    IF (hp < 1) THEN
        state := loseState;
        printLine('You Lose!');
        UPDATE "PGame"
        SET "Round" = 1;
    END IF;

    IF (state = loseState OR state = winState) THEN
        updateAllDb(maxHP, 0);
        IF (state = winState) THEN
            currentRound := currentRound + 1;
            UPDATE "PGame"
            SET "Round" = currentRound;
        END IF;
    ELSE
        printLine('Current Player HP: ' || hp);
        printLine('Current Enemy HP: ' || enemyHp);
    END IF;
    
    printLine('-----------------------------------');
    printLine('Run the sql command again!');
END;