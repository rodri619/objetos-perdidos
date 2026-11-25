-- 15. Obtener los detalles de un reclamo específico, incluyendo la información del objeto y del usuario reclamante.
SELECT 
    r.id_reclamo,
    u.nombre_completo AS reclamante,
    u.num_identificacion AS numero_cuenta,
    o.descripcion_detallada AS objeto,
    c.nombre_categoria AS categoria,
    r.descripcion_sucedido AS testimonio_usuario,
    r.fecha_hora_reclamo,
    e.nombre_estado AS estado_actual
FROM Reclamo r
JOIN Usuario u ON r.id_usuario_reclama = u.id_usuario
JOIN Objeto o ON r.id_objeto = o.id_objeto
JOIN Categoria c ON o.id_categoria = c.id_categoria
JOIN Estado e ON o.id_estado_actual = e.id_estado
WHERE r.id_reclamo = 1; -- Ejemplo con el folio de reclamo #1