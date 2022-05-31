drop table Artistas;
drop table Pessoas;
drop table Musicas;
drop table Usuarios;
drop table Playlists;





CREATE TABLE Pessoas(
	cod_ID 	NUMBER(5)		NOT NULL,
	nome	VARCHAR2(100)	NOT NULL,
	email 	VARCHAR2(100)	NOT NULL,
	CONSTRAINT pk_pessoas  	PRIMARY KEY (cod_ID)--,
	--CONSTRAINT uk_pessoas_cod_ID UNIQUE (cod_ID)
);



CREATE TABLE Artistas(
    nome_art    VARCHAR2(100)   NOT NULL,
    estudio     VARCHAR2(100)   NOT NULL,
    cod_ID      NUMBER(5)       NOT NULL,
    CONSTRAINT pk_artistas  PRIMARY KEY (nome_art),
    CONSTRAINT fk_pes_art   FOREIGN KEY (cod_ID) references Pessoas(cod_ID)--,  
  --CONSTRAINT uk_artistas_nome_art UNIQUE (nome_art)
);

CREATE TABLE Musicas(
	nome 			VARCHAR2(100) NOT NULL,
	id_musica 		NUMBER(8) NOT NULL,
	duracao 		NUMBER(8) NOT NULL,
	qnt_estrelas	NUMBER(1) NOT NULL,
	estilo_musical 	VARCHAR2(100),

	CONSTRAINT pk_musicas PRIMARY KEY (id_musica)
);


CREATE TABLE Usuarios(
	nome 			VARCHAR2(100) NOT NULL,
	cod_id			NUMBER(5) NOT NULL,
	CPF				NUMBER (9) NOT NULL
	--cartao_credito 	NUMBER (16),
	--bandeira_cartao VARCHAR2 (50),
	--validade		DATE,
	--CVV				NUMBER (3)
);


CREATE TABLE cartao_credito(
	numero_cartao 	NUMBER (16) NOT NULL,
	bandeira_cartao VARCHAR2 (50) NOT NULL,
	validade		DATE NOT NULL,
	CVV				NUMBER (3)NOT NULL
);


UPDATE cartao_credito
SET bandeira_cartao = 'Mastercard'
WHERE cartao_credito like '5%'; 

UPDATE cartao_credito
SET bandeira_cartao = 'Visa'
WHERE cartao_credito like '4%';

UPDATE cartao_credito
SET bandeira_cartao = 'Dinners Club'
WHERE cartao_credito like '36%' OR cartao_credito like '38%';

UPDATE cartao_credito
SET bandeira_cartao = 'Discover'
WHERE cartao_credito like '6011%' OR cartao_credito like '65%';

UPDATE cartao_credito
SET bandeira_cartao = 'American Express'
WHERE cartao_credito like '34%' OR cartao_credito like '37%';


ALTER TABLE cartao_credito
ADD CONSTRAINT verificaValidade
check(validade < sysdate );



CREATE TABLE Playlists(
	ID_List	NUMBER(5) NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	privado NUMBER(1) DEFAULT '0',

	CONSTRAINT pk_Playlists PRIMARY KEY (ID_List)
);


--Verificar se o atributo 'privado' é público (0) ou privado (1). 
--Somente aceitará 0 ou 1.
ALTER TABLE Playlists 
ADD CONSTRAINT verificaPrivado01
check (privado IN ('0', '1' ));


