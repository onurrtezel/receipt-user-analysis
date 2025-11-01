-- 1) Create Table

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    city VARCHAR(50)
);

CREATE TABLE receipts (
    receipt_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20),
    store_name VARCHAR(100),
    store_category VARCHAR(50),
    items_json JSONB,
    tax_amount DECIMAL(10,2) DEFAULT 0
);

----------------------------------------------------------------------------------------------------------------------------------
-- 2) Add Values (Insert)

INSERT INTO users (name, surname, email, phone_number, city) VALUES
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@example.com', '5551234567', 'İstanbul'),
('Elif', 'Demir', 'elif.demir@example.com', '5552345678', 'Ankara'),
('Murat', 'Kaya', 'murat.kaya@example.com', '5553456789', 'İzmir'),
('Zeynep', 'Çelik', 'zeynep.celik@example.com', '5554567890', 'Bursa'),
('Emre', 'Arslan', 'emre.arslan@example.com', '5555678901', 'Antalya'),
('Selin', 'Öztürk', 'selin.ozturk@example.com', '5556789012', 'Adana'),
('Can', 'Aksoy', 'can.aksoy@example.com', '5557890123', 'Mersin'),
('Ayşe', 'Kara', 'ayse.kara@example.com', '5558901234', 'Trabzon'),
('Oğuz', 'Polat', 'oguz.polat@example.com', '5559012345', 'Eskişehir'),
('Derya', 'Taş', 'derya.tas@example.com', '5550123456', 'Samsun');

