CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT ,
    quantity INT ,
    cost int
);

INSERT INTO items (name, quantity, cost) VALUES
('Item A', 15, 75),
('Item B', 30, 40);


