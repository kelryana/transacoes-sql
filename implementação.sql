-- reset para o inicio (la de quando foi criado as tabelas)

UPDATE contas SET saldo = 1000 WHERE nome = 'Alice';
UPDATE contas SET saldo = 500  WHERE nome = 'Bob';
UPDATE contas SET saldo = 2000 WHERE nome = 'Carol';

-- compra 

BEGIN;
  -- verifica estoque (leitura)
  
  SELECT saldo FROM contas WHERE nome = 'Alice' FOR UPDATE;
  
  -- processa 
  
  UPDATE contas SET saldo = saldo - 150 WHERE nome = 'Alice';
  
  -- registra
  
  INSERT INTO log_transacoes (operacao, valor) 
  VALUES ('Compra realizada por Alice', 150);
  
  
  UPDATE contas SET saldo = saldo + 150 WHERE nome = 'Carol';

COMMIT;

--  final

SELECT * FROM contas;
SELECT * FROM log_transacoes;