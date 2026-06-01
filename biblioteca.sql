Leitor {
	id_leitor integer pk increments unique
	nome varchar(100)
	email varchar(100)
	telefone varchar(20)
	data_cadastro date
}

Autores {
	id_autor integer pk increments unique
	nome varchar(150)
	data_nascimento date
	nacionalidade varchar(80)
	biografia text
}

Categorias {
	id_categoria integer pk increments unique
	nome_categoria varchar(100)
	descricao varchar(255)
	data_criacao date
	status_categoria boolean
}

Livros {
	id_livro integer pk increments unique
	titulo varchar(255)
	id_autor integer > Autores.id_autor
	editora varchar(100)
	id_categoria integer > Categorias.id_categoria
}

Emprestimos {
	id_emprestimo integer pk increments unique
	id_leitor integer > Leitor.id_leitor
	id_livro integer > Livros.id_livro
	data_emprestimo date
	data_devolucao_prevista date
	data_devolucao_real date
	status varchar(20)
}

