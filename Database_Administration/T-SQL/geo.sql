BEGIN TRANSACTION;

CREATE TABLE tblGeom (
    GXY geometry,
    Description varchar(30),
    IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1)
);

INSERT INTO tblGeom (GXY, Description)
VALUES (geometry::STGeomFromText('POINT (3 4)', 0), 'First point');

SELECT * FROM tblGeom;

ROLLBACK TRANSACTION;
