-- Linguagem SQL padrão ANSI-92 ou SQL-92

-- Criação do banco de dados biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca;

-- Definição do banco de dados padrão
USE biblioteca;

-- Criação da tabela leitores
CREATE TABLE IF NOT EXISTS leitores
( id_leitor INT(6) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  telefone VARCHAR(20),
  data_cadastro DATE NOT NULL
);

-- Criação da tabela autores
CREATE TABLE IF NOT EXISTS autores
( id_autor INT(6) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  data_nascimento DATE,
  nacionalidade VARCHAR(80),
  biografia TEXT
);

-- Criação da tabela categorias
CREATE TABLE IF NOT EXISTS categorias
( id_categoria INT(4) PRIMARY KEY AUTO_INCREMENT,
  nome_categoria VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  data_criacao DATE,
  status_categoria BOOLEAN
);

-- Criação da tabela livros (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS livros
( id_livro INT(6) PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  id_autor INT(6),
  editora VARCHAR(100),
  id_categoria INT(4),

  -- Chave estrangeira conectando livros com autores
  FOREIGN KEY (id_autor) REFERENCES autores(id_autor),

  -- Chave estrangeira conectando livros com categorias
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Criação da tabela emprestimos (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS emprestimos
( id_emprestimo INT(7) PRIMARY KEY AUTO_INCREMENT,
  id_leitor INT(6),
  id_livro INT(6),
  data_emprestimo DATE NOT NULL,
  data_devolucao_prevista DATE NOT NULL,
  data_devolucao_real DATE,
  status VARCHAR(20),

  -- Chave estrangeira conectando empréstimos com leitores
  FOREIGN KEY (id_leitor) REFERENCES leitores(id_leitor),

  -- Chave estrangeira conectando empréstimos com livros
  FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
