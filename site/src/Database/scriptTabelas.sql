drop database strawTech;

create database strawTech;
use strawTech;

create table empresa(
	idEmpresa int primary key auto_increment,
    nome varchar(40) not null,
    representante varchar(50),
    cnpj char(14) not null,
    CEP varchar(40) not null,
    cidade varchar(40) not null,
    bairro varchar(40) not null,
    rua varchar(40) not null,
    numero varchar(20) not null,
    email varchar(60) not null,
	senha varchar(30) not null
);

insert into empresa (nome, representante, cnpj, CEP, cidade, bairro, rua, numero, email, senha) values
	('Group Frizaa', 'Frizza', '29410562723333',  '05819030', 'São Paulo', 'Jardim santa josé fina', 'Rua foz do giraldo',  '96',  'friza@sptech.school', 'Frizza' );

select * from empresa;


create table plantacao (
	idPlantacao int auto_increment,
	fkEmpresa int,
	foreign key (fkEmpresa) references empresa(idEmpresa),
    nome varchar(50),
    qtdArduino int,
    primary key (idPlantacao, fkEmpresa)
    );

    
insert into plantacao values
	(2, 1, 'estufa Boituva', 6);


INSERT INTO plantacao (fkEmpresa, nome, qtdArduino) VALUES (2, 'Minha Plantacao', 5);

Select * FROM plantacao;


-- create table endereco (
-- 	idEndereco int primary key auto_increment,
-- 	fkPlantacao int,
--     foreign key (fkPlantacao) references plantacao(idPlantacao),
--     cep char(8) not null,
--     uf varchar(30) not null,
--     cidade varchar(30) not null,
--     bairro varchar(30),
--     rua varchar(50) not null,
--     numero int
-- );

-- insert into endereco values
-- 	(null, 1, '21304932', 'SP', 'Sao Paulo', 'Cerqueira Cesar','Hadock Lobo', 595),
-- 	(null, 2, '89320492', 'RJ', 'Rio de Janeiro', 'Madureira','Avenida Brasil', 1000),
-- 	(null, 3, '64154647', 'SP', 'Sao Paulo', 'Cerqueira Cesar','Alameda Santos', 3445),
-- 	(null, 4, '54646819', 'SC', 'Santa Catarina', 'Joinville', 'Pitangas', 34);


-- create table arduino (
-- 	idArduino int primary key auto_increment,
-- 	fkPlantacao int,
-- 	foreign key (fkPlantacao) references plantacao(idPlantacao),
-- 	dtInstalacao date
--     );


create table registro (
	idRegistro int primary key auto_increment,
	fkPlantacao int,
	foreign key (fkPlantacao) references plantacao(idPlantacao),
    lm35_temperatura decimal(4,2),
    dht11_umidade decimal(4,2),
    dataHora DATETIME  DEFAULT current_timestamp 
);

SELECT * FROM registro;

INSERT INTO registro (fkPlantacao, lm35_temperatura, dht11_umidade)
VALUES
    (2, 30, 80.0);

SELECT
    lm35_temperatura AS temperatura,
    dht11_umidade AS umidade,
    dataHora AS momento,
    DATE_FORMAT(dataHora, '%H:%i:%s') AS momento_grafico
FROM registro
WHERE fkPlantacao = 2
ORDER BY idRegistro DESC
LIMIT 7;

select 
        lm35_temperatura as temperatura, 
        dht11_umidade as umidade,
		DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
		fkPlantacao 
		from registro where fkPlantacao = 2
                    order by idRegistro desc limit 1;

select dht11_temperatura as temperatura, 
	   dht11_umidade as umidade, dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from registro
                    where fk_plantacao = 1
                    order by id desc limit 7;
