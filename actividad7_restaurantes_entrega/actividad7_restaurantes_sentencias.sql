# DATOS DE EJEMPLO:

-- Sentencias SQL de inserción con datos de ejemplo para 10 restaurantes:
INSERT INTO restaurantes (nombre, direccion, telefono, nombre_responsable, is_abierto)
VALUES
('Burgerqueen_Valencia', 'C/ Xativa, 103', '961425668', 'Antonio Morales', 1),
('Burgerqueen_Madrid', 'C/ Sol, 88', '911253223', 'Pepe Sanchez', 1),
('Burgerqueen_Barcelona', 'Av. Diagonal, 123', '932112233', 'Maria Gonzalez', 1),
('Burgerqueen_Sevilla', 'C/ Sierpes, 45', '955667788', 'Juan Martinez', 0),
('Burgerqueen_Bilbao', 'Plaza Moyua, 10', '944554433', 'Elena Fernandez', 1),
('Burgerqueen_Malaga', 'C/ Larios, 15', '952112233', 'Manuel Lopez', 1),
('Burgerqueen_Alicante', 'C/ Rambla, 5', '965667788', 'Laura Ramirez', 1),
('Burgerqueen_Zaragoza', 'Plaza del Pilar, 20', '976554433', 'Pablo Diaz', 0),
('Burgerqueen_Granada', 'Av. de la Constitución, 30', '958112233', 'Carmen Ruiz', 1),
('Burgerqueen_Cadiz', 'Av. Andalucia, 12', '956667788', 'Pedro Fernandez', 1);

-- Sentencias SQL de inserción con al menos 2 mesas por cada restaurante, es decir al menos 20 mesas entre todos los restaurantes:
INSERT INTO mesas (num_mesa, num_comensales, fk_restaurante)
VALUES
(1, 4, 1),
(2, 8, 1),
(1, 4, 2),
(2, 6, 2),
(1, 2, 3),
(2, 4, 3),
(1, 4, 4),
(2, 6, 4),
(1, 2, 5),
(2, 4, 5),
(1, 4, 6),
(2, 8, 6),
(1, 4, 7),
(2, 6, 7),
(1, 2, 8),
(2, 4, 8),
(1, 4, 9),
(2, 8, 9),
(1, 2, 10),
(2, 6, 10);

-- Sentencias SQL de inserción con datos de ejemplo de al menos 10 clientes:
INSERT INTO clientes (nombre, telefono, email)
VALUES 
('Carlos Rodríguez', '689242124', 'carlos.rodriguez@mail.com'),
('Elena Garcia', '627243785', 'elena.garcia@mail.com'),
('Javier Lopez', '655236985', 'javier.lopez@mail.com'),
('Laura Fernández', '672589554', 'laura.fernandez@mail.com'),
('Miguel Ruíz', '636665247', 'miguel.ruiz@mail.com'),
('Maria Sanchez', '696558978', 'maria.sanchez@mail.com'),
('Clara Pascual', '623559647', 'clara.pascual@mail.com'),
('David Garcia', '675442589', 'david.garcia@mail.com'),
('Sergio Sales', '654120036', 'sergio.sales@mail.com'),
('Andrea Puerto', '652664785', 'andrea.puerto@mail.com');

-- Sentencias SQL de inserción con al menos 20 restaurantes favoritos repartidos entre todos los restaurantes y clientes:
INSERT INTO favoritos (fk_cliente, fk_restaurante)
VALUES 
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(3, null),
(4, 4),
(4, 6),
(5, 2),
(5, 5),
(6, null),
(7, 6),
(7, 7),
(7, 8),
(8, 2),
(8, 4),
(8, 5),
(9, 2),
(9, 8),
(9, 3),
(10, null);

-- Sentencias SQL de inserción con al menos 20 reservas en total repartidas entre todos los restaurantes y clientes:
INSERT INTO reservas (fecha_reserva, hora_reserva, fk_cliente, fk_mesa, fk_restaurante)
VALUES
	-- Reservas Burgerqueen Valencia:
('2024-04-14', '17:00:00', 1, 1, 1),
('2024-04-15', '19:00:00', 2, 2, 1),
('2024-04-15', '21:00:00', 3, 2, 1),
	-- Reservas Burgerqueen Madrid:
('2024-04-14', '17:00:00', 4, 1, 2),
('2024-04-14', '17:00:00', 5, 2, 2),
	-- Reservas Burgerqueen Barcelona:
('2024-04-14', '14:00:00', 6, 1, 3),
('2024-04-14', '15:00:00', 7, 2, 3),
('2024-04-15', '18:00:00', 4, 2, 3),
('2024-04-15', '20:00:00', 8, 1, 3),
	-- Reservas Burgerqueen Sevilla:
('2024-04-17', '11:00:00', 1, 1, 4),
	-- Reservas Burgerqueen Bilbao:
('2024-04-16', '14:00:00', 7, 1, 5),
('2024-04-17', '14:00:00', 1, 2, 5),
('2024-04-16', '11:00:00', 1, 1, 5),
('2024-04-18', '20:00:00', 1, 2, 5),
('2024-04-18', '21:00:00', 5, 1, 5),
('2024-04-20', '14:00:00', 1, 2, 5),
('2024-04-20', '20:00:00', 7, 2, 5),
('2024-04-21', '11:00:00', 5, 1, 5),
('2024-04-21', '18:00:00', 1, 2, 5),
('2024-04-21', '19:00:00', 2, 2, 5),
('2024-04-22', '21:00:00', 2, 1, 5),
('2024-04-23', '17:00:00', 1, 2, 5),
	-- Reservas Burgerqueen Málaga:
