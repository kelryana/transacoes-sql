--  serial: t1 completa --> depois t2
BEGIN;
  -- t1 
  UPDATE contas SET saldo = saldo - 50 WHERE nome = 'Alice';
  UPDATE contas SET saldo = saldo + 50 WHERE nome = 'Bob';
COMMIT;

BEGIN;
  -- t2
  UPDATE contas SET saldo = saldo * 0.9 WHERE nome = 'Alice';
COMMIT;

SELECT * FROM contas;