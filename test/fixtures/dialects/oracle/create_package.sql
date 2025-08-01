CREATE PACKAGE IF NOT EXISTS emp_mgmt AS
   FUNCTION hire (last_name VARCHAR2, job_id VARCHAR2,
      manager_id NUMBER, salary NUMBER,
      commission_pct NUMBER, department_id NUMBER)
      RETURN NUMBER;
   FUNCTION create_dept(department_id NUMBER, location_id NUMBER)
      RETURN NUMBER;
   PROCEDURE remove_emp(employee_id NUMBER);
   PROCEDURE remove_dept(department_id NUMBER);
   PROCEDURE increase_sal(employee_id NUMBER, salary_incr NUMBER);
   PROCEDURE increase_comm(employee_id NUMBER, comm_incr NUMBER);
   no_comm EXCEPTION;
   no_sal EXCEPTION;
END emp_mgmt;
/

CREATE OR REPLACE PACKAGE BODY emp_mgmt AS
   tot_emps NUMBER;
   tot_depts NUMBER;
FUNCTION hire
   (last_name VARCHAR2, job_id VARCHAR2,
    manager_id NUMBER, salary NUMBER,
    commission_pct NUMBER, department_id NUMBER)
   RETURN NUMBER IS new_empno NUMBER;
BEGIN
   SELECT employees_seq.NEXTVAL
      INTO new_empno
      FROM DUAL;
   INSERT INTO employees
      VALUES (new_empno, 'First', 'Last','first.example@example.com',
              '(415)555-0100',
              TO_DATE('18-JUN-2002','DD-MON-YYYY'),
              'IT_PROG',90000000,00, 100,110);
      tot_emps := tot_emps + 1;
   RETURN(new_empno);
END;
FUNCTION create_dept(department_id NUMBER, location_id NUMBER)
   RETURN NUMBER IS
      new_deptno NUMBER;
   BEGIN
      SELECT departments_seq.NEXTVAL
         INTO new_deptno
         FROM dual;
      INSERT INTO departments
         VALUES (new_deptno, 'department name', 100, 1700);
      tot_depts := tot_depts + 1;
      RETURN(new_deptno);
   END;
PROCEDURE remove_emp (employee_id NUMBER) IS
   BEGIN
      DELETE FROM employees
      WHERE employees.employee_id = remove_emp.employee_id;
      tot_emps := tot_emps - 1;
   END;
PROCEDURE remove_dept(department_id NUMBER) IS
   BEGIN
      DELETE FROM departments
      WHERE departments.department_id = remove_dept.department_id;
      tot_depts := tot_depts - 1;
      SELECT COUNT(*) INTO tot_emps FROM employees;
   END;
PROCEDURE increase_sal(employee_id NUMBER, salary_incr NUMBER) IS
   curr_sal NUMBER;
   BEGIN
      SELECT salary INTO curr_sal FROM employees
      WHERE employees.employee_id = increase_sal.employee_id;
      IF curr_sal IS NULL
         THEN RAISE no_sal;
      ELSE
         UPDATE employees
         SET salary = salary + salary_incr
         WHERE employee_id = employee_id;
      END IF;
   END;
PROCEDURE increase_comm(employee_id NUMBER, comm_incr NUMBER) IS
   curr_comm NUMBER;
   BEGIN
      SELECT commission_pct
      INTO curr_comm
      FROM employees
      WHERE employees.employee_id = increase_comm.employee_id;
      IF curr_comm IS NULL
         THEN RAISE no_comm;
      ELSE
         UPDATE employees
         SET commission_pct = commission_pct + comm_incr;
      END IF;
   END;
END emp_mgmt;
/

-- Use of RESULT_CACHE keyword
CREATE OR REPLACE PACKAGE test_package IS

FUNCTION any_function_with_result_cache
RETURN VARCHAR2 RESULT_CACHE;

END test_package;
/

-- Use of POLYMORPHIC keyword
CREATE PACKAGE skip_col_pkg AS

  -- OVERLOAD 1: Skip by name --
  FUNCTION skip_col(tab TABLE,
                    col COLUMNS)
           RETURN TABLE PIPELINED ROW POLYMORPHIC USING skip_col_pkg;

  FUNCTION describe(tab IN OUT DBMS_TF.TABLE_T,
                    col        DBMS_TF.COLUMNS_T)
           RETURN DBMS_TF.DESCRIBE_T;

  -- OVERLOAD 2: Skip by type --
  FUNCTION skip_col(tab       TABLE,
                    type_name VARCHAR2,
                    flip      VARCHAR2 DEFAULT 'False')
           RETURN TABLE PIPELINED ROW POLYMORPHIC USING skip_col_pkg;

  FUNCTION describe(tab       IN OUT DBMS_TF.TABLE_T,
                    type_name        VARCHAR2,
                    flip             VARCHAR2 DEFAULT 'False')
           RETURN DBMS_TF.DESCRIBE_T;

END skip_col_pkg;
/

CREATE OR REPLACE PACKAGE BODY test_package IS

  FUNCTION test_function
  RETURN VARCHAR2 IS
    var_1 NUMBER := 0;
  BEGIN
    BEGIN
      SELECT 1 INTO var_1 FROM DUAL;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        var_1 := 0;
      WHEN OTHERS THEN
        logger.log_error('Unhandled Exception');
        RAISE;
    END;
  END test_function;

END test_package;
/
