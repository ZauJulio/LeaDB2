/* bd2_v3_logic: */

CREATE TABLE Usuario (
    registration NUMERIC PRIMARY KEY,
    cpf VARCHAR,
    name VARCHAR,
    username VARCHAR,
    login VARCHAR,
    password VARCHAR
);

CREATE TABLE Class (
    id NUMERIC PRIMARY KEY,
    name VARCHAR,
    period NUMERIC,
    monitor NUMERIC
);

CREATE TABLE Admin (
    id NCHAR,
    fk_User_registration NUMERIC,
    PRIMARY KEY (id, fk_User_registration)
);

CREATE TABLE Discente (
    id NUMERIC,
    fk_User_registration NUMERIC,
    PRIMARY KEY (id, fk_User_registration)
);

CREATE TABLE Docente (
    id NUMERIC,
    fk_User_registration NUMERIC,
    PRIMARY KEY (id, fk_User_registration)
);

CREATE TABLE Monitor (
    id NUMERIC,
    fk_User_registration NUMERIC,
    fk_Class_id NUMERIC,
    PRIMARY KEY (id, fk_User_registration)
);

CREATE TABLE Atendimento (
    id NUMERIC PRIMARY KEY,
    date_time TIMESTAMP,
    duration NUMERIC,
    fk_Monitor_id NUMERIC,
    fk_Monitor_fk_User_registration NUMERIC,
    fk_Class_id NUMERIC
);

CREATE TABLE Duvida (
    id NUMERIC PRIMARY KEY,
    description VARCHAR,
    title VARCHAR,
    allowed BOOLEAN,
    fk_Atendimento_id NUMERIC,
    fk_Discente_id NUMERIC,
    fk_Discente_fk_User_registration NUMERIC
);

CREATE TABLE Resposta (
    id NUMERIC PRIMARY KEY,
    title VARCHAR,
    allowed BOOLEAN,
    description VARCHAR,
    fk_Discente_id NUMERIC,
    fk_Discente_fk_User_registration NUMERIC,
    fk_Docente_id NUMERIC,
    fk_Docente_fk_User_registration NUMERIC,
    fk_Monitor_id NUMERIC,
    fk_Monitor_fk_User_registration NUMERIC,
    fk_Duvida_id NUMERIC
);

CREATE TABLE docente_class (
    fk_Docente_id NUMERIC,
    fk_Docente_fk_User_registration NUMERIC,
    fk_Class_id NUMERIC
);

CREATE TABLE discente_class (
    fk_Class_id NUMERIC,
    fk_Discente_id NUMERIC,
    fk_Discente_fk_User_registration NUMERIC
);

CREATE TABLE atendimento_discente (
    fk_Discente_id NUMERIC,
    fk_Discente_fk_User_registration NUMERIC,
    fk_Atendimento_id NUMERIC
);

CREATE TABLE duvida_class (
    fk_Duvida_id NUMERIC,
    fk_Class_id NUMERIC
);
 
ALTER TABLE Admin ADD CONSTRAINT FK_Admin_2
    FOREIGN KEY (fk_User_registration)
    REFERENCES Usuario (registration)
    ON DELETE CASCADE;
 
ALTER TABLE Discente ADD CONSTRAINT FK_Discente_2
    FOREIGN KEY (fk_User_registration)
    REFERENCES Usuario (registration)
    ON DELETE CASCADE;
 
ALTER TABLE Docente ADD CONSTRAINT FK_Docente_2
    FOREIGN KEY (fk_User_registration)
    REFERENCES Usuario (registration)
    ON DELETE CASCADE;
 
ALTER TABLE Monitor ADD CONSTRAINT FK_Monitor_2
    FOREIGN KEY (fk_User_registration)
    REFERENCES Usuario (registration)
    ON DELETE CASCADE;
 
ALTER TABLE Monitor ADD CONSTRAINT FK_Monitor_3
    FOREIGN KEY (fk_Class_id)
    REFERENCES Class (id)
    ON DELETE SET NULL;
 
ALTER TABLE Atendimento ADD CONSTRAINT FK_Atendimento_2
    FOREIGN KEY (fk_Monitor_id, fk_Monitor_fk_User_registration)
    REFERENCES Monitor (id, fk_User_registration)
    ON DELETE SET NULL;
 
ALTER TABLE Atendimento ADD CONSTRAINT FK_Atendimento_3
    FOREIGN KEY (fk_Class_id)
    REFERENCES Class (id)
    ON DELETE SET NULL;
 
ALTER TABLE Duvida ADD CONSTRAINT FK_Duvida_2
    FOREIGN KEY (fk_Atendimento_id)
    REFERENCES Atendimento (id)
    ON DELETE CASCADE;
 
ALTER TABLE Duvida ADD CONSTRAINT FK_Duvida_3
    FOREIGN KEY (fk_Discente_id, fk_Discente_fk_User_registration)
    REFERENCES Discente (id, fk_User_registration)
    ON DELETE CASCADE;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_2
    FOREIGN KEY (fk_Discente_id, fk_Discente_fk_User_registration)
    REFERENCES Discente (id, fk_User_registration)
    ON DELETE CASCADE;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_3
    FOREIGN KEY (fk_Docente_id, fk_Docente_fk_User_registration)
    REFERENCES Docente (id, fk_User_registration)
    ON DELETE CASCADE;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_4
    FOREIGN KEY (fk_Monitor_id, fk_Monitor_fk_User_registration)
    REFERENCES Monitor (id, fk_User_registration)
    ON DELETE CASCADE;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_5
    FOREIGN KEY (fk_Duvida_id)
    REFERENCES Duvida (id)
    ON DELETE CASCADE;
 
ALTER TABLE docente_class ADD CONSTRAINT FK_docente_class_1
    FOREIGN KEY (fk_Docente_id, fk_Docente_fk_User_registration)
    REFERENCES Docente (id, fk_User_registration)
    ON DELETE RESTRICT;
 
ALTER TABLE docente_class ADD CONSTRAINT FK_docente_class_2
    FOREIGN KEY (fk_Class_id)
    REFERENCES Class (id)
    ON DELETE RESTRICT;
 
ALTER TABLE discente_class ADD CONSTRAINT FK_discente_class_1
    FOREIGN KEY (fk_Class_id)
    REFERENCES Class (id)
    ON DELETE RESTRICT;
 
ALTER TABLE discente_class ADD CONSTRAINT FK_discente_class_2
    FOREIGN KEY (fk_Discente_id, fk_Discente_fk_User_registration)
    REFERENCES Discente (id, fk_User_registration)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento_discente ADD CONSTRAINT FK_atendimento_discente_1
    FOREIGN KEY (fk_Discente_id, fk_Discente_fk_User_registration)
    REFERENCES Discente (id, fk_User_registration)
    ON DELETE RESTRICT;
 
ALTER TABLE atendimento_discente ADD CONSTRAINT FK_atendimento_discente_2
    FOREIGN KEY (fk_Atendimento_id)
    REFERENCES Atendimento (id)
    ON DELETE SET NULL;
 
ALTER TABLE duvida_class ADD CONSTRAINT FK_duvida_class_1
    FOREIGN KEY (fk_Duvida_id)
    REFERENCES Duvida (id)
    ON DELETE SET NULL;
 
ALTER TABLE duvida_class ADD CONSTRAINT FK_duvida_class_2
    FOREIGN KEY (fk_Class_id)
    REFERENCES Class (id)
    ON DELETE SET NULL;