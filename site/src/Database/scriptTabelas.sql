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



-- SELECT
--     plantacao.nome AS NomePlantacao,
--     plantacao.qtdArduino AS QtdArduino,
--     empresa.nome AS NomeEmpresa
-- FROM
--     plantacao
-- JOIN
--     empresa ON plantacao.fkEmpresa = empresa.idEmpresa;
--     
    
    
    
    
insert into plantacao values
	(null, 1, 'estufa Ibiuna', 15);


INSERT INTO plantacao (fkEmpresa, nome, qtdArduino) VALUES (1, 'Fazenda Jasmin', 25);

Select * FROM plantacao;


create table endereco (
	idEndereco int primary key auto_increment,
	fkPlantacao int,
    foreign key (fkPlantacao) references plantacao(idPlantacao),
    cep char(8) not null,
    uf varchar(30) not null,
    cidade varchar(30) not null,
    bairro varchar(30),
    rua varchar(50) not null,
    numero int
);

insert into endereco values
	(null, 1, '21304932', 'SP', 'Ibiuna', 'Cerqueira Cesar','Rua foz do giraldo', 595);

-- SELECT * FROM endereco JOIN
--     plantacao ON endereco.fkPlantacao = plantacao.idPlantacao;




SELECT
    endereco.bairro AS Bairro,
    endereco.cidade AS Cidade,
    plantacao.nome AS NomePlantacao,
    endereco.rua AS Rua,
     endereco.numero AS Numero
FROM
    endereco
JOIN
    plantacao ON endereco.fkPlantacao = plantacao.idPlantacao
WHERE
    plantacao.fkEmpresa = 1;



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
    (1, 22, 50.0);

SELECT
    lm35_temperatura AS temperatura,
    dht11_umidade AS umidade,
    dataHora AS momento,
    DATE_FORMAT(dataHora, '%H:%i:%s') AS momento_grafico
FROM registro
WHERE fkPlantacao = 1
ORDER BY idRegistro DESC
LIMIT 7;

select 
        lm35_temperatura as temperatura, 
        dht11_umidade as umidade,
		DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
		fkPlantacao 
		from registro where fkPlantacao = 1
                    order by idRegistro desc limit 1;

select dht11_temperatura as temperatura, 
	   dht11_umidade as umidade, dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from registro
                    where fk_plantacao = 1
                    order by id desc limit 7;
