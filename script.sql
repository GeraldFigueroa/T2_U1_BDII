
-- Ejercicio 1

DECLARE
    nombre VARCHAR2(50) := 'gerald';
    apellido1 VARCHAR2(50) := 'figueroa';
    apellido2 VARCHAR2(50) := 'gomez';
BEGIN

    DBMS_OUTPUT.PUT_LINE(
        UPPER(SUBSTR(nombre, 1, 1)) || '.' ||
        UPPER(SUBSTR(apellido1, 1, 1)) || '.' ||
        UPPER(SUBSTR(apellido2, 1, 1))
    );    
    
END;



-- Ejercicio 2

DECLARE 
    num NUMBER;
BEGIN

    SELECT CEIL( DBMS_RANDOM.VALUE(1,1000)) INTO num FROM dual; -- Se genera el número y se almacena en num
    
    IF MOD(num,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' -> Es Par');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' -> Es Impar');
    END IF;

END;



-- Ejercicio 3

DECLARE
    id_departamento DEPARTMENTS.DEPARTMENT_ID%TYPE := 100;
    salario_maximo JOBS.MAX_SALARY%TYPE;
BEGIN

    SELECT 
        MAX(max_salary) INTO salario_maximo
    FROM 
        jobs
    INNER JOIN employees 
        ON jobs.job_id = employees.job_id
    WHERE 
        employees.department_id = id_departamento;

    DBMS_OUTPUT.PUT_LINE(
        'El salario màximo del departamento ' || 
        id_departamento ||
        ' es: ' || salario_maximo
    );
END;



-- Ejercicio 4

DECLARE
    id_departamento DEPARTMENTS.DEPARTMENT_ID%TYPE := 10;
    nombre_departamento DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    n_empleados NUMBER;
BEGIN

    -- nombre del departamento
    SELECT department_name INTO nombre_departamento FROM departments WHERE department_id = id_departamento;
    
    -- nùmero de empleados
    SELECT 
        COUNT(department_id) INTO n_empleados
    FROM 
        employees
    WHERE 
        department_id = id_departamento
    GROUP BY
        department_id;
    
    DBMS_OUTPUT.PUT_LINE(
        'El departamento ' || nombre_departamento || ' tiene ' ||
        n_empleados || ' empleados'
    );
END;



-- Ejercicio 5

DECLARE
    salario_maximo EMPLOYEES.SALARY%TYPE;
    salario_minimo EMPLOYEES.SALARY%TYPE;
    diferencia EMPLOYEES.SALARY%TYPE;
BEGIN

    -- Salario Màximo
    SELECT MAX(salary) INTO salario_maximo FROM employees;
    DBMS_OUTPUT.PUT_LINE(
        'Salario Máximo: ' || salario_maximo
    );
    -- Salario Mìnimo
    SELECT MIN(salary) INTO salario_minimo FROM employees;
    DBMS_OUTPUT.PUT_LINE(
        'Salario Mínimo: ' || salario_minimo
    );
    
    diferencia := salario_maximo - salario_minimo;
    
    DBMS_OUTPUT.PUT_LINE(
        'La diferencia es de: ' || diferencia
    );
    
END;
