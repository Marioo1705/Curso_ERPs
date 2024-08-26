-- Borrado inicial de tablas y enumerados para hacer prueba de funcionamiento desde cero

DROP TABLE IF EXISTS Equipos CASCADE;
DROP TABLE IF EXISTS Presidentes CASCADE;
DROP TABLE IF EXISTS Jugadores CASCADE;
DROP TABLE IF EXISTS Partidos CASCADE;
DROP TABLE IF EXISTS Equipos_Partidos CASCADE;
DROP TABLE IF EXISTS Goles CASCADE;
DROP TABLE IF EXISTS Partidos_Goles CASCADE;
DROP TABLE IF EXISTS Copia_Jugadores CASCADE;

DROP TYPE IF EXISTS posicion_jugador_enum CASCADE;

-- **********************
-- * CREACIÓN DE TABLAS *
-- **********************

-- Creación de tabla Equipos
CREATE TABLE Equipos (
	id SERIAL,
	nombre_equipo VARCHAR(50) UNIQUE NOT NULL,
	nombre_estadio VARCHAR(100) NOT NULL,
	aforo INT,
	ano_fundacion VARCHAR(10),
	ciudad VARCHAR(50) NOT NULL,
	codigo VARCHAR (20) UNIQUE NOT NULL,
	PRIMARY KEY (id)
);

-- Creación de tabla Presidentes
CREATE TABLE Presidentes (
	id SERIAL,
	nombre VARCHAR(15) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	dni VARCHAR(20) UNIQUE,
	fecha_nacimiento DATE,
	ano_elegido VARCHAR(10),
	fk_id_equipo INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_equipo) REFERENCES Equipos
);

-- Creación de tabla Jugadores
CREATE TYPE posicion_jugador_enum AS ENUM ('Portero', 'Defensa', 'Centrocampista', 'Delantero');

CREATE TABLE Jugadores (
	id SERIAL,
	nombre VARCHAR(50) NOT NULL,
	posicion posicion_jugador_enum NOT NULL,
	fecha_nacimiento DATE,
	codigo VARCHAR(20) UNIQUE NOT NULL,
	fk_id_equipo INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_equipo) REFERENCES Equipos
);

-- Creación de tabla Partidos
CREATE TABLE Partidos (
	id SERIAL,
	fecha DATE NOT NULL,
	nombre VARCHAR(50) UNIQUE NOT NULL,
	goles_equipo_local INT,
	goles_equipo_visitante INT,
	codigo INT UNIQUE NOT NULL,
	PRIMARY KEY (id)
);

-- Creación de tabla Equipos_Partidos
CREATE TABLE Equipos_Partidos (
	id SERIAL,
	fk_id_equipo INT,
	fk_id_partido INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_equipo) REFERENCES Equipos,
	FOREIGN KEY (fk_id_partido) REFERENCES Partidos
);

-- Creación de tabla Goles
CREATE TABLE Goles (
	id SERIAL,
	descripcion TEXT,
	fk_id_goleador INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_goleador) REFERENCES Jugadores
);

-- Creación de tabla Partidos_Goles 
CREATE TABLE Partidos_Goles (
	id SERIAL,
	minuto_gol VARCHAR(10),
	fk_id_partido INT,
	fk_id_gol INT,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_partido) REFERENCES Partidos,
	FOREIGN KEY (fk_id_gol) REFERENCES Goles
);


-- ****************************************************************
-- * TRIGGER QUE REALICE COPIA DE SEGURIDAD DE LA TABLA Jugadores *
-- ****************************************************************

-- Creación de tabla Copia_Jugadores
CREATE TABLE Copia_Jugadores (
	id SERIAL,
	nombre VARCHAR(50),
	posicion posicion_jugador_enum,
	fecha_nacimiento DATE,
	codigo VARCHAR(20),
	fk_id_equipo INT,
	insert_delete_update VARCHAR(10),
	fecha_copia TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_id_equipo) REFERENCES Equipos
);

-- Creación de TRIGGER que me realice copia de jugadores introducidos con INSERT y la fecha en que se hizo el INSERT
CREATE OR REPLACE FUNCTION jugadores_nuevos()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO Copia_Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo, insert_delete_update, fecha_copia)
	VALUES (NEW.nombre, NEW.posicion, NEW.fecha_nacimiento, NEW.codigo, NEW.fk_id_equipo, 'Insert', CURRENT_TIMESTAMP);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER copiar_jugadores_nuevos
