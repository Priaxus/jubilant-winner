# 8LE - SQL II
###### tags: `IM` `Week 8` `Lecture`

## Types of Join

### CROSS Join
All rows in table A joined to all rows in table B

### (INNER) Join
Select rows ONLY when the join condition is true

### LEFT (OUTER) Join
Select all rows in A with data from B if WHERE condition is true (otherwise data from B is null)

## Exercise
### Q1 - Display names and departments of all current contract staff
```sql
SELECT
    first_name, 
    last_name, 
    department 
FROM 
    employee 
WHERE 
    job_title='Contractor' 
    AND 
    leave_date IS NULL
;
```

Temporary way to create a temporary table with all current staff
```sql
SELECT
    *
INTO
    current_employee
FROM
    employee
WHERE
    leave_date IS NULL
```

### Q2 - Display names and job titles of all current contract staff
```sql
SELECT 
    first_name, 
    last_name, 
    job_title 
FROM 
    employee 
WHERE 
    job_title ~* '(Manager|Supervisor)' 
    AND 
    department ~* 'Manufacturing'
;
```

### Q3 - Obtain a list of all WIML departments ordered alphabetically with no duplicates. The column heading should be "WIML Departments"

```sql
SELECT DISTINCT 
    department AS "WIML Departments" 
FROM 
    employee
ORDER BY
    department ASC
;
```

### Q4 - Create a list of WIML departments in descending order by number of employees in each department

```sql
SELECT
    department, 
    COUNT(department) 
FROM
    employee
WHERE
    leave_date IS NULL
GROUP BY
    department 
ORDER BY
    COUNT(department) DESC
;
```

### Q5 - Create a 4 column report that displays the concatenation of `initial of first name` & `lastname`, `job title`, `dept` and `salary` for all staff earning over £80k. Ordered by dept and descending salary.

```sql
SELECT 
    CONCAT(LEFT(first_name,1),' ',last_name) AS "Name", 
    job_title, 
    department, 
    salary 
FROM 
    employee
WHERE
    salary > 80000 
ORDER BY 
    department, salary DESC
;
```

### Q6 - Display all staff that joined the company in 2021

```sql
SELECT 
    * 
FROM employee 
WHERE 
    join_date >= '01/01/2021' 
AND 
    leave_date IS NULL
;
```

Could also do:

```sql
WHERE EXTRACT (YEAR FROM join_date) = EXTRACT (YEAR FROM TIMESTAMP '2021-01-01')
```

### Q7 - Display the next five people (full name, department, job title, join date, bonus date) due to recieve their bonus for being with WIML for 5 years

```sql
SELECT 
    CONCAT(first_name,' ',last_name) AS "name",
    department, 
    job_title, 
    join_date, 
    CAST(join_date + INTERVAL '5 years' AS DATE) AS "bonus_date" 
FROM 
    employee
WHERE
    join_date >= CURRENT_DATE - INTERVAL '5 years'
ORDER BY 
    bonus_date ASC
LIMIT 
    5
;
```

### Q8 - Display the number of full time staff and the combined and average salaies for each dept
```sql
SELECT
    department,
    COUNT(department) AS "No. of staff",
    AVG(salary)::NUMERIC(10,2) AS "Avg. salary",
    SUM(salary)::NUMERIC(10,2) AS "Total salary"
FROM
    employee
GROUP BY
    department
ORDER BY
    SUM(salary) DESC
;
```

### Q9 - Calculate the proportion of the total salary paid to executives (excl. contractors)

```sql
SELECT
    (    
        SELECT
            SUM(salary)
        FROM employee 
        WHERE
            department = 'Executive'
            AND
            job_title <> 'Contractor'
            AND 
            leave_date IS NULL
    ) * 100.
    /
    SUM(salary) AS "Exec Salary Proportion"
    FROM
        employee
    WHERE
        job_title <> 'Contractor'
        AND 
        leave_date IS NULL
;
```

### Q10 - Display the max and min salaries for each job role in the org (excl. executives)

```sql
SELECT
    job_title,
    MAX(salary),
    MIN(salary)
FROM
    employee
WHERE
    department <> 'Executive'
GROUP BY
    job_title
ORDER BY
    job_title ASC
;
```

### Q11 - Determine the top 5 products sold (based on no. sold)

```sql
SELECT
    product_name,
    SUM(quantity)
FROM
    order_line
GROUP BY
    product_name
ORDER BY
    SUM(quantity) DESC
LIMIT
    5
;
```

### Q12 - Determine the top 5 products sold (based on revenue)

```sql
SELECT
    ordr.product_name, 
    SUM(ordr.quantity * pcat.cost)::NUMERIC(10,2) AS "Total Revenue"
FROM
    order_line ordr
    INNER JOIN
        productcatalogue pcat
            ON ordr.product_code = pcat.part_num
            
GROUP BY
    ordr.product_name
ORDER BY 
    SUM(ordr.quantity * pcat.cost) DESC
LIMIT
    5
;
```

### Q13 - Determine the top 3 customers (that have spent the most). Show the cust. name and total amount they've spent


```sql
SELECT 
    cust.customer_name, 
    SUM(ordr.quantity * pcat.cost)::NUMERIC(10,2) AS "Total Spent"
FROM
    customer cust
    
    INNER JOIN 
        customer_order cord
            ON cust.customer_code = cord.customer_id
            
    INNER JOIN
        order_line ordr
            ON cord.customer_order_ref = ordr.customer_order
            
    INNER JOIN
        productcatalogue pcat
            ON ordr.product_code = pcat.part_num
            
GROUP BY
    cust.customer_name
ORDER BY
    SUM(ordr.quantity * pcat.cost) DESC
LIMIT
    3
;
```

### Q14 - Calculate the total revenue from the past 6 months from the sale of all products. (starting from 6 months prior to the most recent order)


```sql
SELECT     
    SUM(x.order_sum)::NUMERIC(10,2) AS "Total Revenue (past 6 months)"
FROM
    (
        SELECT
            SUM(ordr.quantity * pcat.cost) AS order_sum
        FROM     
            customer_order cord
            INNER JOIN
                order_line ordr
                    ON cord.customer_order_ref = ordr.customer_order
            INNER JOIN
                productcatalogue pcat
                    ON ordr.product_code = pcat.part_num
        GROUP BY
            cord.order_date
        HAVING
            cord.order_date >= MAX(cord.order_date) - INTERVAL '6 months'
            
    ) x    
;
```