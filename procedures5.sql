-- questao 5 procedures

delimiter //
create procedure bloquear_null_insert(in novo_nome varchar(50), in novo_cpf varchar(50), in novo_id_permissao int)
	begin
    start transaction;
		insert into Funcionario(nome,cpf,id_permissao) values (novo_nome, novo_cpf, novo_id_permissao);
        
        if novo_nome <> null and novo_cpf <> null and novo_id_permissao <> null then commit;
        else
         rollback;
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Voce tentou inserir um valor nulo';
        end if;
	end;
//	delimiter ;

delimiter //
create procedure bloquear_null_update(in id_func int, in novo_nome varchar(50), in novo_cpf varchar(50), in novo_id_permissao int)
	begin
    start transaction;
		update Funcionario set nome = novo_nome, cpf = novo_cpf, id_permissao = novo_id_permissao where id_funcionario = id_func;
        
        if novo_nome <> null and novo_cpf <> null and novo_id_permissao <> null then commit;
        else
         rollback;
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Voce tentou inserir um valor nulo';
        end if;
	end;
//	delimiter ;

call bloquear_null_insert(null, '67', 1);
call bloquear_null_update(1,null, '679', 1);