INSERT INTO receipts (user_id, total_amount, payment_method, store_name, store_category, items_json, tax_amount) VALUES
(1, 45.50, 'Kredi Kartı', 'Migros', 'Market', '[{"name":"Ekmek","quantity":2,"price":10},{"name":"Süt","quantity":1,"price":5},{"name":"Peynir","quantity":1,"price":20}]', 5.50),
(2, 78.90, 'Nakit', 'Carrefour', 'Market', '[{"name":"Makarna","quantity":3,"price":15},{"name":"Salça","quantity":2,"price":18},{"name":"Zeytin","quantity":1,"price":15}]', 8.90),
(3, 32.00, 'Kredi Kartı', 'Bim', 'Market', '[{"name":"Çay","quantity":2,"price":12},{"name":"Şeker","quantity":1,"price":8},{"name":"Reçel","quantity":1,"price":12}]', 4.00),
(4, 120.75, 'QR', 'Burger King', 'Fast Food', '[{"name":"Burger","quantity":2,"price":80},{"name":"Coca Cola","quantity":2,"price":40}]', 10.75),
(5, 55.60, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Latte","quantity":2,"price":50},{"name":"Kurabiye","quantity":1,"price":5.60}]', 5.60),
(6, 200.00, 'Nakit', 'Teknosa', 'Elektronik', '[{"name":"Mouse","quantity":1,"price":120},{"name":"Klavye","quantity":1,"price":80}]', 20.00),
(7, 85.90, 'Kredi Kartı', 'LC Waikiki', 'Giyim', '[{"name":"T-shirt","quantity":2,"price":60},{"name":"Pantolon","quantity":1,"price":25.90}]', 10.00),
(8, 45.20, 'Nakit', 'Migros', 'Market', '[{"name":"Makarna","quantity":2,"price":20},{"name":"Sos","quantity":1,"price":10.20},{"name":"Peynir","quantity":1,"price":15}]', 5.20),
(9, 60.00, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Cappuccino","quantity":2,"price":50},{"name":"Kurabiye","quantity":2,"price":10}]', 6.00),
(10, 150.00, 'QR', 'Teknosa', 'Elektronik', '[{"name":"Kulaklık","quantity":1,"price":150}]', 15.00),

(1, 35.50, 'Kredi Kartı', 'Bim', 'Market', '[{"name":"Ekmek","quantity":1,"price":5},{"name":"Süt","quantity":2,"price":10},{"name":"Peynir","quantity":1,"price":20}]', 5.50),
(2, 90.00, 'Nakit', 'Carrefour', 'Market', '[{"name":"Makarna","quantity":5,"price":75},{"name":"Zeytin","quantity":1,"price":15}]', 9.00),
(3, 40.00, 'Kredi Kartı', 'Migros', 'Market', '[{"name":"Çay","quantity":3,"price":18},{"name":"Şeker","quantity":1,"price":12},{"name":"Reçel","quantity":1,"price":10}]', 4.00),
(4, 130.75, 'QR', 'Burger King', 'Fast Food', '[{"name":"Burger","quantity":3,"price":120},{"name":"Coca Cola","quantity":2,"price":40}]', 12.75),
(5, 70.00, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Latte","quantity":3,"price":70}]', 7.00),
(6, 250.00, 'Nakit', 'Teknosa', 'Elektronik', '[{"name":"Mouse","quantity":1,"price":120},{"name":"Klavye","quantity":1,"price":80},{"name":"USB","quantity":1,"price":50}]', 25.00),
(7, 100.00, 'Kredi Kartı', 'LC Waikiki', 'Giyim', '[{"name":"T-shirt","quantity":3,"price":90},{"name":"Pantolon","quantity":1,"price":25}]', 10.00),
(8, 55.20, 'Nakit', 'Migros', 'Market', '[{"name":"Makarna","quantity":2,"price":20},{"name":"Sos","quantity":1,"price":10.20},{"name":"Peynir","quantity":1,"price":25}]', 5.20),
(9, 80.00, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Cappuccino","quantity":3,"price":75},{"name":"Kurabiye","quantity":1,"price":5}]', 8.00),
(10, 180.00, 'QR', 'Teknosa', 'Elektronik', '[{"name":"Kulaklık","quantity":1,"price":150},{"name":"Mousepad","quantity":1,"price":30}]', 18.00),

(1, 60.00, 'Kredi Kartı', 'Bim', 'Market', '[{"name":"Ekmek","quantity":2,"price":10},{"name":"Süt","quantity":2,"price":10},{"name":"Peynir","quantity":2,"price":40}]', 6.00),
(2, 120.00, 'Nakit', 'Carrefour', 'Market', '[{"name":"Makarna","quantity":6,"price":90},{"name":"Zeytin","quantity":2,"price":30}]', 12.00),
(3, 45.00, 'Kredi Kartı', 'Migros', 'Market', '[{"name":"Çay","quantity":2,"price":12},{"name":"Şeker","quantity":2,"price":16},{"name":"Reçel","quantity":1,"price":17}]', 4.50),
(4, 150.75, 'QR', 'Burger King', 'Fast Food', '[{"name":"Burger","quantity":4,"price":160},{"name":"Coca Cola","quantity":2,"price":40}]', 15.75),
(5, 85.60, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Latte","quantity":3,"price":75},{"name":"Kurabiye","quantity":2,"price":10.60}]', 8.60),
(6, 300.00, 'Nakit', 'Teknosa', 'Elektronik', '[{"name":"Mouse","quantity":1,"price":120},{"name":"Klavye","quantity":1,"price":80},{"name":"USB","quantity":2,"price":100}]', 30.00),
(7, 120.00, 'Kredi Kartı', 'LC Waikiki', 'Giyim', '[{"name":"T-shirt","quantity":4,"price":120}]', 12.00),
(8, 65.20, 'Nakit', 'Migros', 'Market', '[{"name":"Makarna","quantity":2,"price":20},{"name":"Sos","quantity":1,"price":10.20},{"name":"Peynir","quantity":1,"price":35}]', 6.50),
(9, 90.00, 'Kredi Kartı', 'Starbucks', 'Kafe', '[{"name":"Cappuccino","quantity":4,"price":80},{"name":"Kurabiye","quantity":2,"price":10}]', 9.00),
(10, 200.00, 'QR', 'Teknosa', 'Elektronik', '[{"name":"Kulaklık","quantity":1,"price":150},{"name":"Mousepad","quantity":1,"price":50}]', 20.00);

----------------------------------------------------------------------------------------------------------------------------------
-- 3) Select Tables

select * from users;
select * from receipts;

----------------------------------------------------------------------------------------------------------------------------------
-- 4) Conditional (Select) and LIKE,NOT LIKE

select * from users where city='İstanbul' or city='Ankara';
select * from users where phone_number like '%2' or phone_number like '%0';
select * from users where name like '%a%';
select * from users where name not like '%e' and name not like '%n';

----------------------------------------------------------------------------------------------------------------------------------
-- 5) Update and Update with CASE

update users
set city='Çanakkale'
where name='Zeynep' or name='Ahmet';

update receipts
set store_name='Kahve Dünyası',tax_amount=28.00
where store_name='Starbucks' or tax_amount=30.00;

UPDATE users
SET phone_number = CASE user_id
    WHEN 1 THEN '5512051560'
    WHEN 2 THEN '5055413377'
    END
WHERE user_id IN (1,2);

select * from users order by user_id;
select * from receipts order by receipt_id;

----------------------------------------------------------------------------------------------------------------------------------
-- 6) SUM(),AVG() MAX()

select sum(total_amount) from receipts;
select sum(tax_amount) from receipts;
select avg(total_amount) as average_total ,avg(tax_amount) as average_tax from receipts;
select max(total_amount) as max_total_amount, min(total_amount) as min_total_amount from receipts;

----------------------------------------------------------------------------------------------------------------------------------
-- 7) COUNT(*) and FILTER

select count(*) from users;
select count(receipt_id) from receipts;
select count(*) filter (where city = 'Çanakkale') as Çanakkale,count(*) filter (where city = 'İzmir') as İzmir from users;

----------------------------------------------------------------------------------------------------------------------------------
-- 8) Group by and Having

select city, count(*) from users group by city;
select store_name,count(*) from receipts group by store_name;
select tax_amount,count(*) from receipts group by tax_amount having count(*) > 2;

----------------------------------------------------------------------------------------------------------------------------------
-- 9) Inner Join

select name,surname,receipts.receipt_id from users inner join receipts on users.user_id = receipts.user_id order by receipt_id;
select name,surname,receipts.receipt_id,receipts.total_amount from users inner join receipts on users.user_id = receipts.user_id;
select name,surname,receipts.receipt_id,receipts.payment_method from users inner join receipts on users.user_id=receipts.user_id order by receipt_id;



