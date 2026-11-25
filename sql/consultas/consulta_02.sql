-- Consulta 2. Encontrar todos los objetos de la categoría “Electrónicos” que aún no han sido reclamados.
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    c.nombre_categoria, 
    e.nombre_estado
FROM Objeto o
JOIN Categoria c ON o.id_categoria = c.id_categoria
JOIN Estado e ON o.id_estado_actual = e.id_estado
LEFT JOIN Reclamo r ON o.id_objeto = r.id_objeto
WHERE c.nombre_categoria = 'Electrónicos' 
  AND r.id_reclamo IS NULL;