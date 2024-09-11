use prova_bd;
-- questao 3 triggers

delete from funcionarios where id = 4;

delimiter //
create trigger registrar_funcionario_excluido
	before delete on funcionarios
    for each row
    begin
    set @qtd_func = (select count(id) from funcionarios where  departamento = old.departamento) - 1;
        update departamentos_estatisticas set total_funcionarios = @qtd_func where departamento = old.departamento;
	end;
    // delimiter ;

   