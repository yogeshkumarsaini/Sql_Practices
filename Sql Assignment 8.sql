
---------------------------------------------------ON SUBQUERY CASE1------------------------------------------------------------------

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

1.WAQTD NAME OF THE EMPLOYEES EARNING MORE THAN ADAMS
SQL> select ename
  2  from emp
  3  where sal> (Select sal
  4  from emp
  5  where ename='ADAMS');

ENAME
----------
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
FORD
MILLER

11 rows selected.

2.WAQTD NAME AND SALARY OF THE EMPLOYEES EARNING LESS THAN KING
SQL> Select ename, sal
  2  from emp
  3  where sal<(Select sal
  4  from emp
  5  where ename='KING');

ENAME             SAL
---------- ----------
SMITH             800
ALLEN            1600
WARD             1250
JONES            2975
MARTIN           1250
BLAKE            2850
CLARK            2450
SCOTT            3000
TURNER           1500
ADAMS            1100
JAMES             950
FORD             3000
MILLER           1300

13 rows selected.

3.WAQTD NAME AND DEPTNO OF THE EMPLOYEES IF THEY ARE WORKING IN THE SAME DEPT AS JONES
SQL> Select ename,deptno 
  2  from emp
  3  where deptno=(Select deptno
  4  from emp
  5  where ename='JONES');

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
SCOTT              20
ADAMS              20
FORD               20

4.WAQTD NAME AND JOB OF ALL THE EMPLOYEES WORKING IN THE SAME DESIGNATION AS JAMES
SQL> Select ename,job
  2  from emp
  3  where job=(Select job
  4  from emp
  5  where ename='JAMES');

ENAME      JOB
---------- ---------
SMITH      CLERK
ADAMS      CLERK
JAMES      CLERK
MILLER     CLERK

5.WAQTD EMPNO AND ENAME ALONG WITH ANNUAL SALARY OF ALL THE EMPLOYEES IF THEIR ANNUAL SALARY IS GREATER THAN WARD ANNUAL SALARY.
SQL> Select empno,ename,sal*12 Annual_Salary
  2  from emp
  3  where sal*12>(Select sal*12
  4  from emp
  5  where ename='WARD');

     EMPNO ENAME      ANNUAL_SALARY
---------- ---------- -------------
      7499 ALLEN              19200
      7566 JONES              35700
      7698 BLAKE              34200
      7782 CLARK              29400
      7788 SCOTT              36000
      7839 KING               60000
      7844 TURNER             18000
      7902 FORD               36000
      7934 MILLER             15600

9 rows selected.

6.WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED BEFORE SCOTT
SQL> Select ename, hiredate
  2  from emp
  3  where hiredate<(Select hiredate
  4  from emp
  5  where ename='SCOTT');

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
KING       17-NOV-81
TURNER     08-SEP-81
JAMES      03-DEC-81
FORD       03-DEC-81
MILLER     23-JAN-82

12 rows selected.

7.WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED AFTER THE PRESIDENT
SQL> Select ename,hiredate
  2  from emp
  3  where hiredate>(Select hiredate
  4  from emp
  5  where job='PRESIDENT');

ENAME      HIREDATE
---------- ---------
SCOTT      19-APR-87
ADAMS      23-MAY-87
JAMES      03-DEC-81
FORD       03-DEC-81
MILLER     23-JAN-82

8.WAQTD NAME AND SAL OF THE EMPLOYEE IF THEY ARE EARNING SAL LESS THAN THE EMPLOYEE WHOS EMPNO IS 7839
SQL> Select ename,sal 
  2  from emp
  3  where sal<(Select sal
  4  from emp
  5  where empno=7839);

ENAME             SAL
---------- ----------
SMITH             800
ALLEN            1600
WARD             1250
JONES            2975
MARTIN           1250
BLAKE            2850
CLARK            2450
SCOTT            3000
TURNER           1500
ADAMS            1100
JAMES             950
FORD             3000
MILLER           1300

13 rows selected.

