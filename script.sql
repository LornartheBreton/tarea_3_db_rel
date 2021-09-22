--- Ejercicio 1
SELECT
	employee_id ,
	last_name,
	first_name,
	CAST(FLOOR((current_date-birth_date)/365.25) AS int) AS age
FROM employees e; 

--- Ejercicio 2
SELECT
	contact_title,
	COUNT(customer_id) AS number_in_category
FROM customers
	GROUP BY(contct_title);

--- Ejercicio 3
SELECT  
	o.customer_id,
	c.company_name, 
	MAX(o.order_date) AS latest_order_date
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id 
GROUP BY o.customer_id,c.company_name ;
--- Ejercicio 4
SELECT
	p.category_id,
	c.category_name,
	COUNT(p.product_id)
FROM products p 
JOIN categories c ON c.category_id = p.category_id 
	GROUP BY (p.category_id,c.category_name);

--- Ejercicio 5
SELECT 
	o.ship_country, 
	count(od.quantity) AS units 
FROM order_details od
JOIN orders o ON o.order_id  = od.order_id 
	GROUP BY(o.ship_country)
	ORDER BY(units) DESC LIMIT 1;

--- Ejercicio 8
SELECT DISTINCT 
	o.employee_id,
	e.first_name,
	e.last_name
FROM orders o
JOIN employees e ON o.employee_id = e.employee_id 
WHERE (date_part('month', o.shipped_date) = 12
		AND date_part('day',o.shipped_date)= 25);
	
--- Ejercicio 9
SELECT
	od.product_id,
	p.product_name
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON p.product_id  = od.product_id
	WHERE (date_part('month', o.shipped_date) = 12
		AND date_part('day',o.shipped_date)= 25);


--- Ejercicio 10
SELECT 
	ship_country,
	COUNT(order_id) AS orders
FROM orders o
	GROUP BY ship_country
	ORDER BY orders DESC
	LIMIT 1;

