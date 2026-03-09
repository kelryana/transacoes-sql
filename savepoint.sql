BEGIN;
  UPDATE contas SET saldo = saldo - 100 WHERE nome = 'Alice';
  
  SAVEPOINT ponto1;
  
  UPDATE contas SET saldo = saldo - 100 WHERE nome = 'Alice';
  
  --  erramos (foi de proposito ok) a segunda operação foi errada, volta  até o savepoint
  ROLLBACK TO SAVEPOINT ponto1;
  
  -- A primeira operação ainda vale
  UPDATE contas SET saldo = saldo + 50 WHERE nome = 'Bob'; -- atualizamos 
  
COMMIT;

SELECT * FROM contas;
