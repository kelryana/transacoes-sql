BEGIN;
  UPDATE contas SET saldo = saldo - 9999 WHERE nome = 'Alice';
COMMIT;
-- o postgresql vai rejeitar porque viola o --> check (saldo >=0)  

SELECT * FROM contas;
