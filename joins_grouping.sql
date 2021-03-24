/*
1. Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible for that customer’s orders. The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. The output should be sorted alphabetically by customer name.
*/

select c.`customerName`, e.`lastName`, e.`firstName`
from `customers` as c  join `employees` as e on c.`salesRepEmployeeNumber` = e.`employeeNumber`
order by c.`customerName`;

/*
2. Determine which products are most popular with our customers. For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product. The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. List the products by Total Sale descending.
*/

select p.`productName` as 'Product Name', sum(od.`quantityOrdered`) as 'Total # Ordered', sum(od.`quantityOrdered` * od.`priceEach`) as 'Total Sale'
from `customers` as c join `orders` as o on  c.`customerNumber` = o.`customerNumber`
join `orderdetails` as od on o.`orderNumber` = od.`orderNumber`
join `products` as p on p.`productCode` = od.`productCode`
group by 1
order by 3 desc;

/*
3. Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” and “# Orders”. Sort alphabetically by status.
*/

select o.status as 'Order Status', sum(od.`quantityOrdered`) as '# orders'
from `orders` as o join `orderdetails` as od on o.`orderNumber` = od.`orderNumber`
group by o.`status`
order by o.`status`;

/*
4. Write a query to list, for each product line, the total # of products sold from that product line. The first column should be “Product Line” and the second should be “# Sold”. Order by the second column descending.
*/

select p.`productLine` as 'Product Line', sum(od.`quantityOrdered`) as '# Sold'
from `products` as p join `orderdetails` as od on p.`productCode` = od.`productCode`
group by p.`productLine`
order by od.`quantityOrdered` desc;

/*
5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders. The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”. The second column should be titled “# Orders” and the third should be “Total Sales”. Sort the output by Total Sales descending. Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, and if the employee made no sales the Total Sales should display as “0.00”.
*/

select CONCAT(e.`firstName`,'  ', e.`lastName`) as 'Sales Rep', sum(od.`quantityOrdered`) as '# Orders', sum(od.`quantityOrdered` * od.`priceEach`) as 'Total Sales'
from `employees` as e left join `customers` as c on e.`employeeNumber` = c.`salesRepEmployeeNumber`
left join `orders` as o on c.`customerNumber` = o.`customerNumber`
left join `orderdetails` as od on od.`orderNumber` = o.`orderNumber`
where e.`jobTitle` = 'Sales Rep'
group by 1
order by 3  desc;

/*
6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month. The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. Values in the third column should be formatted as numbers with two decimals – for example: 694,292.68.
*/


select MONTHNAME(p.`paymentDate`) as Month, YEAR(p.`paymentDate`) as Year, FORMAT(p.`amount`, 2) as 'Payments Received'
from `payments` p
group by Month
ORDER BY FIELD(Month,'January','February','March','April', 'May', 'June', 'July','August', 'September', 'October', 'November','December');