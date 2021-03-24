/*
1. For each product, show the product name "Product" and the product type name "Type".
*/
select p.`name` as Product, pt.`name` as Type
from `product` as p join `product_type` as pt on p.`product_type_cd` = pt.`product_type_cd`;

/*
2. For each branch, list the branch name and city, plus last name and title of each employee who works in that branch.
*/
select b.`name` as 'Branch Name', b.`city` as City, e.`last_name` as 'Employee Name', e.`title` as Title
from `branch` as b join `employee` as e on b.`branch_id` = e.`assigned_branch_id`;

/*
3. Show a list of each unique employee title.
*/
select distinct `title`
from `employee`;

/*
4. Show the last name and title of each employee, along with the last name and title of that employee's boss.
*/
select e.`last_name` as 'Employee Name', e.`title` as Title, em.`last_name` as 'Boss Name', em.`title` as Title
from `employee` as e join `employee` as em on e.`superior_emp_id` = em.`emp_id`;

/*
5. For each account, show the name of the account's product, the available balance, and the customer's last name.
*/

select p.`name` as 'Account', FORMAT(a.`avail_balance`, 2) as 'Avaiable Balance', i.`last_name` as 'Last Name'
from `account` as a join `product` as p on a.`product_cd` = p.`product_cd`
join `customer` as c on a.`cust_id` = c.`cust_id`
join `individual` as i on i.`cust_id` = c.`cust_id`;

/*
6. List all account transaction details for individual customers whose last name starts with 'T'.
*/
