create table product
(
	id uuid DEFAULT gen_random_uuid(),
	name text NOT NULL,
	price real,

	PRIMARY KEY(id)
);

create table warehouse
(
	id uuid DEFAULT gen_random_uuid(),
	name text NOT NULL,
	adress text NOT NULL,

	PRIMARY KEY (id)
);

create table product_to_warehouse
(
	product uuid NOT NULL,
	warehouse uuid NOT NULL,
	quantity int NOT NULL DEFAULT 0,

	PRIMARY KEY(product, warehouse),
	FOREIGN KEY (product) 
		REFERENCES product(id)
			ON UPDATE CASCADE 
			ON DELETE CASCADE,
	FOREIGN KEY (warehouse) 
		REFERENCES warehouse(id)
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);

INSERT INTO product(id, name, price) VALUES
	('23b79855-2743-4507-9b37-bec1bf8b9256','Молоко', 60),
	('9c095bcf-72d8-4060-9272-d230c60049b9','Масло', 250),
	('d0b67403-1353-474d-860f-43067bf58637','Хлеб', 35),
	('d0b67403-1353-474d-860f-43067bf54637','Майонез', 170),
	('9c093bcf-72d8-4060-9272-d230c60049b9','Яйца куриные', 130);

INSERT INTO warehouse (id, name, adress) VALUES
	('f6d59aa5-0103-4206-ab3e-3ded3dd8446d','Кашира', 'Каширское шоссе 15'),
	('01a1ef44-d28b-4090-9a74-8f94c64d7d3c','Ярославка', 'Ярославское шоссе 11'),
	('3d1ef72b-44cd-40ab-9818-bd6ebef2b682','Данилов', 'улица Данилова 13');


INSERT INTO product_to_warehouse 
		(product, warehouse, quantity) 
	VALUES
('23b79855-2743-4507-9b37-bec1bf8b9256', 'f6d59aa5-0103-4206-ab3e-3ded3dd8446d', 15),
('23b79855-2743-4507-9b37-bec1bf8b9256', '01a1ef44-d28b-4090-9a74-8f94c64d7d3c', 100),		
('23b79855-2743-4507-9b37-bec1bf8b9256', '3d1ef72b-44cd-40ab-9818-bd6ebef2b682', 120),
('9c095bcf-72d8-4060-9272-d230c60049b9', 'f6d59aa5-0103-4206-ab3e-3ded3dd8446d', 25),
('9c095bcf-72d8-4060-9272-d230c60049b9', '01a1ef44-d28b-4090-9a74-8f94c64d7d3c', 25),		
('9c095bcf-72d8-4060-9272-d230c60049b9', '3d1ef72b-44cd-40ab-9818-bd6ebef2b682', 25),
('d0b67403-1353-474d-860f-43067bf54637', 'f6d59aa5-0103-4206-ab3e-3ded3dd8446d', 73),
('d0b67403-1353-474d-860f-43067bf54637', '01a1ef44-d28b-4090-9a74-8f94c64d7d3c', 27),		
('d0b67403-1353-474d-860f-43067bf54637', '3d1ef72b-44cd-40ab-9818-bd6ebef2b682', 41);


select 
	product.name as Наименование,
	price as Цена,
	quantity as Количество,
	warehouse.name as Склад,
	adress as Адрес_Склада
from
	product_to_warehouse,
	product,
	warehouse
where 
	product.id = product_to_warehouse.product
	AND 
	product_to_warehouse.warehouse = warehouse.id
;
