create database Revisao;
use Revisao;

create table Departamento(
codigo int primary key,
nome varchar(20));

create table Funcionario(
codigo int primary key,
primeiroNome varchar(20) not null,
segunoNome varchar(20) not null,
ultimoNome varchar(20) not null,
dataNasci date not null,
CPF char(11) not null,
RG char(11) not null,
endereco varchar(100) not null,
CEP char(8) not null,
cidade varchar(60) not null,
fone char(9) not null,
funcao varchar(20) not null,
salario decimal(4,2) not null,
codigoDepartamento int,
foreign key (codigoDepartamento) references Departamento(codigo));

insert into Departamento values(1, 'Informática');
insert into Departamento values(2, 'IoT');
insert into Departamento values(3, 'Segurança da informação');
insert into Departamento values(4, 'Recursos Humanos');

(1, 'Carimbo, '');
(2,'');
(3,);
(4,);
