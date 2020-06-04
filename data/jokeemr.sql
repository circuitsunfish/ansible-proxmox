DROP SCHEMA IF EXISTS jokeemr;

CREATE SCHEMA jokeemr DEFAULT CHARACTER SET utf8;

USE jokeemr;

DROP TABLE IF EXISTS Pats;
CREATE TABLE Pats(
    PatId INT NOT NULL AUTO_INCREMENT,
    PatName varchar(255) NOT NULL,
    Bones BOOLEAN,
    PRIMARY KEY (PatId)
);

INSERT INTO Pats (PatName, Bones) VALUES ('Benry', FALSE);
INSERT INTO Pats (PatName, Bones) VALUES ('Dr. Coomer, PhD', TRUE);
INSERT INTO Pats (PatName, Bones) VALUES ('Bubby', TRUE);
INSERT INTO Pats (PatName, Bones) VALUES ('Tommy Coolatta', TRUE);
INSERT INTO Pats (PatName, Bones) VALUES ('Darnold', TRUE);