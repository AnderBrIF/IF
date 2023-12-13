CREATE DATABASE IF NOT EXISTS STREAMING;
USE STREAMING;

CREATE TABLE usuario (
  ID_Usuario INT PRIMARY KEY,
  Nome VARCHAR(40),
  EMail VARCHAR(255),
  Senha VARCHAR(10)
);

CREATE TABLE Perfil(
  ID_Perfil INT PRIMARY KEY,
  ID_Usuario INT,
  Nome_perfil VARCHAR(40),
  Avatar VARCHAR(20),
  Descricao VARCHAR(100),
  FOREIGN KEY(ID_Usuario) REFERENCES usuario(ID_Usuario)
);

CREATE TABLE Assinatura (
  ID_Assinatura INT PRIMARY KEY,
  ID_Plano INT,
  Data_Inicio DATE,
  Data_Fim DATE,
  Valor DECIMAL(10, 2),
  Tipo_assinatura VARCHAR(60),
  Vencimento VARCHAR(50),
  ID_Usuario INT,
  FOREIGN KEY(ID_Usuario) REFERENCES usuario(ID_Usuario)
);

CREATE TABLE Conteudo(
  ID_conteudo INT PRIMARY KEY,
  Titulo VARCHAR(40),
  Data_lancamento DATE,
  Descricao VARCHAR(100),
  Classificacao_etaria INT,
  Duracao INT,
  Genero VARCHAR(100)
);

CREATE TABLE Ator(
  ID_Ator INT PRIMARY KEY,
  Nome_Ator VARCHAR(40)
);

CREATE TABLE Ator_conteudo(
  ID_Ator_Conteudo INT PRIMARY KEY,
  ID_conteudo INT,
  ID_Ator INT,
  FOREIGN KEY(ID_conteudo) REFERENCES Conteudo(ID_conteudo),
  FOREIGN KEY(ID_Ator) REFERENCES Ator(ID_Ator) 
);

CREATE TABLE Usuario_Assistiu(
  ID_Usuario_Assistiu INT PRIMARY KEY,
  ID_conteudo INT,
  ID_Usuario INT,
  FOREIGN KEY(ID_conteudo) REFERENCES Conteudo(ID_conteudo),
  FOREIGN KEY(ID_Usuario) REFERENCES usuario(ID_Usuario)
);

INSERT INTO usuario (ID_Usuario, Nome, EMail, Senha)
VALUES (1, 'João Silva', 'joao@example.com', 'senha123');

INSERT INTO usuario (ID_Usuario, Nome, EMail, Senha)
VALUES (2, 'Maria Santos', 'maria@example.com', 'senha456');

INSERT INTO Perfil (ID_Perfil, ID_Usuario, Nome_perfil, Avatar, Descricao)
VALUES (1, 1, 'Perfil Pessoal', 'avatar1.jpg', 'Descrição do perfil pessoal');

INSERT INTO Perfil (ID_Perfil, ID_Usuario, Nome_perfil, Avatar, Descricao)
VALUES (2, 1, 'Perfil Profissional', 'avatar2.jpg', 'Descrição do perfil profissional');

INSERT INTO Assinatura (ID_Assinatura, ID_Plano, Data_Inicio, Data_Fim, Valor, Tipo_assinatura, Vencimento, ID_Usuario)
VALUES (1, 1, '2023-01-01', '2023-12-31', 9.99, 'Mensal', '15º dia do mês', 1);

INSERT INTO Conteudo (ID_conteudo, Titulo, Data_lancamento, Descricao, Classificacao_etaria, Duracao, Genero)
VALUES (1, 'Filme A', '2022-05-15', 'Descrição do filme A', 12, 120, 'Drama');

INSERT INTO Conteudo (ID_conteudo, Titulo, Data_lancamento, Descricao, Classificacao_etaria, Duracao, Genero)
VALUES (2, 'Série B', '2023-03-10', 'Descrição da série B', 16, 40, 'Suspense');

INSERT INTO Ator (ID_Ator, Nome_Ator)
VALUES (1, 'John Doe');

INSERT INTO Ator (ID_Ator, Nome_Ator)
VALUES (2, 'Jane Smith');

INSERT INTO Ator_conteudo (ID_Ator_Conteudo, ID_conteudo, ID_Ator)
VALUES (1, 1, 1);

INSERT INTO Ator_conteudo (ID_Ator_Conteudo, ID_conteudo, ID_Ator)
VALUES (2, 2, 2);

INSERT INTO Usuario_Assistiu (ID_Usuario_Assistiu, ID_conteudo, ID_Usuario)
VALUES (1, 1, 1);

INSERT INTO Usuario_Assistiu (ID_Usuario_Assistiu, ID_conteudo, ID_Usuario)
VALUES (2, 2, 1);
