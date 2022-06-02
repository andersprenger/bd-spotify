CREATE TABLE Pessoas(
	cod_ID 	NUMBER(5)		NOT NULL,
	nome	VARCHAR2(100)	NOT NULL,
	email 	VARCHAR2(100)	NOT NULL,
	CONSTRAINT pk_pessoas  	PRIMARY KEY (cod_ID)
);

CREATE TABLE Artistas(
    nome_art    VARCHAR2(100)   NOT NULL,
    estudio     VARCHAR2(100)   NOT NULL,
    cod_ID      NUMBER(5)       NOT NULL,
    CONSTRAINT pk_artistas  PRIMARY KEY (nome_art),
    CONSTRAINT fk_pes_art   FOREIGN KEY (cod_ID)
);

CREATE TABLE Musica(
	nome 			VARCHAR2(100)	NOT NULL,
	musica_ID 		NUMBER(5) 		NOT NULL,
	nome_art    	VARCHAR2(100)   NOT NULL,
	duracao 		NUMBER(5) 		NOT NULL,
	qnt_estrelas 	NUMBER(1) 		NOT NULL,
	estilo_musical	VARCHAR2(100)	NOT NULL,
	CONSTRAINT pk_musicas PRIMARY KEY (musica_ID),
	CONSTRAINT fk_art_mus FOREIGN KEY (nome_art)
);

CREATE TABLE Cartao(
	numero 			NUMBER(5) 		NOT NULL,
	nome			VARCHAR2(100)	NOT NULL,
	cod_seg			NUMBER(3)		NOT NULL,
	validade_mes	NUMBER(2)		NOT NULL,
	validade_ano	NUMVER(4)		NOT NULL,
	bandeira_cartao  	VARCHAR2(20)
	--Possivelmente ter que fazer um try catch, para confirmar se o cartão for completamente igual, não permitir ser vinculado novamente, assim inibindo a utilização do mesmo cartão em diversas contas
	--caso contrário poderai ocorrer diversos roubos etc.

);

CREATE TABLE Usuário(
	nome		VARCHAR2(100), --novidade, pois a pessoa pode colocar um nick próprio 
	cod_ID      NUMBER(5)  		NOT NULL,
	cartao_ID 	NUMBER(5), --Os usuários podem ou não ter um cartão vinculado, caso vazio, a conta seria gratúita
	musica_ID 	NUMBER(5), --Musica que está a escutar no momento, caso vazia, não está a escutar nada no momento
	CONSTRAINT fk_pes_usu FOREIGN KEY (cod_ID),
	CONSTRAINT fk_mus_usu FOREIGN KEY (musica_ID),
	CONSTRAINT fk_car_usu FOREIGN KEY (cartao_ID)

);

--------------------------------------------------------------------------
		-- SEÇÃO QUE PREENCHE AS BANDEIRAS DOS CARTÕES INSERIDOS

-- Mastercard: 51, 52, 53, 54 e 55;
UPDATE Cartao
SET bandeira_cartao = 'Mastercard'
WHERE cartao_credito like '51%'OR cartao_credito like '52%' OR cartao_credito like '53%' OR cartao_credito like '54%' OR cartao_credito like '55%'; 

-- Visa: 4;
UPDATE Cartao
SET bandeira_cartao = 'Visa'
WHERE cartao_credito like '4%';

-- Diners Club: 36 e 38;
UPDATE Cartao
SET bandeira_cartao = 'Dinners Club'
WHERE cartao_credito like '36%' OR cartao_credito like '38%';

-- Discover: 6011 e 65;
UPDATE Cartao
SET bandeira_cartao = 'Discover'
WHERE cartao_credito like '6011%' OR cartao_credito like '65%';

-- American Express: 34 e 37.
UPDATE Cartao
SET bandeira_cartao = 'American Express'
WHERE cartao_credito like '34%' OR cartao_credito like '37%';


--------------------------------------------------------------------------



-- De acordo com a determinação, os cartões de crédito e débito só podem começar com 3, 4, 5 e 6.
ALTER TABLE Cartao 
ADD CONSTRAINT verificaSeÉValido
check (numero like (3%) OR numero like (4%) OR numero like (5%) OR numero like (6%));



--------------------------------------------------------------------------
		-- VERIFICA SE VALIDADE (MÊS E ANO) DO CARTÃO INSERIDO É MENOR D0 QUE ATUAL
ALTER TABLE Cartao
ADD CONSTRAINT verificaValidade
check(validade_mes < 
select EXTRACT(MONTH FROM sysdate) from dual;
select to_char(sysdate, ‘mm’) from dual; );


ALTER TABLE Cartao
ADD CONSTRAINT verificaValidade
check(validade_ano < 
select EXTRACT(YEAR FROM sysdate) from dual;
select to_char(sysdate, ‘YYYY’) from dual; );
--------------------------------------------------------------------------



-- create table playlists
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


