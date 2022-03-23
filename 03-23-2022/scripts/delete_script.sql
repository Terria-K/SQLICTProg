SET SERVEROUTPUT ON;
DECLARE
    deptno EMPLOYEES.department_id%TYPE := 10;
BEGIN
    DELETE FROM EMPLOYEES
    WHERE department_id = deptno;
END;