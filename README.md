# Mint Classics Inventory Optimization (MySQL)

## Business Problem
Mint Classics Company operates multiple warehouses for storing classic model cars. 
The company is considering closing one warehouse while maintaining a 24-hour order fulfillment SLA.

## Objective
- Identify a warehouse suitable for closure
- Optimize inventory distribution
- Reduce carrying costs without impacting customer service

## Dataset & Tools
- MySQL relational database (Mint Classics schema)
- MySQL Workbench
- SQL (joins, aggregations, business logic)

## Key Analyses Performed
1. Inventory distribution by warehouse
2. Inventory vs sales velocity analysis
3. Identification of zero-movement (dead) stock
4. Warehouse order dependency risk analysis

## Key Findings
- South warehouse holds the lowest inventory (~14%) and supports fewer orders
- Presence of slow-moving and zero-movement SKUs
- Inventory can be redistributed without stressing other warehouses

## Recommendation
Close the South warehouse and redistribute inventory using SKU criticality rules 
while preserving the 24-hour shipping SLA.

## Business Impact
- Reduced warehouse operating costs
- Lower inventory carrying costs
- Maintained service-level agreements

## Files in This Repository
- `/sql` → SQL queries used in analysis
- `/data` → Supporting CSV files
- `/insights` → Executive summary & findings
