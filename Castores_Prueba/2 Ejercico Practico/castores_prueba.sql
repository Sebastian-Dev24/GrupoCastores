-- Crear base de datos
CREATE DATABASE IF NOT EXISTS `castores_prueba`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

-- Usar base de datos
USE `castores_prueba`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `roles`
-- --------------------------------------------------------
CREATE TABLE `roles` (
  `id_rol` TINYINT(4) NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Almacenista');

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `usuarios`
-- --------------------------------------------------------
CREATE TABLE `usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  `apellido_pa` VARCHAR(55) NOT NULL,
  `apellido_ma` VARCHAR(55) NOT NULL,
  `correo` VARCHAR(250) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `id_rol` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido_pa`, `apellido_ma`, `correo`, `password`, `id_rol`) VALUES
(1, 'Juan', 'Castores', 'Bendito', 'Prueba@live.com.mx', '$2a$10$Du3jk.kml06HAPh6vmnaIOhsDBmgmkmRD2Kch8y5NGSuCO7fyvavG', 1),
(5, 'Fatima', 'Bendito', 'Castores', 'FatimaBendito@hotmail.com', '$2a$10$Uxvf8BIjnvmMHPEoDCr5dO/vy7QuMSBD6osfxrVHGD1x3jrB.uaw6', 2);

--Contraseñas de ambas
--Gta112233

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `productos`
-- --------------------------------------------------------
CREATE TABLE `productos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `cantidad_actual` INT(11) DEFAULT 0,
  `estatus` ENUM('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `bitacora_movimientos`
-- --------------------------------------------------------
CREATE TABLE `bitacora_movimientos` (
  `id_movimiento` INT(11) NOT NULL AUTO_INCREMENT,
  `id_producto` INT(11) NOT NULL,
  `tipo_movimiento` ENUM('Entrada','Salida') NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `fecha_hora` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `bitacora_movimientos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `bitacora_movimientos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Confirmar cambios
COMMIT;