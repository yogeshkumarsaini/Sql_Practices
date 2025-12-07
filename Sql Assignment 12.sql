
---------------------------------------------------ON TYPES OF SUBQUERY -------------------------------------------------------------

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

1. WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE SALESMAN
SQL> Select ename
  2  from emp
  3  where sal > (Select max(sal)
  4               from emp
  5               where job = 'SALESMAN');

ENAME
----------
JONES
BLAKE
CLARK
SCOTT
KING
FORD

6 rows selected.

2. WAQTD DETAILS OF THE EMPLOYEES HIRED AFTER ALL THE CLERKS
SQL> Select *
  2  from emp
  3  where hiredate > (Select hiredate
  4                    from emp
  5                    where job = 'CLERKS');

no rows selected

3. WAQTD NAME AND SALARY FOR ALL THE EMPLOYEES IF THEY ARE EARNING LESS THAN ATLEST A MANAGER
SQL> Select ename,sal
  2  from emp
  3  where sal < (Select min(sal)
  4               from emp
  5               where job = 'MANAGER');

ENAME             SAL
---------- ----------
SMITH             800
ALLEN            1600
WARD             1250
MARTIN           1250
TURNER           1500
ADAMS            1100
JAMES             950
MILLER           1300

8 rows selected.

4. WAQTD NAME AND HIREDATE OF EMPLOYEES HIRED BEFORE ALL THE MANAGERS
SQL> Select ename,hiredate
  2  from emp
  3  where hiredate < (Select min(hiredate)
  4                   from emp
  5                   where job = 'MANAGER');

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81

5. WAQTD NAMES OF THE EMPLOYEES HIRED AFTER ALL THE MANAGERS AND EARNING SALARY MORE THAN ALL THE CLERKS
SQL> Select ename
  2  from emp
  3  where hiredate > (Select max(hiredate)
  4                    from emp
  5                    where job = 'MANAGER') and sal > (Select max(sal)
  6                                                      from emp
  7                                                      where job = 'CLERKS');

no rows selected

6. WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND HIRED BEFORE ATLEST A SALESMAN
SQL> Select *
  2  from emp
  3  where job = 'CLERKS' and hiredate < (Select min(hiredate)
  4                                       from emp
  5                                       where job = 'SALESMAN');

no rows selected

7. WAQTD DETAILS OF EMPLOYEES WORKING IN ACCOUNTING OR SALES DEPT
SQL> Select *
  2  from emp
  3  where job = 'ACCOUNTING' or deptno = (Select deptno
  4                                        from dept
  5                                        where dname = 'SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

6 rows selected.

8. WAQTD DEPARTMENT NAMES OF THE EMPOYEES WITH NAME SMITH , KING AND MILLER
SQL> Select dname
  2  from dept
  3  where deptno in (Select deptno
  4   		      from emp
  5  		      where ename in ('SMITH','KING','MILLER'));

DNAME
--------------
ACCOUNTING
RESEARCH

9. WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO
SQL> Select *
  2  from emp
  3  where deptno IN  (select deptno
  4    from dept
  5    where loc in ('NEW YORK','CHICAGO'));

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

9 rows selected.

10. WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 10
SQL> Select ename
  2  from emp
  3  where hiredate > (Select max(hiredate)
  4                    from emp
  5                    where deptno = 10);

ENAME
----------
SCOTT
ADAMS
