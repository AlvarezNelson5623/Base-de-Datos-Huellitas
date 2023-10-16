INSERT INTO zapatos_lote_producto VALUES (1,1,10);

-- ----------------------------------------------------------------------------------------------------------------------------------------

-- o	Realizar una consulta que permita conocer en que zapatos fue usado determinado molde.

SELECT molde.id_molde,molde.id_tipo_zapato,molde.talla_molde, zapato.id_zapato FROM molde inner join zapato on zapato.id_molde = molde.id_molde;

-- --------------------------------------------------------------------------------------------------------------------------------------------

-- o	Realizar una consulta que permita conocer que lotes de material fueron usados en la construcción de un zapato. 

SELECT material_zapato.id_zapato, material_zapato.id_material,material.descripcion, material_zapato.cantidad_trozos, 
material_zapato.id_empleado_cortador, lote_material.id_lote from material_zapato
inner join material on material.id_material=material_zapato.id_material
inner join lote_material on lote_material.id_material = material.id_material;

-- ----------------------------------------------------------------------------------------------------------------------------------------------

-- o	Realizar una consulta que permita conocer cuántos zapatos se crearon para un diseño determinado.

SELECT diseño.id_diseño_zapato, diseño.descripcion,diseño.id_empleado_maestro_zapatero,
zapatos_lote_producto.id_zapato,zapatos_lote_producto.cantidad_zapato FROM diseño
inner join molde on diseño.id_diseño_zapato=molde.id_tipo_zapato
inner join zapato on zapato.id_molde = molde.id_molde
inner join zapatos_lote_producto on zapatos_lote_producto.id_zapato = zapato.id_zapato;

-- ------------------------------------------------------------------------------------------------------------------------------------------------