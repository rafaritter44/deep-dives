-- SELECT in WITH
insert into "order" (region, product, quantity, amount)
values ('US', 'Book',  10, 199.90),
       ('US', 'Gun',   50, 24999.50),
       ('US', 'Gun',   20, 9999.80),
       ('US', 'Knife', 15, 1499.85),
       ('PL', 'Book',  30, 599.70),
       ('PH', 'Knife', 50, 4999.50),
       ('PH', 'Knife', 25, 2499.75);

-- Recursive query
insert into part (part, subpart, quantity)
values ('our_product',    'sub_assembly_1', 2),
       ('our_product',    'sub_assembly_2', 1),
       ('sub_assembly_1', 'raw_material_A', 3),
       ('sub_assembly_1', 'raw_material_B', 2),
       ('sub_assembly_2', 'raw_material_A', 5),
       ('raw_material_A', 'screw',          4);

-- Tree traversal
insert into tree (id, link, data)
values (1, null, 'Root'),
       (2, 1,    'A'),
       (3, 1,    'B'),
       (4, 2,    'A1'),
       (5, 2,    'A2'),
       (6, 3,    'B1'),
       (7, 4,    'A1a');