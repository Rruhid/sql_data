 
--
-- Table structure for table `actor`
--

CREATE TABLE actor (
  actor_id SERIAL PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


--
-- Table structure for table `address`
--

CREATE TABLE address(
  address_id SERIAL PRIMARY KEY,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50),
  district VARCHAR(20) NOT NULL,
  city_id SMALLINT NOT NULL,
  postal_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `category`
--


CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


--
-- Table structure for table `city`
--

CREATE TABLE city (
  city_id SERIAL PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);



--
-- Table structure for table `country`
--
CREATE TABLE country (
  country_id SERIAL PRIMARY KEY,
  country VARCHAR(50) NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

 
 
--
-- Table structure for table `customer`
--

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  store_id SMALLINT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50),
  address_id SMALLINT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date TIMESTAMP NOT NULL,
  last_update TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


--
-- Table structure for table `film`
--
CREATE TYPE enum_Rating AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17');


CREATE TABLE film (
  film_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  release_year DATE,
  language_id SMALLINT NOT NULL,
  original_language_id SMALLINT,
  rental_duration SMALLINT NOT NULL DEFAULT 3,
  rental_rate DECIMAL(4, 2) NOT NULL DEFAULT 4.99,
  length SMALLINT,
  replacement_cost DECIMAL(5, 2) NOT NULL DEFAULT 19.99,
  rating enum_Rating DEFAULT 'G',
  special_features VARCHAR(255)[] DEFAULT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


--
-- Table structure for table `inventory`
--

CREATE TABLE inventory (
  inventory_id SERIAL PRIMARY KEY,
  film_id SMALLINT NOT NULL,
  store_id SMALLINT NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
 

--
-- Table structure for table `payment`
--

CREATE TABLE payment (
  payment_id SERIAL PRIMARY KEY,
  customer_id SMALLINT NOT NULL,
  staff_id SMALLINT NOT NULL,
  rental_id INT,
  amount NUMERIC(5, 2) NOT NULL,
  payment_date TIMESTAMP NOT NULL,
  last_update TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);



--
-- Table structure for table `rental`
--

CREATE TABLE rental (
  rental_id SERIAL PRIMARY KEY,
  rental_date TIMESTAMP NOT NULL,
  inventory_id INT NOT NULL,
  customer_id SMALLINT NOT NULL,
  return_date TIMESTAMP,
  staff_id SMALLINT NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


--
-- Table structure for table `staff`
--

CREATE TABLE staff (
  staff_id SERIAL PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  address_id SMALLINT NOT NULL,
  picture BYTEA,
  email VARCHAR(50),
  store_id SMALLINT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  username VARCHAR(16) NOT NULL,
  password BYTEA,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `store`
--

CREATE TABLE store (
  store_id SERIAL PRIMARY KEY,
  manager_staff_id SMALLINT NOT NULL,
  address_id SMALLINT NOT NULL,
  last_update TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

