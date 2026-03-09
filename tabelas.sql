create table contas (
id SERIAL PRIMARY KEY,
nome VARCHAR(50),
saldo DECIMAL(10,2),
CONSTRAINT saldo_positivo CHECK (saldo>= 0)
);

create table log_transacoes (
id SERIAL PRIMARY KEY,
operacao TEXT,
valor DECIMAL (10,2),
data_hora TIMESTAMP DEFAULT NOW()
);

insert into contas (nome, saldo) VALUES
('Alice', 1000.00),
('BoB', 500.00),
('Carol', 2000.00);

select * from contas;