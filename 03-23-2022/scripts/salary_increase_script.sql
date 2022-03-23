SET SERVEROUTPUT ON;
DECLARE
    sal_increase EMPLOYEES.salary%TYPE := 800;
BEGIN
    UPDATE EMPLOYEES
    SET salary = salary + sal_increase
    WHERE employee_name = 'Kenji';
END;