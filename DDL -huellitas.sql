CREATE DATABASE HUELLITAS;
USE HUELLITAS; 


-- -----------------------------------------------------
-- Tabla Cargo_empleado
-- -----------------------------------------------------
CREATE TABLE Cargo_empleado (
  id_cargo_empleado INT NOT NULL,
  nombre_cargo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_cargo_empleado))
;


-- -----------------------------------------------------
-- Tabla Empleado
-- -----------------------------------------------------
CREATE TABLE Empleado (
  id_empleado INT NOT NULL,
  nombre_completo VARCHAR(45) NOT NULL,
  numero_telefono VARCHAR(45) NOT NULL,
  direccion_residencia VARCHAR(45) NOT NULL,
  fecha_nacimiento VARCHAR(45) NOT NULL,
  id_cargo_empleado INT NOT NULL,
  PRIMARY KEY (id_empleado),
  CONSTRAINT fk_Emleado_Cargo_empleado
    FOREIGN KEY (id_cargo_empleado)
    REFERENCES Cargo_empleado (id_cargo_empleado)
    )
;


-- -----------------------------------------------------
-- Tabla Proveedor
-- -----------------------------------------------------
CREATE TABLE Proveedor (
  id_proveedor INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  numero_telefono VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_proveedor))
;


-- -----------------------------------------------------
-- Tabla Lote_materia_prima
-- -----------------------------------------------------
CREATE TABLE Lote_materia_prima (
  id_lote INT NOT NULL,
  fecha_recepcion VARCHAR(45) NOT NULL,
  fecha_agotado VARCHAR(45) NULL,
  id_empleado_ayudante INT NOT NULL,
  id_proveedor INT NOT NULL,
  PRIMARY KEY (id_lote),
  CONSTRAINT fk_Lote_Empleado1
    FOREIGN KEY (id_empleado_ayudante)
    REFERENCES Empleado (id_empleado)
    ,
  CONSTRAINT fk_Lote_Proveedor1
    FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor (id_proveedor)
    )
;


-- -----------------------------------------------------
-- Tabla Suela
-- -----------------------------------------------------
CREATE TABLE Suela (
  id_suela INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_suela))
;


-- -----------------------------------------------------
-- Tabla Diseño
-- -----------------------------------------------------
CREATE TABLE Diseño (
  id_diseño_zapato INT NOT NULL,
  id_suela INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  id_empleado_maestro_zapatero INT NOT NULL,
  PRIMARY KEY (id_diseño_zapato),
  CONSTRAINT fk_Tipo_zapato_Suela1
    FOREIGN KEY (id_suela)
    REFERENCES Suela (id_suela)
    ,
  CONSTRAINT fk_Diseño_Empleado1
    FOREIGN KEY (id_empleado_maestro_zapatero)
    REFERENCES Empleado (id_empleado)
    )
;


-- -----------------------------------------------------
-- Tabla Molde
-- -----------------------------------------------------
CREATE TABLE Molde (
  id_molde INT NOT NULL,
  id_tipo_zapato INT NOT NULL,
  talla_molde VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_molde),
  CONSTRAINT fk_Molde_tipo_zapato1
    FOREIGN KEY (id_tipo_zapato)
    REFERENCES Diseño (id_diseño_zapato)
    )
;


-- -----------------------------------------------------
-- Tabla Lote_molde
-- -----------------------------------------------------
CREATE TABLE Lote_molde (
  id_lote INT NOT NULL,
  id_molde INT NOT NULL,
  cantidad_molde INT NOT NULL,
  PRIMARY KEY (id_lote, id_molde),
  CONSTRAINT fk_Molde_has_Lote_Molde1
    FOREIGN KEY (id_molde)
    REFERENCES Molde (id_molde)
    ,
  CONSTRAINT fk_Molde_has_Lote_Lote1
    FOREIGN KEY (id_lote)
    REFERENCES Lote_materia_prima (id_lote)
    )
;


-- -----------------------------------------------------
-- Tabla Material
-- -----------------------------------------------------
CREATE TABLE Material (
  id_material INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_material))
;


-- -----------------------------------------------------
-- Tabla Zapato
-- -----------------------------------------------------
CREATE TABLE Zapato (
  id_zapato INT NOT NULL,
  id_molde INT NOT NULL,
  PRIMARY KEY (id_zapato),
  CONSTRAINT fk_Zapato_Molde1
    FOREIGN KEY (id_molde)
    REFERENCES Molde (id_molde)
    )
;


-- -----------------------------------------------------
-- Tabla Material_Zapato
-- -----------------------------------------------------
CREATE TABLE Material_Zapato (
  id_zapato INT NOT NULL,
  id_material INT NOT NULL,
  cantidad_trozos INT NOT NULL,
  id_empleado_cortador INT NOT NULL,
  PRIMARY KEY (id_zapato, id_material),
  CONSTRAINT fk_Material_has_Zapato_Material1
    FOREIGN KEY (id_material)
    REFERENCES Material (id_material)
    ,
  CONSTRAINT fk_Material_has_Zapato_Zapato1
    FOREIGN KEY (id_zapato)
    REFERENCES Zapato (id_zapato)
    ,
  CONSTRAINT fk_Material_has_Zapato_Empleado1
    FOREIGN KEY (id_empleado_cortador)
    REFERENCES Empleado (id_empleado)
    )
