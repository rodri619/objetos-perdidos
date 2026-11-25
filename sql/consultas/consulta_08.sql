-- 8. Mostrar el objeto que ha estado sin reclamar por más tiempo
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    r.fecha_hora_reporte,
    DATEDIFF(NOW(), r.fecha_hora_reporte) AS dias_transcurridos,
    ub.nombre_ubicacion
FROM Objeto o
JOIN Reporte r ON o.id_objeto = r.id_objeto
JOIN UbicacionFisica ub ON o.id_ubicacion_fisica = ub.id_ubicacion_fisica
LEFT JOIN Reclamo rc ON o.id_objeto = rc.id_objeto
WHERE rc.id_reclamo IS NULL
ORDER BY r.fecha_hora_reporte ASC
LIMIT 1;