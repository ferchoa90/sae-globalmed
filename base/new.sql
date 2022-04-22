SELECT ec.id,e.nombres,IF(ec.estado='A','Activo','Inactivo'),
 IF(ec.estado='A','m-badge m-badge--success m-badge--wide','m-badge m-badge--danger m-badge--wide'),ec.documento, 
 CONCAT(e.apellidos,' ',e.nombres) , ec.concepto
FROM empleado_anticipo ec 
INNER JOIN empleado e ON e.id=ec.idempleado WHERE ec.emp_id='1'