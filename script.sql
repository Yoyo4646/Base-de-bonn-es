#Ma base de données : 

DROP TABLE IF EXISTS Etudiant;
CREATE TABLE Etudiant(
        NumCINEtudiant     Varchar (25),
        NomEtu1     Varchar (25),
        PrenomEtu1     Varchar (25),
        DateNaissanceEtu     Date,
        AdresseEtu     Varchar (25),
        VilleEtu     Varchar (25),
        NiveauEtu     Int,
        PRIMARY KEY (NumCINEtudiant)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Session;
CREATE TABLE Session(
        CodeSess     Int,
        NomSess     Varchar (25),
        DateDebut     Date (25),
        DateFin     Date (25),
        CodeForm_Formation     Int,
        PRIMARY KEY (CodeSess)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Formation;
CREATE TABLE Formation(
        CodeForm     Int,
        TitreForm     Varchar (25),
        DureeForm     Time (25),
        PrixForm     Int (25),
        PRIMARY KEY (CodeForm)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Spécialité;
CREATE TABLE Spécialité(
        Codespec     Int,
        NomSpec     Varchar (25),
        DescSpe     Varchar (100),
        PRIMARY KEY (Codespec)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS est inscrit;
CREATE TABLE est inscrit(
        TypeCours     Varchar (25),
        NumCINEtudiant_Etudiant     Varchar (25),
        CodeSess_Session     Int,
        PRIMARY KEY (NumCINEtudiant_Etudiant,CodeSess_Session)
)ENGINE=InnoDB;



DROP TABLE IF EXISTS Appartient;
CREATE TABLE Appartient(
        Codespec_Spécialité     Int,
        CodeForm_Formation     Int,
        PRIMARY KEY (Codespec_Spécialité,CodeForm_Formation)
)ENGINE=InnoDB;



ALTER TABLE Session ADD CONSTRAINT FK_Session_CodeForm_Formation FOREIGN KEY (CodeForm_Formation) REFERENCES Formation(CodeForm)
ALTER TABLE est inscrit ADD CONSTRAINT FK_est inscrit_NumCINEtudiant_Etudiant FOREIGN KEY (NumCINEtudiant_Etudiant) REFERENCES Etudiant(NumCINEtudiant)
ALTER TABLE est inscrit ADD CONSTRAINT FK_est inscrit_CodeSess_Session FOREIGN KEY (CodeSess_Session) REFERENCES Session(CodeSess)
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_Codespec_Spécialité FOREIGN KEY (Codespec_Spécialité) REFERENCES Spécialité(Codespec)
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_CodeForm_Formation FOREIGN KEY (CodeForm_Formation) REFERENCES Formation(CodeForm)
