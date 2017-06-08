-- 建表的
drop database if exists shoping;

create database shoping;

use shoping;

-- 管理用户
create table t_sysuser(
	id int primary key auto_increment,
	userName varchar(30),
	loginName varchar(30),
	loginPassWord varchar(30),
	sysuserStatus int
)engine=Innodb default charset=utf8;

-- 产品类型表
create table t_product_type(
	id int  primary key auto_increment,
	productTypeName varchar(50),
	productTypeStatus int 
)engine=Innodb default charset=utf8;

-- 产品表
create table t_product(
	id int primary key auto_increment,
	proName varchar(50),
	proPrice double(10,2),
	imgUrl varchar(60),
	typeId int,
	proStatus int,
	foreign key (typeId) references t_product_type(id)
)engine=Innodb default charset=utf8;

-- 用户
create table t_user(
	id int primary key auto_increment,
	name varchar(50),
	username varchar(50),
	password varchar(50)
)engine=Innodb default charset=utf8;

-- 用户地址表
create table t_user_address(
	id int primary key auto_increment,
	address varchar(200),
	tel varchar(20),
	linkname varchar(50),
	userId int,
	foreign key (userId) references t_user(id)
)engine=Innodb default charset=utf8;

-- 订单
create table t_online_order(
	id int primary key auto_increment,
	orderNo varchar(100),
	productId int,
	userId int,
	buyNum double,
	buyDate date,
	addressId int,
	ordersttus int,
	foreign key (productId) references t_product(id),
	foreign key (addressId) references t_user_address(id),
	foreign key (userId) references t_user(id)
)engine=Innodb default charset=utf8;
