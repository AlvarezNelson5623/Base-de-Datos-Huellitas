USE huellitas;
-- o   Insertar 3 maestros zapateros, 2 ayudantes y 2 cortadores en base de datos. 

INSERT INTO cargo_empleado VALUES(1,"Maestro Zapatero"),(2,"Ayudante"),(3,"Cortador");
INSERT INTO empleado VALUES (1245788,"Nelson Jesid Prada","323-235-5566","Cra.45 #4 -3","2002-02-30",1), 	# Maestro Zapatero
							(2345354,"Brabdon Herrera","323-245-5566","Cra.5 #4 -3","2004-08-30",1), 	 	# Maestro Zapatero
                            (3453454,"Laura Maria Prada","324-235-5566","Cra.44 #4 -3","2002-04-30",1),	 	# Maestro Zapatero
                            (4567665,"Tomas Archila Rincón","323-235-5566","Cra.55 #4 -3","2002-09-23",2),  # Ayudante
                            (9879878,"Maria Archila Rincón","323-235-5566","Cra.35 #4 -3","2002-07-12",2),  # Ayudante
                            (2354545,"David Jesid Prada","323-235-5566","Cra.45 #4 -3","2002-06-30",3),     # Cortador
                            (1200033,"Emerson Gonzalez Prada","323-235-5566","Cra.45 #4 -3","2002-05-30",3);# Cortador

-- ------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO proveedor VALUES (1,"KHML","Cra.23, Bernal","user@dominio.com","666-4555");
INSERT INTO lote_materia_prima VALUES (1,"2019-09-23",NULL,9879878,1),(2,"2019-09-23",NULL,9879878,1),(3,"2019-09-23",NULL,4567665,1);
INSERT INTO suela VALUES (1,"Hgf"),(2,"mnf"),(3,"Hrt");
INSERT INTO lote_suela VALUES (1,1,10),(1,2,10),(1,3,10);
INSERT INTO material VALUES (1,"tela suabe - MKS"),(2,"tela rugosa - MKS"),(3,"tela dura - MKS");
INSERT INTO lote_material VALUES (2,1,10),(2,2,10),(2,3,10);
INSERT INTO accesorio VALUES (1,"parche - futurama"),(2,"Parche marca Nike"),(3,"parche - puma");
INSERT INTO lote_accesorio VALUES (3,1,10),(3,2,10),(3,3,10);

-- o	Insertar un nuevo diseño de un zapato.

INSERT INTO diseño VALUES (1,2,"Diseño juvenil",1245788);
INSERT INTO diseño_has_accesorio VALUES (1,2),(1,3);
INSERT INTO material_diseño VALUES (1,2,3);

-- -----------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO molde VALUES (1,1,"34 Americana"),(2,1,"34 Europea"),(3,1,"34 Oriental");
INSERT INTO lote_molde VALUES (1,1,10),(2,2,10),(3,3,10);
INSERT INTO zapato VALUES (1,1),(2,2),(3,3);
INSERT INTO material_zapato VALUES (1,2,3,1200033);

-- o	Insertar un nuevo lote de 10 zapatos generados a partir de este diseño y con los empleados ya creados.

INSERT INTO lote_zapatos VALUES (1,"2020-10-15");
INSERT INTO zapatos_lote_producto VALUES (1,1,10); # DIEZ ZAPATOS DEL MISMO DISEÑO, CORTADOR Y MAESTRO ZAPATERO

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- o	Modificar el rol de un empleado de ayudante a maestro zapatero. 

UPDATE empleado SET id_cargo_empleado = 1 WHERE id_cargo_empleado= 2 AND id_empleado = 4567665;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- o	Actualizar un diseño de un zapato agregando un accesorio nuevo.

INSERT INTO diseño_has_accesorio VALUES (1,1);

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- o	Actualizar un diseño de un zapato agregando un trozo de un material diferente.

INSERT INTO material_diseño VALUES (1,3,1);

-- -------------------------------------------------------------------------------------------------------------------------------------------------

-- o	Eliminar un zapato de un lote.

DELETE FROM zapatos_lote_producto WHERE id_zapato = 1;

-- ---------------------------------------------------------------------------------------------------------------------------------------------

-- o	Eliminar un diseño de un zapato en base de datos que ya tenga un lote de 10 zapatos generados. 

# Esta accion no se peude llevar a cabo, ya que segun el MR es necesario un trigger que elimine todos los registros de las entidades 
# que DEPENDEN de la entidad DISEÑO, lo que eliminaria los zapatos del lote.

-- --------------------------------------------------------------------------------------------------------------------------------------------------------

-- o	Insertar un nuevo accesorio en base de datos y luego insertar un diseño que use este accesorio.

INSERT INTO accesorio VALUES (4,"Pacrhe de RMK");
INSERT INTO diseño VALUES (2,1,"Diseño Moderno",2345354);
INSERT INTO diseño_has_accesorio VALUES (2,4);

-- ----------------------------------------------------------------------------------------------------------------------------------------------