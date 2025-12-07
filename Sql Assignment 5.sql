
------------------------------------------------------ ON MULTI ROW FUNCTION -------------------------------------------------------

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

1. WAQTD NUMBER OF EMPLOYEES GETTING SALARY LESS THAN 2000 IN DEPTNO 10.
SQL>  select count(*)
  2   from emp
  3   where sal>2000 and deptno=10;

  COUNT(*)
----------
         2

2. WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES WORKING AS CLERK
SQL> select sum(sal)
  2  from emp
  3  where job='CLERK';

 SUM(SAL)
---------
     4150

3. WAQTD AVERAGE SALARY NEEDED TO PAY ALL EMPLOYEES
SQL> select avg(sal)
  2  from emp;

  AVG(SAL)
----------
2073.21429

4. WAQTD NUMBER OF EMPLOYEES HAVING 'A' AS THEIR FIRST CHARACTER
SQL> select count(ename)
  2  from emp
  3  where ename like ('A%');

COUNT(ENAME)
------------
           2

5. WAQTD NUMBER OF EMPLOYEES WORKING AS CLERK OR MANAGER
SQL> select count(job)
  2  from emp
  3  where job='CLERK' or job='MANAGER';

COUNT(JOB)
----------
         7

6. WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES HIRED IN FEB
SQL> select sum(sal)
  2  from emp
  3  where hiredate like'%FEB%';

  SUM(SAL)
----------
      2850

7. WAQTD NUMBER OF EMPLOYEES REPORTING TO 7839 (MGR)
SQL> select count(ename)
  2  from emp
  3  where mgr=7839;

COUNT(ENAME)
------------
           3

8. WAQTD NUMBER OF EMPLOYEES GETTING COMISSION IN DEPTNO 30
SQL> select count(ename)
  2  from emp
  3  where comm is not null and deptno=30;

COUNT(ENAME)
------------
           4

9. WAQTD AVG SAL , TOTAL SAL , NUMBER OF EMPS AND MAXIMUM SALARY GIVEN TO EMPLOYEES WORKING AS PERSIDENT
SQL> Select avg(sal),sum(sal),count(ename),max(sal)
  2  from emp
  3  where job='PERSIDENT';

  AVG(SAL)   SUM(SAL) COUNT(ENAME)   MAX(SAL)
---------- ---------- ------------ ----------
                                 0

10. WAQTD NUMBER OF EMPLOYEES HAVING 'A' IN THEIR NAMES
SQL>  select count(ename)
  2   from emp
  3  where ename like '%A%';

COUNT(ENAME)
------------
           7

11. WAQTD NUMBER OF EMPS AND TOTAL SALARY NEEDED TO PAY THE EMPLOYEES WHO HAVE 2 CONSICUTIVE L's IN THEIR NAMES
SQL> Select count(ename),sum(sal)
  2  from emp
  3  where ename like '%LL%';

COUNT(ENAME)   SUM(SAL)
------------ ----------
           2       2900

12. WAQTD NUMBER OF DEPARTMENTS PRESENT IN EMPLOYEE TABLE
SQL> Select count(deptno)
  2  from emp;

COUNT(DEPTNO)
-------------
           14

13. WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'Z' IN THEIR NAMES
SQL> Select count(ename)
  2  from emp
  3  where ename like '%Z%';

COUNT(ENAME)
------------
           0

14. WAQTD NUMBER OF EMPLOYEES HAVING '$' IN THEIR NAMES
SQL> Select count(ename)
  2  from emp
  3  where ename like '%$%';

COUNT(ENAME)
------------
           0

15. WAQTD TOTAL SALARY GIVEN TO EMPLOYEES WORKING AS CLERK IN DEPT 30
SQL> Select sum(sal)
  2  from emp
  3  where job='CLERK' and deptno=30;

  SUM(SAL)
----------
       950

16. WAQTD MAXIMUM SALARY GIVEN TO THE EMPLOYEES WORKING AS ANALYST
SQL> Select max(Sal)
  2  from emp
  3  where job='ANALYST';

  MAX(SAL)
----------
      3000

17. WAQTD NUMBER OF DISTINCT SALARIES PRESENT IN EMPLOYEE TABLE
SQL> Select count(distinct sal)
  2  from emp;

COUNT(DISTINCTSAL)
------------------
                12

18. WAQTD NUMBER OF JOBS PRESENT IN EMPLOYEE TABLE
SQL> Select count(distinct job)
  2  from emp;

COUNT(DISTINCTJOB)
------------------
                 5

19. WATQD AVG SALARY GIVEN TO THE CLERK
SQL> Select avg(sal)
  2  from emp
  3  where job='CLERK';

  AVG(SAL)
----------
    1037.5

20. WAQTD MINIMUM SALARY GIVEN TO THE EMPLOYEES WHO WORK IN DEPT 10 AS MANAGER OR A CLERK
SQL> Select min(sal)
  2  from emp
  3  where deptno=10 and (job='CLERK' or job='MANAGER');

  MIN(SAL)
----------
      1300

