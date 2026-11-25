-- 9. Listar todos los objetos que actualmente están “En Custodia” en la "Biblioteca Central"
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    c.nombre_categoria, 
    e.nombre_estado,
    ub.nombre_ubicacion
FROM Objeto o
JOIN Categoria c ON o.id_categoria = c.id_categoria
JOIN Estado e ON o.id_estado_actual = e.id_estado
JOIN UbicacionFisica ub ON o.id_ubicacion_fisica = ub.id_ubicacion_fisica
WHERE e.nombre_estado = 'En Custodia' 
  AND ub.nombre_ubicacion LIKE '%Biblioteca Central%';