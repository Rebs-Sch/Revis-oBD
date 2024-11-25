create database Revisao;
use Revisao;

create table Departamento(
codigo int primary key,
nome varchar(20),
localizacao varchar(60),
codigoFuncionarioGerente int); -- não sei como eu relacionaria isso com o codigo do funcionario, já que a tabela funcionario já tem uma chave estrangeira para esta tabela, mas ok

create table Funcionario(
codigo int primary key,
primeiroNome varchar(20) not null,
segunoNome varchar(20),
ultimoNome varchar(20) not null,
dataNasci date not null,
CPF char(11) not null,
RG char(11) not null,
endereco varchar(100) not null,
CEP char(8) not null,
cidade varchar(60) not null,
fone char(9) not null,
funcao varchar(20) not null,
salario float(6) not null,
codigoDepartamento int,
foreign key (codigoDepartamento) references Departamento(codigo));

insert into Departamento values(1, 'Informática', 'Belo Horizonte', 4);
insert into Departamento values(2, 'IoT', 'João Pessoa', 3);
insert into Departamento values(3, 'Segurança', 'Curitiba', 2);
insert into Departamento values(4, 'Recursos Humanos', 'Porto Alegre', 1);

insert into Funcionario values(1, 'Carimbo', 'Clóvis', 'da Silva', '1956-03-09', '11111111111', '11111111111', 'Avenida Garibaldi, 2268', '85887000', 'Matelândia', '991546378', 'gerente', 9783.00, 4);
insert into Funcionario values(2, 'Deide', 'Costa', 'Lemory', '1986-07-11', '22222222222', '22222222222', 'Centro, 765', '85887000', 'Cianorte', '986542378', 'gerente', 9783.00, 3);
insert into Funcionario values(3, 'Amarilda', 'Maria', 'Augusta', '1992-12-27', '33333333333', '33333333333', 'Duque de Caxias, 1689', '8584000', 'Céu azul', '973647453', 'gerente', 9783.00, 2);
insert into Funcionario values(4, 'Guilhermino', 'Otávio', 'dos Santos', '1995-05-30', '44444444444', '44444444444', 'Avenida Paraná, 352', '85440000', 'Ubiratã', '965874632', 'gerente', 9783.00, 1);
insert into Funcionario values(5, 'Daiane', 'Regina', 'Oliveira', '1978-08-18', '55555555555', '55555555555', 'Avenida Garibaldi, 2268', '85887000', 'Matelândia', '964532183', 'supervisor', 5620.00, 4);
insert into Funcionario values(6, 'Arnaldo', '', 'Schneider', '1978-08-18', '66666666666', '66666666666', 'Rua das Palmeiras, 713', '23812310', 'Recife', '985456742', 'telefonista', 2120.00, 1);


select primeiroNome, ultimoNome from Funcionario order by ultimoNome;
select * from Funcionario order by cidade;
select * from Funcionario where salario > 1000 order by primeiroNome, segunoNome, ultimoNome;
select primeiroNome, dataNasci from Funcionario order by dataNasci desc;
select primeiroNome, segunoNome, ultimoNome, fone from Funcionario;
select sum(salario) from Funcionario;
select Fun.primeiroNome, Dep.nome, Fun.funcao from Funcionario Fun, Departamento Dep where Dep.codigo = Fun.codigoDepartamento;
select Dep.nome, Fun.primeiroNome, Fun.funcao from Departamento Dep, Funcionario Fun where Dep.codigoFuncionarioGerente = Fun.codigo;
select codigoDepartamento, sum(salario) from Funcionario group by codigoDepartamento; -- não consegui por o nome do departamento
select Fun.primeiroNome, Dep.nome from Funcionario Fun, Departamento Dep where Dep.codigo = Fun.codigoDepartamento and funcao = 'supervisor';
select count(*) from Funcionario;
select avg(salario) from Funcionario;
select primeiroNome from Funcionario where funcao = 'telefonista' and cidade = 'Recife';
select Dep.nome, Fun.primeiroNome from Departamento Dep, Funcionario Fun where Fun.codigoDepartamento = Dep.codigo order by Dep.nome, Fun.primeiroNome;
select primeiroNome, ultimoNome from Funcionario where segunoNome = '';
select codigoDepartamento, min(salario) from Funcionario group by codigoDepartamento; -- de novo, não consegui por o nome do departamento