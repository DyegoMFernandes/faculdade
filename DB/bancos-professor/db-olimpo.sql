create database bd_olimpo
	default character set utf8mb4
    # AI e CI -> acento insensitive e caps insensitive
    collate utf8mb4_0900_ai_ci;

use bd_olimpo;
create table usuarios
(id integer not null primary key auto_increment, nome varchar(40) not null, email varchar(50) not null unique, senha varchar(255) not null) engine = InnoDB;

insert into usuarios(nome,email,senha)
	values	('Zeus','zeus@email.com','123'),
			('Poseidon','poseidon@email.com','awa'),
            ('Medusa','med@email.com','preda'),
            ('aphrodite','frozinha@email.com','fror');

-- criar usuario de banco de dados
create user aluno@localhost
	identified by '123';
    
-- grant permissoes
grant select on bd_olimpo.usuarios to aluno@localhost;
grant insert on bd_olimpo.usuarios to aluno@localhost;

-- verificar permissoes
show grants for aluno@localhost;

-- revogar permissões
revoke insert on bd_olimpo.usuarios from aluno@localhost;

-- verificar permissoes
show grants for aluno@localhost;

-- grupo de privilegios (role)
create role consulta;

-- atribuir acessos a um grupo
grant select on bd_olimpo.usuarios to consulta;

-- criar um novo usuario pra testar
create user dyego@localhost;

-- atribuir regra a usuario
grant consulta to dyego@localhost;

-- verificar permissoes
show grants for dyego@localhost;

-- definir a regra padrão do usuario
set default role consulta to dyego@localhost;
