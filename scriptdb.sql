createdb test_bd
psql -U intern -d test_bd
CREATE TABLE products (
    products_id serial,
    brand varchar(50),
    category varchar(60),
    item varchar(150),
    notes varchar(1000),
    price decimal(8,2),
    rating decimal(2,1)
);
INSERT INTO products (brand, category, item, notes, price, rating)
VALUES ('Lancome', 'Парфюмерия', 'Парфюмерная вода Miracle', 'Парфюмерная вода, 30мл', 7724.00, 4.7),
('Lancome', 'Макияж', 'Тональная основа Teint Miracle', '№035 Beige Dore, 30мл', 3763.00, 4.8),
('Lancome', 'Уход для лица', 'Крем для лица', 'Дневной крем для нормальной кожи лица, 50мл', 9162.00, 4.9),
('NIVEA', 'Уход для лица', 'Мицеллярная вода MicellAir', 'Мицеллярная вода для чувствительной кожи, 200мл', 249.00, 5.0),
('NIVEA', 'Уход для лица', 'Бальзам для губ', 'Увлажняющий бальзам для губ, 200мл', 229.00, 4.8),
('ARAVIA', 'Уход для лица', 'Сыворотка для лица', 'Увлажняющая сыворотка для лица, 30мл', 651.00, 4.9),
('ARAVIA', 'Уход для лица', 'Крем для лица', 'Суперувлажнение и регенерация, 150мл', 704.00, 5.0),
('Givenchy', 'Макияж', 'Румяна для лица', '№3 Voile Corail', 2989.00, 5.0),
('Givenchy', 'Макияж', 'Карандаш для глаз', 'Водостойкий, №01 Black', 1396.00, 4.6),
('Givenchy', 'Парфюмерия', 'Туалетная вода Irresistible', 'Туалетная вода, 35мл', 4986.00, 5.0);
SELECT * 
FROM products
WHERE products_id = 5;

SELECT brand, category, item, notes, price, rating
FROM products
WHERE brand = 'Givenchy' AND price < (SELECT AVG(price) FROM products);

SELECT brand, category, item, price, rating
FROM products
WHERE rating = (SELECT MAX(rating) FROM products) 
AND price < (SELECT AVG(price) FROM products)
ORDER BY price
LIMIT 1;