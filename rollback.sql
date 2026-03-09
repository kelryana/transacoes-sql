BEGIN;
  UPDATE contas SET saldo = saldo - 200 WHERE nome = 'Bob';
  -- aqui vai dar erro, pois ira tentar sacar mais dinheiro do que se tem
  UPDATE contas SET saldo = saldo - 10000 WHERE nome = 'Bob';
ROLLBACK;

SELECT * FROM contas;