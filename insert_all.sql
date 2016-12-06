CREATE  OR REPLACE
FUNCTION insert_fuels()
  RETURNS INT AS
$$
BEGIN
  INSERT INTO fuels (mark, price, created_at, updated_at) VALUES ('A-98', 26, now(), now());
  INSERT INTO fuels (mark, price, created_at, updated_at) VALUES ('A-95+', 24, now(), now());
  INSERT INTO fuels (mark, price, created_at, updated_at) VALUES ('A-95', 23, now(), now());
  INSERT INTO fuels (mark, price, created_at, updated_at) VALUES ('A-92', 22, now(), now());
  RETURN 0;
END ;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE
FUNCTION insert_sub_destination(n INT, name_ VARCHAR)
  RETURNS INT AS
$$
DECLARE
  market      VARCHAR;
  srorage      VARCHAR;
  enterprise   VARCHAR;
  raw_producer VARCHAR;
  tmp_n        INT;
  counter      INT;
BEGIN
  tmp_n := (trunc(random() * (n/2)) + n/2);
  counter := 1;
  WHILE tmp_n > 0 LOOP
    INSERT INTO destinations (name, created_at, updated_at, address
    ) VALUES (concat(name_, counter), now(), now(), concat('Місто ', trunc(random() * 10) + 1));
    counter := counter + 1;
    tmp_n := tmp_n - 1;
  END LOOP;
  raw_producer := 'Виробник сировини №';
  enterprise := 'Підприємство по переробці №';
  srorage := 'Склад №';
  market := 'Магазин №';
  CASE name_
    WHEN raw_producer THEN
    INSERT INTO raw_producers (destination_id, created_at, updated_at)
      SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN enterprise THEN
    INSERT INTO enterprises (destination_id, created_at, updated_at)
      SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN srorage THEN
    INSERT INTO storages (destination_id, created_at, updated_at)
      SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN market THEN INSERT INTO markets (destination_id, created_at, updated_at)
    SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
  END CASE ;
  RETURN 0;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE
FUNCTION insert_destinations(n INT)
  RETURNS INT AS
$$
BEGIN
  PERFORM insert_sub_destination(n, 'Виробник сировини №');
  PERFORM insert_sub_destination(n, 'Підприємство по переробці №');
  PERFORM insert_sub_destination(n, 'Склад №') ;
  PERFORM insert_sub_destination(n, 'Магазин №');
  RETURN 0;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_all()
  RETURNS INT AS
$$
BEGIN
  DELETE FROM truck_for_productions;
  DELETE FROM truck_for_raws;
  DELETE FROM trucks;
  DELETE FROM raw_producers;
  DELETE FROM enterprises;
  DELETE FROM storages;
  DELETE FROM markets;
  DELETE FROM destinations;

  DELETE FROM productions;
  DELETE FROM raws;
  DELETE FROM cargoes;
  RETURN 0;
END;
$$ LANGUAGE plpgsql;
SELECT delete_all();

CREATE OR REPLACE FUNCTION test_case(name_ VARCHAR)
  RETURNS TABLE (
    id_ INTEGER,
    date1 TIMESTAMPTZ,
    date2 TIMESTAMPTZ
  ) AS
$$
DECLARE
  market      VARCHAR;
  srorage      VARCHAR;
  enterprise   VARCHAR;
  raw_producer VARCHAR;
BEGIN
  raw_producer := 'Виробник сировини №';
  enterprise := 'Підприємство по переробці №';
  srorage := 'Склад №';
  market := 'Магазин №';
  CASE name_
    WHEN market
    THEN RETURN QUERY SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN srorage
    THEN RETURN QUERY SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN enterprise
    THEN RETURN QUERY SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
    WHEN raw_producer
    THEN RETURN QUERY SELECT id, now(), now() FROM destinations WHERE name LIKE concat(name_, '%');
  ELSE NULL ;
  END CASE ;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION test_case(VARCHAR);
SELECT * from test_case('Виробник сировини №');
SELECT * from test_case('Підприємство по переробці №');
SELECT * from test_case('Склад №') ;
SELECT * from test_case('Магазин №');
SELECT insert_destinations(30);
SELECT insert_fuels();

CREATE OR REPLACE FUNCTION insert_trucks(rand_dest_num INTEGER, quant INTEGER)
  RETURNS SETOF trucks AS
$$
DECLARE
  enterprise RECORD;
  storage_ RECORD;
  counter INTEGER;
  tmp_n INTEGER;
  t_id INTEGER;
