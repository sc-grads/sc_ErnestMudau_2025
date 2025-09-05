CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    est_delivery TIMESTAMP NOT NULL,
    CHECK (created_at < est_delivery)


INSERT INTO orders (name,created_at, est_delivery)
VALUES('Shirt', '2000-NOV-20 01:00AM','2000-NOV-25 O1:00AM')