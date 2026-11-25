-- 10. Contar cuántos objetos han sido exitosamente “Reclamados” en lo que va del año
SELECT 
    COUNT(rc.id_reclamo) AS total_recuperados_anio
FROM Reclamo rc
JOIN Objeto o ON rc.id_objeto = o.id_objeto
JOIN Estado e ON o.id_estado_actual = e.id_estado
WHERE e.nombre_estado = 'Reclamado'
  AND YEAR(rc.fecha_hora_reclamo) = YEAR(CURDATE());