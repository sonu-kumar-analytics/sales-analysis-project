use project;

select * from superstore;

-- Total sales and Profit 
select sum(sales) as sales, sum(profit) as profit
from superstore;

-- Sales by Region
select region, sum(sales) as sales
from superstore
group by region
order by sum(sales) desc;

-- Profit by Category
select category, sum(profit) as profit
from superstore
group by category
order by sum(profit) desc;

-- Top 10 Products
select product_name, sum(sales) as sales
from superstore
group by product_name
order by sum(sales) desc 
limit 10;

-- Loss Making Products
select product_name, sum(profit) as profit
from superstore
group by product_name
having sum(profit) < 0
order by sum(profit) desc;

-- Total Business Performance
select product_name,
sum(sales) sales,
sum(profit) profit,
round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by product_name
order by round(sum(profit)/sum(sales)*100,2) desc;

-- Region-wise Performance
select region, 
sum(sales) as sales,
sum(profit) as profit,
round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by region
order by round(sum(profit)/sum(sales)*100,2) desc;

-- Category-wise Performance
select category,
sum(sales) as sales,
sum(profit) as profit,
round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by category
order by round(sum(profit)/sum(sales)*100,2) desc;

-- Top 10 City
select city,
sum(sales) as sales,
sum(profit) as profit,
round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by city
order by round(sum(profit)/sum(sales)*100,2) desc;

-- Monthly Sales Trend
select 
date_format(str_to_date(order_date, '%m/%d/%y'), '%m %Y') as month,
sum(sales) as sales,
sum(profit) as profit,
round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by date_format(str_to_date(order_date, '%m/%d/%y'), '%m %Y')
order by date_format(str_to_date(order_date, '%m/%d/%y'), '%m %Y') desc;

-- High Sales but Low Profit Cities
select city,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore
group by city
having sum(sales) > 50000 and sum(profit) < 5000
order by total_sales desc;





