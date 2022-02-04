create table utilisateur(
    idUtil int primary key not null AUTO_INCREMENT,
    pseudo varchar(50) not null,
    mdp varchar(50) not null,
    adresse varchar(100),
    email varchar(100)
);

create table vehicule(
    idVehic int primary key not null AUTO_INCREMENT,
    nomModele varchar(50),
    caract varchar(500),
    photo varchar(100), --chamin d'accès de la photo 
    etat boolean --true si dispo, false si loue--  1= true, 0= false
);

create table facture(
    idFac int primary key not null AUTO_INCREMENT,
    idUtil int references utilisateur(idUtil),
    idVehic int references vehicule(idVehic),
    dateD date not null,
    dateF date not null,
    valeur int not null,
    etatR boolean, --true si reglee, false sinon--
    constraint facture_idUtil_idVehic_dateD unique (idUtil, idVehic,dateD)
);