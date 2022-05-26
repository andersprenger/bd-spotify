CREATE TABLE Pessoas(
	cod_ID 	NUMBER(5)		NOT NULL,
	nome	VARCHAR2(100)	NOT NULL,
	email 	VARCHAR2(100)	NOT NULL,
	CONSTRAINT pk_pessoas  	PRIMARY KEY (cod_ID),
	CONSTRAINT uk_pessoas_cod_ID UNIQUE (cod_ID)
);

CREATE TABLE Artistas(
    nome_art    VARCHAR2(100)   NOT NULL,
    estudio     VARCHAR2(100)   NOT NULL,
    cod_ID      NUMBER(5)       NOT NULL,
    CONSTRAINT pk_artistas  PRIMARY KEY (nome_art),
    CONSTRAINT fk_pes_art   FOREIGN KEY (cod_ID),
    CONSTRAINT uk_artistas_nome_art UNIQUE (nome_art)
);

CREATE TABLE Musica(
	nome VARCHAR2(100) NOT NULL,
	id_musica NUMBER(8) NOT NULL,
	duracao NUMBER(8) NOT NULL,
	qnt_estrelas NUMBER(1) NOT NULL,
	estilo_musical VARCHAR2(100)

	CONSTRAINT pk_musicas PRIMARY KEY (id_musica)
);