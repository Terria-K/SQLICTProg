SET SERVEROUTPUT ON;
DECLARE
    v_hire_date   EMPLOYEES.hire_date%TYPE;
    v_employee_id EMPLOYEES.employee_id%TYPE := 10;
BEGIN
    SELECT hire_date
    INTO v_hire_date
    FROM EMPLOYEES
    WHERE employee_id = v_employee_id;

    DBMS_OUTPUT.PUT_LINE('hire_date: ' || TO_CHAR(v_hire_date));
END;