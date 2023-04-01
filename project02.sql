---Inspecting Data with microsoft SQL server by Khaja Arsalaan

Select * from PortfolioProject03..sales_data_sample;

--Checking unique values
select distinct status from PortfolioProject03..sales_data_sample; --Nice one to plot
select distinct year_id from PortfolioProject03..sales_data_sample;
select distinct PRODUCTLINE from PortfolioProject03..sales_data_sample; ---Nice to plot
select distinct COUNTRY from PortfolioProject03..sales_data_sample; ---Nice to plot
select distinct DEALSIZE from PortfolioProject03..sales_data_sample; ---Nice to plot
select distinct TERRITORY from PortfolioProject03..sales_data_sample; ---Nice to plot

		/*ANALYSIS */

-- Let's start by grouping sales by productline
-- Sales By Product line
Select PRODUCTLINE, round(sum(sales),2) Revenue
From PortfolioProject03..sales_data_sample
Group by PRODUCTLINE
Order by 2 desc;

-- Sales by YEAR
Select YEAR_ID, round(sum(sales),2) Revenue
From PortfolioProject03..sales_data_sample
Group by YEAR_ID
Order by 2 desc;
-- Insights!!! In 2005 they operated for only 5 months that was the reason why the sales were low in 2005.
Select distinct month_id from PortfolioProject03..sales_data_sample where  YEAR_ID= 2005; 

-- Sales by Deal Size
Select DEALSIZE, round(sum(sales),2) Revenue
From PortfolioProject03..sales_data_sample
Group by DEALSIZE
Order by 2 desc;

-- What was the best month for sales in a specific year? How much was earned that month? 
select distinct(MONTH_ID), round(sum(sales),2) as Revenue, count(ordernumber) Total_orders From PortfolioProject03..sales_data_sample
where YEAR_ID = 2003 group by MONTH_ID Order by 2 desc; -- Looks like November is the highest order month

Select distinct(MONTH_ID), round(sum(sales),2) as Revenue, count(ordernumber) Total_orders From PortfolioProject03..sales_data_sample
where YEAR_ID = 2004 group by MONTH_ID Order by 2 desc; -- Looks like November is the highest order month	

-- November is the month with higest orders, let's check what products are sold in november
Select productline, round(sum(sales),2) as revenue, year_id  from PortfolioProject03..sales_data_sample 
where MONTH_ID = 11 and year_id = 2003 group by productline, YEAR_ID order by 2 desc; --change year to see the revenue for other years

--What city has the highest number of sales in a specific country
select city, sum (sales) Revenue
from PortfolioProject03..sales_data_sample 
where country = 'UK'
group by city
order by 2 desc

---What is the best product in United States?
select country, YEAR_ID, PRODUCTLINE,round(sum(sales),2) Revenue
from PortfolioProject03..sales_data_sample 
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc
