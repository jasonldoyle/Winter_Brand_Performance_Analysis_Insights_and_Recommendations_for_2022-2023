CREATE TABLE  customer_details
(
    customer_id INT PRIMARY KEY,	
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(20),
    category VARCHAR(15),
    purchase_amount_(usd) INT,
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
    frequency_of_purchases VARCHAR(15),
    FOREIGN KEY 
    FOREIGN KEY
);

CREATE TABLE 



CREATE TABLE public.order_list
(
    order_id INT PRIMARY KEY,
    order_date DATE, 
    origin_port TEXT,
    carrier TEXT,
    tpt INT, 
    service_level TEXT,
    ship_ahead_day_count INT, 
    ship_late_day_count INT, 
    customer TEXT, 
    product_id INT, 
    plant_id TEXT, 
    destination_port TEXT, 
    unit_quantity INT,
    weight FLOAT,
    FOREIGN KEY (product_id) REFERENCES public.products_per_plant(product_id),
    FOREIGN KEY (plant_id) REFERENCES public.plant_ports(plant_id)
);

CREATE TABLE public.freight_rates
(
    carrier TEXT PRIMARY KEY,
    orig_port_cd TEXT,
    dest_port_cd TEXT,
    minm_wgh_qty INT,
    max_wgh_qty FLOAT,
    svc_cd TEXT,
    minimum_cost FLOAT,
    rate FLOAT,
    mode_ds TEXT,
    tpt_day_cnt INT,
    Carrier_type TEXT
);

CREATE TABLE public.wh_costs
(
    plant_id TEXT PRIMARY KEY,
    cost_per_unit FLOAT
);

CREATE TABLE public.wh_capacities
(
    plant_id TEXT PRIMARY KEY,
    capacity FlOAT
);

CREATE TABLE public.products_per_plant
(
    plant_id TEXT PRIMARY KEY,
    product_id INT
);

CREATE TABLE public.vmi_customers
(
    plant_id TEXT PRIMARY KEY,
    customers TEXT
);

CREATE TABLE public.plant_ports
(
    plant_id TEXT PRIMARY KEY,
    port_id TEXT
);