
CREATE TABLE EmpleadoSectores (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50)
);


CREATE TABLE Empleados (
    id INT IDENTITY(1,1) PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    idSector INT,
    FOREIGN KEY (idSector) REFERENCES EmpleadoSectores(id)
);
