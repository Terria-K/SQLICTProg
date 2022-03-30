DECLARE
    score NUMBER(5) := 75;
BEGIN
    IF (score >= 90 AND score <= 100) THEN
        DBMS_OUTPUT.PUT_LINE('Your grade is A');
    ELSIF (score >= 80 and score <= 89) THEN
        DBMS_OUTPUT.PUT_LINE('Your grade is B');
    ELSIF (score >= 70 and score <= 79) THEN
        DBMS_OUTPUT.PUT_LINE('Your grade is C');
    ELSIF (score >= 60 and score <= 69) THEN
        DBMS_OUTPUT.PUT_LINE('Your grade is D');
    ELSIF (score >= 50 and score <= 59) THEN
        DBMS_OUTPUT.PUT_LINE('Your grade is F');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid!');
    END IF;
END;