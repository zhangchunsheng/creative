-- 2011-12-06
create database gtrl_buyVegetables;

create table gtrl_user(
	id int(10) not null auto_increment comment '用户标识',
	registerType enum('1','2') not null default '1' comment '1 - 新浪微博 2 - 注册用户',
	loginName varchar(60) not null default '' comment '登录名',
	password varchar(60) not null default '' comment '密码',
	userName varchar(16) not null default '' comment '姓名',
	sex enum('0','1','2') not null default '0' comment '0 - 保密 1 - 男 2 - 女',
	sinaWeiboId varchar(60) not null default '' comment '新浪ID',
	androidId varchar(60) not null default '' comment '设备ID',
	email varchar(60) not null default '0' comment '邮箱',
	qq int(10) not null default 0 comment 'QQ',
	passwordInfo varchar(16) not null default '' comment 'passwordInfo',
	registerDate int(10) not null default 0 comment '注册日期',
	loginDate int(10) not null default 0 comment '登录日期',
	loginCount int(10) not null default 0 comment '连续登陆次数',
	primary key(id),
	index index_registerType(registerType),
	index index_loginName(loginName),
	index index_password(password),
	index index_sinaWeiboId(sinaWeiboId),
	index index_email(email),
	index index_qq(qq),
	index index_registerDate(registerDate),
	index index_loginDate(loginDate)
) engine=InnoDB default charset=utf8;

create table gtrl_friends(
	id int(10) not null auto_increment comment 'ID',
	userId int(10) not null default 0 comment '用户标识',
	friendId int(10) not null default 0 comment '好友ID',
	primary key(id),
	index index_userId(userId),
	index index_friendId(friendId)
) engine=InnoDB default charset=utf8;

create table gtrl_vegetables(
	id int(10) not null auto_increment comment 'vegetablesId',
	vegetablesName varchar(16) not null default '' comment '蔬菜名',
	updateDate int(10) not null default 0 comment '更新日期',
	primary key(id),
	index index_vegetablesName(vegetablesName)
) engine=InnoDB default charset=utf8;

create table gtrl_fruits(
	id int(10) not null auto_increment comment 'fruitId',
	fruitName varchar(16) not null default '' comment '水果名',
	updateDate int(10) not null default 0 comment '更新日期',
	primary key(id),
	index index_fruitName(fruitName)
) engine=InnoDB default charset=utf8;

create table gtrl_userBuyVegetables(
	id int(10) not null auto_increment comment 'id',
	userId int(10) not null default 0 comment '用户标识',
	androidId varchar(60) not null default '' comment '设备信息',
	vegetablesId int(10) not null default 0 comment '蔬菜ID',
	price int(10) not null default 0 comment '价格',
	date int(10) not null default 0 comment '日期',
	location varchar(160) not null default '' comment '地点',
	bz enum('1','2') not null default '1' comment '1 - 未同步 2 - 已同步',
	primary key(id),
	index index_userId(userId),
	index index_vegetablesId(vegetablesId),
	index index_price(price),
	index index_date(date),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_userBuyFruit(
	id int(10) not null auto_increment comment 'id',
	userId int(10) not null default 0 comment '用户标识',
	androidId varchar(60) not null default '' comment '设备信息',
	fruitId int(10) not null default 0 comment '水果ID',
	price int(10) not null default 0 comment '价格',
	date int(10) not null default 0 comment '日期',
	location varchar(160) not null default '' comment '地点',
	bz enum('1','2') not null default '1' comment '1 - 未同步 2 - 已同步',
	primary key(id),
	index index_userId(userId),
	index index_fruitId(fruitId),
	index index_price(price),
	index index_date(date),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_cpi(
	id int(10) not null auto_increment comment 'ID',
	year int(4) not null default 0 comment '年份',
	month int(2) not null default 0 comment '月份',
	percent float(10) not null default 0 comment '百分比',
	bz enum('0','1','2') not null default '' comment '0 - 持平 1 - 上涨 2 - 下降',
	primary key(id),
	index index_year(year),
	index index_month(month),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_userLoginLog(
	id int(10) not null auto_increment comment 'id',
	userId int(10) not null default 0 comment '用户标识',
	loginDate int(10) not null default 0 comment '登录时间',
	loginCount int(10) not null default 0 comment '当天登录次数',
	primary key(id),
	index index_userId(userId),
	index index_loginDate(loginDate)
) engine=InnoDB default charset=utf8;
-- 2011-12-07
create table gtrl_userBuyVegetables(
	id int(10) not null auto_increment comment 'id',
	userId int(10) not null default 0 comment '用户标识',
	androidId varchar(60) not null default '' comment '设备信息',
	vegetablesId int(10) not null default 0 comment '蔬菜ID',
	price float(10) not null default 0 comment '价格',
	consumeMoney float(10) not null default 0 comment '消费金额',
	date int(10) not null default 0 comment '日期',
	location varchar(160) not null default '' comment '地点',
	longitude varchar(60) not null default '' comment '经度',
	latitude varchar(60) not null default '' comment '纬度',
	bz enum('1','2') not null default '1' comment '1 - 未同步 2 - 已同步',
	primary key(id),
	index index_userId(userId),
	index index_vegetablesId(vegetablesId),
	index index_price(price),
	index index_date(date),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_userBuyFruit(
	id int(10) not null auto_increment comment 'id',
	userId int(10) not null default 0 comment '用户标识',
	androidId varchar(60) not null default '' comment '设备信息',
	fruitId int(10) not null default 0 comment '水果ID',
	price float(10) not null default 0 comment '价格',
	consumeMoney float(10) not null default 0 comment '消费金额',
	date int(10) not null default 0 comment '日期',
	marketName varchar(60) not null default '' comment '市场名称',
	location varchar(160) not null default '' comment '地点',
	longitude varchar(60) not null default '' comment '经度',
	latitude varchar(60) not null default '' comment '纬度',
	comment varchar(100) not null default '' comment '备注',
	bz enum('1','2') not null default '1' comment '1 - 未同步 2 - 已同步',
	primary key(id),
	index index_userId(userId),
	index index_fruitId(fruitId),
	index index_price(price),
	index index_date(date),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_state(
	id int(10) not null auto_increment comment 'ID',
	stateCode varchar(60) not null default '' comment '地区编号',
	stateName varchar(60) not null default '' comment '地区名称',
	parentId int(10) not null default 0 comment '上级地区ID',
	bz enum('1','2') not null default '1' comment '1 - 可见 2 - 隐藏',
	primary key(id),
	index index_stateCode(stateCode),
	index index_parentId(parentId),
	index index_bz(bz)
) engine=InnoDB default charset=utf8;

create table gtrl_vegetablesMarket(
	id int(10) not null auto_increment comment 'ID',
	marketName varchar(60) not null default '' comment '市场名称',
	stateCode varchar(60) not null default '' comment '地区编号',
	address varchar(160) not null default '' comment '详细地址',
	coordinate varchar(160) not null default '' comment '坐标',
	longitude varchar(60) not null default '' comment '经度',
	latitude varchar(60) not null default '' comment '纬度',
	bz enum('1','2') not null default '1' comment '1 - 可见 2 - 隐藏',
	primary key(id),
	index index_stateCode(stateCode),
	index index_coordinate(coordinate),
	index index_longitude(longitude),
	index index_latitude(latitude),
	index index_bz(bz)
);