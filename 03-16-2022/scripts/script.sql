DECLARE
    v_fname VARCHAR2(20);

-- This is just a function without return value --
    PROCEDURE print_line(message VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(message);
    END;

BEGIN
    SELECT SUPPLIER_NAME
    INTO v_fname
    FROM SUPPLIERS
    WHERE SUPPLIER_ID = 400;
    print_line('The first name of the supplier is: ' || v_fname);
END;