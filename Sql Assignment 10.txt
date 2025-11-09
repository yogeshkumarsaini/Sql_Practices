
---------------------------------------------------ON SUBQUERY CASE 1 & CASE 2 ------------------------------------------------------

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

1. WAQTD NAMES OF THE EMPLOYEES EARNING MORE THAN SCOTT IN ACCOUNTING DEPT
SQL> Select ename
  2  from emp
  3  where sal > (Select sal
  4               from emp
  5               where ename = 'SCOTT') and
  6               deptno=(Select deptno
  7               from dept
  8               where dname='ACCOUNTING');

ENAME
----------
KING

2. WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE LOCATION CHICAGO
SQL>  Select *
  2   from emp
  3   where job = 'MANAGER' and deptno = (Select deptno
  4                                       from dept
  5                                       where loc = 'CHICAGO');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30

3. WAQTD NAME AND SAL OF THE EMPLOYEES EARNING MORE THAN KING IN THE DEPT ACCOUNTING
SQL> Select ename,sal
  2  from emp
  3  where sal > (Select sal
  4               from emp
  5               where ename='KING') and deptno=(Select deptno
  6                                               from dept
  7                                               where dname='ACCOUNTING');

no rows selected

4. WAQTD DETAILS OF THE EMPLOYEES WORKING AS SALESMAN IN THE DEPARTEMENT SALES
SQL> Select *
  2  from emp
  3  where job = 'SALESMAN' and deptno=(Select deptno
  4                                     from dept
  5                                     where dname='SALES');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

5. WAQTD NAME , SAL , JOB , HIREDATE OF THE EMPLOYEES WORKING IN OPERATIONS DEPARTMENT AND HIRED BEFORE KING
SQL>  Select ename,sal,job,hiredate
  2   from emp
  3   where deptno = (Select deptno
  4                   from dept
  5                   where dname='OPERATIONS') and hiredate < (Select hiredate
  6                                                             from emp
  7                                                             where ename='KING');

no rows selected

6. DISPLAY ALL THE EMPLOYEES WHOSE DEPARTMET NAMES ENDING 'S'.
SQL> Select *
  2  from emp
  3  where deptno = (Select deptno
  4                  from dept
  5                  where dname like 'S%');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

6 rows selected.

7. WAQTD DNAME OF THE EMPLOYEES WHOS NAMES HAS CHARACTER 'A' IN IT.
SQL> Select dname
  2  from dept
  3  where deptno in (Select deptno
  4                   from emp
  5                   where ename like '%A%');

DNAME
--------------
ACCOUNTING
RESEARCH
SALES

8. WAQTD DNAME AND LOC OF THE EMPLOYEES WHOS SALARY IS RUPEES 800.
SQL> Select dname,loc
  2  from dept
  3  where deptno = (Select deptno
  4                  from emp
  5                  where sal = 800);

DNAME          LOC
-------------- -------------
RESEARCH       DALLAS

9. WAQTD DNAME OF THE EMPLOYEES WHO EARN COMISSION
SQL>  Select dname
  2   from dept
  3   where deptno in (Select deptno
  4   from emp
  5   where comm is not null);

DNAME
--------------
SALES

10. WAQTD LOC OF THE EMPLOYEES IF THEY EARN COMISSION IN DEPT 40
SQL>  Select loc
  2   from dept
  3   where deptno in (Select deptno
  4   		       from emp
  5	         	where comm is not null) and deptno=40;

no rows selected


