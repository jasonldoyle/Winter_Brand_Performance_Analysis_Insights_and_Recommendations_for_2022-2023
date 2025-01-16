CREATE TABLE customer_details (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(20),
    category VARCHAR(15),
    purchase_amount_usd INT,
    location VARCHAR(15),
    size VARCHAR(5),
    color VARCHAR(10),
    season VARCHAR(10),
    review_rating INT,
    subscription_status BOOLEAN, 
    shipping_type VARCHAR(15),
    discount_applied BOOLEAN,
    promo_code_used BOOLEAN,
    previous_purchases INT,
    payment_method VARCHAR(15),
    frequency_of_purchases VARCHAR(15)
);

ALTER TABLE customer_details
ALTER COLUMN review_rating TYPE FLOAT USING review_rating::FLOAT;

CREATE TABLE product_details (
    uniqe_id VARCHAR(35) PRIMARY KEY,
    product_name VARCHAR(210),
    category VARCHAR(160),
    upc_ean_code VARCHAR(145),
    selling_price VARCHAR(20),
    model_number VARCHAR(40),
    about_product VARCHAR(2615),
    product_specification VARCHAR(645),
    technical_details VARCHAR(3965),
    shipping_weight VARCHAR(15),
    product_dimensions VARCHAR(40),
    image VARCHAR(660),
    variants VARCHAR(2960),
    product_url VARCHAR(130),
    is_amazon_seller BOOLEAN
);

CREATE TABLE sales_data (
    id SERIAL PRIMARY KEY,  -- Auto-incrementing ID to uniquely identify each transaction
    user_id INT,            -- Allow NULL for missing customer data
    product_id VARCHAR(35), -- Allow NULL for missing product data
    interaction_type VARCHAR(10),
    time_stamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES customer_details(customer_id),
    FOREIGN KEY (product_id) REFERENCES product_details(uniqe_id)
);

ALTER TABLE sales_data
ALTER COLUMN user_id TYPE FLOAT USING user_id::FLOAT;

INSERT INTO customer_details (customer_id, subscription_status)
VALUES
    (1, CASE WHEN 'Yes' = 'Yes' THEN TRUE ELSE FALSE END), 
    (2, CASE WHEN 'No' = 'Yes' THEN TRUE ELSE FALSE END);  

SELECT conname AS constraint_name, conrelid::regclass AS table_name
FROM pg_constraint
WHERE confrelid = 'customer_details'::regclass AND confkey @> ARRAY[
    (SELECT attnum FROM pg_attribute WHERE attrelid = 'customer_details'::regclass AND attname = 'customer_id')
];

ALTER TABLE sales_data
ADD CONSTRAINT sales_data_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES customer_details(customer_id);