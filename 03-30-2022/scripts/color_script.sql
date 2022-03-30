DECLARE
    color CHAR(1) := 'r';
BEGIN
    IF (color = 'r' OR color = 'R') THEN
        DBMS_OUTPUT.PUT_LINE('Color is Red');
    ELSIF (color = 'g' OR color = 'G') THEN
        DBMS_OUTPUT.PUT_LINE('Color is Green');
    ELSIF (color = 'b' OR color = 'B') THEN
        DBMS_OUTPUT.PUT_LINE('Color is Blue');
    ELSIF (color = 'a' OR color = 'A') THEN
        DBMS_OUTPUT.PUT_LINE('Color is Red');
    END IF;
END;