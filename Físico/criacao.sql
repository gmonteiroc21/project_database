-- Criar tabela de País
CREATE TABLE Pais (
    NOME VARCHAR(255),
    DAIMYÔ VARCHAR(255)
    CONSTRAINT PK_PAIS PRIMARY KEY (NOME)
);

-- Criar tabela da Vila
CREATE TABLE Vila (
    ID INT,
    NOME VARCHAR(255),
    SIMBOLO VARCHAR(255),
    NOME_PAIS VARCHAR(255),
    CONSTRAINT PK_VILA PRIMARY KEY (ID),
    CONSTRAINT FK_VILA FOREIGN KEY (NOME_PAIS) REFERENCES Pais(NOME)
);

-- Criar tabela de Kage
CREATE TABLE Kage (
    ID_VILA INT,
    NUMERO INT,
    NOME VARCHAR(255),
    CONSTRAINT PK_KAGE PRIMARY KEY (ID_Vila, Número),
    CONSTRAINT FK_KAGE FOREIGN KEY (ID_Vila) REFERENCES Vila(ID)
);

-- Criar tabela de missão
CREATE TABLE Missao (
    ID INT,
    Nível VARCHAR(2), --2 porque pode ser A+, S-, etc
    Recompensa DECIMAL(10, 2), -- DECIMAL para valores monetários
    Data DATE
    CONSTRAINT PK_MISSAO PRIMARY KEY (ID),
);

-- Criar tabela Time
CREATE TABLE Time (
    NUMERO INT,
    SENSEI VARCHAR(255),
    PROTA_1 VARCHAR(255),
    PROTA_2 VARCHAR(255),
    PROTA_3 VARCHAR(255),
    CONSTRAINT PK_TIME PRIMARY KEY (NUMERO)
)

-- Criar tabela Envia
CREATE TABLE Envia (
    ID_Missão INT,
    Num_Time INT,
    ID_Vila INT NOT NULL,
    CONSTRAINT PK_ENVIA PRIMARY KEY (ID_Missão, Num_Time),
    CONSTRAINT FK_ENVIA_MIS FOREIGN KEY (ID_Missão) REFERENCES Missao(ID),
    CONSTRAINT FK_ENVIA_TIM FOREIGN KEY (Num_Time) REFERENCES Time(NUMERO),
    CONSTRAINT FK_ENVIA_VIL FOREIGN KEY (ID_Vila) REFERENCES Vila(ID)
);

-- Criar tabela Torneio
CREATE TABLE Torneio (
    ID INT PRIMARY KEY,
    PREMIO DECIMAL(10, 2), -- DECIMAL para valores monetários
    Data DATE
    CONSTRAINT PK_TORNEIO PRIMARY KEY (ID)
);

-- Criar tabela podios
CREATE TABLE Podios (
    Posição ID PRIMARY KEY
);

-- Criar tabela Participa
CREATE TABLE Participa (
    NUM_TIME INT,
    ID_TORNEIO INT,
    POSICAO INT,
    CONSTRAINT PK_PARTICIPA PRIMARY KEY (NUM_TIME, ID_TORNEIO),
    CONSTRAINT FK_PARTICIPA_NUM FOREIGN KEY (NUM_TIME) REFERENCES Time(Número),
    CONSTRAINT FK_PARTICIPA_ID_TORNEIO FOREIGN KEY (ID_Torneio) REFERENCES Torneio(ID),
    CONSTRAINT FK_PARTICIPA_POS FOREIGN KEY (POSICAO) REFERENCES Podios(POSICAO)
);

-- Criar tabela de Ninja
CREATE TABLE Ninja (
    ID INT,
    NOME VARCHAR(255),
    RANKING INT,
    END_CEP VARCHAR(20),
    END_LOGRADOURO VARCHAR(100),
    NUM_TIME, --Verificar ao inserir, modificar e deletar elemento
    CONSTRAINT PK_NINJA PRIMARY KEY (ID),
    CONSTRAINT FK_NINJA FOREIGN KEY (NUM_TIME) REFERENCES Time(NUMERO)
)

-- Criar tabela Estilo Ninja
CREATE TABLE Estilo_Ninja (
    ID_Ninja INT,
    Estilo VARCHAR(255),
    CONSTRAINT PK_ESTILO PRIMARY KEY (ID_Ninja, Estilo),
    CONSTRAINT FK_ESTILO FOREIGN KEY (ID_Ninja) REFERENCES Ninja(ID)
);

-- Criar tabela de Treina
CREATE TABLE Treina (
    ID_Treinador INT,
    ID_Aluno INT,
    CONSTRAINT PK_TREINA PRIMARY KEY (ID_Treinador, ID_Aluno)
    CONSTRAINT FK_TREINA_TREINADOR FOREIGN KEY (ID_Treinador) REFERENCES Ninja(ID),
    CONSTRAINT FK_TREINA_ALUNO FOREIGN KEY (ID_Aluno) REFERENCES Ninja(ID)
);

-- Criar tabela Jutsu
CREATE TABLE Jutsu (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255)
);

--Ninjutsu
CREATE TABLE Ninjutsu(
    ID_JUTSU INT,
    QTD_CHACRA INT,
    ELEMENTO VARCHAR(25),
    CONSTRAINT PK_NINJUTSO PRIMARY KEY (ID_JUTSU)
    CONSTRAINT FK_NINJUTSO FOREIGN KEY (ID_JUTSU) REFERENCES Jutsu(ID)
)
--Taijutso
CREATE TABLE Taijutso(
    ID_JUTSU INT,
    PODER_FISICO INT,
    CONSTRAINT PK_TAIJUTSO PRIMARY KEY (ID_JUTSU)
    CONSTRAINT FK_TAIJUTSO FOREIGN KEY (ID_JUTSU) REFERENCES Jutsu(ID)
)
--Genjutsu
CREATE TABLE Genjutsu(
    ID_JUTSU INT,
    PODER_ILUSAO INT,
    CONSTRAINT PK_GENJUTSU PRIMARY KEY (ID_JUTSU)
    CONSTRAINT FK_GENJUTSU FOREIGN KEY (ID_JUTSU) REFERENCES Jutsu(ID)
)
