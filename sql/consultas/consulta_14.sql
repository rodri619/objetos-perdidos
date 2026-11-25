-- 14. Listar todos los objetos cuyo estado es “Donado” y que fueron reportados hace más de 6 meses (política de retención).
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    c.nombre_categoria, 
    r.fecha_hora_reporte,
    e.nombre_estado
FROM Objeto o
JOIN Reporte r ON o.id_objeto = r.id_objeto
JOIN Categoria c ON o.id_categoria = c.id_categoria
JOIN Estado e ON o.id_estado_actual = e.id_estado
WHERE e.nombre_estado = 'Donado'
  AND r.fecha_hora_reporte <= DATE_SUB(NOW(), INTERVAL 6 MONTH);