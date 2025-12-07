
----------------------------------------------------- ON OPERATOR --------------------------------------------------------------------

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

1. WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND EARNING LESS THAN 1500.
SQL> select *
  2  from emp
  3  where job='CLERK' and sal<1500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

2. WAQTD NAME AND HIREDATE OF THE EMPLOYEES WORKING AS MANAGER IN DEPT 30.
SQL> select ename,hiredate
  2  from emp
  3  where job='MANAGER' and deptno=30;

ENAME      HIREDATE
---------- ---------
BLAKE      01-MAY-81

3. WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF THEY ARE WORKING IN DEPT 30 AS SALESMAN AND THEIR ANNUAL SALARY HAS GREATER THAN 14000.

SQL> Select emp.*, sal*12 Annual_Salary
  2  from emp
  3  where deptno=30 and job='SALESMAN' and sal*12>14000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- -------------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         19200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         15000
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         15000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         18000

4. WAQTD ALL DETAILS OF THE EMP WORKING IN DEPT 30 OR AS ANALYST.
SQL> SELECT *
  2  from emp
  3  where deptno=30 or job='ANALYST';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

8 rows selected.

5. WAQTD NAMES OF THE EMPLOYEES WHOS SALARY IS LESS THA 1100 AND THEIR DESIGNATION IS CLERK.

SQL> Select ename
  2  from emp
  3  where sal<1100 and job='CLERK';

ENAME
----------
SMITH
JAMES

6. WAQTD NAME AND SAL,ANNUAL SAL AND DEPTNO IF DEPTNO IS 20 EARNING MORE THAN 1100 AND ANNUAL SALARY EXCEEDS 12000.
SQL> SELECT ename,sal,sal*12 Annual_Salary,deptno
  2  from emp
  3  where deptno=20 and sal>1100 and sal*12>12000;

ENAME             SAL ANNUAL_SALARY     DEPTNO
---------- ---------- ------------- ----------
JONES            2975         35700         20
SCOTT            3000         36000         20
FORD             3000         36000         20

7. WAQTD EMPNO AND NAMES OF THE EMPLOYEES WORKING AS MANAGER IN DEPT 20.
SQL> SELECT empno,ename
  2  from emp
  3  where job='MANAGER' and deptno=20;

     EMPNO ENAME
---------- ----------
      7566 JONES

8. WAQTD DETAILS OF THE EMPLOYEES WORKING IN DEPT 20 OR 30.
SQL> Select *
  2  from emp
  3  where deptno=20 or deptno=30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

11 rows selected.

9. WAQTD DETAILS OF THE EMPLOYEES WORKING AS ANALYST IN DEPT 10.

SQL> Select *
  2  from emp
  3  where job='ANALYST' and deptno=10;

no rows selected

10. WAQTD DETAILS OF EMPLOYEES WORKING AS PRESIDENT WITH SALARY OF RUPEES 4000.
SQL> Select*
  2  from emp
  3  where job='PRESIDENT' AND SAL=4000;

no rows selected

11. WAQTD NAMES AND DEPTNO, JOB OF THE EMPS WORKING AS CLERK IN DEPT 10 OR 20.
SQL> SELECT ename, deptno ,job
  2  from emp
  3  where job='CLERK' and (Deptno=10 or deptno=20);

ENAME          DEPTNO JOB
---------- ---------- ---------
SMITH              20 CLERK
ADAMS              20 CLERK
MILLER             10 CLERK

12. WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK OR MANAGER IN DEPT 10.
SQL> select *
  2  from emp
  3  where (job='CLERK' or job='MANAGER') and deptno=10;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

13. WAQTD NAMES OF EMPLOYEES WORKING IN DEPT 10,20,30,40.
SQL> SELECT ename
  2  from emp
  3  where deptno=10 or deptno=20 or deptno=30 or deptno=40;

ENAME
----------
SMITH
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
ADAMS
JAMES
FORD
MILLER

14 rows selected.

14. WAQTD DETAILS OF THE EMPLOYEES WITH EMPNO 7902,7839.

SQL> SELECT * 
  2  from emp
  3  where empno=7902 or empno=7839;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

15. WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER OR SALESMAN OR CLERK.
SQL> SELECT *
  2  from emp
  3  where job='MANAGER' or job='SALSMAN' or job='CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

7 rows selected.

16. WAQTD NAMES OF THE EMPLOYEES HIRED AFTER 81 AND BEFORE 87.
SQL> 
SQL> SELECT ename
  2  from emp
  3  where hiredate>'01-jan-81' and hiredate<'01-jan-87';

ENAME
----------
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
KING
TURNER
JAMES
FORD
MILLER

11 rows selected.

17. WAQTD DETAILS OF THE EMPLOYEES EARNING MORE THAN 1250 BUT LESS THAN 3000.
SQL> SELECT *
  2  from emp
  3  where sal>1250 and sal<3000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

6 rows selected.

18. WAQTD NAMES OF THE EMPLOYEES HIRED AFTER 81 INTO DEPTNO 10 OR 30.
SQL>  SELECT ename
  2   from emp
  3   where hiredate>'01-jan-81' and (deptno=10 or deptno=30);

ENAME
----------
ALLEN
WARD
MARTIN
BLAKE
CLARK
KING
TURNER
JAMES
MILLER

9 rows selected.

19. WAQTD NAMES OF THE EMPLOYEES ALONG WITH ANNUAL SALARY FOR THE EMPLOYEES WORKING AS MANAGER OR CLERK INTO DEPT 10 OR 30.
SQL> SELECT ename,sal*12 Annual_Salary
  2  from emp
  3  where (job='MANAGER' OR job='CLERK') AND (deptno=10 or deptno=30);

ENAME      ANNUAL_SALARY
---------- -------------
BLAKE              34200
CLARK              29400
JAMES              11400
MILLER             15600

20. WAQTD ALL THE DETAILS ALONG WITH ANNUAL SALARY IF SAL IS BETWEEN 1000 AND 4000 ANNUAL SALARY MORE THAN 1500.
SQL> SELECT emp.*,sal*12 Annual_Salary
  2  from emp
  3  where (sal>1000 and sal<4000) and sal*12>1500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- -------------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         19200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         15000
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         35700
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         15000
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         34200
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         29400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         36000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         18000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         13200
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         36000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         15600

11 rows selected.

 