AFTER INSERT ON Jugadores
FOR EACH ROW EXECUTE FUNCTION jugadores_nuevos();

-- Creación de TRIGGER que me saque un registro cuando se produce un DELETE de un jugador y la fecha del borrado
CREATE OR REPLACE FUNCTION jugadores_borrados()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO Copia_Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo, insert_delete_update, fecha_copia)
	VALUES (OLD.nombre, OLD.posicion, OLD.fecha_nacimiento, OLD.codigo, OLD.fk_id_equipo, 'Delete', CURRENT_TIMESTAMP);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER copiar_jugadores_borrados
AFTER DELETE ON Jugadores
FOR EACH ROW EXECUTE FUNCTION jugadores_borrados();

--- Creación de TRIGGER que me saque un registro de los datos nuevos 
-- cuando se produce un UPDATE de un jugador y la fecha de la actualización de datos
CREATE OR REPLACE FUNCTION jugadores_actualizados()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO Copia_Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo, insert_delete_update, fecha_copia)
	VALUES (NEW.nombre, NEW.posicion, NEW.fecha_nacimiento, NEW.codigo, NEW.fk_id_equipo, 'Update', CURRENT_TIMESTAMP);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER copiar_jugadores_actualizados
AFTER UPDATE ON Jugadores
FOR EACH ROW EXECUTE FUNCTION jugadores_actualizados();


-- *******************************
-- * INSERTS DE TODAS LAS TABLAS *
-- *******************************

-- ***** INSERTs en la tabla Equipos *****
INSERT INTO Equipos (nombre_equipo, nombre_estadio, aforo, ano_fundacion, ciudad, codigo) VALUES
('Deportivo Alavés', 'Mendizorroza', 19840, '1921', 'Vitoria-Gasteiz', 'ALV'),
('UD Almería', 'Power Horse Stadium', 18331, '1989', 'Almería', 'ALM'),
('Athletic Club', 'San Mamés', 53289, '1898', 'Bilbao', 'ATH'),
('Atlético de Madrid', 'Cívitas Metropolitano', 70460, '1903', 'Madrid', 'ATM'),
('FC Barcelona', 'Olímpico de Montjuic', 55926, '1899', 'Barcelona', 'BAR'),
('Real Betis Balompié', 'Benito Villamarín', 60721, '1907', 'Sevilla', 'BET'),
('Cádiz CF', 'Ramón de Carranza', 20724, '1910', 'Cádiz', 'CAD'),
('RC Celta de Vigo', 'Balaídos', 29000, '1923', 'Vigo', 'CEL'),
('Getafe CF', 'Coliseum', 16500, '1983', 'Getafe', 'GET'),
('Girona FC', 'Montilivi', 13500, '1930', 'Girona', 'GIR'),
('Granada CF', 'Nuevo Los Cármenes', 19336, '1931', 'Granada', 'GRA'),
('UD Las Palmas', 'Gran Canaria', 32400, '1949', 'Las Palmas de Gran Canaria', 'LPA'),
('RCD Mallorca', 'Son Moix', 23142, '1916', 'Palma de Mallorca', 'MAL'),
('CA Osasuna', 'El Sadar', 23576, '1920', 'Pamplona', 'OSA'),
('Rayo Vallecano', 'Vallecas', 14708, '1924', 'Madrid', 'RAY'),
('Real Madrid CF', 'Santiago Bernabéu', 81044, '1902', 'Madrid', 'RMA'),
('Real Sociedad', 'Reale Arena', 40000, '1909', 'San Sebastián', 'RSO'),
('Sevilla FC', 'Ramón Sánchez-Pizjuán', 43883, '1890', 'Sevilla', 'SEV'),
('Valencia CF', 'Mestalla', 49430, '1919', 'Valencia', 'VAL'),
('Villarreal CF', 'La Cerámica', 23500, '1923', 'Villarreal', 'VIL');

