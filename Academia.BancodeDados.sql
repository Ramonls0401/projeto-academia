DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS mensalidades;


CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);


CREATE TABLE mensalidades (
    id_mensalidade INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    valor REAL NOT NULL,
    data_pagamento TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');


INSERT INTO mensalidades (id_cliente, valor, data_pagamento) VALUES
(1, 100.0, '2025-05-01'),
(2, 120.0, '2025-05-02');



-- Total pago por cliente
SELECT clientes.nome, SUM(mensalidades.valor) AS total_pago
FROM clientes
JOIN mensalidades ON clientes.id_cliente = mensalidades.id_cliente
GROUP BY clientes.id_cliente;

-- Clientes com mensalidades acima de R$100
SELECT clientes.nome, mensalidades.valor
FROM clientes
JOIN mensalidades ON clientes.id_cliente = mensalidades.id_cliente
WHERE mensalidades.valor > 100;


SELECT clientes.nome, mensalidades.valor
FROM clientes
JOIN mensalidades ON clientes.id_cliente = mensalidades.id_cliente;

-- Estatísticas
SELECT SUM(valor) AS total_pago FROM mensalidades;
SELECT AVG(valor) AS media_mensalidades FROM mensalidades;
SELECT MAX(valor) AS maior_mensalidade FROM mensalidades;
SELECT MIN(valor) AS menor_mensalidade FROM mensalidades;
