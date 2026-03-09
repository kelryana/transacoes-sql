

-- Test
SELECT transferir('Alice', 'Bob', 100);
SELECT transferir('Bob', 'Carol', 99999); -- Vai falhar
SELECT * FROM contas;
SELECT * FROM log_transacoes;