9.WAQTD ALL THE DETAILS OF THE EMPLOYEES IF THE EMPLOYEES ARE HIRED BEFORE MILLER
SQL>  Select *
  2   from emp
  3   where hiredate<(Select hiredate
  4  from emp
  5  where ename='MILLER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

11 rows selected.

10.WAQTD ENAME AND EMPNO OF THE EMPLOYEES IF EMPLOYEES ARE EARNING MORE THAN ALLEN
SQL> Select ename,empno
  2  from emp
  3  where sal>(Select sal
  4  from emp
  5  where ename='ALLEN');

ENAME           EMPNO
---------- ----------
JONES            7566
BLAKE            7698
CLARK            7782
SCOTT            7788
KING             7839
FORD             7902

6 rows selected.

11.WAQTD ENAME AND SALARY OF ALL THE EMPLOYEES WHO ARE EARNING MORE THAN MILLER BUT LESS THAN ALLEN .
SQL> Select ename,sal
  2  from emp
  3  where sal>(Select sal from emp where ename='MILLER') 
  4  and sal<(Select sal from emp where ename='ALLEN');

ENAME             SAL
---------- ----------
TURNER           1500

12.WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING IN DEPT 20 AND WORKING IN THE SAME DESIGNATION AS SMITH
SQL>  Select *
  2   from emp
  3   where deptno=20 
  4   and job=(Select job from emp where ename='SMITH');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20


13.WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE SAME DEPT AS TURNER
SQL> Select *
  2  from emp
  3  where job='MANAGER'
  4  and deptno=(Select deptno from emp where ename='TURNER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30

14.WAQTD NAME AND HIREDATE OF THE EMPLOYEES HIRED AFTER 1980 AND BEFORE KING
SQL> Select ename,hiredate
  2  from emp
  3  where hiredate > '01-jan-80'
  4  and hiredate < (Select hiredate from emp where ename='KING');

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
TURNER     08-SEP-81

8 rows selected.

15.WAQTD NAME AND SAL ALONG WITH ANNUAL SAL FOR ALL EMPLOYEES WHOS SAL IS LESS THAN BLAKE AND MORE THAN 3500
SQL> Select ename,sal,sal*12 Annual_Salary
  2  from emp
  3  where sal>3500
  4  and sal<(Select sal from emp where ename='BLAKE');

no rows selected

16.WAQTD ALL THE DETAILS OF EMPLOYEES WHO EARN MORE THAN SCOTT BUT LESS THAN KING
SQL> Select *
  2  from emp
  3  where sal>(Select sal from emp where ename='SCOTT')
  4  and sal<(Select sal from emp where ename='KING');

no rows selected

17.WAQTD NAME OF THE EMPLOYEES WHOS NAME STARTS WITH 'A' AND WORKS IN THE SAME DEPT AS BLAKE
SQL> Select ename
  2  from emp
  3  where ename like 'A%' 
  4  and deptno=(Select deptno from emp where ename='BLAKE');

ENAME
----------
ALLEN

18.WAQTD NAME AND COMM IF EMPLOYEES EARN COMISSION AND WORK IN THE SAME DESIGNATION AS SMITH
SQL> Select ename,comm
  2  from emp
  3  where comm is not null
  4  and job=(Select job from emp where ename='SMITH');

no rows selected

19.WAQTD DETAILS OF ALL THE EMPLOYEES WORKING AS CLERK IN THE SAME DEPT AS TURNER .
SQL> Select *
  2  from emp
  3  where job='CLERK'
  4  and deptno = (Select deptno from emp where ename='TURNER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

20.WAQTD ENAME, SAL AND DESIGNATION OF THE EMPLOYEES WHOS ANNUAL SALARY IS MORE THAN SMITH AND LESS THAN KING.
SQL> Select ename,sal,job
  2  from emp
  3  where sal*12 > (Select sal*12 from emp where ename='SMITH')
  4  and sal*12 < (Select sal*12 from emp where ename='KING');

ENAME             SAL JOB
---------- ---------- ---------
ALLEN            1600 SALESMAN
WARD             1250 SALESMAN
JONES            2975 MANAGER
MARTIN           1250 SALESMAN
BLAKE            2850 MANAGER
CLARK            2450 MANAGER
SCOTT            3000 ANALYST
TURNER           1500 SALESMAN
ADAMS            1100 CLERK
JAMES             950 CLERK
FORD             3000 ANALYST
MILLER           1300 CLERK

12 rows selected.
