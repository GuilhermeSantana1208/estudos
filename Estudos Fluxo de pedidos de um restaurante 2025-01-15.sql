create table garçom 
(ID_Garçom Integer not null,
 Nome Varchar (40),
 Primary Key (ID_Garçom));

 create table cozinheiro
 (ID_Cozinheiro integer not null,
  Nome Varchar (40),
  Primary Key (ID_Cozinheiro));

  create table Cliente
  (ID_Comanda_Cliente integer not null,
   Nome Varchar (40),
   Primary Key ID_Comanda_Cliente));

  create table pedido
  (ID_Pedido integer not null,
   ID_Cozinheiro integer not null,
   ID_Garçom integer not null,
   ID_Comanda_Cliente integer not null,
   Data_hora timestamp,
   Status Varchar (30),
   Foreign Key (ID_Cozinheiro) references cozinheiro (ID_Cozinheiro),
   Foreign Key (ID_Garçom) references garçom (ID_Garçom),
   Primary key (ID_Pedido));

   create table prato
   (ID_Prato integer not null,
    Nome Varchar (40),
	Preço numeric (3,2),
	Tempo_Preparo Time,
	Primary Key (ID_Prato));
    
	create table Item_Pedido
   (ID_Item integer not null,
    ID_Pedido integer not null,
	Quantidade integer not null,
	ID_Cozinheiro integer not null,
	ID_Prato integer not null,
    Primary Key (ID_Item),
	Foreign Key (ID_Pedido) references pedido (ID_Pedido),
	Foreign Key (ID_Prato) references prato (ID_Prato),
	Foreign key (ID_Cozinheiro) references Cozinheiro (ID_Cozinheiro));

	
