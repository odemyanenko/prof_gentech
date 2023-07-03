create database aircompany;

use aircompany;

create table passengers (
	id integer primary key,
	name varchar(128),
	age_group integer
);

insert into passengers(id, name, age_group) values(1, 'Анатолий', 	1);
insert into passengers(id, name, age_group) values(2, 'Степан', 	2);
insert into passengers(id, name, age_group) values(3, 'Ольга', 		2);
insert into passengers(id, name, age_group) values(4, 'Светлана', 	3);
insert into passengers(id, name, age_group) values(5, 'Александр', 	1);
insert into passengers(id, name, age_group) values(6, 'Аркадий', 	2);
insert into passengers(id, name, age_group) values(7, 'Григорий', 	1);


create table flying (
	id integer primary key,
	point_from varchar(128),
	point_to varchar(128),
	flight_time integer,
	price integer
);


insert into flying(id, point_from, point_to, flight_time, price) values(1, 'Москва', 		'Киев', 		180, 12000);
insert into flying(id, point_from, point_to, flight_time, price) values(2, 'Киев', 			'Ереван',	 	310, 17000);
insert into flying(id, point_from, point_to, flight_time, price) values(3, 'Минск', 		'Москва', 		100, 7000);
insert into flying(id, point_from, point_to, flight_time, price) values(4, 'Минск', 		'Ереван', 		270, 15000);
insert into flying(id, point_from, point_to, flight_time, price) values(5, 'Москва', 		'Минск', 		170, 8000);
insert into flying(id, point_from, point_to, flight_time, price) values(6, 'Ереван', 		'Ставрополь', 	90,  10000);
insert into flying(id, point_from, point_to, flight_time, price) values(7, 'Ставрополь', 	'Москва', 		190, 12000);





create table fly_mapping (
	id integer primary key,
	passenger_id integer,
	flying_id integer
);

insert into fly_mapping(id, passenger_id, flying_id) values(1	, 6, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(2	, 1, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(3	, 3, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(4	, 4, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(5	, 5, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(6	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(7	, 7, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(8	, 6, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(9	, 1, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(10	, 6, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(11	, 1, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(12	, 3, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(13	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(14	, 1, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(15	, 2, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(16	, 1, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(17	, 6, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(18	, 4, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(19	, 3, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(20	, 6, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(21	, 2, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(22	, 7, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(23	, 6, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(24	, 5, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(25	, 7, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(26	, 4, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(27	, 2, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(28	, 1, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(29	, 2, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(30	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(31	, 2, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(32	, 7, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(33	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(34	, 5, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(35	, 5, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(36	, 7, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(37	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(38	, 5, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(39	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(40	, 5, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(41	, 3, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(42	, 2, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(43	, 3, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(44	, 3, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(45	, 6, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(46	, 3, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(47	, 5, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(48	, 5, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(49	, 2, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(50	, 5, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(51	, 4, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(52	, 2, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(53	, 6, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(54	, 6, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(55	, 3, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(56	, 6, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(57	, 6, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(58	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(59	, 2, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(60	, 2, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(61	, 6, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(62	, 4, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(63	, 4, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(64	, 5, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(65	, 7, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(66	, 6, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(67	, 3, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(68	, 3, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(69	, 2, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(70	, 2, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(71	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(72	, 2, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(73	, 3, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(74	, 7, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(75	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(76	, 6, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(77	, 6, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(78	, 6, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(79	, 4, 7);
insert into fly_mapping(id, passenger_id, flying_id) values(80	, 5, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(81	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(82	, 1, 6);
insert into fly_mapping(id, passenger_id, flying_id) values(83	, 2, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(84	, 4, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(85	, 6, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(86	, 6, 1);
insert into fly_mapping(id, passenger_id, flying_id) values(87	, 5, 2);
insert into fly_mapping(id, passenger_id, flying_id) values(88	, 2, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(89	, 5, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(90	, 6, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(91	, 5, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(92	, 4, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(93	, 2, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(94	, 6, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(95	, 7, 3);
insert into fly_mapping(id, passenger_id, flying_id) values(96	, 5, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(97	, 2, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(98	, 4, 5);
insert into fly_mapping(id, passenger_id, flying_id) values(99	, 7, 4);
insert into fly_mapping(id, passenger_id, flying_id) values(100	, 3, 4);



