-- questao 4 procedures

delimiter //
create procedure validar_data(in data_insercao date, in nome_prod varchar(50), in disponibilidade varchar(50), in id_func int)
	begin
    start transaction;
		insert into Produto(nome,disponivel,id_funcionario) values (nome_prod, disponibilidade, id_func);
        if data_insercao = curdate() then commit;
        else
         rollback;
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data incorreta';
        end if;
	end;
//	delimiter ;

call validar_data ('2024-09-11', 'new', 'disponivel', 1);