-- ***** INSERTs en la tabla Presidentes *****
INSERT INTO Presidentes (nombre, apellidos,	dni, fecha_nacimiento, ano_elegido, fk_id_equipo) VALUES
('Alfonso', 'Fernández de Trocóniz', '78965412F', '1973-03-22', '2013', 1),
('Turki', 'Al-Sheikh', 'T1234567A', '1981-08-04', '2019', 2),
('Jon', 'Uriarte Uranga', '45632178U', '1978-06-16', '2022', 3),
('Enrique', 'Cerezo Torres', '12398745C', '1948-02-27', '2003', 4),
('Joan', 'Laporta i Estruch', '98745632L', '1962-06-29', '2021', 5),
('Ángel', 'Haro García', '65412398H', '1974-01-01', '2016', 6),
('Manuel', 'Vizcaíno Fernáncez', '74125896M', '1965-12-21', '2014', 7),
('Marián', 'Mouriño Terrazo', '32178965M', '1975-05-25', '2023', 8),
('Ángel', 'Torres Sánchez', '85236974T', '1952-05-07', '2002', 9),
('Delfí', 'Geli Roura', '96314785G', '1969-04-22', '2015', 10),
('Sophia', 'Yang', 'S9874563Y', '1982-01-01', '2022', 11),
('Miguel Ángel', 'Ramírez Alonso', '75342869R', '1969-01-01', '2005', 12),
('Andy', 'Kohlberg', 'A3698521K', '1959-08-17', '2017', 13),
('Luis', 'Sabalza Iriarte', '75324862S', '1947-10-23', '2014', 14),
('Raúl', 'Martín Presa', '12731878M', '1977-01-10', '2011', 15),
('Florentino', 'Pérez Rodríguez', '22961712P', '1947-03-08', '2009', 16),
('Jokin', 'Aperribay Bedialauneta', '15811886A', '1966-05-27', '2018', 17),
('José María', 'del Nido Carrasco', '10885973N', '1978-01-01', '2023', 18),
('Lay', 'Hoon', 'L5197915H', '1964-08-01', '2022', 19),
('Fernando', 'Roig Alfonso', '21595720R', '1947-06-25', '1997', 20);

-- ***** INSERTs en la tabla Jugadores *****
-- Plantilla del Alavés
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Antonio Sivera', 'Portero', '1996-08-11', '01SIV01', 1), -- 1
('Rubén Duarte', 'Defensa', '1995-10-18', '01DUA03', 1), -- 2
('Abdel Abqar', 'Defensa', '1999-03-10', '01ABQ05', 1), -- 3
('Ander Guevara', 'Centrocampista', '1997-07-07', '01GUE06', 1), -- 4
('Luis Rioja', 'Delantero', '1993-10-16', '01RIO11', 1), -- 5
('Kike García', 'Delantero', '1989-11-25', '01GAR15', 1); -- 6

-- Plantilla del Almería
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Luís Maximiano', 'Portero', '1999-01-25', '02MAX25', 2), -- 7
('Edgar González', 'Defensa', '1997-04-01', '02GON03', 2), -- 8
('Sergio Arribas', 'Centrocampista', '2001-09-30', '02ARR19', 2), -- 9
('Luis Suárez', 'Delantero', '1997-12-02', '02SUA09', 2); -- 10

-- Plantilla del Athletic
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Unai Simón', 'Portero', '1997-06-11', '03SIM01', 3), -- 11
('Yuri Berchiche', 'Defensa', '1990-02-10', '03BER17', 3), --12
('Oihan Sancet', 'Centrocampista', '2000-04-25', '03SAN08', 3), -- 13
('Gorka Guruzeta', 'Delantero', '1996-09-12', '03GUR12', 3), -- 14
('Iñaki Williams', 'Delantero', '1994-06-15', '03WIL09', 3); -- 15

-- Plantilla del Atlético de Madrid
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Jan Oblak', 'Portero', '1993-01-07', '04OBL13', 4), -- 16
('Axel Witsel', 'Defensa', '1989-01-12', '04WIT20', 4), -- 17
('Marcos Llorente', 'Centrocampista', '1995-01-30', '04LLO14', 4), -- 18
('Álvaro Morata', 'Delantero', '1992-10-23', '04MOR19', 4), -- 19
('Memphis Depay', 'Delantero', '1994-02-13', '04DEP09', 4); -- 20

