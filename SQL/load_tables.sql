COPY product_details
FROM '/tmp/product_details_cleaned4.csv'
DELIMITER ',' 
CSV HEADER;

COPY customer_details
FROM '/tmp/customer_details_cleaned2.csv'
DELIMITER ',' 
CSV HEADER;

COPY sales_data (user_id, product_id, interaction_type, time_stamp)
FROM '/tmp/sales_data_fixed2.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM sales_data
LIMIT 10

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales_data';

SELECT * FROM sales_data LIMIT 10

ALTER TABLE sales_data DROP CONSTRAINT sales_data_user_id_fkey;

ALTER TABLE customer_details
ALTER COLUMN customer_id TYPE DOUBLE PRECISION USING customer_id::DOUBLE PRECISION;

ALTER TABLE sales_data
ADD CONSTRAINT sales_data_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES customer_details(customer_id);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales_data';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer_details';

SELECT conname AS constraint_name, confkey, confrelid::regclass AS referenced_table
FROM pg_constraint
WHERE conrelid = 'sales_data'::regclass AND contype = 'f';