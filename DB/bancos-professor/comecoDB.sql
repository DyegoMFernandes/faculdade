create database Faculdade;

-- =======================
-- TABELA CURSOS
-- =======================
CREATE TABLE Cursos (
  idCurso INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nomeCurso VARCHAR(40) NOT NULL,
  duracaoCurso INT UNSIGNED NULL, -- duração em meses
  PRIMARY KEY(idCurso)
) ENGINE=InnoDB;

-- =======================
-- TABELA MATERIA
-- =======================
CREATE TABLE Materia (
  idMateria INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nomeMateria VARCHAR(40) NOT NULL,
  PRIMARY KEY(idMateria)
) ENGINE=InnoDB;

-- =======================
-- TABELA ASSOCIAÇÃO CURSO_MATERIA (N:N)
-- =======================
CREATE TABLE Curso_Materia (
  idCurso INT UNSIGNED NOT NULL,
  idMateria INT UNSIGNED NOT NULL,
  PRIMARY KEY(idCurso, idMateria),
  FOREIGN KEY(idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE,
  FOREIGN KEY(idMateria) REFERENCES Materia(idMateria) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =======================
-- TABELA ALUNOS
-- =======================
CREATE TABLE Alunos (
  idAluno INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idCurso INT UNSIGNED NOT NULL,
  nomeAluno VARCHAR(40) NOT NULL,
  emailAluno VARCHAR(40) NULL,
  raAluno INT UNSIGNED NOT NULL UNIQUE,
  PRIMARY KEY(idAluno),
  FOREIGN KEY(idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =======================
-- TABELA ATIVIDADES
-- =======================
CREATE TABLE Atividades (
  idAtividade INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idAluno INT UNSIGNED NOT NULL,
  idMateria INT UNSIGNED NOT NULL,
  b1 DECIMAL(3,2) NULL CHECK (b1 BETWEEN 0 AND 10),
  b2 DECIMAL(3,2) NULL CHECK (b2 BETWEEN 0 AND 10),
  extras DECIMAL(3,2) NULL CHECK (extras BETWEEN 0 AND 10),
  descricao VARCHAR(255) NULL,
  PRIMARY KEY(idAtividade),
  FOREIGN KEY(idAluno) REFERENCES Alunos(idAluno) ON DELETE CASCADE,
  FOREIGN KEY(idMateria) REFERENCES Materia(idMateria) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =======================
-- TABELA PROVAS
-- =======================
CREATE TABLE Provas (
  idProva INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idAluno INT UNSIGNED NOT NULL,
  idMateria INT UNSIGNED NOT NULL,
  tipo ENUM('B1','B2','Projeto Integrador') NOT NULL,
  nota DECIMAL(3,2) NOT NULL CHECK (nota BETWEEN 0 AND 10),
  dataProva DATE NULL,
  PRIMARY KEY(idProva),
  FOREIGN KEY(idAluno) REFERENCES Alunos(idAluno) ON DELETE CASCADE,
  FOREIGN KEY(idMateria) REFERENCES Materia(idMateria) ON DELETE CASCADE
) ENGINE=InnoDB;

insert into materia(nomeMateria)values
('Desenvolvimento de Pessoas'),
('Banco de dadinhos');

insert into aluno(idAluno,idCurso,)values()

-- INICIAR INSERÇÃO DE DADOS