SELECT
	year(order_date) as years,
	product_sub_category,
	product_category,
	sum(sales) as sales,
	sum(discount_value) as promotion_value,
	round(sum(discount_value)/sum(sales)*100,2) as burn_rate_percentage
FROM
	dqlab_sales_store
WHERE 
	order_status = 'Order Finished' AND year(order_date) = 2012
GROUP BY 1,2,3
ORDER BY 4 DESC