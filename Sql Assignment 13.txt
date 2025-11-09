
---------------------------------------------------ON INNER JOIN --------------------------------------------------------------------

SQL*Plus: Release 10.2.0.1.0 - Production on Thu Mar 23 12:07:24 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> Set pages 150 lines 150;
SQL> Select *
  2  from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL> Select *
  2  from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

1. NAME OF THE EMPLOYEE AND HIS LOCATION OF ALL THE EMPLOYEES.
SQL> Select ename,loc
  2  from emp,dept
  3  where emp.deptno=dept.deptno;

ENAME      LOC
---------- -------------
SMITH      DALLAS
ALLEN      CHICAGO
WARD       CHICAGO
JONES      DALLAS
MARTIN     CHICAGO
BLAKE      CHICAGO
CLARK      NEW YORK
SCOTT      DALLAS
KING       NEW YORK
TURNER     CHICAGO
ADAMS      DALLAS
JAMES      CHICAGO
FORD       DALLAS
MILLER     NEW YORK

14 rows selected.

2. WAQTD DNAME AND SALARY FOR ALL THE EMPLOYEE WORKING IN ACCOUNTING.
SQL> Select dname,sal
  2  from emp,dept
  3  where emp.deptno=dept.deptno and dname='ACCOUNTING';

DNAME                 SAL
-------------- ----------
ACCOUNTING           2450
ACCOUNTING           5000
ACCOUNTING           1300

3. WAQTD DNAME AND ANNUAL SALARY FOR ALLEMPLOYEES WHOS SALARY IS MORE THAN 2340
SQL> Select dname,sal*12 Annual_Salary
  2  from emp,dept
  3  where emp.deptno=dept.deptno and sal > 2340;

DNAME          ANNUAL_SALARY
-------------- -------------
RESEARCH               35700
SALES                  34200
ACCOUNTING             29400
RESEARCH               36000
ACCOUNTING             60000
RESEARCH               36000

6 rows selected.

4. WAQTD ENAME AND DNAME FOR EMPLOYEES HAVING CAHARACTER 'A' IN THEIR DNAME
SQL> Select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno and dname like '%A%';

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
SCOTT      RESEARCH
KING       ACCOUNTING
TURNER     SALES
ADAMS      RESEARCH
JAMES      SALES
FORD       RESEARCH
MILLER     ACCOUNTING

14 rows selected.

5. WAQTD ENAME AND DNAME FOR ALL THE EMPLOYEES WORKING AS SALESMAN
SQL> Select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno and job='SALESMAN';

ENAME      DNAME
---------- --------------
ALLEN      SALES
WARD       SALES
MARTIN     SALES
TURNER     SALES

6. WADTD DNAME AND JOB FOR ALL THE EMPLOYEES WHOS JOB AND DNAME STARTS WITH CHARACTER 'S'
SQL> Select dname,job
  2  from emp,dept
  3  where emp.deptno = dept.deptno and dname like 'S%' and job like 'S%';

DNAME          JOB
-------------- ---------
SALES          SALESMAN
SALES          SALESMAN
SALES          SALESMAN
SALES          SALESMAN

7. WAQTD DNAME AND MGR NO FOR EMPLOYEES REPORTING TO 7839
SQL> Select dname,mgr
  2  from emp,dept
  3  where emp.deptno=dept.deptno and mgr=7839;

DNAME                 MGR
-------------- ----------
RESEARCH             7839
SALES                7839
ACCOUNTING           7839

8. WAQTD DNAME AND HIREDATE FOR EMPLOYEES HIRED AFTER 83 INTO ACCOUNTING OR RESEARCH DEPT
SQL> Select dname,hiredate
  2  from emp,dept
  3  where emp.deptno=dept.deptno and hiredate > '1-jan-83' and dname in ('ACCOUNTING','RESEARCH');

DNAME          HIREDATE
-------------- ---------
RESEARCH       19-APR-87
RESEARCH       23-MAY-87

9. WAQTD ENAME AND DNAME OF THE EMPLOYEES WHO ARE GETTING COMM IN DEPT 10 OR 30
SQL> Select ename,dname
  2  from emp,dept
  3  where emp.deptno = dept.deptno and comm is not null and emp.deptno in (10,30);

ENAME      DNAME
---------- --------------
ALLEN      SALES
WARD       SALES
MARTIN     SALES
TURNER     SALES

10. WAQTD DNAME AND EMPNO FOR ALL THE EMPLOYEESWHO'S EMPNO ARE (7839,7902) AND ARE WORKING IN LOC NEW YORK
SQL> Select dname,empno
  2  from emp,dept
  3  where emp.deptno = dept.deptno and empno in (7839,7902) and loc = 'NEW YORK';

DNAME               EMPNO
-------------- ----------
ACCOUNTING           7839
