SELECT
	left(order_date,4) as years,
	sum(sales) as sales,
	count(order_status) as number_of_order
FROM dqlab_sales_store 
WHERE order_status = 'Order Finished' 
GROUP BY years
