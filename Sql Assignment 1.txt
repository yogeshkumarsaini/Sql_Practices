 
SQL*Plus: Release 10.2.0.1.0 - Production on Tue Mar 21 14:12:52 2023

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

1. WAQTED NAME OF THE EMPLOYEE ALONG WITH THEIR ANNUAL SALARY.
SQL> Select ename,sal*12 Annual_Salary
  2  from emp;

ENAME      ANNUAL_SALARY
---------- -------------
SMITH               9600
ALLEN              19200
WARD               15000
JONES              35700
MARTIN             15000
BLAKE              34200
CLARK              29400
SCOTT              36000
KING               60000
TURNER             18000
ADAMS              13200
JAMES              11400
FORD               36000
MILLER             15600

14 rows selected.

2. WAQTD ENAME AND JOB FOR ALL THE EMPLOYEE WITH THEIR HALF TERM SALARY.
SQL> Select ename,job,sal*6 Half_Term_Salary
  2  from emp;

ENAME      JOB       HALF_TERM_SALARY
---------- --------- ----------------
SMITH      CLERK                 4800
ALLEN      SALESMAN              9600
WARD       SALESMAN              7500
JONES      MANAGER              17850
MARTIN     SALESMAN              7500
BLAKE      MANAGER              17100
CLARK      MANAGER              14700
SCOTT      ANALYST              18000
KING       PRESIDENT            30000
TURNER     SALESMAN              9000
ADAMS      CLERK                 6600
JAMES      CLERK                 5700
FORD       ANALYST              18000
MILLER     CLERK                 7800

14 rows selected.

3. WAQTD ALL THE DETAILS OF THE EMPLOYEES ALONG WITH AN ANNUAL BONUS OF 2000.
SQL> Select emp.*,sal*12+2000 Annual_Bonus
  2  from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_BONUS
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ------------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20        11600
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30        21200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30        17000
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20        37700
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30        17000
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30        36200
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10        31400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20        38000
      7839 KING       PRESIDENT            17-NOV-81       5000                    10        62000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30        20000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20        15200
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30        13400
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20        38000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10        17600

14 rows selected.

4. WAQTD NAME SALARY AND SALARY WITH A HIKE OF 10%. 
SQL> Select ename,sal,sal+sal*0.1 Hike_Salary
  2  from emp;

ENAME             SAL HIKE_SALARY
---------- ---------- -----------
SMITH             800         880
ALLEN            1600        1760
WARD             1250        1375
JONES            2975      3272.5
MARTIN           1250        1375
BLAKE            2850        3135
CLARK            2450        2695
SCOTT            3000        3300
KING             5000        5500
TURNER           1500        1650
ADAMS            1100        1210
JAMES             950        1045
FORD             3000        3300
MILLER           1300        1430

14 rows selected.

5. WAQTD NAME AND SALARY WITH DEDUCTION OF 25%.
SQL> Select ename,sal-sal*0.25 Deduction_Salary
  2  from emp;

ENAME      DEDUCTION_SALARY
---------- ----------------
SMITH                   600
ALLEN                  1200
WARD                  937.5
JONES               2231.25
MARTIN                937.5
BLAKE                2137.5
CLARK                1837.5
SCOTT                  2250
KING                   3750
TURNER                 1125
ADAMS                   825
JAMES                 712.5
FORD                   2250
MILLER                  975

14 rows selected.

6. WAQTD NAME AND SALARY WITH MONTHLY HIKE OF 50.
SQL> Select ename,sal+50 Monthly_Hike_Salary
  2  from emp;

ENAME      MONTHLY_HIKE_SALARY
---------- -------------------
SMITH                      850
ALLEN                     1650
WARD                      1300
JONES                     3025
MARTIN                    1300
BLAKE                     2900
CLARK                     2500
SCOTT                     3050
KING                      5050
TURNER                    1550
ADAMS                     1150
JAMES                     1000
FORD                      3050
MILLER                    1350

14 rows selected.

7. WAQTD NAME AND ANNUAL SALARY WITH DEDUCTION OF 10%.  
SQL> Select ename,sal*12-sal*12*0.1 Deduction_Salary
  2  from emp;

ENAME      DEDUCTION_SALARY
---------- ----------------
SMITH                  8640
ALLEN                 17280
WARD                  13500
JONES                 32130
MARTIN                13500
BLAKE                 30780
CLARK                 26460
SCOTT                 32400
KING                  54000
TURNER                16200
ADAMS                 11880
JAMES                 10260
FORD                  32400
MILLER                14040

14 rows selected.

8. WAQTD TOTAL SALARY GIVEN TO EACH EMPLOYEE(SAL+COMM).
SQL> Select sal+nvl(comm,0) Total_Salary
  2  from emp;

TOTAL_SALARY
------------
         800
        1900
        1750
        2975
        2650
        2850
        2450
        3000
        5000
        1500
        1100
         950
        3000
        1300

14 rows selected.

9. WAQTD DETAILS OF ALL THE EMPLOYEES ALONG WITH ANNUAL SALARY.
SQL> Select emp.*,sal*12 Annual_Salary
  2  from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO ANNUAL_SALARY
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- -------------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20          9600
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         19200
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         15000
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         35700
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         15000
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         34200
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         29400
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         36000
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         60000
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         18000
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         13200
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         11400
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         36000
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         15600

14 rows selected.

10. WAQTD NAME AND DESIGNATION ALONG WITH 100 PENALTY IN SALARY.
SQL> Select ename,job,sal-100 Penalty_Salary
  2  from emp;

ENAME      JOB       PENALTY_SALARY
---------- --------- --------------
SMITH      CLERK                700
ALLEN      SALESMAN            1500
WARD       SALESMAN            1150
JONES      MANAGER             2875
MARTIN     SALESMAN            1150
BLAKE      MANAGER             2750
CLARK      MANAGER             2350
SCOTT      ANALYST             2900
KING       PRESIDENT           4900
TURNER     SALESMAN            1400
ADAMS      CLERK               1000
JAMES      CLERK                850
FORD       ANALYST             2900
MILLER     CLERK               1200

14 rows selected.

