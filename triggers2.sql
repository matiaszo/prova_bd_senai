use prova_bd;
-- questao 2 triggers

delimiter //
create trigger registrar_mudanca_cargo
	after update on funcionarios
    for each row
    begin
		if old.cargo <> new.cargo then 
        insert into historico_cargos (funcionario_id,cargo_anterior,cargo_novo,salario_anterior ,salario_novo,data_mudanca) 
        values(new.id, old.cargo, new.cargo, old.salario, new.salario, curdate());
        end if;
	end;
    // delimiter ;
    
    select * from funcionarios;
    select * from historico_cargos;

	update funcionarios set cargo = "outro" where id = 1;