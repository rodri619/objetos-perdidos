-- 4. Buscar objetos cuya descripción contenga la palabra "termo"(para encontrar un termo perdido)
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    c.nombre_categoria, 
    o.lugar_aproximado_hallazgo,
    e.nombre_estado
FROM Objeto o
JOIN Categoria c ON o.id_categoria = c.id_categoria
JOIN Estado e ON o.id_estado_actual = e.id_estado
WHERE o.descripcion_detallada LIKE '%termo%';