-- Plantilla del Barcelona
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Marc-André ter Stegen', 'Portero', '1992-04-30', '05STE01', 5), -- 21
('Joao Cancelo', 'Defensa', '1994-05-27', '05CAN02', 5), -- 22
('Pedri', 'Centrocampista', '2002-11-25', '05PED08', 5), -- 23
('Ferran Torres', 'Delantero', '2000-02-29', '05TOR07', 5); -- 24

-- Plantilla del Betis
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Rui Silva', 'Portero', '1994-02-07', '06SIL13', 6), -- 25
('Juan Miranda', 'Defensa', '2000-01-19', '06MIR03', 6), -- 26
('Isco', 'Centrocampista', '1992-04-21', '06ISC22', 6), -- 27 
('Willian José', 'Delantero', '1991-11-23', '06JOS12', 6), -- 28
('Ayoze Pérez', 'Delantero', '1993-07-29', '06PER10', 6); -- 29

-- Plantilla del Cádiz
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Conan Ledesma', 'Portero', '1993-02-13', '07LED01', 7), -- 30
('Javi Hernández', 'Defensa', '1998-05-02', '07HER15', 7), -- 31
('Fede San Emeterio', 'Centrocampista', '1997-03-16', '07EME24', 7), -- 32
('Chris Ramos', 'Delantero', '1997-01-18', '07RAM16', 7); -- 33

-- Plantilla del Celta
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Iván Villar', 'Portero', '1997-07-09', '08VIL13', 8), -- 34
('Óscar Mingueza', 'Defensa', '1999-05-13', '08MIN03', 8), -- 35
('Williot Swedberg', 'Centrocampista', '2004-02-01', '08SWE19', 8), -- 36
('Iago Aspas', 'Delantero', '1987-08-01', '08ASP10', 8); -- 37

-- Plantilla del Getafe
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('David Soria', 'Portero', '1993-04-04', '09SOR13', 9), -- 38
('Gastón Álvarez', 'Defensa', '2000-03-24', '09ALV04', 9), -- 39
('Nemanja Maksimovic', 'Centrocampista', '1995-01-26', '09MAK20', 9), -- 40
('Mason Greenwood', 'Delantero', '2001-10-01', '09GRE12', 9); -- 41

-- Plantilla del Girona
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Paulo Gazzaniga', 'Portero', '1992-01-02', '10GAZ13', 10), -- 42
('Eric García', 'Defensa', '2001-01-09', '10GAR25', 10), -- 43
('Yangel Herrera', 'Centrocampista', '1998-01-07', '10HER21', 10), -- 44
('Artem Dovbyk', 'Delantero', '1997-06-21', '10DOV09', 10), -- 45
('Cristhian Stuani', 'Delantero', '1986-10-12', '10STU07', 10); -- 46

-- Plantilla del Granada
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Augusto Batalla', 'Portero', '1996-04-30', '11BAT25', 11), -- 47
('Ricard Sánchez', 'Defensa', '2000-02-22', '11SAN12', 11), -- 48
('Gonzalo Villar', 'Centrocampista', '1998-03-23', '11VIL24', 11), -- 49
('Samuel Omorodion', 'Delantero', '2004-05-05', '11OMO29', 11); -- 50

-- Plantilla del Las Palmas
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Álvaro Valles', 'Portero', '1997-07-25', '12VAL13', 12), -- 51
('Sergi Cardona', 'Defensa', '1999-07-08', '12CAR03', 12), -- 52
('Jonathan Viera', 'Centrocampista', '1989-10-21', '12VIE21', 12), -- 53
('Munir El Haddadi', 'Delantero', '1995-09-01', '12HAD17', 12); -- 54

-- Plantilla del Mallorca
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Predrag Rajkovic', 'Portero', '1995-10-31', '13RAJ01', 13), -- 55
('Antonio Raíllo', 'Defensa', '1991-10-08', '13RAI21', 13), -- 56
('Dani Rodríguez', 'Centrocampista', '1988-06-06', '13ROD14', 13), -- 57
('Vedat Muriqi', 'Delantero', '1994-04-24', '13MUR07', 13); -- 58

