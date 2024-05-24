-- Around Boston, Brookline, and Somerville, you might catch sight of 
-- Union Square Donuts, a shop famous in the area for its delicious confections.
--  Suppose that Union Square Donuts has been around for a while and, 
--  while their paper receipts have worked well so far, they’re hoping for a 
--  system to help them handle more customers. In fact, they’ve just hired you 
--  to design a database fitting for their shop. In exchange, free donuts? 🍩


-- Ingredients
-- We certainly need to keep track of our ingredients. Some of the typical ingredients 
-- we use include flour, yeast, oil, butter, and several different types of sugar. 
-- Moreover, we would love to keep track of the price we pay per unit of ingredient
--  (whether it’s pounds, grams, etc.).

-- Donuts
-- We’ll need to include our selection of donuts, past and present! For each donut 
-- on the menu, we’d love to include three things:
-- The name of the donut
-- Whether the donut is gluten-free
-- The price per donut
-- Oh, and it’s important that we be able to look up the ingredients 
-- for each of the donuts!

-- Orders
-- We love to see customers in person, though we realize a good number of people might
--  order online nowadays. We’d love to be able to keep track of those online orders. 
--  We think we would need to store:
-- An order number, to keep track of each order internally
-- All the donuts in the 

-- Customers
-- The customer who placed the order. We suppose we could assume only one customer
--  places any given order.
-- Customers
-- Oh, and we realize it would be lovely to keep track of some information about 
-- each of our customers. We’d love to remember the history of the orders they’ve made.
--  In that case, we think we should store:
-- A customer’s first and last name
-- A history of their orders

Sample Data
Your database should be able to represent…
Cocoa, for which Union Square Donuts pays $5.00 for one pound.
Sugar, for which Union Square Donuts pays $2.00 for one pound.
Union Square Donuts’ “Belgian Dark Chocolate” donut, which is not gluten-free,
 costs $4.00, and includes the following ingredients:
Cocoa
Flour
Buttermilk
Sugar
Union Square Donuts’ “Back-To-School Sprinkles” donut, which is not gluten-free, 
costs $4.00, and includes the following ingredients:
Flour
Buttermilk
Sugar
Sprinkles
Order 1 from Luis Singh for 3 Belgian Dark Chocolate donuts and 2 Back-To-School
 Sprinkles donuts.


CREATE TABLE IF NOT EXISTS
    "ingredients" (
        "name"  TEXT,
        "price" NUMERIC
    );

CREATE TABLE IF NOT EXISTS
    "donuts" (
        "name"        TEXT,
        "gluten_free" BOOLEAN,
        "price"       NUMERIC
        "ingredients_id" TEXT,
        FOREIGN KEY ("ingredients_id") REFERENCES "ingredients" ("name")
    );

CREATE TABLE IF NOT EXISTS
    "orders" (
        "order_number" INTEGER,
        "type"       CHECK("type" IN ('online', 'in-person')),
        "customer_id"  INTEGER,
        FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
        FOREIGN KEY ("order_number") REFERENCES "donuts" ("name")
        PRIMARY KEY ("order_number")
    );

CREATE TABLE IF NOT EXISTS
    "customers" (
        "id"          INTEGER,
        "first_name"  TEXT,
        "last_name"   TEXT,
        "history"     TEXT, -- history of orders
        PRIMARY KEY ("id")
    );
