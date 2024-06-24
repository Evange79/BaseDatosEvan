-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 24, 2024 at 02:33 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda_tecnologia`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `Categorias_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `Categorias_id`) VALUES
(1, 'Computadoras', 'Computadoras de escritorio y laptops', 0),
(2, 'Accesorios', 'Accesorios de tecnología', 0),
(3, 'Smartphones', 'Teléfonos inteligentes y accesorios', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `Nombre y Apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `Nombre y Apellido`, `email`, `telefono`, `direccion`) VALUES
(100, 'Santiago Emanuel', 'santiago10@gmail.com', '3516212784', 'Calle publica A 6282 Barrio Los Robles de Horizonte.'),
(101, 'Luciana Martinez', 'Lucianamartinez23@hotmail.com', '3516212784', 'Menendez Pidal 2345 Barrio Cerro de las Rosas.'),
(102, 'Carolina Lozada', 'Carolozada234@gmail.com', '3519876890', 'Calle publica A 6788 Barrio Altamira'),
(103, 'Bautista Mulla', 'Baumulla26@hotmail.com', '3513456789', 'Juan B Justo 4567 Barrio Alta Cba'),
(104, 'Jorge Gomez', 'JG@gmail.com', '3516212890', 'Campillo 1234 Barrio Cofico'),
(105, 'Esteban Gutierrez', 'EstebanG@gmail.com', '3512987891', 'Manzana 30 Lote 17 Barrio Parque de la Vega 1'),
(106, 'Jose Peñaloza', 'JPeñaloza@gmail.com', '011 34567890', 'Calle Uruguay 2345 Barrio Bolulogne'),
(107, 'Cesar de la Torre', 'LTorre@gmail.com', '3512456789', 'Calle Bermudas 340 Barrio Cabo Farina'),
(108, 'Lucas Mercado', 'Lucas_Mercado76@gmail.com', '3518900807', 'Calle ituzaingo 768 Barrio Nueva Cordoba');

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pedidos`
--

CREATE TABLE `detalles_pedidos` (
  `id` int NOT NULL,
  `pedido_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detalles_pedidos`
--

INSERT INTO `detalles_pedidos` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 2, 5, '200.00'),
(2, 2, 12, 15, '200.00'),
(3, 3, 7, 3, '200.00'),
(4, 4, 6, 20, '200.00'),
(5, 5, 3, 12, '200.00'),
(6, 6, 4, 5, '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `fecha`, `total`, `estado`) VALUES
(1, 103, '2024-06-09 16:09:46', '1000.00', 'En distribucion'),
(2, 100, '2024-06-18 22:16:36', '30000.00', 'Entregado'),
(3, 108, '2024-06-14 15:18:51', '600.00', 'Entregado'),
(4, 102, '2024-06-02 10:20:57', '4000.00', 'Entregado'),
(5, 107, '2024-06-20 18:22:05', '2400.00', 'En distribucion'),
(6, 106, '2024-06-19 19:23:26', '1000.00', 'Entregado');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `categorias_id` int DEFAULT NULL,
  `stock` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `categorias_id`, `stock`) VALUES
(1, 'Apple MacBook', 'Air m2 PRO', '200.00', 1, 50),
(2, 'Notebook Asus', 'VIVO Book Ryzen 7', '200.00', 1, 75),
(3, 'Notebook HP', 'Pavillion 15.6', '200.00', 1, 100),
(4, 'Celular Samsung ', 'Galaxy A14 5G', '200.00', 3, 95),
(5, 'Celular Xaomi', 'Pocophone x3 PRO', '200.00', 3, 100),
(6, 'Celular Motorola', 'Moto G84 5G', '200.00', 3, 200),
(7, 'Tablet Samsung ', 'Galaxy Tab A7', '200.00', 3, 125),
(8, 'Tablet Apple', 'iPad Air', '200.00', 3, 100),
(9, 'Tablet VIVO', 'VIVO pad 2', '200.00', 3, 50),
(10, 'Apple MacBook', 'MacBook M3 MAX', '200.00', 1, 50),
(11, 'Celular Apple', 'Iphone 14 PRO MAX', '200.00', 3, 100),
(12, 'Computadora Apple', 'Apple Mac PRO', '200.00', 1, 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_id` (`categorias_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD CONSTRAINT `detalles_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalles_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