-- Plantilla del Osasuna
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Sergio Herrera', 'Portero', '1993-06-05', '14HER01', 14), -- 59
('Jesús Areso', 'Defensa', '1999-07-02', '14ARE12', 14), -- 60
('Iker Muñoz', 'Centrocampista', '2002-09-05', '14MUÑ34', 14), -- 61
('Rubén García', 'Delantero', '1993-07-14', '14GAR14', 14), -- 62
('Moi Gómez', 'Delantero', '1994-06-23', '14GOM16', 14); -- 63

-- Plantilla del Rayo Vallecano
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Stole Dimitrievski', 'Portero', '1993-12-25', '15DIM01', 15), -- 64
('Florian Lejeune', 'Defensa', '1999-07-02', '15LEJ24', 15), -- 65
('Randy Nteka', 'Centrocampista', '2002-09-05', '15NTE11', 15), -- 66
('Pathé Ciss', 'Centrocampista', '1994-03-16', '15CIS21', 15), -- 67
('Álvaro García', 'Delantero', '1991-07-22', '15GAR18', 15), -- 68
('Isi Palazón', 'Delantero', '1991-07-22', '15PAL07', 15); -- 69

-- Plantilla del Real Madrid
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Thibaut Courtois', 'Portero', '1992-05-11', '16COU01', 16), -- 70
('Andriy Lunin', 'Portero', '1999-02-11', '16LUN13', 16), -- 71
('Dani Carvajal', 'Defensa', '1992-01-11', '16CAR02', 16), -- 72
('Jude Bellingham', 'Centrocampista', '2003-06-29', '16BEL05', 16), -- 73
('Vinícius Júnior', 'Delantero', '2000-07-12', '16JUN07', 16), -- 74
('Rodrygo', 'Delantero', '2001-01-09', '16ROD11', 16); -- 75

-- Plantilla de la Real Sociedad
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Álex Remiro', 'Portero', '1995-03-24', '17REM01', 17), -- 76
('Robin Le Normand', 'Defensa', '1996-11-11', '17NOR24', 17), -- 77
('Mikel Merino', 'Centrocampista', '1996-06-22', '17MER08', 17), -- 78
('Takefusa Kubo', 'Delantero', '2001-06-04', '17KUB14', 17), -- 79
('Ander Barrenetxea', 'Delantero', '2001-12-27', '17BAR07', 17); -- 80

-- Plantilla del Sevilla
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Ørjan Nyland', 'Portero', '1990-09-10', '18NYL13', 18), -- 81
('Sergio Ramos', 'Defensa', '1986-03-30', '18RAM04', 18), -- 82
('Djibril Sow', 'Centrocampista', '1997-02-06', '18SOW18', 18), -- 83
('Youssef En-Nesyri', 'Delantero', '1997-06-01', '18NES15', 18), -- 84
('Érik Lamela', 'Delantero', '1992-03-04', '18LAM17', 18), -- 85
('Rafa Mir', 'Delantero', '1997-06-18', '18MIR09', 18); -- 86
 
-- Plantilla del Valencia
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Giorgi Mamardashvili', 'Portero', '2000-09-29', '19MAM25', 19), -- 87
('Mouctar Diakhaby', 'Defensa', '1996-12-19', '19DIA04', 19), -- 88
('Javi Guerra', 'Centrocampista', '2003-05-13', '19GUE08', 19), -- 89
('Pepelu', 'Centrocampista', '1998-08-11', '19PEP18', 19), -- 90
('Hugo Duro', 'Delantero', '1999-11-10', '19DUR09', 19); -- 91
 
-- Plantilla del Villarreal
INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) VALUES
('Filip Jørgensen', 'Portero', '2002-04-16', '20JOR13', 20), -- 92
('Jorge Cuenca', 'Defensa', '1999-11-17', '20CUE05', 20), -- 93
('Dani Parejo', 'Centrocampista', '1989-04-16', '20PAR10', 20), -- 94
('Gerard Moreno', 'Delantero', '1992-04-07', '20MOR07', 20); -- 95
 
