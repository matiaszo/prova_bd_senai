use prova_bd;
-- questao 1 triggers

delimiter //
create trigger registrar_aumento_salario
	before update on funcionarios
    for each row
    begin
		if old.salario < new.salario then 
        insert into aumento_salario_audit(funcionario_id,salario_antigo,salario_novo,data_aumento) 
        values(old.id, old.salario, new.salario, curdate());
        end if;
	end;
    // delimiter ;
    
    insert into funcionarios(nome,cargo,salario,departamento,data_contratacao) values ("novo", "cargo", 1, "dep", '2024-10-10');
    
    update funcionarios set salario = 3 where id = 1;