BEGIN
  counter := 1;
  FOR enterprise IN SELECT id FROM enterprises ORDER BY random() LIMIT trunc(random() * (rand_dest_num / 3)) LOOP
    tmp_n := (trunc(random() * (quant/2)) + quant/2);
    WHILE tmp_n > 0 LOOP
      INSERT INTO trucks (name, number, mark, fuel_consumption, capacity_fuel, average_speed, created_at, updated_at, fuel_id)
      VALUES (concat('Вантажна машина №', counter), concat('NN ', counter), concat('Марка ', trunc(random() * 10) + 1),
              trunc(random() * 5) + 6, trunc(random() * 7) + 8, trunc(random() * 30) + 50, now(), now(),
              (SELECT id FROM fuels ORDER BY random() LIMIT 1)
      ) RETURNING id INTO t_id;
      INSERT INTO truck_for_raws (capacity, truck_id, created_at, updated_at, enterprise_id)
      VALUES (trunc(random()*15 + 20), t_id, now(), now(), enterprise.id);
      counter := counter + 1;
      tmp_n := tmp_n - 1;
    END LOOP;
  END LOOP;

  FOR enterprise IN SELECT id FROM enterprises ORDER BY random() LIMIT trunc(random() * (rand_dest_num / 3)) LOOP
    tmp_n := (trunc(random() * (quant/2)) + quant/2);
    WHILE tmp_n > 0 LOOP
      INSERT INTO trucks (name, number, mark, fuel_consumption, capacity_fuel, average_speed, created_at, updated_at, fuel_id)
      VALUES (concat('Вантажна машина №', counter), concat('NN ', counter), concat('Марка ', trunc(random() * 10) + 1),
              trunc(random() * 5) + 6, trunc(random() * 7) + 8, trunc(random() * 30) + 50, now(), now(),
              (SELECT id FROM fuels ORDER BY random() LIMIT 1)
      ) RETURNING id INTO t_id;
      INSERT INTO truck_for_productions (capacity, truck_id, created_at, updated_at, enterprise_id)
      VALUES (trunc(random()*15 + 20), t_id, now(), now(), enterprise.id);
      counter := counter + 1;
      tmp_n := tmp_n - 1;
    END LOOP;
  END LOOP;

  FOR storage_ IN SELECT id FROM storages ORDER BY random() LIMIT trunc(random() * (rand_dest_num / 3)) LOOP
    tmp_n := (trunc(random() * (quant/2)) + quant/2);
    WHILE tmp_n > 0 LOOP
      INSERT INTO trucks (name, number, mark, fuel_consumption, capacity_fuel, average_speed, created_at, updated_at, fuel_id)
      VALUES (concat('Вантажна машина №', counter), concat('NN ', counter), concat('Марка ', trunc(random() * 10) + 1),
              trunc(random() * 5) + 6, trunc(random() * 7) + 8, trunc(random() * 30) + 50, now(), now(),
              (SELECT id FROM fuels ORDER BY random() LIMIT 1)
      ) RETURNING id INTO t_id;
      INSERT INTO truck_for_productions (capacity, truck_id, created_at, updated_at, storage_id)
      VALUES (trunc(random()*15 + 20), t_id, now(), now(), storage_.id);
      counter := counter + 1;
      tmp_n := tmp_n - 1;
    END LOOP;
  END LOOP;

  RETURN QUERY SELECT * FROM trucks;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM insert_trucks(20, 7);


CREATE OR REPLACE FUNCTION insert_cargoes(quant INTEGER)
  RETURNS SETOF cargoes AS
$$
DECLARE
  counter INTEGER;
  tmp_n INTEGER;
  c_id INTEGER;
  w INTEGER;
BEGIN
  counter := 1;
  tmp_n := (trunc(random() * (quant/2)) + quant/2);
  w := trunc(random() * 3) + 1;
  INSERT INTO cargoes (name, created_at, updated_at, number, capacity, weight)
  VALUES (concat('Молоко ', counter), now(), now(), concat('CNN ', counter), w,
          w) RETURNING id INTO c_id;
  INSERT INTO raws (capacity, cargo_id, created_at, updated_at)
  VALUES (w, c_id, now(), now());

  WHILE tmp_n > 0 LOOP
    w := trunc(random() * 3) + 1;
    INSERT INTO cargoes (name, created_at, updated_at, number, capacity, weight)
    VALUES (concat('Масло №', counter), now(), now(), concat('CNN ', counter), w,
            w) RETURNING id INTO c_id;
    INSERT INTO productions (name, category, cargo_id, created_at, updated_at)
    VALUES (concat('Масло №', counter), 'Масло ', c_id, now(), now());
    counter := counter + 1;
    tmp_n := tmp_n - 1;
  END LOOP;

  tmp_n := (trunc(random() * (quant/2)) + quant/2);
  WHILE tmp_n > 0 LOOP
    w := trunc(random() * 3) + 1;
    INSERT INTO cargoes (name, created_at, updated_at, number, capacity, weight)
    VALUES (concat('Сир №', counter), now(), now(), concat('CNN ', counter), w,
            w) RETURNING id INTO c_id;
    INSERT INTO productions (name, category, cargo_id, created_at, updated_at)
    VALUES (concat('Сир №', counter), 'Сир', c_id, now(), now());
    counter := counter + 1;
    tmp_n := tmp_n - 1;
  END LOOP;

  RETURN QUERY SELECT * FROM cargoes;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM insert_cargoes(10);

