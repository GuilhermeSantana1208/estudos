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

-- inserção de dados do produto.
insert into produtos(Id,Nome,Quantidade)
values (1, "Iphone", 200,);

insert into produtos(Id,Nome,Quantidade)
values (2, " Placa Rx6600", 3000);

insert into produtos(Id,Nome,Quantidade)
values (3, "Controle Gamesir G7", 4000);

insert into produtos(Id,Nome,Quantidade)
values (4, "Fone Akz", 2340);

insert into produtos(Id,Nome,Quantidade)
values (5, "Mouse Attack Shark", 1200);

-- Corrigindo Tabela dos produtos sem o valor.

alter table produtos add column Valor decimal (10,2) not null ;
describe produtos;
 
 update produtos
 set Valor = 2499.99
 where id = 2;
 
 select valor from produtos where id=2;
 
 update produtos
 set Valor = 5559.60
 where id = 1;
 
 update produtos
 set Valor = 289.90
 where id = 3;
 
 update produtos 
 set Valor = 39.99
 where id = 4 
 
 update produtos 
 set valor = 349.90
 where id = 5;

-- Verificando se ta tudo ok.
select nome,id,quantidade,valor from produtos;

---
insert into clientes (Cpf,Nome,Email,Telefone)
values ( 23465478600, "jandira", "jandiraJobs@gmail.com", 61999666888); 

-- Alteração no Cpf e Telefone por não aceitar tantos caracteres.

alter table clientes modify column CPF varchar (40); 
alter table clientes modify column telefone varchar (40);

-- Verificando se tava tudo ok.

select cpf,nome,email,telefone from clientes;

-- Inserção dos dados dos clientes.

insert into clientes (Cpf,Nome,Email,Telefone)
values ( 06512376534,"Adalberto","Adalberto32@gmail.com",61977222123);

 insert into clientes (Cpf,Nome,Email,Telefone)
values ( 65100967112, "Felipe", "felipe2077@gmail.com",61987865432);

insert into clientes (Cpf,Nome,Email,Telefone)
values ( 76243667100,"juliana","julianatrab@gmai.com",61987632436);

insert into clientes (Cpf,Nome,Email,Telefone)
values (74312476599,"Ana Silva","ana.silva123@mail.com",61988765432);

insert into clientes (Cpf,Nome,Email,Telefone)
values (45312466787,"João Pereira",	"joao.perreira234@mail.com" ,61987654321);

insert into clientes (Cpf,Nome,Email,Telefone)
values (76277627654,"Maria Oliveira","maria.oliveira345@mail.com",61986543210);

insert into clientes (Cpf,Nome,Email,Telefone)
values (67747687145," Pedro Costa","pedro.costa456@mail.com",61985432109);

insert into clientes (Cpf,Nome,Email,Telefone)
values (89778637901, "Carlos Santos","carlos.santos678@mail.com",61983210987)	

insert into clientes (Cpf,Nome,Email,Telefone)
values (67237891356,"Beatriz Almeida","beatriz.almeida789@mail.com",61982109876);

insert into clientes (Cpf,Nome,Email,Telefone)
values (70898763724,"Marcos Lima","marcos.lima890@mail.com",61981098765);

insert into clientes (Cpf,Nome,Email,Telefone)
values (88755436901,"Fernanda Martins","fernanda.martins901@mail.com",61980987654);

insert into clientes (Cpf,Nome,Email,Telefone)
values (65478999122,"Gustavo Rocha","gustavo.rocha012@mail.com",61979876543);

-- Verificando se tava tudo ok.

select Cpf,Nome,Email,Telefone From clientes;

CREATE TABLE Pedidos (
    Id_pedido int not null ,   
    Cpf varchar (40),                         
    Data_Pedido date,                         
    primary key (Id_pedido),                  
    foreign key (Cpf) references Clientes (Cpf) );

Create table Pedido_Produto
(
id_pedido int not null ,
id_produto int unsigned not null auto_increment,
Quantidade double not null default '0',
primary key (id_pedido, id_produto),
foreign key (id_pedido) references Pedidos (id_pedido),
foreign key (id_produto) references produtos(id)
);
 
 -- Inserção de dados do produto.
 
insert into produtos(Id,Nome,Quantidade,Valor)
values (6,"NVIDIA GeForce RTX 3080",900,4599.90);

insert into produtos(Id,Nome,Quantidade,Valor)
values(7,"Monitor LG Ultragear",750,1999.90);

insert into produtos(Id,Nome,Quantidade,Valor)
values(8,"Logitech G Pro X Superlight",500,780.79);

insert into produtos(Id,Nome,Quantidade,Valor)
values(9,"Corsair K95 RGB Platinum XT",100,1100.50);

 insert into produtos(Id,Nome,Quantidade,Valor)
values(10,"SteelSeries Arctis 7",230,860.70);
 
insert into produtos(Id,Nome,Quantidade,Valor)
values(11," Xbox Wireless Controller",360,500.00);

-- Inserção de dados do pedido.

-- errado
insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (11,23465478600,'2024-09-24');
-- errado
insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (11,23465478600,'2024-09-24');

insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (2,45312466787,'2024-08-12');

insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (3,65100967112,'2024-01-7');

insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (4,6512376534,'2024-08-20');

insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (5,65478999122,'2024-05-12');

insert into pedidos (id_pedido,Cpf,Data_pedido)
Values (6,67237891356,'2024-07-26');

-- primeiro insert dos pedidos deletado
delete from pedidos where id_pedido= 11;

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (1,23465478600,'2024-05-29');

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (7,67747687145,'2024-06-24');

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (8,70898763724,'2024-10-28');

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (9,74312476599,'2024-09-12');

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (10,76243667100,'2024-07-30');

insert into pedidos (id_pedido,Cpf,Data_pedido)
values (11,76277627654,'2024-09-09');

insert into pedidos (id_pedido,Cpf,Data_pedido)
value (12,88755436901,'2024-12-09');

insert into pedidos (id_pedido,Cpf,Data_pedido)
value (13,89778637901,'2024-06-23');

-- Inserção da tabela pedido produto

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (1, 11, 2);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (2, 9, 1);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (3, 3, 4);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (4, 5, 2);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (5, 6, 1);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (6, 10, 2);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (7, 1, 2);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (8, 4 , 6);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (9, 7, 1);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (10, 2, 1);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (11, 11, 2);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values (12, 6, 1);

insert into pedido_produto (id_pedido,id_produto,Quantidade)
values ( 13, 1, 1);

Select pedido_produto.id_pedido,
clientes.Nome as Nome_Cliente,
produtos.Nome as Nome_Produto,
pedido_produto.Quantidade from pedido_produto

join pedidos on pedido_produto.id_pedido = pedidos.id_pedido

join clientes on pedidos.cpf = clientes.cpf

join produtos on pedido_produto.id_produto = produtos.id

order by pedido_produto.id_pedido;

Select pedido_produto.id_pedido,
clientes.Nome as Nome_Cliente,
produtos.Nome as Nome_Produto,
pedido_produto.Quantidade,
pedidos.data_pedido

from pedido_produto

-- agora com data porque eu esqueci. 

join pedidos on pedido_produto.id_pedido = pedidos.id_pedido

join clientes on pedidos.cpf = clientes.cpf

join produtos on pedido_produto.id_produto = produtos.id

order by pedido_produto.id_pedido;











