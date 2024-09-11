-- questao 3 procedures

delimiter //

create procedure solicitar_alt(in msg varchar(50), in quantidade int, in id_prod int, in id_func int)
	begin 
    set @nivel_func = (select nivel_permissao from Funcionario 
    inner join Permissao 
    where Funcionario.id_permissao = Permissao.id_permissao and Funcionario.id_funcionario = id_func); 
    start transaction;
		insert into pedir_permissao(mensagem) values (msg);
    
    if @nivel_func = 5 then commit;
    else
    rollback;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Voce nao possui nivel de permissao 5';
    end if;
end;

call solicitar_alt('me deixa', 3,3,1);
