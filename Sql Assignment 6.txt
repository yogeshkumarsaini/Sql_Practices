
---------------------------------------------------ON GROUP CLAUSE--------------------------------------------------------------------

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

1. WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTEMENT EXCEPT PRESIDENT.
SQL> Select count(*)
  2  from emp
  3  where job != 'PRESIDENT'
  4  group by deptno;

  COUNT(*)
----------
         6
         5
         2

2. WAQTD TOTAL SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH JOB.
SQL> Select sum(sal)
  2  from emp
  3  group by job;

  SUM(SAL)
----------
      4150
      5600
      5000
      8275
      6000

3. WAQTD NUMBER OF EMPLOYEEES WORKING AS MANAGER IN EACH DEPARTMENT.
SQL> Select count(*)
  2  from emp
  3  where job='MANAGER'
  4  group by deptno;

  COUNT(*)
----------
         1
         1
         1

4. WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH DEPARTMENT EXCLUDING THE EMPLOYEES OF DEPTNO 20.
SQL>  Select avg(sal) avg_Salary
  2   from emp
  3   where deptno !=20
  4  group by deptno;

AVG_SALARY
----------
1566.66667
2916.66667

5. WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'A' IN THEIR NAMES IN EACH JOB.
SQL> Select count(ename) Number_Of_Employees
  2  from emp
  3  where ename like '%A%'
  4  group by job;

NUMBER_OF_EMPLOYEES
-------------------
                  3
                  2
                  2

6. WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES WHO SALARY IN GREATER THAN 2000 IN EACH DEPT.


SQL> Select count(ename) Number_Of_Employees, avg(sal) Avg_Salary
  2  from emp
  3  where sal>2000
  4  group by deptno;

NUMBER_OF_EMPLOYEES AVG_SALARY
------------------- ----------
                  1       2850
                  3 2991.66667
                  2       3725

7. WAQDTD TOTAL SALARY NEEDED TO PAY AND NUMBER OF SALESMANS IN EACH DEPT.
SQL> Select sum(sal) Total_Salary
  2  from emp
  3  where job='SALESMAN'
  4  group by deptno;

TOTAL_SALARY
------------
        5600

8. WAQTD NUMBER OF EMPLOYEES WITH THEIR MAXIMUM SALARIES IN EACH JOB.
SQL> Select count(*) Number_Of_Employees,max(sal) Maximum_Salary
  2  from emp
  3  group by job;

NUMBER_OF_EMPLOYEES MAXIMUM_SALARY
------------------- --------------
                  4           1300
                  4           1600
                  1           5000
                  3           2975
                  2           3000

9. WAQTD MAXIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.

SQL> Select max(sal) Maximum_Salary
  2  from emp
  3  group by deptno;

MAXIMUM_SALARY
--------------
          2850
          3000
          5000

10. WAQTD NUMBER OF TIMES THE SALARIES PRESENT IN EMPLOYEE TABLE

SQL> Select count(*) Salary_Count
  2  from emp
  3  group by sal;

SALARY_COUNT
------------
           1
           1
           1
           2
           1
           1
           1
           2
           1
           1
           1
           1

12 rows selected.


