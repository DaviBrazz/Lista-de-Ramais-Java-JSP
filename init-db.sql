-- Criação da tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(70) NOT NULL,
    username VARCHAR(45) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL -- Aumentei o tamanho para 255
);

-- Criação da tabela de ramais
CREATE TABLE IF NOT EXISTS ramais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setor VARCHAR(60) NOT NULL,
    ramal VARCHAR(45) NOT NULL UNIQUE,
    localizacao VARCHAR(75) NOT NULL
);

-- Inserção de usuários na tabela usuarios
INSERT INTO `usuarios`(`nome`,`username`,`password`) VALUES 
('Administrador','admin','admin123'),
('Davi Braz','davibraz','davibraz');



