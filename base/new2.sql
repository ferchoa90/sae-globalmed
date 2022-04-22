SELECT ec.id,e.nombres,IF(ec.estado='A','Activo','Inactivo'), 
IF(ec.estado='A','m-badge m-badge--success m-badge--wide','m-badge m-badge--danger m-badge--wide'),  
CONCAT(e.apellidos,' ',e.nombres) , ec.motivo ,  ec.fechaini, ec.fechafin , ec.dias
FROM empleado_vacaciones ec 
INNER JOIN empleado e ON e.id=ec.idempleado WHERE ec.emp_id='1'