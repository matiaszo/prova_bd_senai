drop database if exists prova_bd;
create database prova_bd;
use prova_bd;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    data_contratacao DATE NOT NULL
);

CREATE TABLE historico_cargos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    cargo_anterior VARCHAR(50),
    cargo_novo VARCHAR(50),
    salario_anterior DECIMAL(10, 2),
    salario_novo DECIMAL(10, 2),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE TABLE aumento_salario_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    salario_antigo DECIMAL(10, 2),
    salario_novo DECIMAL(10, 2),
    data_aumento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE TABLE departamentos_estatisticas (
    departamento VARCHAR(50) PRIMARY KEY,
    total_funcionarios INT DEFAULT 0
);

insert into departamentos_estatisticas(departamento) values("dep");
insert into departamentos_estatisticas(departamento) values("art");

