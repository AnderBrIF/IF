DELIMITER //
CREATE TRIGGER validacao AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    IF NEW.Nome IS NULL OR NEW.EMail IS NULL OR NEW.Senha IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acesso negado. Campos obrigatórios não preenchidos.';
    END IF;
END //
DELIMITER ;

 DROP TRIGGER IF EXISTS validacao;

-- 2

DELIMITER //
CREATE FUNCTION formatar_nome_ator(nome VARCHAR(40)) RETURNS VARCHAR(40)
BEGIN
    DECLARE nome_formatado VARCHAR(40);
    
    -- Adicione aqui a lógica para formatar o nome do ator (Exemplo: Converter para maiúsculas)
    SET nome_formatado = UPPER(nome);
    RETURN nome_formatado;
END;
//
DELIMITER ;

DROP FUNCTION formator_nome_ator;

select nome_formatado(1, 'Sonic');

select * from usuario;

 DROP FUNCTION IF EXISTS formatar_nome_ator;