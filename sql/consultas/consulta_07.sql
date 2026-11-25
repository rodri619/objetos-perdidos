-- 7. Encontrar todos los reclamos pendientes de un usuario específico
SELECT 
    u.nombre_completo,
    o.descripcion_detallada,
    rc.fecha_hora_reclamo,
    e.nombre_estado AS estado_actual,
    ub.nombre_ubicacion AS donde_recoger
FROM Reclamo rc
JOIN Usuario u ON rc.id_usuario_reclama = u.id_usuario
JOIN Objeto o ON rc.id_objeto = o.id_objeto
JOIN Estado e ON o.id_estado_actual = e.id_estado
JOIN UbicacionFisica ub ON o.id_ubicacion_fisica = ub.id_ubicacion_fisica
WHERE u.num_identificacion = '312948573' -- Ejemplo: Laura Torres
  AND e.nombre_estado NOT IN ('Reclamado', 'Finalizado');