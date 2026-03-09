-- agora, criar outra regra, so q dessa vez um poco mais complexa

create table clientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL
);

create table pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES clientes(id),
	valor DECIMAL (10,2)
);

-- vo tentar criar pedido sem cliente (e violando a integridade)
INSERT INTO pedidos (cliente_id, valor) VALUES (999, 100.00);
-- da erro ne, pq esse cliente nem tem, JUMENTO