-- ***** INSERTs en la tabla Partidos *****
-- Jornada 1
INSERT INTO Partidos (fecha, nombre, goles_equipo_local, goles_equipo_visitante, codigo) VALUES
('2023-08-11', 'ALM-RAY', 0, 2, 01012324),
('2023-08-11', 'SEV-VAL', 1, 2, 01022324),
('2023-08-12', 'RSO-GIR', 1, 1, 01032324),
('2023-08-12', 'LPM-MAL', 1, 1, 01042324),
('2023-08-12', 'ATH-RMA', 0, 2, 01052324),
('2023-08-13', 'CEL-OSA', 0, 2, 01062324),
('2023-08-13', 'VIL-BET', 1, 2, 01072324),
('2023-08-13', 'GET-BAR', 0, 0, 01082324),
('2023-08-14', 'CAD-ALV', 1, 0, 01092324),
('2023-08-14', 'ATM-GRA', 3, 1, 01102324);
 
-- Jornada 2
INSERT INTO Partidos (fecha, nombre, goles_equipo_local, goles_equipo_visitante, codigo) VALUES
('2023-08-18', 'MAL-VIL', 0, 1, 02012324),
('2023-08-18', 'VAL-LPM', 1, 0, 02022324),
('2023-08-19', 'RSO-CEL', 1, 1, 02032324),
('2023-08-19', 'ALM-RMA', 1, 3, 02042324),
('2023-08-19', 'OSA-ATH', 0, 2, 02052324),
('2023-08-20', 'GIR-GET', 3, 0, 02062324),
('2023-08-20', 'BAR-CAD', 2, 0, 02072324),
('2023-08-20', 'BET-ATM', 0, 0, 02082324),
('2023-08-21', 'ALV-SEV', 4, 3, 02092324),
('2023-08-21', 'GRA-RAY', 0, 2, 02102324);
 
-- ***** INSERTs en la tabla Equipos_partidos
-- Jornada 1
INSERT INTO Equipos_Partidos (fk_id_equipo, fk_id_partido) VALUES
(2, 1),
(15, 1),
(18, 2),
(19, 2),
(17, 3),
(10, 3),
(12, 4),
(13, 4),
(3, 5),
(16, 5),
(8, 6),
(14, 6),
(20, 7),
(6, 7),
(9, 8),
(5, 8),
(7, 9),
(1, 9),
(4, 10),
(11, 10);
 
-- Jornada 2
INSERT INTO Equipos_Partidos (fk_id_equipo, fk_id_partido) VALUES
(13, 11),
(20, 11),
(19, 12),
(12, 12),
(17, 13),
(8, 13),
(2, 14),
(16, 14),
(14, 15),
(3, 15),
(10, 16),
(9, 16),
(5, 17),
(7, 17),
(6, 18),
(4, 18),
(1, 19),
(18, 19),
(11, 20),
(15, 20);
 
-- ***** INSERTs en la tabla Goles
-- Jornada 1
INSERT INTO Goles (descripcion,	fk_id_goleador) VALUES
('Gol de penalti', 69),
('Gol de penalti', 66),
('Remate con pierna izquierda desde dentro del área', 88),
('Remate de cabeza', 84),
('Remate sin opsición tras un buen centro desde la banda', 89),
('Contragolpe y remate con pierna izquierda desde dentro del área', 79),
('Remate de cabeza', 45),
('Gol de penalti', 53),
('Remate tras un saque de esquina', 56),
('Remate con pierna derecha desde dentro del área', 75),
('Remate tras un saque de esquina', 73),
('Se aprovecha del rechace del balón en el larguero para marcar a puerta vacía', 62),
('Se aprovecha del rechace de un balón en el poste pata marcar sin oposición', 63),
('Remate de volea con la pierna derecha desde dentro del área', 29),
('Remate de cabeza tras saque de falta', 93),
('Remate de cabeza', 28),
('Remate de cabeza tras saque de falta', 32),
('Remate con pierna derecha delante del portero', 19),
('Remate con pierna derecha desde dentro del área', 50),
('Remate con pierna derecha desde fuera del área', 20),
('Remate con pierna izquierda delante del portero', 18);

