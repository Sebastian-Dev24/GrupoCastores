//---------------------CREACION DE TABLAS--------------------------------------
CREATE TABLE productos(
    idProducto INT PRIMARY KEY,
    nombre VARCHAR(65),
    precio NUMBER(10,2)
)

CREATE SEQUENCE seq_idProducto
START WITH 1
INCREMENT BY 1
NOCACHE;


CREATE TABLE ventas(
    idVenta INT PRIMARY KEY,
    idProducto INT,
    cantidad INT,
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
)
    
CREATE SEQUENCE seq_idVenta
START WITH 1
INCREMENT BY 1
NOCACHE;

//---------------------BUSQUEDAS-----------------------------------------------
// (1.5)
SELECT p.idProducto, p.nombre
FROM productos p
JOIN ventas v ON p.idProducto = v.idProducto
GROUP BY p.idProducto, p.nombre
HAVING COUNT(*) = 1
ORDER BY p.idProducto ASC;

// (1.6)
SELECT p.idProducto, p.nombre, SUM(v.cantidad) AS total_vendido
FROM productos p
JOIN ventas v ON p.idProducto = v.idProducto
GROUP BY p.idProducto, p.nombre
ORDER BY total_vendido DESC;

// (1.7)
SELECT p.idProducto, p.nombre, 
       COALESCE(SUM(v.cantidad * p.precio), 0) AS total_vendido
FROM productos p
LEFT JOIN ventas v ON p.idProducto = v.idProducto
GROUP BY p.idProducto, p.nombre, p.precio
ORDER BY total_vendido DESC;
