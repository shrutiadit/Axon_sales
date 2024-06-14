use classicmodels;

 

# 1) Which category of vehicles have the maximum sales.
select count(od.productCode),p.productLine from orderdetails od
join products p
on p.productCode=od.productCode
join productlines pl
on pl.productLine=p.productLine
group by p.productLine
order by 1 desc;

# 2) calculate  number of orders sucessfully completed each year
SELECT YEAR(o.orderDate) years,
       COUNT(o.status) 'number of orders'
FROM orders as o
WHERE o.status = 'Shipped'
GROUP BY 1
order by 2 desc;

# 3) YearWise Productlines sales
select year(o.orderDate) as Years,
sum(case when p.productLine='Classic Cars' then  1 else 0 end) as ClassicCar_sales,
sum(case when p.productLine='Motorcycles' then  1 else 0 end) as Motorcycles_sales,
sum(case when p.productLine='Planes' then  1 else 0 end) as Planes_sales,
sum(case when p.productLine='Ships' then  1 else 0 end) as Ships_sales,
sum(case when p.productLine='Trains' then  1 else 0 end) as Trains_sales,
sum(case when p.productLine='Trucks and Buses' then  1 else 0 end) as Trucks_Buses_sales,
sum(case when p.productLine='Vintage Cars' then  1 else 0 end) as VintageCars_sales
from orders as o join orderdetails as ord
on o.orderNumber=ord.orderNumber
join products p on
p.productCode=ord.productCode
group by 1;



# 4) number of customers yearwise
SELECT YEAR(o.orderDate) years,
       COUNT(DISTINCT c.customerNumber) 'number of customers'
FROM customers c join orders o on
c.customerNumber=o.customerNumber
WHERE o.status = 'Shipped'
GROUP BY 1;




# 5) which month in the year 2004 generated the maximum revenue
select monthname(paymentDate) as month_name ,sum(amount) as max_revenue_2004
from payments
where year(paymentDate)='2004'
group by 1
order by 2 desc
limit 1;






