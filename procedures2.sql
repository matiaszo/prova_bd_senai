-- questao 2 procedures

delimiter //
create procedure validar_nivel_permissao(in id_prod int, in estado varchar(50), in id_func int)
	begin
    set @nivel_func = (select nivel_permissao from Funcionario 
    inner join Permissao 
    where Funcionario.id_permissao = Permissao.id_permissao and Funcionario.id_funcionario = id_func); 
    start transaction;

		update Produto set disponivel = estado where id_produto = id_prod;
        
        if @nivel_func > 2 and (estado = 'disponivel' or 'indisponivel') then commit;
        else
         rollback;
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O seu nivel de permissao eh baixo ou voce digitou errado o estado';
        end if;
	end;
//	delimiter ;

call validar_nivel_permissao(1, 'disponivel', 3);
call validar_nivel_permissao(1, 'dispoel', 3);

