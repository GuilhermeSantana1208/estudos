create database Gestão_Biblioteca;
use Gestão_Biblioteca;

create table Cliente
( Id_cliente varchar (40),
  Nome varchar(40),
  Telefone varchar (10),
  primary key (Id_cliente));
  
  create table Livros 
  ( Id_livros int not null,
	Titulo varchar (30),
    Autor varchar (40),
    Ano_Publicação int not null,
    Categoria varchar (30),
    primary key (Id_livros));
    
    create table Empréstimos
    ( Id_empréstimo int not null,
      Data_empréstimo date,
      Devolução_empréstimo date,
      Status enum ( 'Em Andamento','Concluído','Atrasado') not null,
      Id_cliente varchar(40),
      Id_livros  int not null,
      primary key (Id_empréstimo),
	  foreign key (Id_cliente) references Cliente(Id_cliente),	
      foreign key (Id_livros) references  LIvros(Id_livros));
      
      -- inserção de dados na Tabela cliente
      
insert into cliente (Id_cliente,Nome,Telefone)
    values ("C123456","João Silva", 98765-4321);
    
    insert into cliente (id_cliente,Nome,Telefone)
    values ("C234567","Maria Oliveira", 99876-5432);
    
    insert into cliente (id_cliente,Nome,Telefone)
    values ("C345678","Carlos Pereira", 91234-5678);
      
	insert into cliente (Id_cliente,Nome,Telefone)
    values ("C456789"," Ana Souza",92345-6789);
    
	insert into cliente (Id_cliente,Nome,Telefone)
    values ("C567890","Pedro Santos",93456-7890);	
    
    
    -- correção de error 1833 causada pela ausência do (auto increment nas chaves primarias)
alter table empréstimos drop foreign key empréstimos_ibfk_2;

alter table livros modify column Id_livros int not null auto_increment;

alter table empréstimos add constraint empréstimos_ibfk_2 foreign key (id_livros) references livros (id_livros);

-- continuação de inserção de dados 

insert into livros (id_livros,Titulo,Autor,Ano_Publicação,Categoria)
values ( 1 ,"O Senhor dos Anéis","J.R.R. Tolkien",1954,"Fantasia");

insert into livros (id_livros,Titulo,Autor,Ano_Publicação,Categoria)
values (2,1984,"George Orwell",1949,"Distopia");

insert into livros (id_livros,Titulo,Autor,Ano_Publicação,Categoria)
values (3,"Dom Quixote","Miguel de Cervantes",1605,"Romance Clássico");

insert into livros (id_livros,Titulo,Autor,Ano_Publicação,Categoria)
values (4,"Cem Anos de Solidão","Gabriel García Márquez",1967,"Realismo Mágico");

insert into livros (id_livros,Titulo,Autor,Ano_Publicação,Categoria)
values (5,"A Guerra dos Tronos","George R.R. Martin",1996,"Fantasia Épica");

-- inserção de dados Tabela Empréstimos

insert into empréstimos (id_empréstimo,id_livros,Id_cliente,Data_empréstimo,Devolução_empréstimo,Status)
values (1,1,'C123456','2025-03-19','2025-04-19',"Concluído");

insert into empréstimos (id_empréstimo,id_livros,Id_cliente,Data_empréstimo,Devolução_empréstimo,Status)
values (2,3,'C123456','2025-03-19','2025-04-19',"Concluído");

insert into empréstimos (id_empréstimo,id_livros,Id_cliente,Data_empréstimo,Devolução_empréstimo,Status)
values (3,4,'C567890','2025-04-10', '2025-05-19', "Atrasado");

insert into empréstimos (id_empréstimo,id_livros,Id_cliente,Data_empréstimo,Devolução_empréstimo,Status)
values (4,5,'C234567','2025-09-20','2025-10-20',"Concluído");

select
    empréstimos.Id_empréstimo, 
    empréstimos.Data_empréstimo, 
    empréstimos.Devolução_empréstimo, 
    empréstimos.Status AS Status_Empréstimo,
    cliente.Id_cliente, 
    clientes.Nome AS Nome_Cliente, 
    clientes.Telefone AS Telefone_Cliente,
    livros.Id_livros, 
    livros.Titulo AS Titulo_Livro, 
    livros.Autor AS Autor_Livro, 
    livros.Ano_Publicação, 
    livros.Categoria AS Categoria_Livro
from 
    Empréstimos 	
join
    Cliente ON empréstimos.Id_cliente = cliente.Id_cliente
join
    Livros  ON empréstimos.Id_livros = livros.Id_livros;



