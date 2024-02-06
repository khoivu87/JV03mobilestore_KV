CREATE DATABASE mobilestore
USE mobilestore;

CREATE TABLE role(
	
    id int auto_increment,
    name varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE user(

    id int auto_increment,
    email varchar(255),
    password varchar(255),
    usrFirstName varchar(255),
    usrLastName varchar(255),
    usrDOB date,
    usrGender int,
    id_role int,
    createdAt timestamp,
    deletedAt timestamp,
      
    primary key(id)
);

CREATE TABLE customer(

    id int auto_increment,
    email varchar(255),
    password varchar(255),
    custFirstName varchar(255),
    custLastName varchar(255),
    custDOB date,
    custGender int,
    custRank varchar(50),
    id_role int,
    createdAt timestamp,
    deletedAt timestamp,
      
    primary key(id)
);

CREATE TABLE address(

	id int auto_increment,
	addressName varchar(255),
	createdAt timestamp,
    deletedAt timestamp,

	primary key(id)
);

CREATE TABLE addressDetail(

	id int auto_increment,
	addressLine1 varchar(255),
	addressLine2 varchar(255),
	city varchar(80),
	district varchar(50),
	ward varchar(50),
	country varchar(100),
	postalCode varchar(30),
	phoneNumber varchar(50),
    id_customer int,
    id_address int,
    createdAt timestamp,
    deletedAt timestamp,
      
    primary key(id)
);

CREATE TABLE color(

	id int auto_increment,
    colorName varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE storage(
	
	id int auto_increment,
    storageName varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE tag(
	
	id int auto_increment,
    tagName varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE promotion(
	
	id int auto_increment,
    promotionName varchar(100),
    promotionDescription varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE category(
	
	id int auto_increment,
    catName varchar(100),
    catDescription varchar(255),
    createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE subCategory(
	
	id int auto_increment,
	subCatName varchar(100),
	subCatDescription varchar(255),
	subCat_parentID int,
	id_category int,
	createdAt timestamp,
	deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE product(

	id int auto_increment,
	images varchar(255),
	title varchar(255),
	id_subCat int,
	createdAt timestamp,
    deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE productDetail(
	
	id int auto_increment,
	id_color int,
	id_product int,
	id_storage int,
	id_tag int,
	id_promotion int,
	sku varchar(255),
	price double,
	salePrice double,
	quantity int,
	description varchar(255),
	createdAt timestamp,
    deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE productAttribute(
	id int auto_increment,
	attribName varchar(255),
	id_productDetail int,
	
	primary key(id)
);

CREATE TABLE review(
	
	id int auto_increment,
	reviewTitle varchar(100),
	reviewDate timestamp,
	rating int,
	reviewComment varchar(255),
	id_customer int,
	id_product int,
	createdAt timestamp,
    deletedAt timestamp,

	primary key(id)
);

CREATE TABLE comment(
	
	id int auto_increment,
	commentTitle varchar(100),
	commentContent varchar(255),
	email varchar(255),
	mobile varchar(255),
	id_product int,
	createdAt timestamp,
    deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE cart(
	id int auto_increment,
	id_customer int,
	total int,
	createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE cartDetail(
	id int auto_increment,
	id_cart int,
	id_product int,
	id_product_detail int,
	quantity int,
	createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

CREATE TABLE orders(
	
	id int auto_increment,
	id_customer int,
	id_payment int,
	total_price double,
	create_date datetime,
	createdAt timestamp,
    deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE orderDetail(
	
	id int auto_increment,
	id_order int,
	id_product_detail int,
	id_customer int,
	price double,
	quantity int,
	create_date datetime,
	createdAt timestamp,
    deletedAt timestamp,
	
	primary key(id)
);

CREATE TABLE payment(
	id int auto_increment,
	amount double,
	provider varchar(255),
	status varchar(50),
	id_order int,
	createdAt timestamp,
    deletedAt timestamp,
    
    primary key(id)
);

ALTER TABLE user ADD CONSTRAINT FK_id_role_User
FOREIGN KEY (id_role) REFERENCES role(id);

ALTER TABLE customer ADD CONSTRAINT FK_id_role_Customer
FOREIGN KEY (id_role) REFERENCES role(id);

ALTER TABLE addressDetail ADD CONSTRAINT FK_id_customer_AddressDetail
FOREIGN KEY (id_customer) REFERENCES customer(id);

ALTER TABLE addressDetail ADD CONSTRAINT FK_id_address_AddressDetail
FOREIGN KEY (id_address) REFERENCES address(id);

ALTER TABLE subCategory ADD CONSTRAINT FK_id_category_SubCategory
FOREIGN KEY (id_category) REFERENCES category(id);

ALTER TABLE product ADD CONSTRAINT FK_id_subCat_Product
FOREIGN KEY (id_subCat) REFERENCES subCategory(id);

ALTER TABLE productDetail ADD CONSTRAINT FK_id_color_ProductDetail
FOREIGN KEY (id_color) REFERENCES color(id);

ALTER TABLE productDetail ADD CONSTRAINT FK_id_product_ProductDetail
FOREIGN KEY (id_product) REFERENCES product(id);

ALTER TABLE productDetail ADD CONSTRAINT FK_id_storage_ProductDetail
FOREIGN KEY (id_storage) REFERENCES storage(id);

ALTER TABLE productDetail ADD CONSTRAINT FK_id_tag_ProductDetail
FOREIGN KEY (id_tag) REFERENCES tag(id);

ALTER TABLE productDetail ADD CONSTRAINT FK_id_promotion_ProductDetail
FOREIGN KEY (id_promotion) REFERENCES promotion(id);

ALTER TABLE productAttribute ADD CONSTRAINT FK_id_productDetail_ProductAtribute
FOREIGN KEY (id_productDetail) REFERENCES productDetail(id);

ALTER TABLE review ADD CONSTRAINT FK_id_product_Review
FOREIGN KEY (id_product) REFERENCES product(id);

ALTER TABLE review ADD CONSTRAINT FK_id_customer_Review
FOREIGN KEY (id_customer) REFERENCES customer(id);

ALTER TABLE comment ADD CONSTRAINT FK_id_product_Comment
FOREIGN KEY (id_product) REFERENCES product(id);

ALTER TABLE cart ADD CONSTRAINT FK_id_customer_Cart
FOREIGN KEY (id_customer) REFERENCES customer(id);

ALTER TABLE cartDetail ADD CONSTRAINT FK_id_cart_CartDetail
FOREIGN KEY (id_cart) REFERENCES cart(id);

ALTER TABLE cartDetail ADD CONSTRAINT FK_id_product_CartDetail
FOREIGN KEY (id_product) REFERENCES product(id);

ALTER TABLE cartDetail ADD CONSTRAINT FK_id_product_detail_CartDetail
FOREIGN KEY (id_product_detail) REFERENCES productDetail(id);

ALTER TABLE orders ADD CONSTRAINT FK_id_customer_Order
FOREIGN KEY (id_customer) REFERENCES customer(id);

ALTER TABLE orderDetail ADD CONSTRAINT FK_id_order_OrderDetail
FOREIGN KEY (id_order) REFERENCES orders(id);

ALTER TABLE orderDetail ADD CONSTRAINT FK_id_product_detail_OrderDetail
FOREIGN KEY (id_product_detail) REFERENCES productDetail(id);

ALTER TABLE orderDetail ADD CONSTRAINT FK_id_customer_OrderDetail
FOREIGN KEY (id_customer) REFERENCES customer(id);

ALTER TABLE payment ADD CONSTRAINT FK_id_order_Payment
FOREIGN KEY (id_order) REFERENCES orders(id);



