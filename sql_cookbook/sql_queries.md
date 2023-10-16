# Concatenating Column Values (PSQL)
You want to return values in multiple columns as one column.

```sql
select ename || ' WORKS AS ' || job  as Details from emp limit 5;
``` 

|         details          |
|--------------------------|
| SMITH WORKS AS CLERK     |
| ALLEN WORKS AS SALESMAN  |
| WARD WORKS AS SALESMAN   |
| JONES WORKS AS MANAGER   |
| MARTIN WORKS AS SALESMAN |


 # Using Conditional Logic in a SELECT Statement


```sql
SELECT ename,
       sal,
       ( CASE
           WHEN sal <= 2000 THEN 'Under Paid'
           WHEN sal > 2000 THEN 'Well Paid'
           ELSE 'OK'
         END ) AS status
FROM   emp; 
```


| ename  |   sal   |   status   |   
|--------|---------|------------|
| SMITH  |  800.00 | Under Paid |
| ALLEN  | 1600.00 | Under Paid |
| WARD   | 1250.00 | Under Paid |
| JONES  | 2975.00 | Well Paid  |
| MARTIN | 1250.00 | Under Paid |


# Limiting the Number of Rows Returned

```sql
select * from emp limit 1;
```

# Returning n Random Records from a Table
You want to modify the following statement such that successive executions will produce a different set of five rows


# Dealing with Nulls When Sorting
We would like to sort NULL values differently than non-NULL values, for example, you want to sort non-NULL values in ascending or descending order and all NULL values last.

```sql
SELECT empno, sal, comm 
from (SELECT empno, sal, comm, case when comm is null then 0 else 1 end as is_null from emp) X 
order by is_null desc, comm desc;
```


| empno |   sal   |  comm   |
|-------|---------|---------|
|  7654 | 1250.00 | 1400.00|
|  7521 | 1250.00 |  500.00|
|  7499 | 1600.00 |  300.00|
|  7844 | 1500.00 |    0.00|
|  7788 | 3000.00 |        |
|  7839 | 5000.00 |        |
|  7876 | 1100.00 |        |
|  7900 |  950.00 |        |
|  7902 | 3000.00 |        |
|  7369 |  800.00 |        |
|  7934 | 1300.00 |        |
|  7566 | 2975.00 |        |
|  7698 | 2850.00 |        |
|  7782 | 2450.00 |      |


# Sorting on a Data-Dependent Key
You want to sort based on some conditional logic. For example, if JOB is SALESMAN, you want to sort on COMM; otherwise, you want to sort by SAL. 

```sql
SELECT ename,sal,comm,job from emp 
order by 
case 
  when 
     job='SALESMAN' 
  then comm 
  else sal 
end;
```


| ename  |   sal   |  comm   |    job    |
|--------|---------|---------|-----------|
| TURNER | 1500.00 |    0.00 | SALESMAN  |
| ALLEN  | 1600.00 |  300.00 | SALESMAN  |
| WARD   | 1250.00 |  500.00 | SALESMAN  |
| SMITH  |  800.00 |         | CLERK     |
| JAMES  |  950.00 |         | CLERK     |
| ADAMS  | 1100.00 |         | CLERK     |
| MILLER | 1300.00 |         | CLERK     |
| MARTIN | 1250.00 | 1400.00 | SALESMAN  |
| CLARK  | 2450.00 |         | MANAGER   |
| BLAKE  | 2850.00 |         | MANAGER   |
| JONES  | 2975.00 |         | MANAGER   |
| SCOTT  | 3000.00 |         | ANALYST   |
| FORD   | 3000.00 |         | ANALYST   |
| KING   | 5000.00 |         | PRESIDENT | 


# Retrieving Rows from One Table That Do Not Correspond to Rows in Another

You want to find rows that are in one table that do not have a match in another table, for two tables that have common keys. For example, you want to find which departments have no employees.

```sql
SELECT d.* 
FROM 
  dept AS d 
  LEFT OUTER JOIN emp AS e ON (e.deptno = d.deptno) 
WHERE 
  e.deptno IS NULL
```

| deptno |   dname    |  loc   |
|--------|------------|--------|
|     40 | OPERATIONS | BOSTON|


# Adding Joins to a Query Without Interfering with Other Joins

You have a query that returns the results you want. You need additional information, but when trying to get it, you lose data from the original result set.For example, you want to return all employees, the location of the department in which they work, and the date they received a bonus.

```sql
select 
  e.ename, d.loc, eb.received 
from 
  emp as e 
  join dept as d on (e.deptno = d.deptno) 
  left join emp_bonus as eb on (e.empno = eb.empno) 
order by 2
```

 ename  |   loc    |  received  |
--------|----------|------------|
 JAMES  | CHICAGO  | 2005-03-14 |
 WARD   | CHICAGO  |            |
 TURNER | CHICAGO  |            |
 ALLEN  | CHICAGO  |            |
 MARTIN | CHICAGO  |            |
 BLAKE  | CHICAGO  |            |
 SMITH  | DALLAS   | 2005-03-14 |
 JONES  | DALLAS   |            |
 SCOTT  | DALLAS   | 2005-03-14 |
 ADAMS  | DALLAS   |            |
 FORD   | DALLAS   |            |
 CLARK  | NEW YORK |            |
 KING   | NEW YORK |            |
 MILLER | NEW YORK |            |
