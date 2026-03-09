BEGIN;
  UPDATE contas SET saldo = saldo - 100 WHERE nome = 'Alice';
  
  SAVEPOINT ponto1;
  
  UPDATE contas SET saldo = saldo - 100 WHERE nome = 'Alice'; --simulação de erro

  ROLLBACK TO SAVEPOINT ponto1;
