-- Consulta 1. Mostrar todos los objetos perdidos en la "Facultad de Filosofía y Letras"durante la última semana.
SELECT 
    o.id_objeto, 
    o.descripcion_detallada, 
    o.lugar_aproximado_hallazgo, 
    r.fecha_hora_reporte
FROM Objeto o
JOIN Reporte r ON o.id_objeto = r.id_objeto
WHERE (o.lugar_aproximado_hallazgo LIKE '%Filosofía%' 
   OR o.lugar_aproximado_hallazgo LIKE '%FFyL%')
   AND r.fecha_hora_reporte >= DATE_SUB(NOW(), INTERVAL 7 DAY);