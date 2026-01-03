-- SEEDER
-- ==========

INSERT INTO customers (id, name, email, country) VALUES
(1, 'Andi Wijaya', 'andi@mail.com', 'Indonesia'),
(2, 'Budi Santoso', 'budi@mail.com', 'Indonesia'),
(3, 'Citra Lestari', 'citra@mail.com', 'Indonesia'),
(4, 'Dewi Anggraini', 'dewi@mail.com', 'Singapore'),
(5, 'Eko Pratama', 'eko@mail.com', 'Malaysia'),
(6, 'Fajar Nugroho', 'fajar@mail.com', 'Indonesia'),
(7, 'Grace Tan', 'grace@mail.com', 'Singapore');

INSERT INTO orders (id, customer_id, product, amount, created_at) VALUES
-- Januari
(1, 1, 'Laptop', 15000000, '2024-01-05'),
(2, 2, 'Mouse', 250000, '2024-01-10'),
(3, 1, 'Keyboard', 750000, '2024-01-20'),

-- Februari
(4, 3, 'Monitor', 3000000, '2024-02-02'),
(5, 1, 'Headset', 500000, '2024-02-15'),
(6, 4, 'Laptop', 16000000, '2024-02-18'),

-- Maret
(7, 2, 'Laptop', 14500000, '2024-03-01'),
(8, 5, 'Tablet', 5000000, '2024-03-05'),
(9, 1, 'Mouse', 300000, '2024-03-12'),

-- April
(10, 6, 'Laptop', 15500000, '2024-04-01'),
(11, 3, 'Keyboard', 700000, '2024-04-10'),

-- Mei
(12, 7, 'Monitor', 3200000, '2024-05-03'),
(13, 2, 'Headset', 600000, '2024-05-20');
