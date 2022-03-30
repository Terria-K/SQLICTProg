SET SERVEROUTPUT ON;
accept x NUMBER PROMPT 'Guess the Number!'

DECLARE
    magicNumber NUMBER(3) := TO_NUMBER('&x');

BEGIN

    IF (magicNumber = 143) THEN
        DBMS_OUTPUT.PUT_LINE('I Love YOU!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Wrong Guess!');
    END IF;
END;