('2024-04-14', '14:00:00', 8, 1, 6),
('2024-04-15', '15:00:00', 9, 2, 6),
('2024-04-15', '19:00:00', 6, 1, 6),
('2024-04-15', '19:00:00', 3, 2, 6),
('2024-04-15', '21:00:00', 1, 1, 6),
	-- Reservas Burgerqueen Alicante:
('2024-04-16', '21:00:00', 1, 1, 7),
('2024-04-17', '14:00:00', 10, 1, 7),
	-- Reservas Burgerqueen Zaragoza:
('2024-04-14', '19:00:00', 7, 1, 8),
('2024-04-14', '19:00:00', 1, 2, 8),
	-- Reservas Burgerqueen Granada:
('2024-04-15', '13:00:00', 8, 1, 9),
('2024-04-15', '13:00:00', 6, 2, 9),
('2024-04-15', '15:00:00', 5, 1, 9),
('2024-04-15', '20:00:00', 2, 2, 9),
('2024-04-15', '21:00:00', 7, 1, 9),
	-- Reservas Burgerqueen Cadiz:
('2024-04-18', '21:00:00', 5, 1, 10),
('2024-04-21', '14:00:00', 1, 2, 10);

# SENTENCIAS SQL:

-- Sentencia SQL de selección para obtener todas las reservas que tiene un restaurante para un día concreto, mostrando los datos del cliente y de la mesa reservada:
SELECT reservas.id, reservas.fecha_reserva, reservas.hora_reserva, clientes.nombre, clientes.telefono, clientes.email, mesas.num_mesa, mesas.num_comensales 
FROM reservas
INNER JOIN clientes ON reservas.fk_cliente = clientes.id
INNER JOIN mesas ON reservas.fk_mesa = mesas.id
	-- Del restaurante Burguerqueen Valencia, el día 15 de abril a las 19h:
WHERE reservas.fk_restaurante = 1 AND reservas.fecha_reserva = '2024-04-15';

-- Sentencia SQL de selección para obtener todos los nombres de los restaurantes favoritos y que estén abiertos, para un cliente concreto:
SELECT restaurantes.nombre
FROM favoritos AS fav
INNER JOIN restaurantes ON fav.fk_restaurante = restaurantes.id
	-- Restaurantes favoritos y abiertos del cliente con id 8:
WHERE fav.fk_cliente = 8
AND restaurantes.is_abierto = 1;

-- Sentencia SQL de actualización para poder modificar la fecha y hora de una reserva:
UPDATE reservas
	-- Cambiar del '2024-04-18, 20:00:00h' a:
SET fecha_reserva = '2024-04-19', hora_reserva = '22:00:00'
WHERE id = 11;

-- Sentencia SQL de eliminación para poder eliminar todos los restaurantes favoritos que no se encuentren abiertos para un cliente concreto:
DELETE FROM favoritos AS fav
WHERE fav.fk_cliente = 9
AND fav.fk_restaurante 
IN 
(SELECT id
FROM restaurantes
WHERE is_abierto = 0);

-- Sentencia SQL de selección para obtener el nombre de los restaurantes con más de tres reservas de cuatro o más comensales para un día específico:
SELECT r.nombre
FROM restaurantes AS r
INNER JOIN reservas AS rs ON rs.fk_restaurante = r.id
INNER JOIN mesas ON rs.fk_mesa = mesas.id
WHERE rs.fecha_reserva = '2024-04-15'
GROUP BY r.id
HAVING COUNT(DISTINCT rs.id) > 3 AND SUM(mesas.num_comensales) >= 4;

-- Sentencia SQL de selección para obtener el aforo máximo de un restaurante concreto:
SELECT SUM(num_comensales) AS aforo_max
FROM mesas
	-- Burgerqueen Cadiz:
WHERE fk_restaurante = 10;

-- Sentencia SQL de selección para obtener las mesas que dispongan de espacio para dos comensales y que se encuentren disponibles (sin reserva) en un restaurante específico para una fecha y hora concretos:
SELECT m.*
FROM mesas AS m
WHERE fk_restaurante = 8 AND num_comensales = 2 AND m.id NOT IN ( -- Buscar y excluir reservas en la fecha y hora especificadas:
    SELECT m.id FROM reservas AS rs WHERE rs.fecha_reserva = '2024-04-19' AND rs.hora_reserva = '14:00:00');

-- Sentencia SQL de selección para obtener el nombre del cliente que ha realizado más reservas en un restaurante específico dentro de un rango de fechas dado:
SELECT c.nombre
FROM reservas AS rs
INNER JOIN clientes AS c ON rs.fk_cliente = c.id
INNER JOIN restaurantes AS r ON rs.fk_restaurante = r.id
WHERE r.nombre = 'Burgerqueen_Bilbao'
AND rs.fecha_reserva BETWEEN '2024-04-16' AND '2024-04-23'
GROUP BY c.nombre ORDER BY COUNT(*) DESC
LIMIT 1;