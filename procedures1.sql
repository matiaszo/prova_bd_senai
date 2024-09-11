-- questao 1 procedures

delimiter //
create procedure validar_cpf_unico(in cpf_novo varchar(50))
	begin
    set @cpf_antigo = (select count(cpf) from Funcionario where Funcionario.cpf = cpf_novo);
    start transaction;
    
		insert into Funcionario(nome, cpf, id_permissao) values ('testando', cpf_novo, 1);
        
        if @cpf_antigo > 0 then rollback;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nao foi possivel inserir';
        else
         commit;
        end if;
	end;
//	delimiter ;

call validar_cpf_unico('56');

