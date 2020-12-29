SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX idx_user ON app_user;
DROP INDEX idx_contact ON employee;
DROP INDEX idx_project ON project;



/* Drop Tables */

DROP TABLE IF EXISTS about;
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS contact_detail;
DROP TABLE IF EXISTS contact;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS img_thumbnail;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS slider;




/* Create Tables */

CREATE TABLE about
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- Type:
	-- Ceo: CEO Message
	-- His: History
	about_type varchar(3) COMMENT 'Type:
Ceo: CEO Message
His: History',
	description varchar(1000),
	ceo_photo varchar(100),
	-- Description (KR)
	description_kr varchar(1000) COMMENT 'Description (KR)',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE app_user
(
	id bigint unsigned NOT NULL AUTO_INCREMENT,
	username varchar(50) NOT NULL,
	password varchar(50),
	fullname varchar(100),
	-- Khóa tài khoản
	account_locked tinyint(1) unsigned COMMENT 'Khóa tài khoản',
	PRIMARY KEY (id),
	UNIQUE (username)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE contact
(
	id bigint NOT NULL AUTO_INCREMENT,
	address varchar(100),
	phone varchar(100),
	email varchar(30),
	-- 0: Không
	-- 1: Có
	main_branch tinyint(1) COMMENT '0: Không
1: Có',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE contact_detail
(
	id bigint NOT NULL AUTO_INCREMENT,
	contact_id bigint NOT NULL,
	name varchar(50),
	email varchar(30),
	phone varchar(20),
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE employee
(
	id bigint unsigned NOT NULL AUTO_INCREMENT,
	-- Họ tên
	name varchar(100) COMMENT 'Họ tên',
	position varchar(15),
	-- type: 
	-- ar: Architech and Construction
	-- id: Interior design and construction
	project_type varchar(10) COMMENT 'type: 
ar: Architech and Construction
id: Interior design and construction',
	project tinytext,
	avatar_url varchar(200),
	-- Vị trí: (Korea).
	position_kr varchar(100) COMMENT 'Vị trí: (Korea).',
	-- Profile (KR): 
	profile_kr tinytext COMMENT 'Profile (KR): ',
	-- Project (KR)
	project_kr tinytext COMMENT 'Project (KR)',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE img_thumbnail
(
	id bigint unsigned NOT NULL AUTO_INCREMENT,
	project_id bigint unsigned NOT NULL,
	img_url varchar(100),
	-- Sắp xếp hiển thị
	sort int COMMENT 'Sắp xếp hiển thị',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE project
(
	id bigint unsigned NOT NULL AUTO_INCREMENT,
	name varchar(50),
	title varchar(500),
	-- Title (KR)
	title_kr varchar(100) COMMENT 'Title (KR)',
	-- type: 
	-- ar: Architech and Construction
	-- id: Interior design and construction
	project_type varchar(10) COMMENT 'type: 
ar: Architech and Construction
id: Interior design and construction',
	-- - Chi tiết loại project:
	-- Hotel, Bank....
	project_catelogy_type varchar(20) COMMENT '- Chi tiết loại project:
Hotel, Bank....',
	description varchar(1000),
	description_kr varchar(1000),
	-- Hiển thị trang chủ:
	-- 0: Không
	-- 1: Có
	is_display tinyint(1) COMMENT 'Hiển thị trang chủ:
0: Không
1: Có',
	location varchar(100),
	-- vị trí (KR)
	location_kr varchar(100) COMMENT 'vị trí (KR)',
	-- Diện tích bao gồm cả đơn vị
	square varchar(30) COMMENT 'Diện tích bao gồm cả đơn vị',
	budget bigint,
	-- Đối tác
	partner varchar(100) COMMENT 'Đối tác',
	-- kỹ sự dự án
	architech varchar(100) COMMENT 'kỹ sự dự án',
	slider_img_url varchar(100),
	-- Loại hình sử dụng: hotel, ...
	principle_use varchar(100) COMMENT 'Loại hình sử dụng: hotel, ...',
	-- Quy mô
	scale varchar(100) COMMENT 'Quy mô',
	-- Quy mô (KR)
	scale_kr varchar(100) COMMENT 'Quy mô (KR)',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE slider
(
	id bigint NOT NULL AUTO_INCREMENT,
	title varchar(30),
	-- Tiêu đề (KR)
	title_kr varchar(30) COMMENT 'Tiêu đề (KR)',
	description varchar(100),
	-- Mô tả (KR)
	description_kr varchar(100) COMMENT 'Mô tả (KR)',
	slider_img_url varchar(100),
	-- Thứ tự hiển thị
	sort int COMMENT 'Thứ tự hiển thị',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8;



/* Create Foreign Keys */

ALTER TABLE contact_detail
	ADD FOREIGN KEY (contact_id)
	REFERENCES contact (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE img_thumbnail
	ADD FOREIGN KEY (project_id)
	REFERENCES project (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Create Indexes */

CREATE INDEX idx_user ON app_user (id ASC, username ASC);
CREATE INDEX idx_contact ON employee (id ASC, position ASC, project_type ASC);
CREATE INDEX idx_project ON project (id ASC, name ASC, project_type ASC);