-- Jornada 2
INSERT INTO Goles (descripcion,	fk_id_goleador) VALUES
('Remate tras rechace en un saque de esquina', 95),
('Gol de penalti', 90),
('Remate de cabeza', 80),
('Remate con pierna derecha desde dentro del área', 35),
('Remate de cabeza', 9),
('Balón que le llega tras un rechace y remata con pierna derecha', 73),
('Remate de cabeza', 73),
('Remate de vaselina sobre el portero', 74),
('Centro desde la banda izquierda que remata sin oposición', 15),
('Remate a placer tras un buen centro desde la banda', 14),
('Remate con pierna derecha desde dentro del área', 44),
('Centro desde banda izquierda que remata a placer', 46),
('Remate sin oposición tras fallo del porteo', 46),
('Remate con pierna derecha dentro del área', 23),
('Gol en contragolpe', 24),
('Remate con pierna izquierda desde fuera del área', 5),
('Gol en propia puerta', 3),
('Remate con pierna derecha desde dentro del área', 85),
('Remate desde fuera del área con pierna izquierda', 2),
('Remate de cabeza', 6),
('Reamte tras regatear al portero', 6),
('Remate con pierna izquierda desde dentro del área', 86),
('Remate colocado desde el borde del área', 68),
('Remate sin opsosición desde dentro del área', 67);

-- ***** INSERTs en la tabla Partidos_Goles
-- Jornada 1
INSERT INTO Partidos_Goles (minuto_gol, fk_id_partido, fk_id_gol) VALUES
('20', 1, 1),
('28', 1, 2),
('60', 2, 3),
('69', 2, 4),
('88', 2, 5),
('5', 3, 6),
('72', 3, 7),
('29', 4, 8),
('70', 4, 9),
('28', 5, 10),
('36', 5, 11),
('24', 6, 12),
('74', 6, 13),
('20', 7, 14),
('61', 7, 15),
('90+5', 7, 16),
('7', 9, 17),
('45+4', 10, 18),
('62', 10, 19),
('67', 10, 20),
('90+8', 10, 21);

-- Jornada 2
INSERT INTO Partidos_Goles (minuto_gol, fk_id_partido, fk_id_gol) VALUES
('62', 11, 22),
('74', 12, 23),
('22', 13, 24),
('90+4', 13, 25),
('3', 14, 26),
('19', 14, 27),
('60', 14, 28),
('73', 14, 29),
('11', 15, 30),
('20', 15, 31),
('12', 16, 32),
('55', 16, 33),
('65', 16, 34),
('82', 17, 35),
('90+4', 17, 36),
('7', 19, 37),
('15', 19, 38),
('41', 19, 39),
('44', 19, 40),
('54', 19, 41),
('59', 19, 42),
('90+7', 19, 43),
('75', 20, 44),
('79', 20, 45);


-- ***************************************
-- * SELECTs DE TODAS LAS TABLAS CREADAS *
-- ***************************************

SELECT * FROM Equipos;
SELECT * FROM Presidentes;
SELECT * FROM Jugadores;
SELECT * FROM Partidos;
SELECT * FROM Equipos_Partidos;
SELECT * FROM Goles;
SELECT * FROM Partidos_Goles;
SELECT * FROM Copia_Jugadores;


-- *************************************************
-- * CONFIGURACIÓN DE LOS ON UPDATEs Y ON DELETEs, *
-- * NUEVOS INSERTs, UPDATEs y DELETEs             *
-- *************************************************

-- 1. Cambio de presidente en el Barcelona

DELETE FROM Presidentes
WHERE apellidos LIKE '%Laporta%';

SELECT * FROM Presidentes;

INSERT INTO Presidentes (nombre, apellidos,	dni, fecha_nacimiento, ano_elegido, fk_id_equipo) 
VALUES ('Gerard', 'Piqué Bernabéu', '15984267P', '1987-02-02', '2024', 5);

-- 2. Baja de Thibaut Courtois en el Real Madrid y fichaje de Kepa Arrizalabaga para sustituirlo

DELETE FROM Jugadores
WHERE nombre = 'Thibaut Courtois';

SELECT * FROM Jugadores;

INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) 
VALUES ('Kepa Arrizabalaga', 'Portero', '1994-10-03', '16ARR25', 16);

-- 3. Jonathan Viera pasa de ser jugador del equipo Las Palmas al Almería

-- Ver los nombres asignados a todas las restricciones fks:
SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

-- Borro la restricción
ALTER TABLE Goles
DROP CONSTRAINT goles_fk_id_goleador_fkey;

