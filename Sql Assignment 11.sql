
---------------------------------------------------ON SUBQUERY MAX & MIN -------------------------------------------------------------

SQL*Plus: Release 10.2.0.1.0 - Production on Thu Mar 23 12:07:24 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options

SQL> Set pages 100 lines 100;
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

1. WAQTD NAME OF THE EMPLOYEE EARNING MAXIMUM SALARY
SQL> Select ename
  2  from emp
  3  where sal = (Select max(sal)
  4               from emp);

ENAME
----------
KING

2. WAQTD NAME OF THE EMPLOYEE EARNING MINIMUM SALARY

SQL> Select ename
  2  from emp
  3  where sal = (Select min(sal)
  4               from emp);

ENAME
----------
SMITH

3. WAQTD NAME AND HIREDATE OF THE EMPLOYEE HIRED BEFORE ALL THE EMPLOYEES (FIRST EMP)
SQL> Select ename,hiredate
  2  from emp
  3  where hiredate = (Select min(hiredate)
  4                    from emp);

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80

4. WAQTD NAME AND HIREDATE OF THE EMPLOYEES HIRED AT THE LAST
SQL> Select ename,hiredate
  2  from emp
  3  where hiredate = (Select max(hiredate)
  4                    from emp);

ENAME      HIREDATE
---------- ---------
ADAMS      23-MAY-87

5. WAQTD NAME, COMM OF THE EMPLOYEE WHO EARNS MIN COMISSION
SQL> Select ename,comm
  2  from emp
  3  where comm = (Select min(comm)
  4                from emp);

ENAME            COMM
---------- ----------
TURNER              0

6. WAQTD NAME, SAL AND COMM OF THE EMPLOYEE EARNING MAXIMUM COMISSION
SQL> Select ename,sal,comm
  2  from emp
  3  where comm = (Select max(comm)
  4                from emp);

ENAME             SAL       COMM
---------- ---------- ----------
MARTIN           1250       1400

7. WAQTD DETAILS OF THE EMPLOYEE WHO HAS GREATEST EMPNO
SQL> Select *
  2  from emp
  3  where empno= (Select max(empno)
  4                from emp);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

8. WAQTD DETAILS OF THE EMPLOYEES HAVING THE LEAST HIREDATE
SQL> Select *
  2  from emp
  3  where hiredate = (Select min(hiredate)
  4                    from emp);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20

9. WAQTD DETAILS OF THE EMPLOYEES EARNING LEAST ANNUAL SALARY
SQL> Select *
  2  from emp
  3  where sal*12 = (Select min(sal*12)
  4                  from emp);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20

10. WAQTD NAME , ANNUAL SALARY OF THE EMPLOYEES IF THEIR ANNUAL SALARY IS MORE THAN ALL THE SALESMAN
SQL> Select ename,sal*12 Annual_Salary
  2  from emp
  3  where sal*12 > all (Select sal*12
  4  			 from emp
  5  			 where job = 'SALESMAN');

ENAME      ANNUAL_SALARY
---------- -------------
JONES              35700
BLAKE              34200
CLARK              29400
SCOTT              36000
KING               60000
FORD               36000

6 rows selected.
