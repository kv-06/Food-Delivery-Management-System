drop table Payment;
drop table Order_list;
drop table Orders;
drop table Menu;
drop table Items;
drop table Address;
drop table customer;
drop table Delivery_person;
drop table Restaurants;
drop SEQUENCE order_seq;
drop SEQUENCE payment_seq;
drop SEQUENCE transaction_seq;


CREATE TABLE customer (
    cust_id VARCHAR(6) CONSTRAINT cus_id_pk PRIMARY KEY,
    name VARCHAR(25) CONSTRAINT cus_nam_nn NOT NULL,
    email VARCHAR(25) CONSTRAINT cus_mail_uni UNIQUE,
    password VARCHAR(25) CONSTRAINT cus_pass_nn NOT NULL,
    phone_num VARCHAR(25) CONSTRAINT cus_phone_nn NOT NULL CONSTRAINT cus_phone_uni UNIQUE 
);


CREATE TABLE Delivery_person (
    D_id VARCHAR2(20) CONSTRAINT dp_id_pk PRIMARY KEY,
    Name VARCHAR2(50) CONSTRAINT dp_name_nn NOT NULL,
    Phone_no VARCHAR2(15) CONSTRAINT dp_phone_nn NOT NULL CONSTRAINT dp_phone_uni UNIQUE,
    Location VARCHAR2(100),
    password VARCHAR(25) CONSTRAINT dp_pass_nn NOT NULL,
    Email VARCHAR2(50) CONSTRAINT dp_email_uni UNIQUE,
    Free NUMERIC(1,0) DEFAULT 0 CONSTRAINT dp_free_chk CHECK (Free IN (0,1))
);


CREATE TABLE Restaurants (
    Restaurant_id VARCHAR2(20) CONSTRAINT rest_id_pk PRIMARY KEY,
    Name VARCHAR2(50) CONSTRAINT rest_name_nn NOT NULL,
    Block_num NUMBER(5) CONSTRAINT rest_block_nn NOT NULL,
    Street VARCHAR2(100) CONSTRAINT rest_street_nn NOT NULL,
    Area VARCHAR2(100) CONSTRAINT rest_area_nn NOT NULL,
    Pincode VARCHAR2(6) CONSTRAINT rest_pincode_nn NOT NULL CONSTRAINT rest_pincode_chk CHECK (LENGTH(Pincode) = 6),
    Phone_num VARCHAR2(15) CONSTRAINT rest_phone_nn NOT NULL CONSTRAINT rest_phone_uni UNIQUE,
    Password VARCHAR2(50) CONSTRAINT rest_password_nn NOT NULL
);


CREATE TABLE Address (
    Cust_id VARCHAR2(20),
    Add_id VARCHAR2(20),
    Block_num NUMBER(5),
    Street VARCHAR2(100),
    Area VARCHAR2(100),
    Pincode VARCHAR2(6),
    CONSTRAINT addr_pk PRIMARY KEY (Cust_id, Add_id)
);


CREATE TABLE Items (
    Item_id VARCHAR2(20) CONSTRAINT item_id_pk PRIMARY KEY,
    Item_name VARCHAR2(50) CONSTRAINT item_name_nn NOT NULL CONSTRAINT item_name_uni UNIQUE,
    Type VARCHAR2(50),
    Vegetarian VARCHAR2(10) CONSTRAINT item_veg_chk CHECK (Vegetarian IN ('veg', 'non-veg', 'egg'))
);


CREATE TABLE Menu (
    Restaurant_id VARCHAR2(20) CONSTRAINT itemsb_rest_fk REFERENCES Restaurants(Restaurant_id),
    Item_id VARCHAR2(20) CONSTRAINT itemsb_item_fk REFERENCES Items(Item_id),
    Price numeric(10) CONSTRAINT itemsb_price_nn NOT NULL,
    Description VARCHAR2(200),
    CONSTRAINT menu_pk PRIMARY KEY (Restaurant_id,Item_id)
);


CREATE TABLE Orders (
    Order_id VARCHAR2(20) CONSTRAINT orders_order_id_pk PRIMARY KEY,
    Cust_id VARCHAR2(20) CONSTRAINT orders_cust_id_fk REFERENCES customer(cust_id),
    Rest_id VARCHAR2(20) CONSTRAINT orders_rest_id_fk REFERENCES Restaurants(Restaurant_id),
    D_id VARCHAR2(20) CONSTRAINT orders_d_id_fk REFERENCES Delivery_person(D_id),
    Order_time TIMESTAMP CONSTRAINT orders_order_time_nn NOT NULL,
    Delv_time TIMESTAMP,
    Status VARCHAR2(20) CONSTRAINT orders_status_chk CHECK (Status IN ('received', 'cooking', 'out for delivery', 'delivered')),
    Payment VARCHAR2(20) CONSTRAINT orders_payment_chk CHECK (Payment IN ('paid', 'unpaid')),
    CONSTRAINT orders_delv_time_chk CHECK (Delv_time > Order_time)
);


CREATE TABLE Order_list (
    Order_id VARCHAR2(20) CONSTRAINT order_list_order_id_fk REFERENCES Orders(Order_id),
    Item_id VARCHAR2(20) CONSTRAINT order_list_item_id_fk REFERENCES Items(Item_id),
    Qty NUMBER,
    Food_rating NUMBER,
    CONSTRAINT order_list_pk PRIMARY KEY (Order_id, Item_id)
);


CREATE TABLE Payment (
    Payment_id VARCHAR2(20) CONSTRAINT payment_payment_id_pk PRIMARY KEY,
    Order_id VARCHAR2(20) CONSTRAINT payment_order_id_fk REFERENCES Orders(Order_id),
    Method VARCHAR2(50),
    Status VARCHAR2(20) CONSTRAINT payment_status_chk CHECK (Status IN ('successful', 'unsuccessful')),
    Transaction_id VARCHAR2(50)
);


