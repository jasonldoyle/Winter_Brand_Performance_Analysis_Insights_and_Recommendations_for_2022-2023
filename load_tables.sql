COPY product_details
FROM '/tmp/product_details_cleaned4.csv'
DELIMITER ',' 
CSV HEADER;

COPY customer_details
FROM '/tmp/customer_details_cleaned2.csv'
DELIMITER ',' 
CSV HEADER;

COPY sales_data
FROM '/tmp/sales_data_cleaned.csv'
DELIMITER ',' 
CSV HEADER;

SELECT * FROM sales_data