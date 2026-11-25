-- 11. Generar un reporte de los objetos perdidos más comunes por categoría (ej.: 20 mochilas, 15 llaveros)
SELECT 
    c.nombre_categoria, 
    COUNT(o.id_objeto) AS cantidad_extraviada
FROM Objeto o
JOIN Categoria c ON o.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY cantidad_extraviada DESC;