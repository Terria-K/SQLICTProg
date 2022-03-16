DECLARE
    v_my_name VARCHAR2(20) := 'Erik';

BEGIN
    DBMS_OUTPUT.PUT_LINE('My Name is ' || v_my_name);
-- Will overwrite the value of v_my_name for the next line.
    v_my_name := 'John';
    DBMS_OUTPUT.PUT_LINE('My Name is ' || v_my_name);
END;