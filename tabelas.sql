BEGIN;
  UPDATE contas SET saldo = saldo - 300 WHERE nome = 'Alice';
  UPDATE contas SET saldo = saldo + 300 WHERE nome = 'Bob';
COMMIT;

SELECT * FROM contas;