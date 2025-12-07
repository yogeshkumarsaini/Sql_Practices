
---------------------------------------------------ON SUBQUERY CASE2------------------------------------------------------------------

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


1.WAQTD DNAME OF THE EMPLOYEES WHOS NAME IS SMITH

SQL> Select dname
  2  from dept
  3  where deptno=(Select deptno
  4                from emp
  5                where ename='SMITH');

DNAME
--------------
RESEARCH

2.WAQTD DNAME AND LOC OF THE EMPLOYEE WHOS ENAME IS KING

SQL> Select dname,loc
  2  from dept
  3  where deptno = (Select deptno
  4                  from emp
  5                  where ename='KING');

DNAME          LOC
-------------- -------------
ACCOUNTING     NEW YORK

3.WAQTD LOC OF THE EMP WHOS EMPLOYEE NUMBER IS 7902
SQL> Select loc
  2  from dept
  3  where deptno=(Select deptno
  4                from emp
  5                where empno=7902);

LOC
-------------
DALLAS

4.WAQTD DNAME AND LOC ALONG WITH DEPTNO OF THE EMPLOYEE WHOS NAME ENDS WITH 'R'.
SQL>  Select dname,loc,deptno
  2   from dept
  3   where deptno in (Select deptno
  4                    from emp
  5                    where ename like '%R');

DNAME          LOC               DEPTNO
-------------- ------------- ----------
ACCOUNTING     NEW YORK              10
SALES          CHICAGO               30

5.WAQTD DNAME OF THE EMPLOYEE WHOS DESIGNATION IS PRESIDENT
SQL>  Select dname
  2   from dept
  3   where deptno = (Select deptno
  4                   from emp
  5                   where job='PRESIDENT');

DNAME
--------------
ACCOUNTING

6.WAQTD NAMES OF THE EMPLOYEES WORKING IN ACCOUNTING DEPARTMENT

SQL> Select ename
  2  from emp
  3  where deptno = (Select deptno
  4                  from dept
  5                  where dname='ACCOUNTING');

ENAME
----------
CLARK
KING
MILLER

7.WAQTD ENAME AND SALARIES OF THE EMPLOYEES WHO ARE WORKING IN THE LOCATION CHICAGO
SQL> Select ename,sal
  2  from emp
  3  where deptno = (Select deptno
  4                  from dept
  5                  where loc='CHICAGO');

ENAME             SAL
---------- ----------
ALLEN            1600
WARD             1250
MARTIN           1250
BLAKE            2850
TURNER           1500
JAMES             950

6 rows selected.

8.WAQTD DETAILS OF THE EMPLOYEES WORKING IN SALES
SQL> Select *
  2  from emp
  3  where deptno= (Select deptno
  4                 from dept
  5                 where dname='SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

6 rows selected.

9.WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF EMPLOYEES ARE WORKING IN NEW YORK
SQL> Select emp.*,sal*12 Annual_Salary
  2  from emp
  3  where deptno = (Select deptno
  4                  from dept
  5                  where loc='NEW YORK');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- -------------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         29400
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         60000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         15600

10.WAQTD NAMES OF EMPLOYEES WORKING IN OPERATIONS DEPARTMENT
SQL> Select ename
  2  from emp
  3  where deptno= (Select deptno
  4                 from dept
  5                 where dname='OPERATIONS');

no rows selected
