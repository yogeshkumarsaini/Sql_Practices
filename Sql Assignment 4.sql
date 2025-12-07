
---------------------------------------------------ON SPECIAL OPERATOR----------------------------------------------------------------

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

1) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL
SQL>  Select *
  2   from emp
  3   where comm is null;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

10 rows selected.
 
2) LIST ALL THE EMPLOYEES WHO DON’T HAVE A REPORTING MANAGER
SQL> Select ename
  2  from emp
  3  where 'MANAGER' is null;

no rows selected

3) LIST ALL THE SALESMEN IN DEPT 30

SQL> Select *
  2  from emp
  3  where deptno=30 and job like '%SALESMAN%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30


4) LIST ALL THE SALESMEN IN DEPT NUMBER 30 AND HAVING SALARY GREATER THAN 1500
SQL> Select ename
  2  from emp
  3  where job like '%SALESMAN%' and deptno=30 and sal>1500;

ENAME
----------
ALLEN

5) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘S’ OR ‘A’
SQL>  Select ename
  2   from emp
  3   where ename like 'S%' or ename like 'A%';

ENAME
----------
SMITH
ALLEN
SCOTT
ADAMS

6) LIST ALL THE EMPLOYEES EXCEPT THOSE WHO ARE WORKING IN DEPT 10 & 20.
SQL> Select ename
  2  from emp
  3  where deptno in (10,20);

ENAME
----------
SMITH
JONES
CLARK
SCOTT
KING
ADAMS
FORD
MILLER

8 rows selected.

7) LIST THE EMPLOYEES WHOSE NAME DOES NOT START WITH ‘S’
SQL> Select ename
  2  from emp
  3  where ename not like 'S%';

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
ADAMS
JAMES
FORD
MILLER

12 rows selected.

8) LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10
SQL> Select ename
  2  from emp
  3  where 'MANAGER' is not null and deptno=10;

ENAME
----------
CLARK
KING
MILLER

9) LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL AND WORKING AS CLERK
SQL> Select ename
  2  from emp
  3  where comm is null and job like '%CLERK%';

ENAME
----------
SMITH
ADAMS
JAMES
MILLER

10) LIST ALL THE EMPLOYEES WHO DON’T HAVE AREPORTING MANAGER IN DEPTNO 10 OR 30
SQL> Select ename
  2  from emp
  3  where 'MANAGER' is null and deptno in (10,30);

no rows selected

11) LIST ALL THE SALESMEN IN DEPT 30 WITH SAL MORE THAN 2450
SQL> Select ename
  2  from emp
  3  where job like '%SALESMAN%' and deptno=30 and sal>2450;

no rows selected

12) LIST ALL THE ANALYST IN DEPT NUMBER 20 AND HAVING SALARY GREATER THAN 2500
SQL> Select *
  2  from emp
  3  where job like '%ANALYST%' and deptno=20 and sal>2500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

13) LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH ‘M’ OR ‘J’
SQL> Select ename
  2  from emp
  3  where ename like 'M%' or ename like 'J%';

ENAME
----------
JONES
MARTIN
JAMES
MILLER

14) LIST ALL THE EMPLOYEES WITH ANNUAL SALARY EXCEPT THOSE WHO ARE WORKING IN DEPT 30
SQL> Select emp.*, sal*12 Annual_Salary 
  2  from emp
  3  where deptno not in 30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- -------------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20          9600
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         35700
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         29400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         36000
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         60000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         13200
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         36000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         15600

8 rows selected.

15) LIST THE EMPLOYEES WHOSE NAME DOES NOT END WITH ‘ES’ OR ‘R’
SQL> Select ename
  2  from emp
  3  where ename not like '%ES' or ename not like '%R';

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

16)LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10 ALONG WITH 10% HIKE IN SALARY
SQL> Select ename, sal*1.1 Hike_Salary
  2  from emp
  3  where 'MANAGER' is null and deptno=10;

no rows selected

17) DISPLAY ALL THE EMPLOYEE WHO ARE ‘SALESMAN’S HAVING ‘E’ AS THE LAST BUT ONE CHARACTER IN ENAME BUT SALARY HAVING EXACTLY 4 CHARACTER
SQL>  Select *
  2   from emp
  3   where job like '%SALESMAN%' and ename like '_E_' and sal between 1000 and 9999;

no rows selected

18) DISPLAY ALL THE EMPLOYEE WHO ARE JOINED AFTER YEAR 81
SQL> Select *
  2  from emp
  3  where hiredate > '31-dec-81';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

19) DISPLAY ALL THE EMPLOYEE WHO ARE JOINED IN FEB
SQL> Select *
  2  from emp
  3  where hiredate like '%FEB%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30

20) LIST THE EMPLOYEES WHO ARE NOT WORKING AS MANAGERS AND CLERKS IN DEPT 10 AND 20 WITH A SALARY IN THE RANGE OF 1000 TO 3000.
SQL>  Select *
  2   from emp
  3   where job not in ('CLERK','MANAGER') and deptno in (10,20) and sal between 1000 and 3000;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
