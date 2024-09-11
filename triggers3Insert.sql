use prova_bd;
-- questao 3 triggers

insert into funcionarios(nome,cargo,salario,departamento,data_contratacao) values ("ainda", "outro_cargo", 1, "dep", '2024-10-10');
    
delimiter //
create trigger registrar_novo_funcionario
	after insert on funcionarios
    for each row
    begin
    set @qtd_func = (select count(id) from funcionarios where  departamento = new.departamento);
        update departamentos_estatisticas set total_funcionarios = @qtd_func where departamento = new.departamento;
	end;
    // delimiter ;
    
    

    
    