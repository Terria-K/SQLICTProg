SET SERVEROUTPUT ON;

DECLARE
    inputNumber NUMBER(3) := -1;
    inputNo NUMBER(3) := 0;

BEGIN
    IF (inputNumber >= inputNo) THEN
        DBMS_OUTPUT.PUT_LINE('Positive Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Negative Number');
    END IF;
END;