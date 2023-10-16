--Crear una Vista de ReporteVenta:
-- NombreApellido
-- Direccion
-- Correo
-- Celular
-- Numero Documento
-- Nombre del producto que ha comprado el cliente
-- Precio
-- Precio Subtotal
-- Precio Total
-------------------------------------
CREATE VIEW ReporteVenta AS
SELECT
    per.Nombre + ' ' + per.ApellidoPaterno + ' ' +per.ApellidoPaterno AS NombreApellido,
    per.Direccion,
    per.Email,
    per.Telefono,
    per.NumeroDOC,
    p.Nombre AS NombreProducto,
	p.precio,
    p.Precio * v.Cantidad AS PrecioSubtotal,
    p.PRECIO * v.Cantidad AS PrecioTotal
FROM
    Personas per
    INNER JOIN VentaDetalle v ON per.PersonaID = v.ProductoID
    INNER JOIN Productoss p ON v.ProductoID = p.ProductoID

SELECT * FROM ReporteVenta


-------------------------------
SELECT
p.Nombre, 
p.ApellidoMaterno, 
p.ApellidoPaterno,
p.Direccion,
p.Email,
p.Telefono,
p.NumeroDoc,
pd.Nombre,
pd.Precio,
vn.Subtotal,
v.TotalVenta
FROM Ventas AS v
INNER JOIN VentaDetalle AS vn ON vn.VentaID = V.VentaID
INNER JOIN Clientes AS c ON c.ClienteID = v.ClienteID
INNER JOIN Personas AS p ON p.PersonaID= c.PersonaID
INNER JOIN Productoss AS pd ON pd.ProductoID = vn.ProductoID;
