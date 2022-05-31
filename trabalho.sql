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
	numero 		NUMBER(5) 		NOT NULL,
	nome		VARCHAR2(100)	NOT NULL,
	cod_seg		NUMBER(3)		NOT NULL,
	validade	--A verificar ainda,
	bandeira  	VARCHAR2(100)	NOT NULL,
	--Possivelmente ter que fazer um try catch, para confirmar se o cartão for completamente igual, não permitir ser vinculado novamente, assim inibindo a utilização do mesmo cartão em diversas contas
	--caso contrário poderai ocorrer diversos roubos etc.

);

CREATE TABLE Usuário(
	nome		VARCHAR2(100)	NOT NULL, --novidade, pois a pessoa pode colocar um nick próprio
	cod_ID      NUMBER(5)  		NOT NULL,
	cartao_ID 	NUMBER(5), --Os usuários podem ou não ter um cartão vinculado, caso vazio, a conta seria gratúita
	musica_ID 	NUMBER(5), --Musica que está a escutar no momento, caso vazia, não está a escutar nada no momento
	CONSTRAINT fk_pes_usu FOREIGN KEY (cod_ID),
	CONSTRAINT fk_mus_usu FOREIGN KEY (musica_ID),
	CONSTRAINT fk_car_usu FOREIGN KEY (cartao_ID)

);