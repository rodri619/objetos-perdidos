-- Consulta 3. Listar todos los reportes hechos por un usuario específico (usando su número de cuenta).
SELECT 
    u.nombre_completo,
    u.num_identificacion,
    o.descripcion_detallada,
    r.fecha_hora_reporte,
    e.nombre_estado
FROM Reporte r
JOIN Usuario u ON r.id_usuario_reporta = u.id_usuario
JOIN Objeto o ON r.id_objeto = o.id_objeto
JOIN Estado e ON o.id_estado_actual = e.id_estado
WHERE u.num_identificacion = '321173579';