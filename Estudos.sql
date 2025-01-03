CREATE DATABASE Loja_de_eletronico;
USE Loja_de_eletronico;
CREATE TABLE Produtos
(
id int unsigned not null auto_increment,
Nome varchar(40) not null,
Quantidade double not null default '0',
PRIMARY KEY (id)
);
CREATE TABLE clientes 
(
CPF int unsigned not null auto_increment,
Nome varchar (40) not null,
Email varchar (40) not null,
Telefone int unsigned not null,
produtos_id int unsigned default null,
PRIMARY KEY (CPF),
constraint fk_produto_cliente foreign key(Produtos_id) references Produtos(id));

insert into produtos(Id,Nome,Quantidade)
values (1, "Iphone", 200);

insert into produtos(Id,Nome,Quantidade)
values (2, " Placa Rx6600", 3000);

select id, nome, quantidade from produtos