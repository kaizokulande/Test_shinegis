CREATE DATABASE test_shinegis; 

USE test_shinegis;

CREATE TABLE equipements(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    categorie VARCHAR(50),
    number VARCHAR(20) NOT NULL,
    description TEXT DEFAULT(NULL),
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    CONSTRAINT constraint_number UNIQUE(number)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Machines de traction électromécanique (100kN) (+ Four 1000°C)','Essais mécaniques','00001','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Machine de fatigue uni-axiale (32kN)','Essais mécaniques','00002','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Machine de fatigue uni-axiale (100kN)','Essais mécaniques','00003','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Caméras fréquence acquisition : 12Hz (utilisation possible en banc de stéréovision)','Mesures optiques','00004','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Caméra rapide, fréquence acquisition : 120Hz','Mesures optiques','00005','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Projecteur de franges','Mesures optiques','00006','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Machine à mesurer tridimensionnelle','Métrologie','00007','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Laser interférométrique','Métrologie','00008','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Bras de mesure + tête scannage','Métrologie','00009','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Microscopes optiques et binoculaires','Topographie','00011','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Profilomètre optique (interféromètre)','Topographie','00012','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Analyseur thermogravimétrique (TGA)','Topographie','00013','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Postes à soudure','Soudure','00014','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Meules','Soudure','00015','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Disques à couper','Soudure','00016','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Imprimante','Impression','00017','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Scanner','Impression','00018','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Webcam','Ordinateur','00019','Appareil qui combine casque audio et microphone. A Utiliser durant une visio-conférence.',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('MacBook','Ordinateur','00021','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Hp ProBook','Ordinateur','00022','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Disque dur externe','Ordinateur','00023','',NOW());
INSERT INTO equipements(name,categorie,number,description,created_at) VALUES('Clé usb','Ordinateur','00024','',NOW());