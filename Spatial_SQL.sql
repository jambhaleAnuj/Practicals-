
CREATE TABLE cola_markets ( 
mkt_id NUMBER PRIMARY KEY, 
name VARCHAR2(32), 
shape SDO_GEOMETRY);

INSERT INTO cola_markets VALUES( 
1, 
'cola_a', 
SDO_GEOMETRY( 
2003, -- two-dimensional polygon 
NULL, 
NULL, 
SDO_ELEM_INFO_ARRAY(1,1003,3), -- one rectangle (1003 = exterior) 
SDO_ORDINATE_ARRAY(1,1, 5,7) -- only 2 points needed to 
-- define rectangle (lower left and upper right) with 
-- Cartesian-coordinate data 
) 
);

INSERT INTO cola_markets VALUES( 
2, 
'cola_b', 
SDO_GEOMETRY( 
2003, -- two-dimensional polygon 
NULL, 
NULL, 
SDO_ELEM_INFO_ARRAY(1,1003,1), -- one polygon (exterior polygon ring) 
SDO_ORDINATE_ARRAY(5,1, 8,1, 8,6, 5,7, 5,1) 
) 
);

INSERT INTO cola_markets VALUES( 
3, 
'cola_c', 
SDO_GEOMETRY( 
2003, -- two-dimensional polygon 
NULL, 
NULL, 
SDO_ELEM_INFO_ARRAY(1,1003,1), -- one polygon (exterior polygon ring) 
SDO_ORDINATE_ARRAY(3,3, 6,3, 6,5, 4,5, 3,3) 
) 
);

INSERT INTO cola_markets VALUES( 
 4, 
'cola_d', 
SDO_GEOMETRY( 
2003, -- two-dimensional polygon 
NULL, 
NULL, 
SDO_ELEM_INFO_ARRAY(1,1003,4), -- one circle 
SDO_ORDINATE_ARRAY(8,7, 10,9, 8,11) 
) 
);

CREATE INDEX cola_spatial_idx 
ON cola_markets(shape) 
INDEXTYPE IS MDSYS.SPATIAL_INDEX;

SELECT SDO_GEOM.SDO_INTERSECTION(c_a.shape, c_c.shape, 0.005) 
FROM cola_markets c_a, cola_markets c_c 
WHERE c_a.name = 'cola_a' AND c_c.name = 'cola_c';

SELECT SDO_GEOM.RELATE(c_b.shape, 'anyinteract', c_d.shape, 0.005) 
FROM cola_markets c_b, cola_markets c_d 
WHERE c_b.name = 'cola_b' AND c_d.name = 'cola_d';

SELECT name, SDO_GEOM.SDO_AREA(shape, 0.005) FROM cola_markets;

SELECT c.name, SDO_GEOM.SDO_AREA(c.shape, 0.005) FROM cola_markets c 
WHERE c.name = 'cola_a';

SELECT SDO_GEOM.SDO_DISTANCE(c_b.shape, c_d.shape, 0.005) 
FROM cola_markets c_b, cola_markets c_d 
WHERE c_b.name = 'cola_b' AND c_d.name = 'cola_d';

SELECT c.name, SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(c.shape, 
0.005) 
FROM cola_markets c WHERE c.name = 'cola_c';

CREATE TABLE val_results (sdo_rowid ROWID, result VARCHAR2(2000));

CALL SDO_GEOM.VALIDATE_LAYER_WITH_CONTEXT('COLA_MARKETS', 
'SHAPE', 
'VAL_RESULTS', 2)


SELECT * from val_results;

