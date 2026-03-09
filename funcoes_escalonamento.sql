
CREATE OR REPLACE FUNCTION transferir(
  de_conta VARCHAR,
  para_conta VARCHAR,
  valor DECIMAL
) RETURNS TEXT AS $$
BEGIN
  --  saldo
  IF (SELECT saldo FROM contas WHERE nome = de_conta) < valor THEN
    INSERT INTO log_transacoes (operacao, valor) 
    VALUES ('FALHA - saldo insuficiente em ' || de_conta, valor);
    RETURN 'ERRO: Saldo insuficiente';
  END IF;

  --  transferência
  UPDATE contas SET saldo = saldo - valor WHERE nome = de_conta;
  UPDATE contas SET saldo = saldo + valor WHERE nome = para_conta;
  
  --  log
  INSERT INTO log_transacoes (operacao, valor) 
  VALUES ('Transferência de ' || de_conta || ' para ' || para_conta, valor);
  
  RETURN 'OK: Transferência realizada';
  
EXCEPTION WHEN OTHERS THEN
  INSERT INTO log_transacoes (operacao, valor) 
  VALUES ('ERRO: ' || SQLERRM, valor);
  RAISE;
END;
$$ LANGUAGE plpgsql;