-- La vuelvo a crear con ON UPDATE y ON DELETE
ALTER TABLE Goles
ADD CONSTRAINT fk_gol
FOREIGN KEY(fk_id_goleador) REFERENCES Jugadores (id)
ON UPDATE CASCADE
ON DELETE NO ACTION;

UPDATE Jugadores
SET codigo = '02VIE08', fk_id_equipo = 2
WHERE nombre = 'Jonathan Viera';

SELECT * FROM Jugadores;
SELECT * FROM Goles; 

SELECT e.nombre_equipo, j.nombre AS jugador, j.posicion, j.fecha_nacimiento, j.codigo
FROM Jugadores j
JOIN Equipos e ON e.id = j.fk_id_equipo
WHERE fk_id_equipo = 2
ORDER BY j.posicion;

-- 4. El jugador del Atlético de Madrid Álvaro Morata abandona La Liga

UPDATE Jugadores
SET codigo = '21MOR01'
WHERE nombre = 'Álvaro Morata';

-- Creamos vista sin el jugador que ha abandonado el equipo
CREATE VIEW Plantilla_Atletico_Madrid AS
SELECT e.nombre_equipo, j.nombre AS jugador, j.posicion, j.fecha_nacimiento, j.codigo
FROM Jugadores j
JOIN Equipos e ON e.id = j.fk_id_equipo
WHERE j.codigo LIKE '04%'
ORDER BY j.posicion;

SELECT * FROM Plantilla_Atletico_Madrid;

SELECT * FROM Jugadores
WHERE codigo LIKE '21%';

-- 5. Cambiamos el autor del primer gol del segundo partido

SELECT * FROM Jugadores
WHERE nombre = 'Hugo Duro' OR nombre = 'Mouctar Diakhaby';

UPDATE Goles
set fk_id_goleador = 91
WHERE fk_id_goleador = 88;

SELECT * FROM Goles ORDER BY id;

-- 6. El Real Madrid ha fichado a Kylian Mbappé

INSERT INTO Jugadores (nombre, posicion, fecha_nacimiento, codigo, fk_id_equipo) 
VALUES ('Kylian Mbappé', 'Delantero', '1998-12-20', '16MBA09', 16);


-- *****************************************
-- * COMPROBACIÓN DE TABLA Copia_Jugadores *
-- *****************************************

-- Comprobamos que se han copiado los INSERT, y que se han generado registros de los DELETE y UPDATE

SELECT * FROM Copia_Jugadores;

SELECT * FROM Copia_Jugadores
WHERE insert_delete_update = 'Delete';

SELECT * FROM Copia_Jugadores
WHERE insert_delete_update = 'Update';

SELECT * FROM Copia_Jugadores
WHERE insert_delete_update = 'Insert';


-- *******************
-- * SELECTs Y JOINs *
-- *******************

-- 1. Nombres de equipos que hayan marcado de penalti
SELECT nombre_equipo
FROM Equipos 
WHERE id IN (SELECT fk_id_equipo
			 FROM Jugadores
			 WHERE id IN (SELECT fk_id_goleador
						  FROM Goles
						  WHERE descripcion LIKE '%penalti%'));

-- Nombre de los jugadores, su posición y equipo al que pertenecen, que tuvieron partido el 12 de agosto de 2023
SELECT j.nombre, j.posicion, e.nombre_equipo
FROM Jugadores j
JOIN Equipos e ON e.id = j.fk_id_equipo
WHERE j.fk_id_equipo IN (SELECT fk_id_equipo
					     FROM Equipos_Partidos
                         WHERE fk_id_partido IN (SELECT id
											     FROM Partidos
											     WHERE fecha = '2023-08-12'))
ORDER BY e.nombre_equipo;
												 
-- Clasificación Pichichi 
SELECT j.nombre, e.nombre_equipo, COUNT (gol.fk_id_goleador) AS num_goles
FROM Jugadores j
JOIN Goles gol ON j.id = gol.fk_id_goleador
JOIN Equipos e ON e.id = j.fk_id_equipo
GROUP BY j.nombre, e.nombre_equipo
ORDER BY num_goles DESC;

-- Y con esto y un bizcocho...