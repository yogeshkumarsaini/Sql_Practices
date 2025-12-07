
---------------------------------------------------ON HAVING CLAUSE------------------------------------------------------------------

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

1.WAQTD DNO AND NUMBER OF EMP WORKING IN EACH DEPT IF THERE ARE ATLEAST 2 CLERKS IN EACH DEPT
SQL> Select deptno,count(*) Number_Of_Employee
  2  from emp
  3  where job='CLERK'
  4  group by deptno
  5  having count(*)>=2;

    DEPTNO NUMBER_OF_EMPLOYEE
---------- ------------------
        20                  2

2.WAQTD DNO AND TOTAL SALARY NEEDED TO PAY ALL EMP IN EACH DEPT IF THERE ARE ATLEAST 4 EMP IN EACH DEPT
SQL> Select deptno,sum(sal) 
  2  from emp
  3  group by deptno
  4  having count(*)>=4;

    DEPTNO   SUM(SAL)
---------- ----------
        30       9400
        20      10875

3.WAQTD NUMBER OF EMP EARNING SAL MORE THAN 1200 IN EACH JOB AND THE TOTAL SAL NEEDED TO PAY EMP OF EACH JOB MUST EXCEES 3800
SQL> Select count(*), sum(sal) Total_Salary
  2  from emp
  3  group by job
  4  having sum(sal)>3800 and min(sal)>1200;

  COUNT(*) TOTAL_SALARY
---------- ------------
         4         5600
         1         5000
         3         8275
         2         6000

4.WAQTD DEPTNO AND NUMBER OF EMP WORKING ONLY IF THERE ARE 2 EMP WORKING IN EACH DEPT AS MANAGER .
SQL> Select deptno,count(*) NUMBER_OF_EMP
  2  from emp
  3  where job='MANAGER'
  4  group by deptno
  5  having count(*)=2;

no rows selected

5.WAQTD JOB AND MAX SAL OF EMP IN EACH JOB IF THE MAX SAL EXCEEDS 2600
SQL> Select job,max(sal)
  2  from emp
  3  group by job
  4  having max(sal)>2600;

JOB         MAX(SAL)
--------- ----------
PRESIDENT       5000
MANAGER         2975
ANALYST         3000

6.WAQTD THE SALARIES WHICH ARE REPEATED IN EMP TABLE
SQL> Select sal
  2  from emp
  3  group by sal
  4  having count(*)>=1;

       SAL
----------
      2450
      5000
      1300
      1250
      2850
      2975
      1100
      3000
       800
      1600
      1500
       950

12 rows selected.

7.WAQTD THE HIREDATE WHICH ARE DUPLICATED IN EMP TABLE
SQL> Select hiredate,count(*) Number_EMP
  2  from emp
  3  group by hiredate
  4  having count(*)>1;

HIREDATE  NUMBER_EMP
--------- ----------
03-DEC-81          2

8.WAQTD AVG SALARY OF EACH DEPT IF AVG SAL IS LESS THAN 3000
SQL> Select avg(sal)
  2  from emp
  3  group by deptno
  4  having avg(sal)<3000;

  AVG(SAL)
----------
1566.66667
      2175
2916.66667

9.WAQTD DEPTNO IF THERE ARE ATLEAST 3 EMP IN EACH DEPT WHOS NAME
HAS CHAR 'A' OR 'S'.
SQL> Select deptno
  2  from emp
  3  where ename like '%A%' or ename like '%S%'
  4  group by deptno
  5  having count(*)>=3;

    DEPTNO
----------
        30
        20

10.WAQTD MIN AND MAX SALARIES OF EACH JOB IF MIN SAL IS MORE THAN 1000 AND MAX SAL IS LESS THAN 5000
SQL> Select min(sal), max(sal)
  2  from emp
  3  group by job
  4  having min(sal)>1000 and max(sal)<5000;

  MIN(SAL)   MAX(SAL)
---------- ----------
      1250       1600
      2450       2975
      3000       3000
