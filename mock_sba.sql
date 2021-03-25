/*
1. Create a query to return all orders made by users with the first name of “Marion”
*/
select * from `ORDERS` where `USER_ID` = 3;

/*
2. Create a query to select all users that have not made an order
*/
select * from `USERS` as u  left join `ORDERS` as o on u.`USER_ID` = o.`USER_ID` where o.`ORDER_ID` is null;

/*
3. Create a Query to select the names and prices of all items that have been part of 2 or more separate orders.
*/
select i.`NAME`, TRIM(trailing '.' from TRIM(trailing 0 from i.`PRICE`)) as PRICE from `ITEMS` as i join `ORDER_ITEMS` as ot on i.`ITEM_ID` = ot.`ITEM_ID` group by 1;

/*
4. Create a query to return the Order Id, Item name, Item Price, and Quantity from orders made at stores in the city “New York”. Order by Order Id in ascending order.
*/
select ot.`ORDER_ID`, i.`NAME`, TRIM(trailing '.' from TRIM(trailing 0 from i.`PRICE`)) as PRICE, ot.`QUANTITY`
from `ORDER_ITEMS` as ot join `ITEMS` as i on ot.`ITEM_ID` = i.`ITEM_ID`
join `ORDERS` as o on o.`ORDER_ID` = ot.`ORDER_ID`
join `STORES` as s on s.`STORE_ID` = o.`STORE_ID`
where s.`CITY` = 'New York'
order by 1;

/*
5. Your boss would like you to create a query that calculates the total revenue generated by each item. Revenue for an item can be found as (Item Price * Total Quantity Ordered). Please return the first column as ‘ITEM_NAME’ and the second column as ‘REVENUE’.
*/
select i.`NAME`, SUM(i.`PRICE`* ot.`QUANTITY`) as REVENUE
from `ITEMS` as i join `ORDER_ITEMS` as ot on i.`ITEM_ID` = ot.`ITEM_ID`
group by 1
order by 2 desc;

/*
6. Create a query with the following output:
a. Column 1 - Store Name
i. The name of each store
b. Column 2 - Order Quantity
i. The number of times an order has been made in this store
c. Column 3 - Sales Figure
i. If the store has been involved in more than 3 orders, mark as ‘High’
ii. If the store has been involved in less than 3 orders but more than 1 order, mark as ‘Medium’
iii. If the store has been involved with 1 or less orders, mark as ‘Low’
d. Should be ordered by the Order Quantity in Descending Order
*/
select s.`NAME` as NAME, count(o.`STORE_ID`) as ORDER_QUANTITY,
IF(count(o.`STORE_ID`)<=1, 'Low', IF(count(o.`STORE_ID`)>1  and count(o.`STORE_ID`) <=3, 'Medium', 'High')) as SALES_FIGURE
from `STORES` as s join `ORDERS` as o on s.`STORE_ID` = o.`STORE_ID`
group by 1
order by 2 desc;