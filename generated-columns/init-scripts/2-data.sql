insert into person (overridable_id, height_cm, weight_kg)
values (default, 170, 65),
       (0, 180, 75),
       (default, 160, 55);

insert into person (generated_id, height_cm, weight_kg)
overriding system value
values (0, 175, 70),
       (default, 165, 60);