create database dbinfo;
use dbinfo;
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null, 
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela 
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'José de Assis','9999-9999','Joseassis','123456');

select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','9999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','9999-9999','bill','123456');

-- A linha abaixo modifica dados na tabela (CRUD) 
-- update -> update
update tbusuarios set fone='8888-8888' where iduser=2;

-- A linha abaixo apaga um registro da tabela (CRUD)
delete from tbusuarios where iduser=3;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes; 

insert into tbclientes(nomecli,endcli,fonecli,emailcli) 
values('Linus Torvalds','Rua Tux, 2015','9999-9999','linus@linux.com'); 

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

-- O código abaixo traz informações de duas tabelas
select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C 
on (O.idcli = C.idcli); 

