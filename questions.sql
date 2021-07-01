INSERT INTO
  empregado (
    cod_empregado,
    nome_empregado,
    rua,
    cidade,
    salario
  )
VALUES
  (0666,'Luciane','Rua Gregório Vale','Monte Carlo',5000),
  (0667, 'Fulano', 'Av. Coronel das botas', 'São Paulo', 4000),
  (0668, 'Cicano', 'Rua Alvarez Ernandez', 'San Diego', 16500),
  (0669, 'Cigano', 'Av. Oswaldo Valesco', 'Vancouver', 3500);

INSERT INTO
  companhia (cod_companhia, cnpj, nome_companhia, cidade)
VALUES
  (0000, '42343423436', 'LinkApi', 'São Paulo'),
  (0001, '42344662534', 'Vigo', 'caicó'),
  (0002, '68687625767', 'ByteSerido', 'caicó'),
  (0003, '65284578275', 'Soft Sell', 'Natal');

INSERT INTO
  trabalha (cod_empregado, cod_companhia)
VALUES
  (0667, 0000),
  (0666, 0001),
  (0668, 0003),
  (0669, 0002);

INSERT INTO
  gerente (cod_empregado, cod_companhia)
VALUES
  (0667, 0000),
  (0666, 0001);
