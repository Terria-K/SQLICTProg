DECLARE
    message varchar(20) := 'Breaks at ';
    salary NUMBER := 0;
    type breakpoints IS VARRAY(5) OF INTEGER;
    breakat breakpoints;

BEGIN
    breakat := breakpoints(
        DBMS_RANDOM.VALUE(1, 30), 
        DBMS_RANDOM.VALUE(1, 30), 
        DBMS_RANDOM.VALUE(1, 30), 
        DBMS_RANDOM.VALUE(1, 30), 
        DBMS_RANDOM.VALUE(1, 30));
    << on_loop >>
    FOR i IN 1..30 LOOP
        IF (i = breakat(1) OR i = breakat(4)) THEN
            DBMS_OUTPUT.PUT_LINE(A => message || i);
            salary := salary + DBMS_RANDOM.VALUE(0, 500);
            salary := CEIL(salary);
        ELSIF (i = breakat(2) OR i = breakat(3)) THEN
            DBMS_OUTPUT.PUT_LINE(message || i);
            salary := salary - DBMS_RANDOM.VALUE(0, -300);
            salary := CEIL(salary);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nothing to Return');
        END IF;
    END LOOP on_loop;
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' || salary);
END;