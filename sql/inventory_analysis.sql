-- Inventory distribution by warehouse
SELECT 
    w.warehouseCode,
    w.warehouseName,
    COUNT(p.productCode) AS total_products,
    SUM(p.quantityInStock) AS total_units
FROM
    mintclassics.warehouses w
        JOIN
    mintclassics.products p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode , w.warehouseName
ORDER BY total_units ASC;

-- Inventory vs Sales Velocity Ratio
SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    SUM(od.quantityOrdered) AS total_Sold,
	(SUM(od.quantityOrdered)/ p.quantityInStock) AS SVRs
FROM
    mintclassics.products p
        LEFT JOIN
    mintclassics.orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode , p.productName , p.quantityInStock
ORDER BY total_Sold ASC;

-- Zero-movement inventory
SELECT 
    p.productCode, p.productName, p.quantityInStock
FROM
    mintclassics.products p
        LEFT JOIN
    mintclassics.orderdetails od ON p.productCode = od.productCode
WHERE
    od.productCode IS NULL;

--Warehouse Risk Analysis
SELECT 
    w.warehouseCode,
    COUNT(DISTINCT o.orderNumber) AS total_orders
FROM
    mintclassics.warehouses w
        JOIN
    mintclassics.products p ON w.warehouseCode = p.warehouseCode
        JOIN
    mintclassics.orderdetails od ON p.productCode = od.productCode
        JOIN
    mintclassics.orders o ON od.orderNumber = o.orderNumber
GROUP BY w.warehouseCode;
