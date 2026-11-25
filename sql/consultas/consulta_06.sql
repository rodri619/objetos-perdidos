-- 6. Obtener una lista de usuarios que han reportado más de 3 objetos (los "héroes anónimos")
SELECT 
    u.nombre_completo, 
    u.num_identificacion, 
    COUNT(r.id_reporte) AS total_reportes
FROM Usuario u
JOIN Reporte r ON u.id_usuario = r.id_usuario_reporta
GROUP BY u.id_usuario, u.nombre_completo, u.num_identificacion
HAVING total_reportes > 3
ORDER BY total_reportes DESC;