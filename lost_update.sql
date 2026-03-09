-- lost update (perdeu os coisos la)


-- aba 1:
BEGIN;
  SELECT saldo FROM contas WHERE nome = 'Alice';
  -- ver o saldo = 1000
  UPDATE contas SET saldo = 1200 WHERE nome = 'Alice'; -- atulizando o saldo
COMMIT;

-- aba 2
BEGIN;
  SELECT saldo FROM contas WHERE nome = 'Alice';
 
  UPDATE contas SET saldo = 1500 WHERE nome = 'Alice';
COMMIT;
-- Um dos updates vai ser perdido (propositalmente, pq é um teste)

-- isolamento p/a evitar b.o
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
  SELECT saldo FROM contas WHERE nome = 'Alice' FOR UPDATE;
  UPDATE contas SET saldo = 1200 WHERE nome = 'Alice';
COMMIT;
