-- 5. Mostrar la cantidad de objetos encontrados por cada facultad en el último mes.
SELECT 
    f.nombre_facultad, 
    COUNT(o.id_objeto) AS total_objetos_encontrados
FROM Facultad f
JOIN Usuario u ON f.id_facultad = u.id_facultad
JOIN Reporte r ON u.id_usuario = r.id_usuario_reporta
JOIN Objeto o ON r.id_objeto = o.id_objeto
WHERE r.fecha_hora_reporte >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY f.nombre_facultad
ORDER BY total_objetos_encontrados DESC;