SELECT 
	year(order_date) as years,
	product_sub_category,
	sum(sales) as sales
FROM dqlab_sales_store 
WHERE order_status = 'Order Finished' 
AND year(order_date) in ('2011','2012')
GROUP BY 1,2
ORDER BY 1,3 DESC