USE db_node33;

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(200),
	image VARCHAR(200),
	price FLOAT,
	description VARCHAR(200),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

INSERT INTO food (food_id, food_name, image, price, description, type_id) VALUES
(1, 'Phở chay', 'pho-chay.jpg', 5.99, 'Món phở chay Việt Nam', 1),
(2, 'Kem dâu', 'kem-dau.jpg', 3.49, 'Kem tráng miệng vị dâu', 1),
(3, 'Tôm hấp', 'tom-hap.jpg', 12.99, 'Tôm hấp ngon miệng', 2),
(4, 'Bò nướng', 'bo-nuong.jpg', 15.99, 'Món thịt bò nướng', 3),
(5, 'Nước chanh', 'nuoc-chanh.jpg', 1.99, 'Nước chanh tươi', 3);

CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(200)
)

INSERT INTO food_type (type_id, type_name) VALUES
(1, 'Món chay'),
(2, 'Món tráng miệng'),
(3, 'Món hải sản'),
(4, 'Món thịt'),
(5, 'Món nước');

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(200),
	email VARCHAR(200),
	passwrd VARCHAR(200)
)

INSERT INTO users (user_id, full_name, email, passwrd) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com', '123456'),
(2, 'Trần Thị B', 'b@gmail.com', 'b@123456'),
(3, 'Võ Thị C', 'c@gmail.com', '123321'),
(4, 'Nguyễn Minh D', 'd@gmail.com', '123456'),
(5, 'Trương Thị E','e@gmail.com','b@123456'),
(6, 'Võ Minh F','f@gmail.com','123321');

CREATE TABLE restaurant(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(200),
	image VARCHAR(200),
	description VARCHAR(200)
)

INSERT INTO restaurant (res_id, res_name, image, description) VALUES
(1,'Phở 24h','pho24h.jpg','Quán phở nổi tiếng ở Sài Gòn'),
(2,'Bò nướng phố','bo-nuong-pho.jpg','Bò nướng ăn kèm sốt siêu ngon'),
(3,'Swensen','swensen.jpg','Kem thương hiệu Mỹ');

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	food_id INT,
	amount INT,
	cod VARCHAR(200),
	arr_sub_id VARCHAR(200),
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

INSERT INTO orders (order_id, user_id, food_id, amount, cod, arr_sub_id) VALUES
(1,1,2,3,'ORD001','[4]'),
(2,3,4,1,'ORD002','[2]'),
(3,2,1,2,'ORD003','[3]'),
(4,1,2,4,'ORD004','[4]'),
(5,2,4,1,'ORD005','[2]'),
(6,2,1,2,'ORD006','[3]'),
(7,2,2,4,'ORD007','[4]'),
(8,3,4,10,'ORD008','[2]'),
(9,1,1,2,'ORD009','[3]'),
(10,1,2,4,'ORD010','[4]'),
(11,3,4,5,'ORD011','[2]'),
(12,2,1,6,'ORD012','[3]');


CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(200),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

INSERT INTO sub_food (sub_id, sub_name, sub_price, food_id) VALUES
(1,'Muối tiêu xanh', 0.99, 3),
(2,'Sốt phô mai', 1.99, 4),
(3,'Hành tây và giá', 2.99, 1),
(4,'Bánh ốc quế', 1.99, 2),
(5,'Rau trụng', 0.99, 1),
(6,'Marshmallow', 1.99, 2),
(7,'Sprinkle', 1.99, 2),
(8,'Oreo', 0.99, 2),
(9,'Giá', 0.99, 1),
(10,'Sốt nấm', 1.99, 4),
(11,'Sốt tiêu', 0.99, 4);

CREATE TABLE rate_res(
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	PRIMARY KEY (user_id, res_id)
)

INSERT INTO rate_res(user_id, res_id, amount, date_rate) VALUES
(1,1,5,'2023-07-01 09:14:01'),
(1,2,3,'2023-07-02 08:13:02'),
(1,3,3,'2023-07-02 07:12:03'),
(2,1,4,'2023-07-05 06:11:04'),
(2,3,4,'2023-07-11 05:09:05'),
(3,1,1,'2023-07-20 04:08:06'),
(3,2,3,'2023-07-01 09:14:01'),
(4,1,2,'2023-07-02 08:13:02'),
(4,2,2,'2023-07-02 07:12:03'),
(4,3,2,'2023-07-05 06:11:04'),
(5,1,5,'2023-07-11 05:09:05'),
(5,2,5,'2023-07-20 04:08:06');



CREATE TABLE like_res(
	user_id INT,
	res_id INT,
	date_like DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	PRIMARY KEY (user_id, res_id)
)

INSERT INTO like_res(user_id, res_id, date_like) VALUES
(1,1,'2023-07-01 09:14:01'),
(1,2,'2023-07-02 08:13:02'),
(1,3,'2023-07-02 07:12:03'),
(2,1,'2023-07-05 06:11:04'),
(2,3,'2023-07-11 05:09:05'),
(3,1,'2023-07-20 04:08:06'),
(3,3,'2023-07-01 09:14:01'),
(4,2,'2023-07-02 08:13:02'),
(4,3,'2023-07-02 07:12:03'),
(4,1,'2023-07-05 06:11:04'),
(5,3,'2023-07-11 05:09:05'),
(5,1,'2023-07-20 04:08:06');


select users.user_id, users.full_name, lr.like_total from users join (
	select user_id, count(*) as like_total from like_res
	group by user_id
) as lr where users.user_id = lr.user_id
order by like_total desc
limit 5 ;

select restaurant.res_id, restaurant.res_name, lr.like_total from restaurant join (
	select res_id, count(*) as like_total from like_res
	group by res_id
) as lr where restaurant.res_id = lr.res_id
order by like_total desc
limit 2;

select users.user_id, users.full_name, users.email, ot.order_total from users join(
	select user_id, count(*) as order_total from orders 
	group by user_id
) as ot where users.user_id = ot.user_id
order by order_total desc
limit 1;

select users.user_id, users.full_name, users.email, users.passwrd from users 
left join orders
on users.user_id = orders.user_id
left join like_res
on users.user_id = like_res.user_id
left join rate_res
on users.user_id = rate_res.user_id
where orders.user_id is null and like_res.user_id is null and rate_res.user_id is null;

select(select count(*) from sub_food) / (select count(*) from food) as avg_food_subfood;

select * from food join(
	select food_id, avg(sub_price) as sub_avg from sub_food
	group by food_id
) as avgsub where food.food_id = avgsub.food_id