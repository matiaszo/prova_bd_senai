drop database if exists questao_1_prova;
create database questao_1_prova;
use questao_1_prova;

create table Permissao(
	id_permissao INT AUTO_INCREMENT PRIMARY KEY,
    descricao varchar(50),
    nivel_permissao int
    );

create table Funcionario(
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY not null,
    nome varchar(50),
    cpf varchar(50),
    id_permissao int,
    foreign key(id_permissao) references Permissao(id_permissao)
    );
    
create table Produto(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(50),
    disponivel varchar(50),
    id_funcionario int,
    foreign key (id_funcionario) references Funcionario(id_funcionario)
    );

create table Venda(
	id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_produto_vendido int default 0,
    id_produto int,
    foreign key (id_produto) references Produto(id_produto),
    id_funcionario int,
    foreign key (id_funcionario) references Funcionario(id_funcionario)
    );
    
create table pedir_permissao(	
	id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem varchar(50)
    );
    
    insert into Permissao (descricao, nivel_permissao) values('primeira', 1);

    