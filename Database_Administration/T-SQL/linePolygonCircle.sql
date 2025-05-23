BEGIN TRAN;

CREATE TABLE tblGeom 
(
    GXY GEOMETRY,
    Description VARCHAR(20),
    IDtblGeom INT CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1)
);

INSERT INTO tblGeom (GXY, Description)
VALUES 
(GEOMETRY::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
(GEOMETRY::STGeomFromText('LINESTRING (5 1, 14 25, 5 1)', 0), 'Second line'),
(GEOMETRY::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
(GEOMETRY::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
(GEOMETRY::STGeomFromText('LINESTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle');

SELECT * FROM tblGeom;

ROLLBACK TRAN;
