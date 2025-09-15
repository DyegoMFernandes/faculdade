CREATE TABLE Materia (
  idMateria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nomeMateria VARCHAR(40) NOT NULL UNIQUE,
  PRIMARY KEY(idMateria)
);

CREATE TABLE TipoAtividade (
  idTipoAtividade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(30) NOT NULL UNIQUE,
  PRIMARY KEY(idTipoAtividade)
);

CREATE TABLE TipoProva (
  idTipoProva INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(30) NOT NULL UNIQUE,
  PRIMARY KEY(idTipoProva)
);

CREATE TABLE Cursos (
  idCursos INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Materia_idMateria INTEGER UNSIGNED NOT NULL,
  nomeCurso VARCHAR(40) NOT NULL,
  duracaoCurso INTEGER(2) UNSIGNED CHECK (duracaoCurso > 0),
  PRIMARY KEY(idCursos),
  INDEX Cursos_FKIndex2(Materia_idMateria),
  CONSTRAINT fk_Cursos_Materia
    FOREIGN KEY (Materia_idMateria) REFERENCES Materia(idMateria)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Alunos (
  idAlunos INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cursos_idCursos INTEGER UNSIGNED NOT NULL,
  NomeAluno VARCHAR(40) NOT NULL,
  EmailAluno VARCHAR(40) UNIQUE, 
  RaAluno INTEGER UNSIGNED NOT NULL UNIQUE, 
  PRIMARY KEY(idAlunos),
  INDEX Alunos_FKIndex1(Cursos_idCursos),
  CONSTRAINT fk_Alunos_Cursos
    FOREIGN KEY (Cursos_idCursos) REFERENCES Cursos(idCursos)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Atividades (
  idAtividades INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  TipoAtividade_idTipoAtividade INTEGER UNSIGNED NOT NULL,
  Alunos_idAlunos INTEGER UNSIGNED NOT NULL,
  Materia_idMateria INTEGER UNSIGNED NOT NULL,
  Valor DECIMAL(3,2) CHECK (Valor >= 0 AND Valor <= 10), -- nota deve estar entre 0 e 10
  extras DECIMAL(3,2) NULL,
  PRIMARY KEY(idAtividades),
  INDEX Atividades_FKIndex1(Materia_idMateria),
  INDEX Atividades_FKIndex2(Alunos_idAlunos),
  INDEX Atividades_FKIndex3(TipoAtividade_idTipoAtividade),
  CONSTRAINT fk_Atividades_Materia
    FOREIGN KEY (Materia_idMateria) REFERENCES Materia(idMateria)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_Atividades_Alunos
    FOREIGN KEY (Alunos_idAlunos) REFERENCES Alunos(idAlunos)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_Atividades_TipoAtividade
    FOREIGN KEY (TipoAtividade_idTipoAtividade) REFERENCES TipoAtividade(idTipoAtividade)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Provas (
  idProvas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  TipoProva_idTipoProva INTEGER UNSIGNED NOT NULL,
  Alunos_idAlunos INTEGER UNSIGNED NOT NULL,
  Materia_idMateria INTEGER UNSIGNED NOT NULL,
  Valor DECIMAL(3,2) CHECK (Valor >= 0 AND Valor <= 10),
  PRIMARY KEY(idProvas),
  INDEX Provas_FKIndex1(Materia_idMateria),
  INDEX Provas_FKIndex2(Alunos_idAlunos),
  INDEX Provas_FKIndex3(TipoProva_idTipoProva),
  CONSTRAINT fk_Provas_Materia
    FOREIGN KEY (Materia_idMateria) REFERENCES Materia(idMateria)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_Provas_Alunos
    FOREIGN KEY (Alunos_idAlunos) REFERENCES Alunos(idAlunos)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_Provas_TipoProva
    FOREIGN KEY (TipoProva_idTipoProva) REFERENCES TipoProva(idTipoProva)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Inserindo as matérias
INSERT INTO Materia (nomeMateria) VALUES
('Banco de Dados'),
('Programação Java'),
('Engenharia de Software');

-- Inserindo os cursos
INSERT INTO Cursos (Materia_idMateria, nomeCurso, duracaoCurso) VALUES
(1, 'Ciência da Computação', 8),
(2, 'Sistemas de Informação', 8);

-- Inserindo os tipos de atividades
INSERT INTO TipoAtividade (descricao) VALUES
('Atividade B1'),
('Atividade B2');

-- Inserindo os tipos de provas
INSERT INTO TipoProva (descricao) VALUES
('Prova B1'),
('Prova B2'),
('Projeto Integrador');

-- Inserindo alunos
INSERT INTO Alunos (Cursos_idCursos, NomeAluno, EmailAluno, RaAluno) VALUES
(1, 'Dyego Moreira Fernandes', 'dig@gmail.com',01),
(1, 'José Moreira', 'joMoreira@Gmail.com',02),
(1, 'Elenita Lima Moreira', 'elenitaMore@gmail.com',03),
(2, 'Solange Geovanne de Jesus', 'solJesus@gmail.com',04),
(2, 'Caique Geovanne de Jesus', 'caiqJesus@gmail.com',05);


INSERT INTO Atividades (TipoAtividade_idTipoAtividade, Alunos_idAlunos, Materia_idMateria, Valor)
VALUES
(1, 1, 1, 8.0), (1, 1, 1, 7.5), (1, 1, 1, 9.0), -- Nota Atividade B1
(2, 1, 1, 8.5), (2, 1, 1, 7.0), (2, 1, 1, 9.5), -- Nota Atividade B2

(1, 2, 1, 6.0), (1, 2, 1, 7.0), (1, 2, 1, 8.0),
(2, 2, 1, 7.5), (2, 2, 1, 6.5), (2, 2, 1, 8.0),

(1, 3, 2, 9.0), (1, 3, 2, 8.5), (1, 3, 2, 9.5),
(2, 3, 2, 7.0), (2, 3, 2, 8.0), (2, 3, 2, 8.5),

(1, 4, 2, 5.5), (1, 4, 2, 6.0), (1, 4, 2, 6.5),
(2, 4, 2, 7.0), (2, 4, 2, 7.5), (2, 4, 2, 6.5),

(1, 5, 3, 8.0), (1, 5, 3, 8.5), (1, 5, 3, 7.5),
(2, 5, 3, 9.0), (2, 5, 3, 8.0), (2, 5, 3, 8.5);

INSERT INTO Provas (TipoProva_idTipoProva, Alunos_idAlunos, Materia_idMateria, Valor) VALUES
(1, 1, 1, 8.5),  -- Prova B1
(2, 1, 1, 9.0),  -- Prova B2
(3, 1, 1, 8.0),  -- Projeto Integrador

(1, 2, 1, 7.0),
(2, 2, 1, 6.5),
(3, 2, 1, 7.5),

(1, 3, 2, 9.0),
(2, 3, 2, 8.5),
(3, 3, 2, 9.0),

(1, 4, 2, 6.0),
(2, 4, 2, 7.0),
(3, 4, 2, 6.5),

(1, 5, 3, 8.0),
(2, 5, 3, 9.0),
(3, 5, 3, 8.5);

# SQl
-----------------------------------------------------------------------------------------------------------------
-- Calcular a média das atividades da B1 por aluno
SELECT 
    a.NomeAluno,
    AVG(atv.Valor) AS media_B1
FROM Atividades atv
JOIN Alunos a ON atv.Alunos_idAlunos = a.idAlunos
JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
WHERE ta.descricao = 'Atividade B1'
GROUP BY a.idAlunos;
-----------------------------------------------------------------------------------------------------------------
-- Calculando a média da B1 por aluno
SELECT      
    a.NomeAluno,
    round((AVG(atv.Valor) * 0.4 + p.Valor * 0.6), 2) AS Nota_Final
FROM Alunos a 
JOIN Atividades atv ON atv.Alunos_idAlunos = a.idAlunos 
JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade 
JOIN Provas p ON p.Alunos_idAlunos = a.idAlunos 
JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva 
WHERE ta.descricao = 'Atividade B1'    
  AND tp.descricao = 'Prova B1' 
GROUP BY a.idAlunos, a.NomeAluno , p.Valor;
-----------------------------------------------------------------------------------------------------------------
SELECT 
    a.NomeAluno,
    ROUND((media_ativ_b1.media_B1 * 0.4 + prova_b1.nota_prova * 0.6),2) AS nota_final_B1
FROM Alunos a
-- Calcula a MÉDIA das Atividades B1 por aluno
JOIN (
    SELECT 
        atv.Alunos_idAlunos,
        AVG(atv.Valor) AS media_B1 
    FROM Atividades atv
    JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
    WHERE ta.descricao = 'Atividade B1'
    GROUP BY atv.Alunos_idAlunos
) media_ativ_b1 ON media_ativ_b1.Alunos_idAlunos = a.idAlunos
 -- Pega a nota da PROVA B1 por aluno
JOIN (
    SELECT 
        p.Alunos_idAlunos,
        p.Valor AS nota_prova
    FROM Provas p
    JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
    WHERE tp.descricao = 'Prova B1'
) prova_b1 ON prova_b1.Alunos_idAlunos = a.idAlunos
ORDER BY a.NomeAluno;


-----------------------------------------------------------------------------------------------------------------
-- Calculando a nota final da B2
SELECT 
    a.NomeAluno,
    ROUND(
        (((media_ativ_b2.media_B2 + projeto.nota_projeto) / 2) * 0.5 + prova_b2.nota_prova * 0.5),
        2
    ) AS nota_final_B2
FROM Alunos a

-- Calcula a MÉDIA das Atividades B2 por aluno
JOIN (
    SELECT 
        atv.Alunos_idAlunos,
        AVG(atv.Valor) AS media_B2
    FROM Atividades atv
    JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
    WHERE ta.descricao = 'Atividade B2'
    GROUP BY atv.Alunos_idAlunos
) media_ativ_b2 ON media_ativ_b2.Alunos_idAlunos = a.idAlunos

-- Pega a nota do PROJETO INTEGRADOR por aluno
JOIN (
    SELECT 
        p.Alunos_idAlunos,
        p.Valor AS nota_projeto
    FROM Provas p
    -- Relaciona provas com seus tipos para identificar o projeto
    JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
    WHERE tp.descricao = 'Projeto Integrador' 
) projeto ON projeto.Alunos_idAlunos = a.idAlunos

-- Pega a nota da PROVA B2 por aluno
JOIN (
    SELECT 
        p.Alunos_idAlunos,               -- ID do aluno (para fazer o JOIN)
        p.Valor AS nota_prova            -- Nota da prova B2
    FROM Provas p
    JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
    WHERE tp.descricao = 'Prova B2'     -- Filtra apenas a prova do bimestre 2
) prova_b2 ON prova_b2.Alunos_idAlunos = a.idAlunos
ORDER BY a.NomeAluno;

-----------------------------------------------------------------------------------------------------------------
-- Calcula a média final da disciplina
SELECT 
    a.NomeAluno,
    ROUND(
        (
            -- NOTA FINAL B1
            (
                -- Média das Atividades B1
                (SELECT AVG(atv.Valor)
                 FROM Atividades atv
                 JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
                 WHERE ta.descricao = 'Atividade B1' 
                   AND atv.Alunos_idAlunos = a.idAlunos) * 0.4 
                +
                -- Nota da Prova B1
                (SELECT p.Valor
                 FROM Provas p
                 JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                 WHERE tp.descricao = 'Prova B1'
                   AND p.Alunos_idAlunos = a.idAlunos) * 0.6
            )
            +
            -- NOTA FINAL B2
            (
                (
                    -- Média das Atividades B2
                    (SELECT AVG(atv.Valor)
                     FROM Atividades atv
                     JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
                     WHERE ta.descricao = 'Atividade B2' 
                       AND atv.Alunos_idAlunos = a.idAlunos)
                    +
                    -- Nota do Projeto Integrador
                    (SELECT p.Valor
                     FROM Provas p
                     JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                     WHERE tp.descricao = 'Projeto Integrador'
                       AND p.Alunos_idAlunos = a.idAlunos)
                ) / 2 * 0.5
                +
                -- Nota da Prova B2
                (SELECT p.Valor
                 FROM Provas p
                 JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                 WHERE tp.descricao = 'Prova B2'
                   AND p.Alunos_idAlunos = a.idAlunos) * 0.5
            )
        ) / 2,
        2
    ) AS media_final
FROM Alunos a
ORDER BY a.NomeAluno;



--  Determina se o aluno foi Aprovado ou Reprovado -> média_final >= 6.0 → Aprovado, senão → Reprovado
SELECT 
    NomeAluno,
    media_final,
    CASE 
        WHEN media_final >= 6.0 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS Situacao
FROM (SELECT 
    a.NomeAluno,
    ROUND(
        (
            -- NOTA FINAL B1
            (
                -- Média das Atividades B1
                (SELECT AVG(atv.Valor)
                 FROM Atividades atv
                 JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
                 WHERE ta.descricao = 'Atividade B1' 
                   AND atv.Alunos_idAlunos = a.idAlunos) * 0.4 
                +
                -- Nota da Prova B1
                (SELECT p.Valor
                 FROM Provas p
                 JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                 WHERE tp.descricao = 'Prova B1'
                   AND p.Alunos_idAlunos = a.idAlunos) * 0.6
            )
            +
            -- NOTA FINAL B2
            (
                (
                    -- Média das Atividades B2
                    (SELECT AVG(atv.Valor)
                     FROM Atividades atv
                     JOIN TipoAtividade ta ON atv.TipoAtividade_idTipoAtividade = ta.idTipoAtividade
                     WHERE ta.descricao = 'Atividade B2' 
                       AND atv.Alunos_idAlunos = a.idAlunos)
                    +
                    -- Nota do Projeto Integrador
                    (SELECT p.Valor
                     FROM Provas p
                     JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                     WHERE tp.descricao = 'Projeto Integrador'
                       AND p.Alunos_idAlunos = a.idAlunos)
                ) / 2 * 0.5
                +
                -- Nota da Prova B2
                (SELECT p.Valor
                 FROM Provas p
                 JOIN TipoProva tp ON p.TipoProva_idTipoProva = tp.idTipoProva
                 WHERE tp.descricao = 'Prova B2'
                   AND p.Alunos_idAlunos = a.idAlunos) * 0.5
            )
        ) / 2,
        2
    ) AS media_final
FROM Alunos a
ORDER BY a.NomeAluno
) as resultado;
