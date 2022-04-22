SELECT ec.id,e.nombres,IF(ec.estado='A','Activo','Inactivo'), 
IF(ec.estado='A','m-badge m-badge--success m-badge--wide','m-badge m-badge--danger m-badge--wide'),
 CONCAT(e.apellidos,' ',e.nombres)  , ec.fecha , ec.tipo
 FROM empleado_marcaciones ec 
 INNER JOIN empleado e ON e.id=ec.idempleado WHERE ec.emp_id='1'