--Mengetahui Jumlah Customer
SELECT
	YEAR(order_date) as years,
	COUNT(DISTINCT(customer)) as number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY 1