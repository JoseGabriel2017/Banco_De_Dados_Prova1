create database carro_veio;

use carro_veio;

create table clientes(
idcliente int not null auto_increment primary key,
nome varchar (120),
email varchar (120),
endereco varchar (150),
telefone varchar (12),
index(idcliente)
);

insert into clientes values
(default,'Gabriel','gabriel@gmail.com','Rua cicin','4444444','555555'),
(default,'João','joao@gmail.com','Rua cicin','88888','555555'),
(default,'Marcos','marcosl@gmail.com','Rua cicin','121212','555555');

select * from clientes;

create table veiculo(
idveiculo int not null auto_increment primary key,
placa varchar (7),
anodoveiculo varchar (8),
modelo varchar (45),
montadora varchar (45),

clientes_idclientes int,
foreign key (clientes_idclientes) references clientes(idcliente),

index(idveiculo)
);

insert into veiculo values 
('1452', '1900', 'Fusca', 'veiculum', '1', 'novo'),
('4521', '2000', 'Jonaxx', 'vassBol', '2', 'velho'),
('45875', '2023', 'FerrariX10', 'veiculum', '3', 'novo');


create table funcionario(
idfuncionario int not null auto_increment primary key,
nome varchar (120),
funcao varchar (45),
endereco varchar (150),
telefone varchar (12),
index(idfuncionario)
);

insert into funcionario values
('Felipe', 'operador', 'rua pedrin', '1452365', '858585'),
('Matheus', 'ferreiro', 'rua amarin', '145254', '458758'),
('Jon', 'martelador', 'rua sivin', '458754', '45251');


create table venda (
idvenda int not null auto_increment primary key,
data varchar(10),
valor double,

clientes_idclientes int,
foreign key (clientes_idclientes) references clientes(idcliente),

funcionario_idfuncionario int,
foreign key (funcionario_idfuncionario) references funcionario(idfuncionario),
index(idvenda)
);

insert into venda values
('20/06', '100', '1', '1'),
('21/06', '200', '2', '2'),
('22/06', '300', '3', '3');


create table pecas(
idpecas int not null auto_increment primary key,
descricao varchar (120),
valor double,
quantidade int,
index(idpecas)

);

insert into pecas values
('1', 'marreta', '50', '10'),
('2', 'martelo', '40', '2'),
('3', 'chave de fenda', '10', '5');


create table itens_da_venda(
quantidade int,

venda_idvenda int,
foreign key (venda_idvenda) references venda(idvenda),

pecas_idpecas int,
foreign key (pecas_idpecas) references pecas(idpecas)
);


create table os(
idos int not null auto_increment primary key,
datasolicitacao varchar (10),
dataprevisao varchar (10),

clientes_idclientes int,
foreign key (clientes_idclientes) references clientes(idcliente),

funcionario_idfuncionario int,
foreign key (funcionario_idfuncionario) references funcionario(idfuncionario),

veiculo_idveiculo int,
foreign key (veiculo_idveiculo) references veiculo(idveiculo),

index(idos)

);

insert into os values
('19/06', '20/06', '1', '1', '1'),
('20/06', '21/06', '2', '2', '2'),
('21/06', '22/06', '3', '3', '3');


create table servico(
idservico int not null auto_increment primary key,
descricao varchar (120),
valor double,
index(idservico)
);

insert into servico values
('Trabalhar duro', '100'),
('Trabalhar leve', '40'),
('nunca trabalhar', '0');


create table itens_os(
os_idos int,
foreign key (os_idos) references os(idos),

servico_idservico int,
foreign key (servico_idservico) references servico(idservico)
);

alter table funcionario
add column rg varchar(11);

alter table clientes
add column rg varchar (11);

alter table veiculo
add column tipo varchar(30);

update clientes
set nome = 'Pedro'
where idcliente='1';

 update os
 set dataprevisao = '30/06'
 where idos = '1';
 
 update veiculo
 set modelo = 'civic'
 where idveiculo = '1';
 
 delete from pecas
 where idpecas = '1'
 limit 1;
 
 delete from servico
 where idservico = '1'
 limit 1;
 
 



