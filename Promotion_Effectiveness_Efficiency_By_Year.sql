SELECT
	year(order_date) as years,
	sum(sales) as sales,
	sum(discount_value) as promotion_value,
	round(sum(discount_value)/sum(sales)*100,2) as burn_rate_percentage --Round() Berfungsi untuk pembulatan angka decimal
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY 1