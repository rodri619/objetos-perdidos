-- 13. Mostrar la información de contacto del usuario que reportó un objeto específico (para que el reclamante pueda contactarlo si es necesario, con permisos).
SELECT 
    o.id_objeto,
    o.descripcion_detallada AS objeto,
    u.nombre_completo AS reportado_por,
    u.correo_electronico,
    f.nombre_facultad
FROM Objeto o
JOIN Reporte r ON o.id_objeto = r.id_objeto
JOIN Usuario u ON r.id_usuario_reporta = u.id_usuario
JOIN Facultad f ON u.id_facultad = f.id_facultad
WHERE o.id_objeto = 1; -- Ejemplo con la Laptop Dell