;


-- -----------------------------------------------------
-- Tabla Lote_suela
-- -----------------------------------------------------
CREATE TABLE Lote_suela (
  id_lote INT NOT NULL,
  id_suela INT NOT NULL,
  cantidad_suela INT NOT NULL,
  PRIMARY KEY (id_lote, id_suela),
  CONSTRAINT fk_Suela_has_Lote_Suela1
    FOREIGN KEY (id_suela)
    REFERENCES Suela (id_suela)
    ,
  CONSTRAINT fk_Suela_has_Lote_Lote1
    FOREIGN KEY (id_lote)
    REFERENCES Lote_materia_prima (id_lote)
    )
;


-- -----------------------------------------------------
-- Tabla Lote_material
-- -----------------------------------------------------
CREATE TABLE Lote_material (
  id_lote INT NOT NULL,
  id_material INT NOT NULL,
  cantidad_material INT NOT NULL,
  PRIMARY KEY (id_lote, id_material),
  CONSTRAINT fk_Material_has_Lote_Material1
    FOREIGN KEY (id_material)
    REFERENCES Material (id_material)
    ,
  CONSTRAINT fk_Material_has_Lote_Lote1
    FOREIGN KEY (id_lote)
    REFERENCES Lote_materia_prima (id_lote)
    )
;


-- -----------------------------------------------------
-- Tabla Accesorio
-- -----------------------------------------------------
CREATE TABLE Accesorio (
  id_accesorio INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_accesorio))
;


-- -----------------------------------------------------
-- Tabla Lote_accesorio
-- -----------------------------------------------------
CREATE TABLE Lote_accesorio (
  id_lote INT NOT NULL,
  id_accesorio INT NOT NULL,
  cantidad_accesorio VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_lote, id_accesorio),
  CONSTRAINT fk_Lote_materia_prima_has_Accesorio_Lote_materia_prima1
    FOREIGN KEY (id_lote)
    REFERENCES Lote_materia_prima (id_lote)
    ,
  CONSTRAINT fk_Lote_materia_prima_has_Accesorio_Accesorio1
    FOREIGN KEY (id_accesorio)
    REFERENCES Accesorio (id_accesorio)
    )
;


-- -----------------------------------------------------
-- Tabla Lote_zapatos
-- -----------------------------------------------------
CREATE TABLE Lote_zapatos (
  id_lote_zapatos INT NOT NULL,
  fecha_lote VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_lote_zapatos))
;


-- -----------------------------------------------------
-- Tabla zapatos_lote_producto
-- -----------------------------------------------------
CREATE TABLE zapatos_lote_producto (
  lote_zapato INT NOT NULL,
  id_zapato INT NOT NULL,
  cantidad_zapato INT NOT NULL,
  PRIMARY KEY (lote_zapato, id_zapato),
  CONSTRAINT fk_Zapato_has_Lote_zapatos_Zapato1
    FOREIGN KEY (id_zapato)
    REFERENCES Zapato (id_zapato)
    ,
  CONSTRAINT fk_Zapato_has_Lote_zapatos_Lote_zapatos1
    FOREIGN KEY (lote_zapato)
    REFERENCES Lote_zapatos (id_lote_zapatos)
    )
;


-- -----------------------------------------------------
-- Tabla Diseño_has_Accesorio
-- -----------------------------------------------------
CREATE TABLE Diseño_has_Accesorio (
  id_diseño_zapato INT NOT NULL,
  id_accesorio INT NOT NULL,
  PRIMARY KEY (id_diseño_zapato, id_accesorio),
  CONSTRAINT fk_Diseño_has_Accesorio_Diseño1
    FOREIGN KEY (id_diseño_zapato)
    REFERENCES Diseño (id_diseño_zapato)
    ,
  CONSTRAINT fk_Diseño_has_Accesorio_Accesorio1
    FOREIGN KEY (id_accesorio)
    REFERENCES Accesorio (id_accesorio)
    )
;


-- -----------------------------------------------------
-- Tabla Material_Diseño
-- -----------------------------------------------------
CREATE TABLE Material_Diseño (
  id_diseño_zapato INT NOT NULL,
  id_material INT NOT NULL,
  cantidad_trozos INT NOT NULL,
  PRIMARY KEY (id_diseño_zapato, id_material),
  CONSTRAINT fk_Material_has_Diseño_Material1
    FOREIGN KEY (id_material)
    REFERENCES Material (id_material)
    ,
  CONSTRAINT fk_Material_has_Diseño_Diseño1
    FOREIGN KEY (id_diseño_zapato)
    REFERENCES Diseño (id_diseño_zapato)
    )
;
