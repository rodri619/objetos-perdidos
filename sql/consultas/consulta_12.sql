-- 12. Buscar objetos reportados en una fecha específica (ej.: el día del concierto en la Facultad)
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    r.fecha_hora_reporte, 
    ub.nombre_ubicacion,
    u.nombre_completo AS reportado_por
FROM Reporte r
JOIN Objeto o ON r.id_objeto = o.id_objeto
JOIN UbicacionFisica ub ON o.id_objeto = ub.id_ubicacion_fisica
JOIN Usuario u ON r.id_usuario_reporta = u.id_usuario
WHERE DATE(r.fecha_hora_reporte) = '2025-12-17';