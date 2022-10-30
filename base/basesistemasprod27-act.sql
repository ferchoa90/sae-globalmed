/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.21 : Database - dbglobalmed
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbglobalmed` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dbglobalmed`;

/*Table structure for table `auditoria` */

DROP TABLE IF EXISTS `auditoria`;

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` longblob NOT NULL,
  `transaccion` longblob NOT NULL,
  `observacion` longblob,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`,`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auditoria` */

/*Table structure for table `banco` */

DROP TABLE IF EXISTS `banco`;

CREATE TABLE `banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `tipo` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idproveedor` int(11) DEFAULT NULL,
  `beneficiario` longblob,
  `tipopago` int(11) NOT NULL,
  `concepto` longblob NOT NULL,
  `cuenta` varchar(50) NOT NULL,
  `cartera` int(11) DEFAULT NULL,
  `comprobante` int(11) NOT NULL DEFAULT '0',
  `disponible` date DEFAULT NULL,
  `diario` varchar(50) DEFAULT NULL,
  `numeroretencion` varchar(50) DEFAULT NULL,
  `conciliado` int(1) DEFAULT '0',
  `usuariocreacion` int(11) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `cuentaporpagar` int(11) DEFAULT NULL,
  `cuentaotros` varchar(50) DEFAULT NULL,
  `cuentabanco` varchar(50) DEFAULT NULL,
  `movimientobanco` int(11) DEFAULT NULL,
  `movimientocaja` int(11) DEFAULT NULL,
  `cpcprotreversion` int(11) DEFAULT NULL,
  `cpcprotcargos` int(11) DEFAULT NULL,
  `bcoprotreversion` int(11) DEFAULT NULL,
  `bcoprotcargos` int(11) DEFAULT NULL,
  `bcoprotorigen` int(11) DEFAULT NULL,
  `cpcprotorigen` int(11) DEFAULT NULL,
  `movanticipo` int(11) DEFAULT NULL,
  `cuentaempleado` varchar(50) DEFAULT NULL,
  `movprestamo` int(11) DEFAULT NULL,
  `movingempleado` int(11) DEFAULT NULL,
  `movrol` int(11) DEFAULT NULL,
  `cpcdeposito` int(11) DEFAULT NULL,
  `cppcomprobante` int(11) DEFAULT NULL,
  `usuariodesconcilia` int(11) DEFAULT NULL,
  `fechadesconcilia` datetime DEFAULT NULL,
  `estatusanticipo` int(11) DEFAULT NULL,
  `antimovimiento` int(11) DEFAULT NULL,
  `fechaanticipo` datetime DEFAULT NULL,
  `usuarioanti` int(11) DEFAULT NULL,
  `cierreventan` int(11) DEFAULT NULL,
  `fechacierreventa` datetime DEFAULT NULL,
  `usuariocierreventa` int(11) DEFAULT NULL,
  `recsociomov` int(11) DEFAULT NULL,
  `recsoccuotas` int(11) DEFAULT NULL,
  `recsocmovdebito` int(11) DEFAULT NULL,
  `cobrosocio` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `banco` */

/*Table structure for table `bancoconciliacion` */

DROP TABLE IF EXISTS `bancoconciliacion`;

CREATE TABLE `bancoconciliacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cuenta` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  `archivo` varchar(50) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bancoconciliacion` */

/*Table structure for table `bancoconciliaciondetalle` */

DROP TABLE IF EXISTS `bancoconciliaciondetalle`;

CREATE TABLE `bancoconciliaciondetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cuenta` varchar(80) NOT NULL,
  `tipo` int(11) NOT NULL,
  `archivo` varchar(80) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bancoconciliaciondetalle` */

/*Table structure for table `bancos` */

DROP TABLE IF EXISTS `bancos`;

CREATE TABLE `bancos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`,`usuariocreacion`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `bancos_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bancos` */

/*Table structure for table `bodega` */

DROP TABLE IF EXISTS `bodega`;

CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `orden` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bodega` */

/*Table structure for table `buzonmensajes` */

DROP TABLE IF EXISTS `buzonmensajes`;

CREATE TABLE `buzonmensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` longblob NOT NULL,
  `mensaje` longblob,
  `usuarioc` int(11) NOT NULL,
  `destinatario` int(11) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leido` enum('LEIDO','NO LEIDO','INACTIVO') NOT NULL DEFAULT 'NO LEIDO',
  `estatusmen` enum('BORRADOR','ENVIADO','NO ENVIADO','PENDIENTE','ENTREGADO') NOT NULL DEFAULT 'BORRADOR',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuarioc` (`usuarioc`),
  CONSTRAINT `buzonmensajes_ibfk_1` FOREIGN KEY (`usuarioc`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `buzonmensajes` */

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` longblob NOT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `proveedor` int(11) DEFAULT NULL,
  `beneficiario` longblob,
  `tipopago` int(11) DEFAULT NULL,
  `concepto` longblob,
  `cuenta` varchar(80) DEFAULT NULL,
  `cartera` int(11) DEFAULT NULL,
  `comprobante` int(11) DEFAULT NULL,
  `disponible` date DEFAULT NULL,
  `diario` varchar(50) DEFAULT NULL,
  `numeroretencion` varchar(80) DEFAULT NULL,
  `usuariocreacion` int(11) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `cuentaxpagar` int(11) DEFAULT NULL,
  `cuentaotros` varchar(50) DEFAULT NULL,
  `cuentabanco` varchar(50) DEFAULT NULL,
  `movimientobanco` int(11) DEFAULT NULL,
  `cierrecaja` int(11) DEFAULT NULL,
  `movcaja` int(11) DEFAULT NULL,
  `movcartera` int(11) DEFAULT NULL,
  `movanticipo` int(11) DEFAULT NULL,
  `cuentaempleado` varchar(50) DEFAULT NULL,
  `movprestamo` int(11) DEFAULT NULL,
  `movingreempl` int(11) DEFAULT NULL,
  `movrol` int(11) DEFAULT NULL,
  `comprobantectaxp` int(11) DEFAULT NULL,
  `usuarioapertura` int(11) DEFAULT NULL,
  `fechaapertura` datetime DEFAULT NULL,
  `anticipoestatus` int(11) DEFAULT NULL,
  `anticipomov` int(11) DEFAULT NULL,
  `anticipofecha` datetime DEFAULT NULL,
  `anticipousuario` int(11) DEFAULT NULL,
  `cierreventanum` int(11) DEFAULT NULL,
  `cierreventafecha` datetime DEFAULT NULL,
  `cierreventausu` int(11) DEFAULT NULL,
  `aperturaventafecha` datetime DEFAULT NULL,
  `aperturaventausu` int(11) DEFAULT NULL,
  `movrecsocio` int(11) DEFAULT NULL,
  `descsociocuotas` int(11) DEFAULT NULL,
  `recsocmovdebito` int(11) DEFAULT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caja` */

/*Table structure for table `calidad` */

DROP TABLE IF EXISTS `calidad`;

CREATE TABLE `calidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `calidad_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calidad` */

/*Table structure for table `canales` */

DROP TABLE IF EXISTS `canales`;

CREATE TABLE `canales` (
  `id` int(11) NOT NULL,
  `nombre` longblob NOT NULL,
  `etiqueta` varchar(50) NOT NULL,
  `formato` varchar(50) NOT NULL,
  `devolucion` varchar(50) DEFAULT NULL,
  `maxitems` int(11) NOT NULL,
  `autorizacion` varchar(15) NOT NULL,
  `fechaaut` datetime NOT NULL,
  `fechaexp` datetime NOT NULL,
  `tipocomprobante` int(11) NOT NULL,
  `secuencia` varchar(7) NOT NULL,
  `ultimafactura` varchar(7) NOT NULL,
  `tiporecibo` int(11) DEFAULT NULL,
  `ats` int(11) DEFAULT NULL,
  `temisionfactura` int(11) DEFAULT NULL,
  `fechacreacion` datetime DEFAULT NULL,
  `usuariocreacion` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechasec` datetime DEFAULT NULL,
  `usuariosec` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `canales_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `canales` */

/*Table structure for table `caracteristica` */

DROP TABLE IF EXISTS `caracteristica`;

CREATE TABLE `caracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `caracteristica` */

/*Table structure for table `cierreanio` */

DROP TABLE IF EXISTS `cierreanio`;

CREATE TABLE `cierreanio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idperiodo` int(11) NOT NULL DEFAULT '1',
  `detalles` longblob,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idperiodo` (`idperiodo`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `cierreanio_ibfk_1` FOREIGN KEY (`idperiodo`) REFERENCES `periodofiscal` (`id`),
  CONSTRAINT `cierreanio_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cierreanio` */

/*Table structure for table `cierreaniodetalle` */

DROP TABLE IF EXISTS `cierreaniodetalle`;

CREATE TABLE `cierreaniodetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `anio` year(4) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `saldo` decimal(10,3) NOT NULL DEFAULT '0.000',
  `padre` varchar(50) DEFAULT NULL,
  `inputa` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cierreaniodetalle` */

/*Table structure for table `cierreordenproduccion` */

DROP TABLE IF EXISTS `cierreordenproduccion`;

CREATE TABLE `cierreordenproduccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `movprodterminado` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cierreordenproduccion` */

/*Table structure for table `cierreordenproducciondet` */

DROP TABLE IF EXISTS `cierreordenproducciondet`;

CREATE TABLE `cierreordenproducciondet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cierreordenproducciondet` */

/*Table structure for table `citasmedicas` */

DROP TABLE IF EXISTS `citasmedicas`;

CREATE TABLE `citasmedicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `observacion` longblob,
  `fechacita` date NOT NULL,
  `horacita` time NOT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `idoptometrista` int(11) NOT NULL DEFAULT '1',
  `iddoctor` int(11) NOT NULL DEFAULT '1',
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `tipocita` enum('NUEVA CITA','CONTROL','OTROS') NOT NULL DEFAULT 'NUEVA CITA',
  `estatuscita` enum('AGENDADA','CONFIRMADA','CANCELADA','REAGENDADA','ATENDIDA','PREPARACIÓN','EN ATENCIÓN','CONSULTA MED') NOT NULL DEFAULT 'AGENDADA',
  `via` enum('WEB','ONLINE') NOT NULL DEFAULT 'WEB',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idusuario`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `iddoctor` (`iddoctor`),
  KEY `idoptometrista` (`idoptometrista`),
  CONSTRAINT `citasmedicas_ibfk_3` FOREIGN KEY (`iddoctor`) REFERENCES `user` (`id`),
  CONSTRAINT `citasmedicas_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `citasmedicas_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `citasmedicas` */

insert  into `citasmedicas`(`id`,`idusuario`,`observacion`,`fechacita`,`horacita`,`isDeleted`,`fechacreacion`,`fechaact`,`idoptometrista`,`iddoctor`,`usuariocreacion`,`usuarioact`,`tipocita`,`estatuscita`,`via`,`estatus`) values (1,20,'','2022-05-11','09:30:00',0,'2022-05-25 16:22:38',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(2,21,'','2022-05-11','10:00:00',0,'2022-05-25 16:22:38',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(3,22,'Examenes, Tomografia de nervio, Paquimetria','2022-05-11','10:30:00',0,'2022-05-25 16:22:38',NULL,6,10019,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(4,23,'','2022-05-11','11:00:00',0,'2022-05-25 16:22:39',NULL,6,10019,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(5,24,'','2022-05-11','12:00:00',0,'2022-05-25 16:22:39',NULL,6,10019,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(6,25,'datos de prueba para doc luna ','2022-05-11','16:30:00',0,'2022-05-25 16:23:45',NULL,6,10015,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(7,26,'','2022-05-18','09:00:00',0,'2022-05-25 16:22:40',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(8,27,'','2022-05-18','09:30:00',0,'2022-05-25 16:22:40',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(9,22,'REVISION RESULTADOS','2022-05-18','10:00:00',0,'2022-05-25 16:22:41',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(10,28,'','2022-05-18','10:30:00',0,'2022-05-25 16:22:41','2022-05-18 10:53:07',6,10019,10014,10014,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(11,29,'','2022-05-18','12:00:00',0,'2022-05-25 16:22:42',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(12,30,'','2022-05-18','11:30:00',0,'2022-05-25 16:22:42',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(13,31,'','2022-05-18','12:30:00',0,'2022-05-25 16:22:43',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(14,32,'','2022-05-20','09:00:00',0,'2022-05-25 16:24:00',NULL,6,10018,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(15,33,'','2022-05-20','09:30:00',0,'2022-05-25 16:24:00',NULL,6,10018,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(16,34,'','2022-05-20','10:00:00',0,'2022-05-25 16:23:49',NULL,6,10015,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(17,35,'','2022-05-20','10:30:00',0,'2022-05-25 16:24:01',NULL,6,10018,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(18,36,'','2022-05-20','11:00:00',0,'2022-05-25 16:24:02',NULL,6,10018,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(19,37,'','2022-05-20','11:30:00',0,'2022-05-25 16:24:02',NULL,6,10018,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(20,38,'','2022-05-24','09:30:00',0,'2022-05-25 16:24:56',NULL,6,10016,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(21,25,'','2022-05-24','10:30:00',0,'2022-05-25 16:24:51',NULL,6,1,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(23,40,'','2022-05-24','11:30:00',0,'2022-05-25 16:24:48',NULL,6,10016,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(24,41,'','2022-05-25','10:30:00',0,'2022-05-25 16:57:03',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(25,42,'','2022-05-25','11:00:00',0,'2022-05-25 16:57:10',NULL,6,10019,10014,NULL,'NUEVA CITA','ATENDIDA','WEB','ACTIVO'),(30,37,'','2022-05-27','09:00:00',0,'2022-05-27 08:54:32',NULL,10022,10018,10014,NULL,'CONTROL','EN ATENCIÓN','WEB','ACTIVO'),(31,36,'','2022-05-27','09:30:00',0,'2022-05-27 08:57:27',NULL,10022,10018,10014,NULL,'CONTROL','EN ATENCIÓN','WEB','ACTIVO'),(32,43,'','2022-05-27','10:00:00',0,'2022-05-27 09:47:51',NULL,10022,10018,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(33,44,'','2022-05-27','10:00:00',0,'2022-05-27 10:02:38',NULL,10022,10018,10014,NULL,'NUEVA CITA','CANCELADA','WEB','ACTIVO'),(34,44,'','2022-05-27','10:00:00',0,'2022-05-27 10:03:28',NULL,10022,10015,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO'),(35,45,'','2022-05-27','10:30:00',0,'2022-05-27 10:31:43',NULL,10022,10018,10014,NULL,'NUEVA CITA','EN ATENCIÓN','WEB','ACTIVO');

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(10) DEFAULT NULL,
  `idpais` int(11) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idpais` (`idpais`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ciudad` */

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(10) DEFAULT NULL,
  `idpais` int(11) NOT NULL DEFAULT '1',
  `idprovincia` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idpais` (`idpais`),
  KEY `idprovincia` (`idprovincia`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`id`),
  CONSTRAINT `ciudades_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `ciudades_ibfk_3` FOREIGN KEY (`idprovincia`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42005 DEFAULT CHARSET=utf8;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`nombre`,`sufijo`,`idpais`,`idprovincia`,`fechacreacion`,`usuariocreacion`,`fechaact`,`usuarioact`,`isDeleted`,`estatus`) values (1,'TRIUNFO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(22,'JAMUNDI','',1,22,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(55,'URCUQUI','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(140,'PELILEO','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(145,'PILLAROS','',1,218,'2015-06-22 16:34:36',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(150,'BAÑOS','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(175,'SAN MIGUEL DE LOS BANCOS','',1,202,'2015-06-22 15:54:47',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(395,'YAGUACHI','',1,109,'2015-06-23 10:33:37',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(460,'BUCAY','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(600,'LIMON INDANZA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(630,'ASUNCION','',1,23,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(645,'ORELLANA','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(725,'JOYA DE LOS SACHAS','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(735,'PLAYAS','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(770,'S.MIGUEL DE BANCOS','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(780,'ONA','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(815,'CHAGUARPAMBA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(895,'PEDRO V. MALDONADO','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(925,'SAN JUAN BOSCO','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(935,'LORETO','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(940,'NOBOL/PIEDRAHITA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(985,'GRAL. A. ELIZALDE','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(996,'PLAYAS','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(997,'CRNEL.M. MARIDUENA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(998,'SAN PLACIDO','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(1000,'CUBIJIES','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(1001,'LIZARZABURU','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10701,'MACHALA','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10702,'ARENILLAS','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10703,'ATAHUALPA','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10704,'BALSAS','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10705,'CHILLA','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10706,'EL GUABO','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10707,'HUAQUILLAS','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10708,'MARCABELI','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10709,'PASAJE','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10710,'PIÑAS','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10711,'PORTOVELO','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10712,'SANTA ROSA','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10713,'ZARUMA','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10714,'LAS LAJAS','',1,107,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10801,'ESMERALDAS','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10802,'ELOY ALFARO','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10803,'MUISNE','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10804,'QUININDE','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10805,'SAN LORENZO','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10806,'ATACAMES','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10807,'RIO VERDE','',1,108,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10901,'GUAYAQUIL','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10903,'BALAO','',1,109,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10904,'BALZAR','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10905,'COLIMES','',1,109,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10906,'DAULE','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10907,'DURAN','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10908,'EL EMPALME','',1,109,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10909,'EL TRIUNFO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10910,'MILAGRO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10911,'NARANJAL','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10912,'NARANJITO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10913,'PALESTINA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10914,'PEDRO CARBO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10915,'SALINAS','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10916,'SAMBORONDON','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10917,'SANTA ELENA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10918,'SANTA LUCIA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10919,'URBINA JADO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10922,'SIMON BOLIVAR','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10923,'CORONEL MARCELINO MARIDUEÑA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10924,'LOMAS DE SARGENTILLO','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10926,'LA LIBERTAD','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(10928,'ISIDRO AYORA','',1,109,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11201,'BABAHOYO','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11202,'BABA','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11203,'MONTALVO','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11204,'PUEBLO VIEJO','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11205,'QUEVEDO','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11206,'URDANETA','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11207,'VENTANAS','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11208,'VINCES','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11209,'PALENQUE','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11210,'BUENA FE','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11212,'MOCACHE','',1,112,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11301,'PORTOVIEJO','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11302,'BOLIVAR','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11303,'CHONE','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11304,'EL CARMEN','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11305,'FLAVIO ALFARO','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11306,'JIPIJAPA','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11307,'JUNIN','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11308,'MANTA','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11309,'MONTECRISTI','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11310,'PAJAN','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11311,'PICHINCHA','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11312,'ROCAFUERTE','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11313,'SANTA ANA','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11314,'SUCRE','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11315,'TOSAGUA','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11317,'PEDERNALES','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11318,'OLMEDO','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11319,'PUERTO LOPEZ','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(11322,'SAN VICENTE','',1,113,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20101,'CUENCA','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20102,'GIRON','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20103,'GUALACEO','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20104,'NABON','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20105,'PAUTE','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20106,'PUCARA','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20107,'SAN FERNANDO','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20108,'SANTA ISABEL','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20109,'SIGSIG','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20111,'CHORDELEG','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20112,'EL PAN','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20113,'SEVILLA DE ORO','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20114,'GUACHAPALA','',1,201,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20201,'GUARANDA','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20202,'CHILLANES','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20203,'CHIMBO','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20204,'ECHEANDIA','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20206,'CALUMA','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20207,'LAS NAVES','',1,202,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20301,'AZOGUES','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20302,'BIBLIAN','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20303,'CAÑAR','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20304,'LA TRONCAL','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20305,'EL TAMBO','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20306,'DELEG','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20307,'SUSCAL','',1,203,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20401,'TULCAN','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20402,'BOLIVAR','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20403,'ESPEJO','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20404,'MIRA','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20405,'MONTUFAR','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20406,'SAN PEDRO DE HUACA','',1,204,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20501,'LATACUNGA','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20502,'LA MANA','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20503,'PANGUA','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20504,'PUJILI','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20505,'SALCEDO','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20506,'SAQUISILI','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20507,'SIGCHOS','',1,205,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20601,'RIOBAMBA','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20602,'ALAUSI','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20603,'COLTA','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20604,'CHAMBO','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20605,'CHUNCHI','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20606,'GUAMOTE','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20607,'GUANO','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20608,'PALLATANGA','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20609,'PENIPE','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(20610,'CUMANDA','',1,206,'2009-10-27 16:12:06',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21001,'IBARRA','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21002,'ANTONIO ANTE','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21003,'COTACACHI','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21004,'OTAVALO','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21005,'PIMAMPIRO','',1,210,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21101,'LOJA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21102,'CALVAS','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21103,'CATAMAYO','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21104,'CELICA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21106,'ESPINDOLA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21107,'GONZANAMA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21108,'MACARA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21109,'PALTAS','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21110,'PUYANGO','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21111,'SARAGURO','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21112,'SOZORANGA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21113,'ZAPOTILLO','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21114,'PINDAL','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21115,'QUILANGA','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21116,'OLMEDO','',1,211,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21701,'QUITO','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21702,'CAYAMBE','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21703,'MEJIA','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21704,'PEDRO MONCAYO','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21705,'RUMIÑAHUI','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21706,'SANTO DOMINGO','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21709,'PUERTO QUITO','',1,217,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21801,'AMBATO','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21803,'CEVALLOS','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21804,'MOCHA','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21805,'PATATE','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21806,'QUERO','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(21809,'TISALEO','',1,218,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31401,'MORONA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31402,'GUALAQUIZA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31404,'PALORA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31405,'SANTIAGO','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31406,'SUCUA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31407,'HUAMBOYA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31409,'TAISHA','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31410,'LOGROÑO','',1,314,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31501,'TENA','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31503,'ARCHIDONA','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31504,'EL CHACO','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31507,'QUIJOS','',1,315,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31601,'PASTAZA','',1,316,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31602,'MERA','',1,316,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31603,'SANTA CLARA','',1,316,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31604,'ARAJUNO','',1,316,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31901,'ZAMORA','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31902,'CHINCHIPE','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31903,'NANGARITZA','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31904,'YACUAMBI','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31905,'YANZATZA','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31906,'EL PANGUI','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(31907,'CENTINELA DEL CONDOR','',1,319,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32101,'LAGO AGRIO','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32102,'GONZALO PIZARRO','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32103,'PUTUMAYO','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32104,'SHUSHUFINDI','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32105,'SUCUMBIOS','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(32106,'CASCALES','',1,321,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(42001,'SAN CRISTOBAL','',1,420,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(42002,'ISABELA','',1,420,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(42003,'SANTA CRUZ','',1,420,'2009-10-02 12:10:53',1,'0000-00-00 00:00:00',0,0,'ACTIVO'),(42004,'CUCUTA','',1,1000,'2015-06-22 16:54:14',1,'0000-00-00 00:00:00',0,0,'ACTIVO');

/*Table structure for table `clasificacion` */

DROP TABLE IF EXISTS `clasificacion`;

CREATE TABLE `clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `fechamod` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clasificacion` */

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(13) NOT NULL,
  `razonsocial` longblob NOT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `extranjero` int(1) DEFAULT '0',
  `contribuyente` int(1) DEFAULT '0',
  `tipoident` int(11) DEFAULT NULL,
  `contacto` longblob,
  `domicilio` longblob,
  `fax` varchar(25) DEFAULT NULL,
  `correo` varchar(80) NOT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `zona` int(11) DEFAULT NULL,
  `idvendedor` int(11) DEFAULT NULL,
  `transporte` int(11) DEFAULT NULL,
  `notas` longblob,
  `categoria` int(11) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `credito` decimal(10,2) DEFAULT NULL,
  `ultimopago` date DEFAULT NULL,
  `ultimafactura` date DEFAULT NULL,
  `foto` varchar(120) DEFAULT NULL,
  `cuentacontable` varchar(80) DEFAULT NULL,
  `cupocredito` decimal(10,2) DEFAULT NULL,
  `autorizacion` int(11) DEFAULT NULL,
  `validez` datetime DEFAULT NULL,
  `natural` int(1) DEFAULT '0',
  `exentoiva` int(1) DEFAULT '0',
  `factdiasvenc` int(11) DEFAULT NULL,
  `comprobanteelec` int(1) DEFAULT NULL,
  `cuentaanticipo` varchar(50) DEFAULT NULL,
  `rangofacdesde` int(2) DEFAULT NULL,
  `rangofachasta` int(2) DEFAULT NULL,
  `fechanac` date DEFAULT NULL,
  `razoncomercial` longblob,
  `barrio` int(11) DEFAULT NULL,
  `emailcomprobante` varchar(120) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `clientes` */

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `color_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `color` */

/*Table structure for table `consultamedica` */

DROP TABLE IF EXISTS `consultamedica`;

CREATE TABLE `consultamedica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcitamedica` int(11) NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `observacion` longblob NOT NULL,
  `fechacita` date NOT NULL,
  `horacita` time NOT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `idoptometrista` int(11) NOT NULL DEFAULT '1',
  `iddoctor` int(11) NOT NULL DEFAULT '1',
  `fechainatencion` datetime DEFAULT NULL,
  `fechafinatencion` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idcitamedica`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `iddoctor` (`iddoctor`),
  KEY `idpaciente` (`idpaciente`),
  CONSTRAINT `consultamedica_ibfk_1` FOREIGN KEY (`idpaciente`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `consultamedica_ibfk_2` FOREIGN KEY (`idcitamedica`) REFERENCES `citasmedicas` (`id`),
  CONSTRAINT `consultamedica_ibfk_3` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedica` */

insert  into `consultamedica`(`id`,`idcitamedica`,`idpaciente`,`observacion`,`fechacita`,`horacita`,`isDeleted`,`fechacreacion`,`fechaact`,`idoptometrista`,`iddoctor`,`fechainatencion`,`fechafinatencion`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,20,'-','2022-05-11','09:30:00',0,'2022-05-11 09:01:05',NULL,1,1,'2022-05-11 09:01:05',NULL,10022,NULL,'ACTIVO'),(2,2,21,'-','2022-05-11','10:00:00',0,'2022-05-11 09:40:28',NULL,2,2,'2022-05-11 09:40:28',NULL,10022,NULL,'ACTIVO'),(3,4,23,'-','2022-05-11','11:00:00',0,'2022-05-11 10:48:39',NULL,4,4,'2022-05-11 10:48:39',NULL,10022,NULL,'ACTIVO'),(5,3,22,'-','2022-05-11','10:30:00',0,'2022-05-11 11:44:40',NULL,3,3,'2022-05-11 11:44:40',NULL,10022,NULL,'ACTIVO'),(12,5,24,'-','2022-05-11','12:00:00',0,'2022-05-11 11:56:22',NULL,5,5,'2022-05-11 11:56:22',NULL,10022,NULL,'ACTIVO'),(13,6,25,'-','2022-05-11','16:30:00',0,'2022-05-11 16:21:05',NULL,6,6,'2022-05-11 04:21:05',NULL,10015,NULL,'ACTIVO'),(14,7,26,'-','2022-05-18','09:00:00',0,'2022-05-18 08:48:39',NULL,7,7,'2022-05-18 08:48:39',NULL,10022,NULL,'ACTIVO'),(15,8,27,'-','2022-05-18','09:30:00',0,'2022-05-18 08:58:31',NULL,8,8,'2022-05-18 08:58:31',NULL,10022,NULL,'ACTIVO'),(16,9,22,'-','2022-05-18','10:00:00',0,'2022-05-18 10:35:05',NULL,9,9,'2022-05-18 10:35:05',NULL,10019,NULL,'ACTIVO'),(17,10,28,'-','2022-05-18','10:30:00',0,'2022-05-18 11:46:03',NULL,10,10,'2022-05-18 11:46:03',NULL,10019,NULL,'ACTIVO'),(18,12,30,'-','2022-05-18','11:30:00',0,'2022-05-18 11:54:24',NULL,12,12,'2022-05-18 11:54:24',NULL,10022,NULL,'ACTIVO'),(19,11,29,'-','2022-05-18','12:00:00',0,'2022-05-18 12:12:05',NULL,11,11,'2022-05-18 12:12:05',NULL,10022,NULL,'ACTIVO'),(20,13,31,'-','2022-05-18','12:30:00',0,'2022-05-18 13:02:11',NULL,13,13,'2022-05-18 01:02:11',NULL,10022,NULL,'ACTIVO'),(21,14,32,'-','2022-05-20','09:00:00',0,'2022-05-20 09:28:26',NULL,14,14,'2022-05-20 09:28:26',NULL,10022,NULL,'ACTIVO'),(22,15,33,'-','2022-05-20','09:30:00',0,'2022-05-20 09:46:40',NULL,15,15,'2022-05-20 09:46:40',NULL,10022,NULL,'ACTIVO'),(23,16,34,'-','2022-05-20','10:00:00',0,'2022-05-20 10:05:49',NULL,16,16,'2022-05-20 10:05:49',NULL,10022,NULL,'ACTIVO'),(24,17,35,'-','2022-05-20','10:30:00',0,'2022-05-20 10:32:48',NULL,17,17,'2022-05-20 10:32:48',NULL,10022,NULL,'ACTIVO'),(25,18,36,'-','2022-05-20','11:00:00',0,'2022-05-20 10:38:32',NULL,18,18,'2022-05-20 10:38:32',NULL,10022,NULL,'ACTIVO'),(26,19,37,'-','2022-05-20','11:30:00',0,'2022-05-20 11:43:58',NULL,19,19,'2022-05-20 11:43:58',NULL,10022,NULL,'ACTIVO'),(27,20,38,'-','2022-05-24','09:30:00',0,'2022-05-24 08:54:08',NULL,20,20,'2022-05-24 08:54:08',NULL,10022,NULL,'ACTIVO'),(28,21,25,'-','2022-05-24','10:30:00',0,'2022-05-24 10:20:03',NULL,21,21,'2022-05-24 10:20:03',NULL,10022,NULL,'ACTIVO'),(31,23,40,'-','2022-05-24','11:30:00',0,'2022-05-24 11:22:50',NULL,23,23,'2022-05-24 11:22:50',NULL,10022,NULL,'ACTIVO'),(32,24,41,'-','2022-05-25','10:30:00',0,'2022-05-25 10:46:33',NULL,24,24,'2022-05-25 10:46:33',NULL,10022,NULL,'ACTIVO'),(33,25,42,'-','2022-05-25','11:00:00',0,'2022-05-25 11:25:11',NULL,25,25,'2022-05-25 11:25:11',NULL,10022,NULL,'ACTIVO'),(35,31,36,'-','2022-05-27','09:30:00',0,'2022-05-27 09:13:55',NULL,31,31,'2022-05-27 09:13:55',NULL,10018,NULL,'ACTIVO'),(36,30,37,'-','2022-05-27','09:00:00',0,'2022-05-27 09:31:35',NULL,30,30,'2022-05-27 09:31:35',NULL,10022,NULL,'ACTIVO'),(37,32,43,'-','2022-05-27','10:00:00',0,'2022-05-27 09:49:11',NULL,32,32,'2022-05-27 09:49:11',NULL,10022,NULL,'ACTIVO'),(38,34,44,'-','2022-05-27','10:00:00',0,'2022-05-27 10:20:47',NULL,34,34,'2022-05-27 10:20:47',NULL,10015,NULL,'ACTIVO'),(39,35,45,'-','2022-05-27','10:30:00',0,'2022-05-27 11:05:26',NULL,35,35,'2022-05-27 11:05:26',NULL,10022,NULL,'ACTIVO');

/*Table structure for table `consultamedicadet` */

DROP TABLE IF EXISTS `consultamedicadet`;

CREATE TABLE `consultamedicadet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `causaconsulta` longblob,
  `agudezavscod` varchar(100) DEFAULT NULL,
  `agudezavscoi` varchar(100) DEFAULT NULL,
  `agudezavcod` varchar(100) DEFAULT NULL,
  `agudezavcoi` varchar(100) DEFAULT NULL,
  `agudezavotr` varchar(100) DEFAULT NULL,
  `visioncscod` varchar(100) DEFAULT NULL,
  `visioncosci` varchar(100) DEFAULT NULL,
  `visionccod` varchar(100) DEFAULT NULL,
  `visionccid` varchar(100) DEFAULT NULL,
  `visioncotr` varchar(100) DEFAULT NULL,
  `visionlscod` varchar(100) DEFAULT NULL,
  `visionlscoi` varchar(100) DEFAULT NULL,
  `visionlcod` varchar(100) DEFAULT NULL,
  `visionlcoi` varchar(100) DEFAULT NULL,
  `visionlcotr` varchar(100) DEFAULT NULL,
  `pioscod` varchar(100) DEFAULT NULL,
  `pioscoi` varchar(100) DEFAULT NULL,
  `piocod` varchar(100) DEFAULT NULL,
  `piocoi` varchar(100) DEFAULT NULL,
  `piootr` varchar(100) DEFAULT NULL,
  `biomicroscopia` varchar(100) DEFAULT NULL,
  `visiondecolores` varchar(100) DEFAULT NULL,
  `visionprofundidad` varchar(100) DEFAULT NULL,
  `reflejospup` varchar(100) DEFAULT NULL,
  `campovisual` varchar(100) DEFAULT NULL,
  `fondoojood` varchar(100) DEFAULT NULL,
  `fondoojooi` varchar(100) DEFAULT NULL,
  `agujeroest` varchar(100) DEFAULT NULL,
  `examenes` longblob,
  `impdiag1` varchar(100) DEFAULT NULL,
  `impdiag2` varchar(100) DEFAULT NULL,
  `impdiag3` varchar(100) DEFAULT NULL,
  `cie1001` varchar(100) DEFAULT NULL,
  `cie1002` varchar(100) DEFAULT NULL,
  `cie1003` varchar(100) DEFAULT NULL,
  `usolentes` varchar(100) DEFAULT NULL,
  `campim` varchar(100) DEFAULT NULL,
  `octangular` varchar(100) DEFAULT NULL,
  `octm` varchar(100) DEFAULT NULL,
  `octn` varchar(100) DEFAULT NULL,
  `biood` varchar(100) DEFAULT NULL,
  `bioid` varchar(100) DEFAULT NULL,
  `paquimod` varchar(100) DEFAULT NULL,
  `paquimid` varchar(100) DEFAULT NULL,
  `ora` varchar(100) DEFAULT NULL,
  `topografia` varchar(100) DEFAULT NULL,
  `angiog` varchar(100) DEFAULT NULL,
  `ecogra` varchar(100) DEFAULT NULL,
  `endote` varchar(100) DEFAULT NULL,
  `ubm` varchar(100) DEFAULT NULL,
  `retinografia` varchar(100) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `img3` varchar(100) DEFAULT NULL,
  `img4` varchar(100) DEFAULT NULL,
  `img5` varchar(100) DEFAULT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idconsulta`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `consultamedicadet_ibfk_1` FOREIGN KEY (`idconsulta`) REFERENCES `consultamedica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedicadet` */

insert  into `consultamedicadet`(`id`,`idconsulta`,`causaconsulta`,`agudezavscod`,`agudezavscoi`,`agudezavcod`,`agudezavcoi`,`agudezavotr`,`visioncscod`,`visioncosci`,`visionccod`,`visionccid`,`visioncotr`,`visionlscod`,`visionlscoi`,`visionlcod`,`visionlcoi`,`visionlcotr`,`pioscod`,`pioscoi`,`piocod`,`piocoi`,`piootr`,`biomicroscopia`,`visiondecolores`,`visionprofundidad`,`reflejospup`,`campovisual`,`fondoojood`,`fondoojooi`,`agujeroest`,`examenes`,`impdiag1`,`impdiag2`,`impdiag3`,`cie1001`,`cie1002`,`cie1003`,`usolentes`,`campim`,`octangular`,`octm`,`octn`,`biood`,`bioid`,`paquimod`,`paquimid`,`ora`,`topografia`,`angiog`,`ecogra`,`endote`,`ubm`,`retinografia`,`img1`,`img2`,`img3`,`img4`,`img5`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,NULL,NULL,NULL,NULL,NULL,NULL,'j1','j1','','','','20/20','20/20','','','dp 60','13','14',NULL,NULL,NULL,'','','','normal ','','ok','ok','','','blefaromeibomitis ao','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 10:02:01','2022-05-11 10:02:01',10022,10019,'ACTIVO'),(2,2,'chequeo . ',NULL,NULL,NULL,NULL,NULL,'20/400','20/400',' j4','j5','','20/400','20/400','-9.00-2.25 x 180  20/30-2 +ag','-9.50 -2.25 x 180 20/40+2 +ag ','dp  65 ','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 10:01:36','2022-05-11 10:01:36',10022,10022,'ACTIVO'),(3,3,'resultados ',NULL,NULL,NULL,NULL,NULL,'pl','20/200-1','+3.00  --','+3.00  j5','','pl','20/30-2','--','neutro 20/30-2','dp 61','10','11',NULL,NULL,NULL,'','','','','','','','','','','','','','','','on',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-12 09:30:01','2022-05-11 11:22:40',10022,10019,'ACTIVO'),(5,5,'',NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','','F0023--ODOS-220511121414.jpg',NULL,NULL,NULL,NULL,0,'2022-05-11 11:44:40',NULL,10022,NULL,'ACTIVO'),(12,12,'protesis oi sin sacar 1 año. \r\npeontrobal plus x2 oi.',NULL,NULL,NULL,NULL,NULL,'j7','protesis ','+1.50     j1 ','+1.50  --','','20/70','protesis ','+0.50-0.50 x 180   20/25 +ag ','--','dp  ??','12','',NULL,NULL,NULL,'oi retiro puntos, adelgaz conj oi, evisceracion oi','','','','','ok','','','plan recubrimiento conjunctival previo a prótesis oi,','oi evisceracion . ','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-12 09:24:59',NULL,10022,NULL,'ACTIVO'),(13,13,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 16:21:28','2022-05-11 16:21:28',10015,10015,'ACTIVO'),(14,14,NULL,NULL,NULL,NULL,NULL,NULL,'j16','j16','','','','20/100','20/100','','','','16','20',NULL,NULL,NULL,'','','','normales ','','.3/','.3 cd ratio, pvd','','rx en uso : +2.00/add +3.00 prog. \r\n\r\noct n, paq, cv.','nuclear catarata ao','blefaromeibomitis ao','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 10:27:16','2022-05-18 10:27:16',10022,10019,'ACTIVO'),(15,15,NULL,NULL,NULL,NULL,NULL,NULL,'20/400','20/16','','','','20/80','20/40','','','','13','13',NULL,NULL,NULL,'','','','','','','','','rx en uso  +1.75 \r\n                     +1.50 /  2.50  progresivo','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 09:59:31','2022-05-18 09:59:31',10022,10019,'ACTIVO'),(16,16,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'od:22.5/oi:22 diop.','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F0023--ODOS-220511121414.jpg','F0023_20220511_113340_OCTReport_L_001.jpg','F0023_20220511_112533_OCTReport_N_001.jpg',NULL,NULL,0,'2022-05-18 12:29:10','2022-05-18 12:29:10',10019,10019,'ACTIVO'),(17,17,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 12:13:24','2022-05-18 12:13:24',10019,10019,'ACTIVO'),(18,18,'no ve ',NULL,NULL,NULL,NULL,NULL,'20/800','20/800','+3.00  20/800','+3.00 20/800','','20/400','20/400','neutro  20/400 +ag ','neutro  20/400 +ag ','dp 60','24','21',NULL,NULL,NULL,'','','','normales','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 12:33:15','2022-05-18 12:33:15',10022,10022,'ACTIVO'),(19,19,NULL,NULL,NULL,NULL,NULL,NULL,'j6','j10','+3.00 j2','+3.00  j4','','20/60-2','20/150-1','-1.00 -2.25 x 105   20/30+ag','-3.50 -1.00 x 115   20/50+ag ','69','16','18',NULL,NULL,NULL,'meiobomitis , catarata cortinucl oi+','','','','','.6/cd ratio.','.8 cd ratio','','rx en uso \r\nod -1.50 -0.75 x 105 \r\noi  -1.50 -3.00 x 75 / +2.50 progr','catarata ao.','sosp. glaucoma','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 13:36:17','2022-05-18 13:36:17',10022,10019,'ACTIVO'),(20,20,NULL,NULL,NULL,NULL,NULL,NULL,'j1','j1','neutro j1','neutro j1 ','','20/20','20/20','','','dp 60','15','16',NULL,NULL,NULL,'','','','','','ok','ok','','','chalazion pi oi','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 14:14:09','2022-05-18 14:14:09',10022,10019,'ACTIVO'),(21,21,NULL,NULL,NULL,NULL,NULL,NULL,'j4','j6','+2.50  j1 ','+2.50 j1','','20/150','20/150','-1.75-1.25 x 90   20/20','+1.75-1.25 x 80  20/20','','11','13',NULL,NULL,NULL,'','','','','','','','','rx en uso : ao -2.75  ','MIOPIA','PRESBICIA','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 11:12:50','2022-05-20 11:12:50',10022,10018,'ACTIVO'),(22,22,NULL,NULL,NULL,NULL,NULL,NULL,'j7','j7','+1.50   j1','+1.50  j1','','20/20-1 ','20/30 ','n -0.25 x 90  20/20  ','n  -0.75 x 80 20/20','dp 59','11','11',NULL,NULL,NULL,'NORMAL','NORMLA','','','','','NORMAL','NORMAL','rx en uso  od -0.25 \r\n                     oi  n  -0.50 x 85 ','PRESBICIA','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 11:21:18','2022-05-20 11:21:18',10022,10018,'ACTIVO'),(23,23,NULL,NULL,NULL,NULL,NULL,NULL,'j16','j16','+3.00  j1','+3.00 j1 ','','20/200','20/200','+3.25  20/25 +ag ','+3.00  20/20','dp 69','17','19',NULL,NULL,NULL,'SEGMENTO ANTERIOR SANO','','','','','SANO','SANO','','rx en uso  ao +2.75 / +2.50      ','PRESBICIA','','','H52','','','on',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 10:56:09','2022-05-20 10:56:09',10022,10015,'ACTIVO'),(24,24,'od borroso desde 7 meses. ',NULL,NULL,NULL,NULL,NULL,'j 16','j 16 ','','','','C/D 1.5 MTRS','20/200','neutro cd 1.5 mt','-3.75 -1.00 x 70 20/60+ag','dp 67','16','13',NULL,NULL,NULL,'','','','normal ','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 10:33:19','2022-05-20 10:33:19',10022,10022,'ACTIVO'),(25,25,'cuerpo extraño od (palo) ',NULL,NULL,NULL,NULL,NULL,'pl','J16','--','+3.00 J1','','pl','20/60','--','+2.50 20/20 ','','8','',NULL,NULL,NULL,'','','','oi normal ','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 10:51:23','2022-05-20 10:51:23',10022,10022,'ACTIVO'),(26,26,'rx en uso sirve para todas las actividades.\r\n timotol  x2 , larzan x 1 ao ',NULL,NULL,NULL,NULL,NULL,'j3','--','j3 +3.00','+3.00 --','','20/30','mm','+2.00-1.00*90 20/30','neutro  mm','','16','19',NULL,NULL,NULL,'','','','ausentes','','','','','rx en uso od +2.00 -1.25x 90\r\n                    oi +2.25 -1.25 x 95 \r\n                    add  +3.00  prog ','                ','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-20 12:18:18','2022-05-20 12:18:18',10022,10022,'ACTIVO'),(27,27,'',NULL,NULL,NULL,NULL,NULL,'j10','20/200-1 ','j1','j5','','20/40 ','20/60','+1.00 -1.50 x 120 20/25-2+ag','+0.50 -1.00 x 70 20/50-1+ag','dp 67','14','17',NULL,NULL,NULL,'pTERIGION GRADO 1 NASAL oi.','','','','','','','','','Pterigion','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-24 13:01:34','2022-05-24 13:01:34',10022,10016,'ACTIVO'),(28,28,'chequeo',NULL,NULL,NULL,NULL,NULL,'j3','j3','+1.00 j1','+1.00 j3','','20/70','20/60+ag','+0.50-0.25x50 20/20','+0.75-0.25x30 20/60+ag','','15','15',NULL,NULL,NULL,'','','','normal','','','','','rx en uso od: +0.50-0.25x49\r\n                    oi : +075-0.25x10 \r\nprogresivo bl.','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-24 10:58:54','2022-05-24 10:58:54',10022,10022,'ACTIVO'),(31,31,'od vision borrosa  1 año \r\ngotas x3 ao ',NULL,NULL,NULL,NULL,NULL,'j16','j16','+3.00  j7','+3.00 j2','','20/80','20/100-1','+1.50-2.00 x 90  20/50-1+ag','+3.00-2.00 x 90 20/30+ag','dp 64','15','8',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-24 14:16:24','2022-05-24 14:16:24',10022,10022,'ACTIVO'),(32,32,'pestañas molestan oi, visión borrosa.\r\ngotas x3',NULL,NULL,NULL,NULL,NULL,'npl','pl','-','-','','npl','pl','neutro   nlp','neutro pl','dp 67','6','5',NULL,NULL,NULL,'od aphaquia, oi vascular de cornea','','','normal od ','','no. palido, macula ok','no detalles','','','aphaquia, ciego','herpes virus corneal','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-25 12:33:28','2022-05-25 12:33:28',10022,10022,'ACTIVO'),(33,33,'en la noche visión borrosa.',NULL,NULL,NULL,NULL,NULL,'j16','j16','+3.00  j1 dificil','  +3.00  j1 dificil','','20/30-1','20/30-1','neutro  20/30 +ag','neutro  20/30 + ag','dp 64 ','16','31',NULL,NULL,NULL,'nuclear catarata ao','','','lentos.','','ok','ok','','','nuclear catarata ao','meibomitis ao','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-25 12:28:25','2022-05-25 12:28:25',10022,10019,'ACTIVO'),(35,35,'ACUDE CON ECOGRAFIA',NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','ECOGRAFIA  SE REALIZA ECO MODO B EN OJO DERECHO ENCONTRANDOSE VITREITIS + BANDAS DE FIBROSIS EN REGION NASAL + DESPRENDIMIENTO DE RETINA INFERIOR ','DESPRENDIMIENTO DE RETINA OJO DERECHO ','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-27 09:13:55',NULL,10018,NULL,'ACTIVO'),(36,36,'EXAMANEN DE OCT CON ALTERACION DEL NO',NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','GLAUCOMA AVANZADO','','','','','',NULL,'','','','','','','','','','','','','','','','F0037_20220527_091637_OCTReport_N_001.jpg',NULL,NULL,NULL,NULL,0,'2022-05-27 09:48:48','2022-05-27 09:48:48',10022,10018,'ACTIVO'),(37,37,'operación de catarata es factible.\r\nPaciente post operada de catarata ambos ojos desde hace 1 año, no mejoria visual luego de cirugia',NULL,NULL,NULL,NULL,NULL,'j16','pl','-0.50*1.00x90   20/100','N pl','','20/150-1','pl','','','','16','21',NULL,NULL,NULL,'','','','od  normal ','','','exudados duros, emcs ','','dp   63','retinopatia diabetica','desprendimiento de retina cronico oi','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-27 10:51:24','2022-05-27 10:51:24',10022,10018,'ACTIVO'),(38,38,'PACIENTE DE  4 ANOS ACUDE POR MANIFESTAR PARPADEO DESDE HACE 5 DIAS NOTA Y DEFICT VISUAL PARA CERCA ',NULL,NULL,NULL,NULL,NULL,'J1','J1','','','','','','','','','','',NULL,NULL,NULL,'HIPERTROFIA FOLICULAR EN CONJUNTIVA DE  PARPADOS','','','','','','','','SE REALIZA REFRACCION CON DILATACION PUPILAR    \r\n DOY CORRECCION OD ESF+050 CIL _075 A 2  OI ESF+050 CIL _ 075 A 0','BLEFAROESPASMO','ASTIGMATISMO','MIOPIA','G245','H522','H521',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-27 10:59:25','2022-05-27 10:59:25',10015,10015,'ACTIVO'),(39,39,'visión borrosa ao , hace un mes lagrimeo excesivo.\r\nlagrimas artificales x2, dolor ocular al despertar.',NULL,NULL,NULL,NULL,NULL,'j16','j16','+3.00  j7','+3.00  j7','','20/70-1','20/80-1','+1.00   20/60 +ag','n -1.75 x 60 20/60 +ag','dp 68','','',NULL,NULL,NULL,'lagaña abundate en canto interno de ambos ojos ','','','','','','no dilatado paciente no viene acompañado','no dilatado paciente no viene acompañado','','conjuntivitis ao','catarata ao','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-27 11:11:54','2022-05-27 11:11:54',10022,10018,'ACTIVO');

/*Table structure for table `consultamedicadiag` */

DROP TABLE IF EXISTS `consultamedicadiag`;

CREATE TABLE `consultamedicadiag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `orbita` varchar(100) DEFAULT NULL,
  `globos` varchar(100) DEFAULT NULL,
  `lagrim` varchar(100) DEFAULT NULL,
  `escler` varchar(100) DEFAULT NULL,
  `conjunt` varchar(100) DEFAULT NULL,
  `limbo` varchar(100) DEFAULT NULL,
  `parpados` varchar(100) DEFAULT NULL,
  `camant` varchar(100) DEFAULT NULL,
  `iris` varchar(100) DEFAULT NULL,
  `cornea` varchar(100) DEFAULT NULL,
  `presion` varchar(100) DEFAULT NULL,
  `piocc` varchar(100) DEFAULT NULL,
  `reflpup` varchar(100) DEFAULT NULL,
  `cristal` varchar(100) DEFAULT NULL,
  `midria` varchar(100) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `metodo` varchar(100) DEFAULT NULL,
  `vitreo` varchar(100) DEFAULT NULL,
  `papila` varchar(100) DEFAULT NULL,
  `polpost` varchar(100) DEFAULT NULL,
  `macula` varchar(100) DEFAULT NULL,
  `ecuador` varchar(100) DEFAULT NULL,
  `vasos` varchar(100) DEFAULT NULL,
  `perif` varchar(100) DEFAULT NULL,
  `nervioopt` varchar(100) DEFAULT NULL,
  `observacion2` longblob,
  `visioncol` varchar(100) DEFAULT NULL,
  `esteriopsis` varchar(100) DEFAULT NULL,
  `ordenatencion` varchar(100) DEFAULT NULL,
  `yaglaser` varchar(100) DEFAULT NULL,
  `segantodp` varchar(100) DEFAULT NULL,
  `segantodd` varchar(100) DEFAULT NULL,
  `segantidp` varchar(100) DEFAULT NULL,
  `segantidd` varchar(100) DEFAULT NULL,
  `compliant` longblob,
  `segposodp` varchar(100) DEFAULT NULL,
  `segaposodd` varchar(100) DEFAULT NULL,
  `segposidp` varchar(100) DEFAULT NULL,
  `segposidd` varchar(100) DEFAULT NULL,
  `complipost` longblob,
  `laserrodt` varchar(100) DEFAULT NULL,
  `laserrodti` varchar(100) DEFAULT NULL,
  `laserrodn` varchar(100) DEFAULT NULL,
  `laserrodp` varchar(100) DEFAULT NULL,
  `laserroidt` varchar(100) DEFAULT NULL,
  `laserroiti` varchar(100) DEFAULT NULL,
  `laserroin` varchar(100) DEFAULT NULL,
  `laserroip` varchar(100) DEFAULT NULL,
  `plan` longblob,
  `med1` longblob,
  `presc1` longblob,
  `med2` longblob,
  `presc2` longblob,
  `med3` longblob,
  `presc3` longblob,
  `med4` longblob,
  `presc4` longblob,
  `med5` longblob,
  `presc5` longblob,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idconsulta`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `consultamedicadiag_ibfk_1` FOREIGN KEY (`idconsulta`) REFERENCES `consultamedica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedicadiag` */

insert  into `consultamedicadiag`(`id`,`idconsulta`,`orbita`,`globos`,`lagrim`,`escler`,`conjunt`,`limbo`,`parpados`,`camant`,`iris`,`cornea`,`presion`,`piocc`,`reflpup`,`cristal`,`midria`,`observacion`,`metodo`,`vitreo`,`papila`,`polpost`,`macula`,`ecuador`,`vasos`,`perif`,`nervioopt`,`observacion2`,`visioncol`,`esteriopsis`,`ordenatencion`,`yaglaser`,`segantodp`,`segantodd`,`segantidp`,`segantidd`,`compliant`,`segposodp`,`segaposodd`,`segposidp`,`segposidd`,`complipost`,`laserrodt`,`laserrodti`,`laserrodn`,`laserrodp`,`laserroidt`,`laserroiti`,`laserroin`,`laserroip`,`plan`,`med1`,`presc1`,`med2`,`presc2`,`med3`,`presc3`,`med4`,`presc4`,`med5`,`presc5`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hylo dual ','1 gota x3','ciprodex ung','10noc, c2 meses','','','','','','',0,'2022-05-11 10:02:01','2022-05-11 10:02:01',10019,10019,'ACTIVO'),(2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-11 10:48:53','2022-05-11 10:48:53',10019,10019,'ACTIVO'),(3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cristaltears','x6 ao','ciprodex ung','10 noches c2 meses . ao','','','','','','',0,'2022-05-11 12:35:03','2022-05-11 12:35:03',10019,10019,'ACTIVO'),(4,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hylo comod','6 ao','ciprodex','10noc c2 meses ao','zymaran','2, 10 dias oi','','','','',0,'2022-05-12 09:25:52','2022-05-11 13:15:42',10019,10019,'ACTIVO'),(5,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'systame ','1 gita ao x 1 semnanana','','','','','','','','',0,'2022-05-11 16:21:28',NULL,10015,NULL,'ACTIVO'),(6,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ciprodex','10 noches','hylo comod','4','','','','','','',0,'2022-05-18 10:27:16','2022-05-18 10:27:16',10019,10019,'ACTIVO'),(7,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-18 10:19:18','2022-05-18 10:19:18',10019,10019,'ACTIVO'),(8,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'olof ','1 6 meses','hylo dual ','4','ciprodex','10 noches, c2 meses','','','','',0,'2022-05-18 12:13:24',NULL,10019,NULL,'ACTIVO'),(9,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-18 12:29:10',NULL,10019,NULL,'ACTIVO'),(10,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brimof','2 ao','hylodual ','4','','','','','','',0,'2022-05-18 13:19:06','2022-05-18 13:19:06',10019,10019,'ACTIVO'),(11,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ciprodex','10 noches, c3 meses.','','','','','','','','',0,'2022-05-18 13:36:17','2022-05-18 13:36:17',10019,10019,'ACTIVO'),(12,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tobral d','9 dias oi, od 10 dias borde parpados','ibufen 600mg','2. 10 dias, ','','','','','','',0,'2022-05-18 14:14:09','2022-05-18 14:14:09',10019,10019,'ACTIVO'),(13,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SYSTANE','2 GOT C/8 EN AMBOS OJOS ','','','','','','','','',0,'2022-05-20 10:56:09','2022-05-20 10:56:09',10015,10015,'ACTIVO'),(14,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-20 11:21:18','2022-05-20 11:21:18',10018,10018,'ACTIVO'),(15,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-20 11:12:50','2022-05-20 11:12:50',10018,10018,'ACTIVO'),(16,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-20 11:28:24',NULL,10018,NULL,'ACTIVO'),(17,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-20 11:43:19','2022-05-20 11:43:19',10018,10018,'ACTIVO'),(18,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-20 12:25:08',NULL,10018,NULL,'ACTIVO'),(19,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-24 13:01:34','2022-05-24 13:01:34',10016,10016,'ACTIVO'),(22,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-24 13:08:15','2022-05-24 13:08:15',10016,10016,'ACTIVO'),(23,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-25 11:53:28',NULL,10019,NULL,'ACTIVO'),(24,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hylo comod','4','trazidex','10 noches c2 meses','','','','','','',0,'2022-05-25 12:28:25','2022-05-25 12:28:25',10019,10019,'ACTIVO'),(26,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','',0,'2022-05-27 09:13:55',NULL,10018,NULL,'ACTIVO'),(27,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'XEGREX CADA 12 HORAS EN AMBOS OJOS\r\nCONTROL 3 MESES','','','','','','','','','','',0,'2022-05-27 09:48:48','2022-05-27 09:48:48',10022,10018,'ACTIVO'),(28,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'panfoto ojo derecho\r\nlab ','','','','','','','','','','',0,'2022-05-27 10:51:24','2022-05-27 10:51:24',10018,10018,'ACTIVO'),(29,39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'poenbiotic 1 gota cada 4 horas en ambos ojos\r\ncita control para fondo de ojo ','','','','','','','','','','',0,'2022-05-27 11:11:54','2022-05-27 11:11:54',10018,10018,'ACTIVO');

/*Table structure for table `consultorio` */

DROP TABLE IF EXISTS `consultorio`;

CREATE TABLE `consultorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `idempresa` int(11) NOT NULL DEFAULT '1',
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `consultorio_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `consultorio` */

insert  into `consultorio`(`id`,`nombre`,`descripcion`,`idempresa`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`fechaact`,`usuarioact`,`estatus`) values (1,'INTERLAB','N consultorio',1,0,'2022-03-21 10:29:25',1,'2022-03-21 10:33:23',1,'ACTIVO'),(2,'prueba','prueba',1,1,'2022-03-21 10:59:50',1,NULL,NULL,'ACTIVO');

/*Table structure for table `contactenos` */

DROP TABLE IF EXISTS `contactenos`;

CREATE TABLE `contactenos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(300) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `agencia` varchar(200) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `telefonoc` varchar(9) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `requerimiento` longblob NOT NULL,
  `detalle` longblob,
  `descripcion` longblob,
  `peticion` longblob,
  `archivo` varchar(300) DEFAULT NULL,
  `verifyCode` varchar(50) NOT NULL,
  `documento` varchar(500) DEFAULT NULL,
  `acepto` int(1) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contactenos` */

/*Table structure for table `cuentas` */

DROP TABLE IF EXISTS `cuentas`;

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoant` varchar(80) NOT NULL,
  `parent` varchar(4) NOT NULL DEFAULT '0',
  `codigo` varchar(4) NOT NULL DEFAULT '01',
  `inputa` int(11) NOT NULL DEFAULT '0',
  `nombre` longblob,
  `descripcion` longblob,
  `numero` varchar(25) DEFAULT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cheque` varchar(15) NOT NULL DEFAULT '0',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioac` int(11) DEFAULT NULL,
  `fechaac` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentas` */

/*Table structure for table `cuentasparametros` */

DROP TABLE IF EXISTS `cuentasparametros`;

CREATE TABLE `cuentasparametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `idcuentacontable` int(11) NOT NULL,
  `cuentacontable` varchar(80) NOT NULL,
  `cuentaanticipo` varchar(80) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idcuentacontable` (`idcuentacontable`),
  CONSTRAINT `cuentasparametros_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasparametros` */

/*Table structure for table `cuentasporcobrar` */

DROP TABLE IF EXISTS `cuentasporcobrar`;

CREATE TABLE `cuentasporcobrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('D','C') NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `tipopago` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `abono` decimal(10,2) DEFAULT '0.00',
  `saldo` decimal(10,2) DEFAULT '0.00',
  `concepto` longblob,
  `formapago` int(11) DEFAULT NULL,
  `banco` int(11) DEFAULT NULL,
  `cheque` int(11) DEFAULT NULL,
  `fechacheque` date DEFAULT NULL,
  `tipocheque` int(11) DEFAULT NULL,
  `deposito` int(11) DEFAULT NULL,
  `movimientobanco` int(11) DEFAULT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `diario` longblob,
  `caja` int(11) DEFAULT NULL,
  `canal` int(11) DEFAULT NULL,
  `dias` int(11) NOT NULL DEFAULT '0',
  `numeroregistro` int(11) DEFAULT NULL,
  `basecero` decimal(10,2) DEFAULT '0.00',
  `baseiva` decimal(10,2) DEFAULT '0.00',
  `montoiva` decimal(10,2) DEFAULT '0.00',
  `valoriva` decimal(10,2) DEFAULT '0.00',
  `ivabienes` decimal(10,2) DEFAULT '0.00',
  `ivaservicios` decimal(10,2) DEFAULT '0.00',
  `comprobantefiscal` int(11) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `tidentificacion` int(11) DEFAULT NULL,
  `valorretenidoiva` decimal(10,2) DEFAULT '0.00',
  `valorretenidorenta` decimal(10,2) DEFAULT '0.00',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `ncomprobantefiscal` varchar(80) DEFAULT NULL,
  `nretencion` varchar(80) DEFAULT NULL,
  `cierrecartera` int(11) DEFAULT NULL,
  `cxcprotesto` int(11) DEFAULT NULL,
  `cxcprotestocar` int(11) DEFAULT NULL,
  `bcoprotestorev` int(11) DEFAULT NULL,
  `bcoprotestocar` int(11) DEFAULT NULL,
  `bcoprotestoori` int(11) DEFAULT NULL,
  `cxcprotestoori` int(11) DEFAULT NULL,
  `usuarioactiva` int(11) DEFAULT NULL,
  `fechaactiva` datetime DEFAULT NULL,
  `movimientocaja` int(11) DEFAULT NULL,
  `autorizacion` varchar(80) DEFAULT NULL,
  `validez` date DEFAULT NULL,
  `notacreditofis` varchar(50) DEFAULT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `origennotacredfis` int(11) DEFAULT NULL,
  `chequeestado` int(11) DEFAULT NULL,
  `depositolote` int(11) DEFAULT NULL,
  `usuarioapertura` int(11) DEFAULT NULL,
  `fechaapertura` datetime DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `autorizacioncfiscal` varchar(80) DEFAULT NULL,
  `usuariodeclara` int(11) DEFAULT NULL,
  `fechadeclara` datetime DEFAULT NULL,
  `anticipoestatus` int(11) DEFAULT NULL,
  `anticipovalor` decimal(10,2) DEFAULT '0.00',
  `anticiposaldo` decimal(10,2) DEFAULT '0.00',
  `anticipomov` int(11) DEFAULT NULL,
  `anticipofecha` date DEFAULT NULL,
  `anticipousu` int(11) DEFAULT NULL,
  `motivodev` int(11) DEFAULT NULL,
  `validacioncredara` int(11) DEFAULT NULL,
  `cierreventanum` int(11) DEFAULT NULL,
  `cierreventafec` date DEFAULT NULL,
  `cierreventausu` int(11) DEFAULT NULL,
  `aperturaventafec` date DEFAULT NULL,
  `aperturaventausu` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','ANULADO','IMPAGO','INACTIVO','PAGADO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporcobrar` */

/*Table structure for table `cuentasporcobrardep` */

DROP TABLE IF EXISTS `cuentasporcobrardep`;

CREATE TABLE `cuentasporcobrardep` (
  `id` int(11) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `movimientobanco` int(11) NOT NULL,
  `diario` varchar(50) NOT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `desdeefectivo` date DEFAULT NULL,
  `hastaefectivo` date DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `cuentasporcobrardep_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporcobrardep` */

/*Table structure for table `cuentasporcobrardepdet` */

DROP TABLE IF EXISTS `cuentasporcobrardepdet`;

CREATE TABLE `cuentasporcobrardepdet` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `movimiento` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `isDeleted` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `cuentasporcobrardepdet_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporcobrardepdet` */

/*Table structure for table `cuentasporcobrardet` */

DROP TABLE IF EXISTS `cuentasporcobrardet`;

CREATE TABLE `cuentasporcobrardet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `tipofactura` int(11) DEFAULT NULL,
  `numerofactura` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `fecha` date NOT NULL,
  `cheque` int(11) DEFAULT NULL,
  `base` decimal(10,2) NOT NULL DEFAULT '0.00',
  `porcentaje` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valorretenido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `referencia` int(11) DEFAULT NULL,
  `canal` int(4) DEFAULT NULL,
  `baseiva` decimal(10,2) DEFAULT NULL,
  `porcentajeiva1` decimal(10,2) DEFAULT NULL,
  `valorretenido1` decimal(10,2) DEFAULT NULL,
  `porcentajeiva2` decimal(10,2) DEFAULT NULL,
  `valorretenido2` decimal(10,2) DEFAULT NULL,
  `porcentajeiva3` decimal(10,2) DEFAULT NULL,
  `valorretenido3` decimal(10,2) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(1) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporcobrardet` */

/*Table structure for table `cuentasporpagar` */

DROP TABLE IF EXISTS `cuentasporpagar`;

CREATE TABLE `cuentasporpagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('D','C') NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idfactura` int(11) NOT NULL,
  `referencia` varchar(80) DEFAULT NULL,
  `tipopago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `vencimiento` date DEFAULT NULL,
  `dias` int(2) NOT NULL DEFAULT '0',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `abono` decimal(10,2) NOT NULL DEFAULT '0.00',
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `concepto` longblob,
  `formapago` int(11) NOT NULL,
  `banco` int(11) DEFAULT NULL,
  `cuenta` longblob,
  `cheque` longblob,
  `fechacheque` date DEFAULT NULL,
  `tipocheque` int(11) DEFAULT NULL,
  `diario` longblob,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `tipocomprobante` int(11) DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `movimientobanco` int(11) NOT NULL DEFAULT '0',
  `movimientocaja` int(11) DEFAULT NULL,
  `valoriva` decimal(10,2) DEFAULT NULL,
  `ivagravado` decimal(10,2) DEFAULT NULL,
  `ivacero` decimal(10,2) DEFAULT NULL,
  `ivaice` decimal(10,2) DEFAULT NULL,
  `ivapor` decimal(10,2) DEFAULT NULL,
  `consolidarguia` int(11) DEFAULT NULL,
  `exportararchivo` int(11) DEFAULT NULL,
  `exportarfecha` int(11) DEFAULT NULL,
  `exportarusuario` int(11) DEFAULT NULL,
  `facturacanal` int(11) DEFAULT NULL,
  `facturanumero` int(11) DEFAULT NULL,
  `autorizacion` varchar(80) DEFAULT NULL,
  `validez` date DEFAULT NULL,
  `totalotros` int(11) DEFAULT NULL,
  `tipocompra` int(11) DEFAULT NULL,
  `origencompra` int(11) DEFAULT NULL,
  `totaldescuento` decimal(10,2) DEFAULT NULL,
  `origencompraban` int(11) DEFAULT NULL,
  `origencompracaj` int(11) DEFAULT NULL,
  `entradatestatus` int(11) DEFAULT NULL,
  `entradatmov` int(11) DEFAULT NULL,
  `sustentotrib` int(11) DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `saldoinicial` decimal(10,2) DEFAULT NULL,
  `otrosrubrosrmov` int(11) DEFAULT NULL,
  `usuariodeclara` int(11) DEFAULT NULL,
  `fechadeclara` datetime DEFAULT NULL,
  `numerodeclara` int(11) DEFAULT NULL,
  `anticipoestatus` int(11) DEFAULT NULL,
  `anticipovalor` decimal(10,2) DEFAULT NULL,
  `anticiposaldo` decimal(10,2) DEFAULT NULL,
  `anticipomov` int(11) DEFAULT NULL,
  `anticipofecha` datetime DEFAULT NULL,
  `anticipousuario` int(11) DEFAULT NULL,
  `cierreventanum` int(11) DEFAULT NULL,
  `cierreventafecha` datetime DEFAULT NULL,
  `comprobanteeling` int(11) DEFAULT NULL,
  `comprobanteelusu` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('IMPAGO','PAGADO','ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idfactura` (`idfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporpagar` */

/*Table structure for table `cuentasporpagardet` */

DROP TABLE IF EXISTS `cuentasporpagardet`;

CREATE TABLE `cuentasporpagardet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `tipofactura` int(11) NOT NULL,
  `numerofactura` int(11) NOT NULL,
  `valor` decimal(10,3) NOT NULL,
  `cheque` int(11) DEFAULT NULL,
  `base` decimal(10,3) NOT NULL,
  `porcentaje` decimal(10,3) NOT NULL,
  `valorretenido` decimal(10,3) NOT NULL,
  `referencia` varchar(17) CHARACTER SET latin1 DEFAULT NULL,
  `baseiva` decimal(10,3) DEFAULT NULL,
  `poriva1` decimal(10,3) DEFAULT NULL,
  `valretenidoiva1` decimal(10,3) DEFAULT NULL,
  `poriva2` decimal(10,3) DEFAULT NULL,
  `valretenidoiva2` decimal(10,3) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `cuentasporpagardet_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentasporpagardet` */

/*Table structure for table `cuentastipo` */

DROP TABLE IF EXISTS `cuentastipo`;

CREATE TABLE `cuentastipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `cuentastipo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cuentastipo` */

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `departamentos` */

/*Table structure for table `diagnostico` */

DROP TABLE IF EXISTS `diagnostico`;

CREATE TABLE `diagnostico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `historiaclinica` bigint(20) NOT NULL,
  `idenfermedad` bigint(20) NOT NULL,
  `observacion` longblob NOT NULL,
  `fechac` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechau` datetime DEFAULT NULL,
  `usuarioc` int(11) NOT NULL,
  `usuariou` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diagnostico` */

/*Table structure for table `diagnosticomedico` */

DROP TABLE IF EXISTS `diagnosticomedico`;

CREATE TABLE `diagnosticomedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `dxprincipal` varchar(120) DEFAULT NULL,
  `cronico` varchar(120) DEFAULT NULL,
  `consult` varchar(120) DEFAULT NULL,
  `optomt` varchar(120) DEFAULT NULL,
  `prcqrg` varchar(120) DEFAULT NULL,
  `cirugia` longblob,
  `postoperatorio` longblob,
  `plan` varchar(120) DEFAULT NULL,
  `sintesis` longblob,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idconsulta`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diagnosticomedico` */

/*Table structure for table `diario` */

DROP TABLE IF EXISTS `diario`;

CREATE TABLE `diario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diario` int(11) NOT NULL,
  `anio` year(4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `concepto` longblob,
  `total` decimal(10,3) DEFAULT '0.000',
  `auxiliar` int(11) NOT NULL,
  `tipoaux` varchar(10) NOT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioactiva` int(11) DEFAULT NULL,
  `fechaactiva` datetime DEFAULT NULL,
  `anticipoctaxp` int(11) DEFAULT NULL,
  `anticipoctaxc` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diario` */

/*Table structure for table `diariodetalle` */

DROP TABLE IF EXISTS `diariodetalle`;

CREATE TABLE `diariodetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diario` int(11) NOT NULL,
  `anio` year(4) NOT NULL,
  `item` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` longblob,
  `cuenta` varchar(80) DEFAULT NULL,
  `cuenta_padre` varchar(80) DEFAULT NULL,
  `valor` decimal(10,3) NOT NULL DEFAULT '0.000',
  `debito` int(1) NOT NULL DEFAULT '0',
  `tipodiario` int(11) DEFAULT NULL,
  `auxiliar` int(11) DEFAULT NULL,
  `tipoauxiliar` varchar(10) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `diariodetalle_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `diariodetalle` */

/*Table structure for table `doctores` */

DROP TABLE IF EXISTS `doctores`;

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` longblob NOT NULL,
  `apellidos` longblob NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `direccion` longblob,
  `telefono` varchar(40) DEFAULT NULL,
  `correo` longblob NOT NULL,
  `fechanac` date DEFAULT NULL,
  `tiposangre` varchar(2) DEFAULT NULL,
  `idprofesion` int(11) NOT NULL DEFAULT '1',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `idususistem` int(11) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuarioc` (`usuariocreacion`),
  KEY `idprofesion` (`idprofesion`),
  CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `doctores_ibfk_2` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `doctores` */

insert  into `doctores`(`id`,`nombres`,`apellidos`,`cedula`,`direccion`,`telefono`,`correo`,`fechanac`,`tiposangre`,`idprofesion`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`idususistem`,`estatus`) values (1,'ROYLE','COLCHA','0918564684','BRISAS DEL RIO','023546546','eldoc@gmail.com','1986-09-09','o+',137,0,'2022-03-14 17:38:36',NULL,1,NULL,0,'ACTIVO'),(2,'Jacqueline','Inca','1303078933','Urbanor',NULL,'marioaguilar1990@gmail.com','1993-03-31','o+',130,0,'2022-03-22 11:40:38','2022-03-22 11:40:38',1,1,0,'ACTIVO'),(3,'Mario','Aguilar','1303078932','Urbanor',NULL,'mariofaguilarg@gmail.com','1990-09-09','O+',83,0,'2022-05-25 16:07:22',NULL,1,NULL,1,'ACTIVO'),(4,'Nelson','Matamoros Sotomayor','0700971724','',NULL,'info@iom.com',NULL,'',64,0,'2022-04-21 17:07:00',NULL,10014,NULL,10013,'ACTIVO'),(5,'Roberto','Matamoros Sanchez','0901052876','',NULL,'info@iom.com',NULL,'',64,0,'2022-04-21 17:07:02',NULL,10014,NULL,10020,'ACTIVO'),(6,'Vanessa','Tomalá Calle','0915617187','',NULL,'vanessatomalac23@gmail.com',NULL,'',146,0,'2022-04-21 17:06:25',NULL,10014,NULL,10022,'ACTIVO'),(7,'Ana María','Luna Rodriguez','0905236485','Bello Horizonte',NULL,'anamaluro@yahoo.es','1966-11-24','',64,0,'2022-05-04 10:08:28',NULL,10014,NULL,10015,'ACTIVO'),(8,'Daniela','Rodríguez Mesias','0918256682','ksjkjahsjgasy',NULL,'kasajhasjh@hotmail.com','1980-05-06','',64,0,'2022-05-04 10:08:29',NULL,10014,NULL,10018,'ACTIVO'),(9,'GLADYS','ZUÑIGA ','1706091483','CHIMBORAZO 3402',NULL,'gladyszu@yahoo.com','1962-10-07','o+',143,0,'2022-05-04 10:07:15',NULL,10021,NULL,10019,'ACTIVO'),(10,'Andres','Suarez Trujillo','0920461118','kjahsdjghcv',NULL,'kljskhsd@hotmail.com',NULL,'',64,0,'2022-05-24 09:54:57',NULL,10014,NULL,10016,'ACTIVO'),(11,'Optorec','Opt','1233342345','-',NULL,'fweewef@gmail.com',NULL,NULL,146,0,'2022-05-25 16:06:43',NULL,10024,NULL,10024,'ACTIVO');

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idbiometrico` int(11) NOT NULL DEFAULT '0',
  `cedula` varchar(15) DEFAULT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  `direccion` text,
  `telefono` varchar(20) DEFAULT NULL,
  `tiposangre` varchar(4) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `contactoemer` varchar(150) DEFAULT NULL,
  `telefonoemer` varchar(20) DEFAULT NULL,
  `iddepartamento` int(11) NOT NULL DEFAULT '1',
  `fechasalida` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `iddepartamento` (`iddepartamento`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `empleados` */

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `ruc` varchar(13) NOT NULL,
  `ambiente` int(1) NOT NULL DEFAULT '1',
  `serie` varchar(7) NOT NULL DEFAULT '001-001',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`ruc`),
  KEY `id` (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `empresa` */

/*Table structure for table `enfermedades` */

DROP TABLE IF EXISTS `enfermedades`;

CREATE TABLE `enfermedades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(300) NOT NULL,
  `descripcion` longblob NOT NULL,
  `simbolo` varchar(20) DEFAULT NULL,
  `sexo` enum('A','M','H') NOT NULL DEFAULT 'A',
  `edadmin` int(11) DEFAULT NULL,
  `edadmax` int(11) DEFAULT NULL,
  `noafecciones` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `enfermedades_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12423 DEFAULT CHARSET=utf8;

/*Data for the table `enfermedades` */


/*Table structure for table `entregas` */

DROP TABLE IF EXISTS `entregas`;

CREATE TABLE `entregas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nfactura` varchar(40) DEFAULT NULL,
  `canal` int(11) DEFAULT NULL,
  `tipomov` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `bultos` int(11) NOT NULL DEFAULT '0',
  `notas` longblob,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `fechaintraslado` date DEFAULT NULL,
  `fechafintraslado` date DEFAULT NULL,
  `puntopartida` longblob,
  `puntollegada` longblob,
  `transporte` int(11) DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  `guiaremision` varchar(80) DEFAULT NULL,
  `jefebodega` int(11) DEFAULT NULL,
  `usuarioactiva` int(11) DEFAULT NULL,
  `fechaactiva` datetime DEFAULT NULL,
  `tipodoc` int(11) DEFAULT NULL,
  `destinatario` int(11) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  `otros` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `entregas` */

/*Table structure for table `estadocheque` */

DROP TABLE IF EXISTS `estadocheque`;

CREATE TABLE `estadocheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `depositar` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `estadocheque_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `estadocheque` */

/*Table structure for table `estadocivil` */

DROP TABLE IF EXISTS `estadocivil`;

CREATE TABLE `estadocivil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `estadocivil` */

insert  into `estadocivil`(`id`,`nombre`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`fechamod`,`estatus`) values (1,'SOLTERO',0,1,'2022-03-21 09:49:36',NULL,'ACTIVO'),(2,'CASADO',0,1,'2022-03-21 09:49:42',NULL,'ACTIVO');

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nfactura` int(11) NOT NULL,
  `canal` int(11) DEFAULT NULL,
  `tipomov` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipoprecio` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `diasplazo` int(11) DEFAULT NULL,
  `firma` varchar(80) DEFAULT NULL,
  `condiciones` longblob,
  `entrega` int(11) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `tipopago` int(11) DEFAULT '1',
  `cancela` varchar(50) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT '0.00',
  `iva` decimal(10,2) DEFAULT '0.12',
  `transporte` int(11) DEFAULT NULL,
  `referencia` longblob,
  `vencimiento` date DEFAULT NULL,
  `notas` longblob,
  `vendedor` int(11) DEFAULT NULL,
  `bodegaorigen` int(11) DEFAULT NULL,
  `bodegadestino` int(11) DEFAULT NULL,
  `cartera` varchar(50) DEFAULT NULL,
  `autorizacion` varchar(50) DEFAULT NULL,
  `validez` date DEFAULT NULL,
  `retencion` int(11) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `codigotransporte` int(11) DEFAULT NULL,
  `decuentoglobal` decimal(10,3) DEFAULT '0.000',
  `diario` varchar(80) DEFAULT NULL,
  `cuotas` int(11) NOT NULL DEFAULT '1',
  `notascredito` int(11) DEFAULT NULL,
  `ivavalor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `totalivagravado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `totalivaice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `motivosan` int(11) NOT NULL DEFAULT '0',
  `asignardetalles` int(11) DEFAULT NULL,
  `notasalpie` int(11) DEFAULT NULL,
  `motivoanul` int(11) DEFAULT NULL,
  `movimientoctaxp` int(11) DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `autorizacionfac` int(11) DEFAULT NULL,
  `autorizacionusu` int(11) DEFAULT NULL,
  `declarausu` int(11) DEFAULT NULL,
  `fechadeclaracion` datetime DEFAULT NULL,
  `guiaremision` int(11) DEFAULT NULL,
  `usuarioguia` int(11) DEFAULT NULL,
  `fechaguiarem` date DEFAULT NULL,
  `numeroentrega` int(11) DEFAULT NULL,
  `usuarioimp` int(11) DEFAULT NULL,
  `fechaimpresion` datetime DEFAULT NULL,
  `tipodescuento` int(11) NOT NULL DEFAULT '1',
  `proforma` int(11) NOT NULL DEFAULT '0',
  `tipodoc` int(11) NOT NULL DEFAULT '1',
  `nombres` varchar(350) DEFAULT NULL,
  `ruc` varchar(13) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `facturae` enum('PENDIENTE','GENERADA','ERROR','CANCELADA') NOT NULL DEFAULT 'PENDIENTE',
  `estatus` enum('ACTIVO','INACTIVO','ACTIVA') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `nfactura` (`nfactura`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `tipo` (`tipodoc`),
  KEY `tipopago` (`tipopago`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`tipodoc`) REFERENCES `tipodocumento` (`id`),
  CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`tipopago`) REFERENCES `formaspago` (`id`),
  CONSTRAINT `factura_ibfk_6` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `factura_ibfk_7` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `factura` */

/*Table structure for table `facturadetalle` */

DROP TABLE IF EXISTS `facturadetalle`;

CREATE TABLE `facturadetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) NOT NULL,
  `tipomov` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `canal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `narticulo` varchar(350) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `valoru` decimal(10,2) NOT NULL,
  `costo` decimal(10,3) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) NOT NULL,
  `bodegaorigen` int(11) NOT NULL DEFAULT '1',
  `bodegadestino` int(11) DEFAULT '1',
  `liquidacion` decimal(10,2) DEFAULT NULL,
  `valorparcial` decimal(10,2) DEFAULT NULL,
  `civa` decimal(10,2) NOT NULL DEFAULT '12.00',
  `valordes` decimal(10,2) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observaciones` longblob,
  `coeficiente` int(11) DEFAULT '0',
  `cantidadadic` decimal(10,2) DEFAULT NULL,
  `unidadadic` decimal(10,2) DEFAULT NULL,
  `valorunadic` decimal(10,2) DEFAULT NULL,
  `rangodesde` decimal(10,2) DEFAULT NULL,
  `rangohasta` decimal(10,2) DEFAULT NULL,
  `unibultoadic` int(11) DEFAULT NULL,
  `imagen` varchar(350) NOT NULL DEFAULT '''default.png''',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idarticulo` (`item`),
  KEY `idfactura` (`idfactura`),
  CONSTRAINT `facturadetalle_ibfk_2` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`nfactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `facturadetalle` */

/*Table structure for table `formapagoanticipado` */

DROP TABLE IF EXISTS `formapagoanticipado`;

CREATE TABLE `formapagoanticipado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `anticipo` int(11) NOT NULL DEFAULT '0',
  `prestamos` int(11) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `formapagoanticipado_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formapagoanticipado` */

/*Table structure for table `formapagobanco` */

DROP TABLE IF EXISTS `formapagobanco`;

CREATE TABLE `formapagobanco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `comprobanteeti` longblob,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `formapagobanco_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formapagobanco` */

/*Table structure for table `formapagocaja` */

DROP TABLE IF EXISTS `formapagocaja`;

CREATE TABLE `formapagocaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formapagocaja` */

/*Table structure for table `formapagocuentas` */

DROP TABLE IF EXISTS `formapagocuentas`;

CREATE TABLE `formapagocuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `cuentapc` varchar(50) NOT NULL DEFAULT '0',
  `cuentapp` varchar(50) NOT NULL DEFAULT '0',
  `sufijo` varchar(10) NOT NULL DEFAULT 'NNN',
  `formapagoats` int(11) NOT NULL DEFAULT '0',
  `anticipocpp` int(11) NOT NULL DEFAULT '0',
  `anticipocpc` int(11) NOT NULL DEFAULT '0',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `formapagocuentas_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formapagocuentas` */

/*Table structure for table `formaspago` */

DROP TABLE IF EXISTS `formaspago`;

CREATE TABLE `formaspago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `formaspago_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formaspago` */

/*Table structure for table `formatopagoats` */

DROP TABLE IF EXISTS `formatopagoats`;

CREATE TABLE `formatopagoats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) NOT NULL,
  `descripcion` longblob NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `formatopagoats_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `formatopagoats` */

/*Table structure for table `galeria` */

DROP TABLE IF EXISTS `galeria`;

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `galeria` */

/*Table structure for table `gestioncatering` */

DROP TABLE IF EXISTS `gestioncatering`;

CREATE TABLE `gestioncatering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idhorarioc` int(11) NOT NULL,
  `idmarcacion` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idmarcacion` (`idmarcacion`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idhorarioc` (`idhorarioc`),
  KEY `iduser` (`iduser`),
  CONSTRAINT `gestioncatering_ibfk_1` FOREIGN KEY (`idmarcacion`) REFERENCES `marcaciones` (`id`),
  CONSTRAINT `gestioncatering_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `gestioncatering_ibfk_3` FOREIGN KEY (`idhorarioc`) REFERENCES `horariocomidas` (`id`),
  CONSTRAINT `gestioncatering_ibfk_4` FOREIGN KEY (`iduser`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gestioncatering` */

/*Table structure for table `historiaclinica` */

DROP TABLE IF EXISTS `historiaclinica`;

CREATE TABLE `historiaclinica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioc` int(11) NOT NULL,
  `usuariou` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `historiaclinica_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `historiaclinica` */

/*Table structure for table `historialatencion` */

DROP TABLE IF EXISTS `historialatencion`;

CREATE TABLE `historialatencion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `historiaclinica` bigint(20) NOT NULL,
  `idenfermedad` bigint(20) NOT NULL,
  `fechacita` date NOT NULL,
  `horacita` time NOT NULL,
  `fechac` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechau` datetime NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `historiaclinica` (`historiaclinica`),
  CONSTRAINT `historialatencion_ibfk_1` FOREIGN KEY (`historiaclinica`) REFERENCES `historiaclinica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `historialatencion` */

/*Table structure for table `horariocomidas` */

DROP TABLE IF EXISTS `horariocomidas`;

CREATE TABLE `horariocomidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `horariocomidas_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `horariocomidas` */

/*Table structure for table `impresion` */

DROP TABLE IF EXISTS `impresion`;

CREATE TABLE `impresion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cabecera` longblob,
  `titulo1` longblob,
  `titulo2` longblob,
  `mensaje1` longblob,
  `mensaje2` longblob,
  `piepagina1` longblob,
  `piepagina2` longblob,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `impresion` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `tipomov` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `diasplazo` int(11) NOT NULL DEFAULT '0',
  `atentamente` varchar(50) DEFAULT NULL,
  `condiciones` varchar(50) DEFAULT NULL,
  `entrega` varchar(50) DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `cancela` int(1) DEFAULT NULL,
  `descuentototal` decimal(10,2) DEFAULT '0.00',
  `ivatotal` decimal(10,2) DEFAULT '0.00',
  `transporte` int(11) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `vencimiento` datetime DEFAULT NULL,
  `notas` longblob,
  `idproveedor` int(11) DEFAULT NULL,
  `bodegaorigen` int(11) DEFAULT NULL,
  `bodegadestino` int(11) DEFAULT NULL,
  `autorizacion` varchar(80) DEFAULT NULL,
  `validez` date DEFAULT NULL,
  `retencion` varchar(25) DEFAULT NULL,
  `comprobante` varchar(25) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `codigotransporte` int(11) DEFAULT NULL,
  `descuentoglobal` int(11) DEFAULT NULL,
  `diario` varchar(50) DEFAULT NULL,
  `cuotas` int(11) DEFAULT NULL,
  `notascredito` int(11) DEFAULT NULL,
  `valoriva` decimal(10,2) DEFAULT NULL,
  `totaliva` decimal(10,2) DEFAULT NULL,
  `totalivaice` decimal(10,2) DEFAULT NULL,
  `tipocomprobante` int(11) DEFAULT NULL,
  `ordenprod` int(11) DEFAULT NULL,
  `ordenprodcierre` int(11) DEFAULT NULL,
  `tipocompra` int(11) DEFAULT NULL,
  `movtaxpagarenttrans` int(11) DEFAULT NULL,
  `sustentotribut` int(11) DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `usuariodec` int(11) DEFAULT NULL,
  `fechadec` datetime DEFAULT NULL,
  `numerodeclara` int(11) DEFAULT NULL,
  `idcolor` int(11) NOT NULL,
  `idcalidad` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idclasificacion` int(11) NOT NULL,
  `codigobarras` varchar(60) DEFAULT NULL,
  `codigocaja` varchar(60) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idcolor` (`idcolor`),
  KEY `idcalidad` (`idcalidad`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idclasificacion` (`idclasificacion`),
  CONSTRAINT `inventario_ibfk_3` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `inventario_ibfk_4` FOREIGN KEY (`idcolor`) REFERENCES `color` (`id`),
  CONSTRAINT `inventario_ibfk_5` FOREIGN KEY (`idcalidad`) REFERENCES `calidad` (`id`),
  CONSTRAINT `inventario_ibfk_6` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`),
  CONSTRAINT `inventario_ibfk_7` FOREIGN KEY (`idclasificacion`) REFERENCES `clasificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventario` */

/*Table structure for table `inventario_bck` */

DROP TABLE IF EXISTS `inventario_bck`;

CREATE TABLE `inventario_bck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL,
  `idpresentacion` int(11) NOT NULL DEFAULT '1',
  `cantidadini` int(11) NOT NULL,
  `cantidadcaja` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `precioint` decimal(10,2) NOT NULL DEFAULT '0.00',
  `preciov1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `preciov2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `preciovp` decimal(10,2) NOT NULL DEFAULT '0.00',
  `codigobarras` varchar(60) NOT NULL,
  `codigocaja` varchar(60) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idproducto` (`idproducto`),
  KEY `idpresentacion` (`idpresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=2041 DEFAULT CHARSET=utf8;

/*Data for the table `inventario_bck` */


/*Table structure for table `inventariodetalle` */

DROP TABLE IF EXISTS `inventariodetalle`;

CREATE TABLE `inventariodetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `tipomovimiento` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `articulo` varchar(50) DEFAULT NULL,
  `cantidad` decimal(10,3) DEFAULT NULL,
  `valorunitario` decimal(10,3) DEFAULT NULL,
  `costo` decimal(10,3) DEFAULT NULL,
  `descuento` decimal(10,3) DEFAULT NULL,
  `ivalinea` decimal(10,3) DEFAULT NULL,
  `bodegaorigen` int(11) DEFAULT NULL,
  `bodegadestino` int(11) DEFAULT NULL,
  `liquidacion` int(11) DEFAULT NULL,
  `valorparcial` decimal(10,3) DEFAULT NULL,
  `valoriva` decimal(10,3) DEFAULT NULL,
  `valordescuento` decimal(10,3) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidadad` int(11) DEFAULT NULL,
  `unidadad` int(11) DEFAULT NULL,
  `valorunitad` decimal(10,3) DEFAULT NULL,
  `valorparcialad` decimal(10,3) DEFAULT NULL,
  `costounitarioad` decimal(10,3) DEFAULT NULL,
  `valordescad` decimal(10,3) DEFAULT NULL,
  `ivavaladic` decimal(10,3) DEFAULT NULL,
  `rangodesdead` decimal(10,3) DEFAULT NULL,
  `rangohastaad` decimal(10,3) DEFAULT NULL,
  `rangodefadic` decimal(10,3) DEFAULT NULL,
  `rangoivagrabado` decimal(10,3) DEFAULT NULL,
  `rangosubivacero` decimal(10,3) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventariodetalle` */

/*Table structure for table `itemproduccion` */

DROP TABLE IF EXISTS `itemproduccion`;

CREATE TABLE `itemproduccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `rubro` int(11) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuarioingreso` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuarioingreso` (`usuarioingreso`),
  CONSTRAINT `itemproduccion_ibfk_1` FOREIGN KEY (`usuarioingreso`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `itemproduccion` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` longblob NOT NULL,
  `descripcion` longblob NOT NULL,
  `observacion` longblob NOT NULL,
  `codigo` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `id` (`id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`modulo`,`descripcion`,`observacion`,`codigo`,`usuariocreacion`,`fechacreacion`,`estatus`) values (26,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:21:32','ACTIVO'),(27,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:22:06','ACTIVO'),(28,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:29:56','ACTIVO'),(29,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:30:02','ACTIVO'),(30,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:30:13','ACTIVO'),(31,'DOCTORES ','{\"cedula\":[\"Cedula cannot be blank.\"],\"correo\":[\"Correo cannot be blank.\"]}','ID: ','0',10014,'2022-04-29 09:31:50','ACTIVO'),(32,'DOCTORES ','{\"cedula\":[\"Cedula cannot be blank.\"]}','ID: ','0',10014,'2022-04-29 09:35:20','ACTIVO'),(33,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:44:12','ACTIVO'),(34,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:47:07','ACTIVO'),(35,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:47:16','ACTIVO'),(36,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:50:30','ACTIVO'),(37,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:59:28','ACTIVO'),(38,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 10:06:04','ACTIVO'),(39,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 14:58:10','ACTIVO'),(40,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:06','ACTIVO'),(41,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:11','ACTIVO'),(42,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:29','ACTIVO'),(43,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:16:07','ACTIVO'),(44,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10021,'2022-05-04 10:10:53','ACTIVO'),(45,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10021,'2022-05-04 10:10:59','ACTIVO'),(46,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10015,'2022-05-05 10:25:06','ACTIVO'),(47,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10015,'2022-05-05 10:34:39','ACTIVO'),(48,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 09:54:21','ACTIVO'),(49,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 10:33:11','ACTIVO'),(50,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 10:47:04','ACTIVO'),(51,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:45:22','ACTIVO'),(52,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:45:28','ACTIVO'),(53,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:46:05','ACTIVO'),(54,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:46:19','ACTIVO'),(55,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:48:53','ACTIVO'),(56,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 11:47:21','ACTIVO'),(57,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 12:35:03','ACTIVO'),(58,'USUARIO ','{\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 10:19:18','ACTIVO'),(59,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 12:55:27','ACTIVO'),(60,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 12:56:15','ACTIVO'),(61,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 13:18:30','ACTIVO'),(62,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 13:19:06','ACTIVO'),(63,'USUARIO ','{\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"agujeroest\":[\"Agujeroest should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-20 11:28:24','ACTIVO'),(64,'USUARIO ','{\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10018,'2022-05-20 11:41:18','ACTIVO'),(65,'USUARIO ','{\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10018,'2022-05-20 11:43:19','ACTIVO'),(66,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-20 12:25:08','ACTIVO'),(67,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"impdiag2\":[\"Impdiag2 should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:42:50','ACTIVO'),(68,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"impdiag2\":[\"Impdiag2 should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:42:51','ACTIVO'),(69,'USUARIO ','{\"impdiag2\":[\"Impdiag2 should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:45:23','ACTIVO'),(70,'USUARIO ','{\"impdiag2\":[\"Impdiag2 should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:45:34','ACTIVO'),(71,'USUARIO ','{\"impdiag2\":[\"Impdiag2 should contain at most 30 characters.\"],\"impdiag3\":[\"Impdiag3 should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:45:38','ACTIVO'),(72,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:48:31','ACTIVO'),(73,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:49:55','ACTIVO'),(74,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 10:50:40','ACTIVO'),(75,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:19:23','ACTIVO'),(76,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:19:33','ACTIVO'),(77,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:20:08','ACTIVO'),(78,'USUARIO ','{\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:21:55','ACTIVO'),(79,'USUARIO ','{\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:28:05','ACTIVO'),(80,'USUARIO ','{\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:28:25','ACTIVO'),(81,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:30:10','ACTIVO'),(82,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10016,'2022-05-24 12:50:15','ACTIVO'),(83,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:09','ACTIVO'),(84,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:11','ACTIVO'),(85,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:13','ACTIVO'),(86,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:13','ACTIVO'),(87,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:14','ACTIVO'),(88,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:14','ACTIVO'),(89,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:14','ACTIVO'),(90,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:14','ACTIVO'),(91,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:14','ACTIVO'),(92,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:15','ACTIVO'),(93,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10022,'2022-05-24 13:04:47','ACTIVO'),(94,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 13:07:45','ACTIVO'),(95,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 13:07:53','ACTIVO'),(96,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"],\"biomicroscopia\":[\"Biomicroscopia should contain at most 50 characters.\"]}','ID: 0','0',10016,'2022-05-24 13:08:15','ACTIVO'),(97,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:27:32','ACTIVO'),(98,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:28:36','ACTIVO'),(99,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:30:32','ACTIVO'),(100,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:32:19','ACTIVO'),(101,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:34:25','ACTIVO'),(102,'CITAS','{\"iddoctor\":[\"Iddoctor is invalid.\"]}','ID: 0','0',1,'2022-05-25 16:34:54','ACTIVO');

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `marca` */

/*Table structure for table `marcaciones` */

DROP TABLE IF EXISTS `marcaciones`;

CREATE TABLE `marcaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `sucursal` int(1) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `iduser` (`iduser`),
  CONSTRAINT `marcaciones_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `marcaciones_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `marcaciones` */

/*Table structure for table `mensajes` */

DROP TABLE IF EXISTS `mensajes`;

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarionot` int(11) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('LEIDO','NO LEIDO','NUEVO','NOTIFICADO','ELIMINADO','BORRADOR') NOT NULL DEFAULT 'NUEVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `usuarionot` (`usuarionot`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`usuarionot`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `mensajes` */

insert  into `mensajes`(`id`,`mensaje`,`usuariocreacion`,`usuarionot`,`isDeleted`,`fechacreacion`,`estatus`) values (2,'Notificación de prueba',1,21,0,'2022-01-18 10:14:21','NUEVO'),(3,'Corrección de datos en el sistema contable',1,21,0,'2022-01-18 21:00:24','NUEVO');

/*Table structure for table `menu_admin` */

DROP TABLE IF EXISTS `menu_admin`;

CREATE TABLE `menu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idparent` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `icono` varchar(80) NOT NULL,
  `link` varchar(400) NOT NULL,
  `usuarioc` varchar(36) NOT NULL,
  `usuariom` varchar(36) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '1',
  `tipo` enum('WEB','APP') NOT NULL DEFAULT 'WEB',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  PRIMARY KEY (`idparent`,`nombre`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `menu_admin` */

insert  into `menu_admin`(`id`,`idparent`,`nombre`,`icono`,`link`,`usuarioc`,`usuariom`,`fechacreacion`,`fechamod`,`orden`,`tipo`,`estatus`) values (10,0,'App','mobile','#','1',NULL,'2020-04-10 22:42:00',NULL,1,'APP','ACTIVO'),(42,0,'Citas Médicas','address-book','#','1',NULL,'2020-04-10 22:45:50',NULL,5,'WEB','ACTIVO'),(5,0,'Configuración','tasks','#','1',NULL,'2020-04-10 22:42:00',NULL,12,'WEB','ACTIVO'),(1,0,'Escritorio','file-code-o','#','1',NULL,'2020-04-10 22:42:00',NULL,1,'WEB','ACTIVO'),(9,0,'Facturación','bookmark','#','1',NULL,'2020-04-10 22:43:46',NULL,7,'WEB','ACTIVO'),(2,0,'Inventario','list-ol','#','1',NULL,'2020-04-10 22:44:08',NULL,6,'WEB','ACTIVO'),(13,0,'Mi perfil','user','#','1',NULL,'2020-04-10 22:42:01',NULL,2,'WEB','ACTIVO'),(41,0,'Pacientes','address-card','/pacientes/index','1',NULL,'2020-04-10 22:44:30',NULL,4,'WEB','ACTIVO'),(23,0,'Productos','bars','#','1',NULL,'2020-04-10 22:44:31',NULL,6,'WEB','ACTIVO'),(34,0,'Reportes','list-alt','#','1',NULL,'2020-04-10 22:42:02',NULL,9,'WEB','ACTIVO'),(6,0,'Sistema','gears','#','1',NULL,'2020-04-10 22:42:02',NULL,11,'WEB','ACTIVO'),(45,0,'Sistema Médico','edit','/','1',NULL,'2020-09-25 10:17:39',NULL,8,'WEB','ACTIVO'),(19,0,'Usuarios','users','#','1',NULL,'2020-04-10 22:41:57',NULL,3,'WEB','ACTIVO'),(40,2,'Ingreso Stock','th-list','/inventario/agregarstockex','1',NULL,'2020-04-10 22:41:57',NULL,2,'WEB','ACTIVO'),(3,2,'Kardex Productos','list','/inventario/index','1',NULL,'2020-04-10 22:41:57',NULL,1,'WEB','ACTIVO'),(22,2,'Opciones','th-list','/inventario/opciones','1',NULL,'2020-04-10 22:41:58',NULL,2,'WEB','ACTIVO'),(29,4,'Contenidos','pencil-square-o','/contenido/redcajeros','1',NULL,'2020-04-10 22:41:58',NULL,3,'WEB','ACTIVO'),(11,5,'Configuración','cog','#','1',NULL,'2020-04-10 22:41:55',NULL,1,'WEB','INACTIVO'),(7,6,'Gii','','/gii','1',NULL,'2020-04-10 22:41:55',NULL,1,'WEB','ACTIVO'),(8,6,'Logs','','#','1',NULL,'2020-04-10 22:41:55',NULL,1,'WEB','INACTIVO'),(12,9,'Páginas','edit','/paginas/index','1',NULL,'2020-04-10 22:41:55',NULL,1,'WEB','ACTIVO'),(14,13,'Mensajes','envelope-o','#','1',NULL,'2020-04-10 22:41:54',NULL,2,'WEB','INACTIVO'),(18,13,'Mi perfil','user','/usuario/index','1',NULL,'2020-04-10 22:41:54',NULL,1,'WEB','ACTIVO'),(21,19,'Nuevo Usuario','address-card','/usuarios/nuevo','1',NULL,'2020-04-10 22:41:54',NULL,2,'WEB','ACTIVO'),(20,19,'Usuarios','user','/usuarios/index','1',NULL,'2020-04-10 22:41:54',NULL,1,'WEB','ACTIVO'),(26,23,'Categorias','list-alt','/productos/categorias','1',NULL,'2020-04-10 22:41:53',NULL,3,'WEB','ACTIVO'),(37,23,'Marca','list','/productos/marcas','1',NULL,'2020-04-10 22:41:53',NULL,4,'WEB','ACTIVO'),(39,23,'Presentaciones','list','/productos/presentaciones','1',NULL,'2020-04-10 22:41:53',NULL,1,'WEB','ACTIVO'),(24,23,'Productos','list','/productos/index','1',NULL,'2020-04-10 22:41:52',NULL,1,'WEB','ACTIVO'),(36,23,'Proveedores','list','/productos/proveedor','1',NULL,'2020-04-10 22:41:52',NULL,2,'WEB','ACTIVO'),(38,23,'Tipo','list','/productos/tipos','1',NULL,'2020-04-10 22:41:52',NULL,5,'WEB','ACTIVO'),(28,27,'Descargas','cloud-download','/libreria/index','1',NULL,'2020-04-10 22:41:52',NULL,1,'WEB','ACTIVO'),(35,34,'Ventas Diarias','th-list','/reportes/ventasd','1',NULL,'2020-04-10 22:41:51',NULL,1,'WEB','ACTIVO'),(44,41,'Historia Clínica','list-alt','/','1',NULL,'2020-09-25 10:16:56',NULL,2,'WEB','ACTIVO'),(43,41,'Pacientes','address-card','/','1',NULL,'2020-09-25 10:16:06',NULL,1,'WEB','ACTIVO'),(47,45,'Enfermedades','list','/','1',NULL,'2020-09-25 10:18:48',NULL,2,'WEB','ACTIVO'),(46,45,'Especialidades','list','/','1',NULL,'2020-09-25 10:18:52',NULL,1,'WEB','ACTIVO'),(49,45,'Laboratorio','list','/','1',NULL,'2020-09-25 10:20:09',NULL,4,'WEB','ACTIVO'),(48,45,'Medicinas','list','/','1',NULL,'2020-09-25 10:19:09',NULL,3,'WEB','ACTIVO'),(50,45,'Tipo de Sangre','list','/','1',NULL,'2020-09-25 10:20:27',NULL,5,'WEB','ACTIVO');

/*Table structure for table `menu_front` */

DROP TABLE IF EXISTS `menu_front`;

CREATE TABLE `menu_front` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idparent` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `icono` varchar(80) NOT NULL,
  `link` varchar(400) NOT NULL,
  `seccion` int(1) NOT NULL DEFAULT '0',
  `usuarioc` int(11) NOT NULL,
  `usuariom` int(11) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '1',
  `tipo` enum('WEB','APP') NOT NULL DEFAULT 'WEB',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  PRIMARY KEY (`idparent`,`nombre`),
  KEY `id` (`id`),
  KEY `usuarioc` (`usuarioc`),
  CONSTRAINT `menu_front_ibfk_1` FOREIGN KEY (`usuarioc`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `menu_front` */

insert  into `menu_front`(`id`,`idparent`,`nombre`,`icono`,`link`,`seccion`,`usuarioc`,`usuariom`,`fechacreacion`,`fechamod`,`orden`,`tipo`,`estatus`) values (1,0,'Escritorio','fa-desktop','/',0,1,NULL,'2020-03-27 23:31:44',NULL,1,'WEB','ACTIVO'),(2,0,'Facturación','','#',1,1,0,'2020-03-27 21:13:58',NULL,2,'WEB','ACTIVO'),(4,0,'Usuario','','#',1,1,0,'2020-03-27 21:13:59',NULL,3,'WEB','ACTIVO'),(9,2,'Cierre de Caja','fa-file-archive','/site/cierredecaja',0,1,0,'2020-03-27 23:10:47',NULL,3,'WEB','ACTIVO'),(8,2,'Eliminar facturas','fa-trash-alt','/site/eliminarfactura',0,1,0,'2020-03-27 23:43:33',NULL,2,'WEB','ACTIVO'),(3,2,'Facturar','fa-file-alt','/site/facturar',0,1,0,'2021-09-15 18:04:55',NULL,1,'WEB','ACTIVO'),(47,2,'Recaudaciones','fa-money','/site/recaudaciones',0,1,0,'2021-09-15 18:01:27',NULL,4,'WEB','ACTIVO'),(46,4,'Buzón','fa-envelope-open-text','/site/buzon',0,1,0,'2020-03-27 23:13:48',NULL,1,'WEB','ACTIVO'),(5,4,'Estadísticas','fa-chart-area','/site/estadisticas',0,1,0,'2020-03-27 23:13:56',NULL,4,'WEB','ACTIVO'),(7,4,'Notificaciones','fa-comment-dots','/site/notificaciones',0,1,0,'2020-03-27 23:13:50',NULL,2,'WEB','ACTIVO'),(6,4,'Reportes','fa-tachometer-alt','/site/reportes',0,1,0,'2020-03-27 23:13:51',NULL,3,'WEB','ACTIVO');

/*Table structure for table `menuadmin` */

DROP TABLE IF EXISTS `menuadmin`;

CREATE TABLE `menuadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idparent` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `icono` varchar(80) NOT NULL,
  `link` varchar(400) NOT NULL,
  `rolpermiso` longblob,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `usuarioc` int(11) NOT NULL,
  `usuariom` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT '1',
  `tipo` enum('WEB','APP') NOT NULL DEFAULT 'WEB',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `usuarioc` (`usuarioc`),
  CONSTRAINT `menuadmin_ibfk_1` FOREIGN KEY (`usuarioc`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

/*Data for the table `menuadmin` */

insert  into `menuadmin`(`id`,`idparent`,`nombre`,`icono`,`link`,`rolpermiso`,`isDeleted`,`usuarioc`,`usuariom`,`fechacreacion`,`fechamod`,`orden`,`tipo`,`estatus`) values (1,0,'Escritorio','file-code-o','/site/index','menuescritorio',0,1,0,'2022-03-28 12:19:28',NULL,1,'WEB','ACTIVO'),(2,0,'Inventario','archive','#','menuinventario',0,1,0,'2022-03-28 12:19:25',NULL,6,'WEB','INACTIVO'),(3,2,'Kardex Productos','list','/inventario/inventario',NULL,0,1,0,'2022-02-14 09:49:10',NULL,1,'WEB','ACTIVO'),(5,0,'Configuraciones','tasks','#','menuconfiguraciones',0,1,0,'2022-03-28 12:19:23',NULL,12,'WEB','ACTIVO'),(6,0,'Sistema','gears','#','menusistema',0,1,0,'2022-03-28 12:19:33',NULL,11,'WEB','INACTIVO'),(7,6,'Gii','','/gii',NULL,0,1,0,'2022-01-19 19:50:32',NULL,1,'WEB','ACTIVO'),(8,6,'Logs','','#',NULL,0,1,0,'2022-01-19 19:50:32',NULL,1,'WEB','INACTIVO'),(9,0,'Facturación','file-text','#','menufacturacion',0,1,0,'2022-03-28 12:19:39',NULL,4,'WEB','INACTIVO'),(10,0,'App','mobile','#',NULL,0,1,0,'2022-01-19 19:50:25',NULL,1,'APP','ACTIVO'),(11,5,'Configuración','cog','/configuracoi',NULL,0,1,0,'2022-01-24 17:55:25',NULL,1,'WEB','INACTIVO'),(12,9,'Modo de Facturación','edit','/paginas/index',NULL,1,1,0,'2022-01-25 21:33:13',NULL,3,'WEB','ACTIVO'),(13,0,'Mi perfil','user','#','miperfil',0,1,0,'2022-03-28 12:19:49',NULL,2,'WEB','INACTIVO'),(14,13,'Mensajes','envelope-o','#','mensajes',0,1,0,'2022-04-01 11:05:07',NULL,2,'WEB','INACTIVO'),(18,19,'Mi perfil','user','/usuario/miperfil','miperfil',0,1,0,'2022-03-28 11:32:22',NULL,0,'WEB','ACTIVO'),(19,0,'Usuarios','users','#','menuusuarios',0,1,0,'2022-03-28 12:20:03',NULL,3,'WEB','ACTIVO'),(20,19,'Usuarios','user','/usuarios/usuarios','usuarios',0,1,0,'2022-04-01 10:48:12',NULL,1,'WEB','ACTIVO'),(21,19,'Nuevo Usuario','address-card','/usuarios/nuevo',NULL,0,1,0,'2022-01-24 17:53:54',NULL,2,'WEB','INACTIVO'),(22,2,'Opciones','th-list','/inventario/opciones',NULL,0,1,0,'2022-01-19 19:50:30',NULL,2,'WEB','ACTIVO'),(23,0,'Productos','shopping-bag','#',NULL,0,1,0,'2022-03-13 11:00:15',NULL,5,'WEB','INACTIVO'),(24,23,'Productos','list','/productos/productos',NULL,0,1,0,'2022-02-14 01:39:08',NULL,1,'WEB','ACTIVO'),(26,23,'Categorias','list-alt','/productos/categorias',NULL,1,1,0,'2022-02-07 03:58:40',NULL,3,'WEB','ACTIVO'),(28,27,'Descargas','cloud-download','/libreria/index',NULL,0,1,0,'2022-01-19 19:50:39',NULL,1,'WEB','ACTIVO'),(29,4,'Contenidos','pencil-square-o','/contenido/redcajeros',NULL,0,1,0,'2022-01-19 19:50:30',NULL,3,'WEB','ACTIVO'),(34,0,'Reportes','list-alt','#','menureportes',0,1,0,'2022-03-28 12:20:14',NULL,10,'WEB','ACTIVO'),(35,34,'Cuentas por Cobrar','th-list','/reportes/cuentasporcobrar',NULL,0,1,0,'2022-03-14 10:27:35',NULL,1,'WEB','INACTIVO'),(36,23,'Proveedores','list','/productos/proveedor',NULL,0,1,0,'2022-01-19 19:50:39',NULL,2,'WEB','ACTIVO'),(37,23,'Marca','list','/productos/marcas',NULL,0,1,0,'2022-01-19 19:50:38',NULL,4,'WEB','ACTIVO'),(38,23,'Tipo','list','/productos/tipos',NULL,0,1,0,'2022-01-19 19:50:39',NULL,5,'WEB','ACTIVO'),(39,23,'Presentaciones','list','/productos/presentaciones',NULL,0,1,0,'2022-01-19 19:50:39',NULL,1,'WEB','ACTIVO'),(40,2,'Ingreso Stock','th-list','/inventario/agregarstockex',NULL,0,1,0,'2022-01-19 19:50:29',NULL,2,'WEB','ACTIVO'),(41,0,'Contabilidad','list','#','menucontabilidad',0,1,0,'2022-03-28 12:20:18',NULL,4,'WEB','INACTIVO'),(42,41,'Cuentas por pagar','list','/contabilidad/cuentasporpagar',NULL,0,1,0,'2022-01-19 19:50:43',NULL,6,'WEB','ACTIVO'),(43,41,'Cuentas por cobrar','list','/contabilidad/cuentasporcobrar',NULL,0,1,0,'2022-01-19 19:50:43',NULL,5,'WEB','ACTIVO'),(44,41,'Bancos','list','/contabilidad/bancos',NULL,0,1,0,'2022-01-19 19:50:42',NULL,2,'WEB','ACTIVO'),(45,41,'Declaraciones','list','#',NULL,0,1,0,'2022-01-19 19:50:43',NULL,9,'WEB','ACTIVO'),(46,41,'Cierres','list','#',NULL,0,1,0,'2022-01-19 19:50:42',NULL,4,'WEB','INACTIVO'),(47,41,'Cheques','list','#',NULL,0,1,0,'2022-01-19 19:50:42',NULL,3,'WEB','INACTIVO'),(48,41,'Notas de débito','list','#',NULL,0,1,0,'2022-01-19 19:50:43',NULL,8,'WEB','ACTIVO'),(49,41,'Notas de crédito','list','#',NULL,0,1,0,'2022-01-19 19:50:43',NULL,7,'WEB','ACTIVO'),(50,0,'Urbanización','list','#',NULL,0,1,0,'2022-01-19 19:50:29',NULL,6,'WEB','INACTIVO'),(51,50,'Propietarios','list','#',NULL,0,1,0,'2020-10-25 10:06:13',NULL,1,'WEB','ACTIVO'),(52,50,'Casas','list','#',NULL,0,1,0,'2022-01-19 19:50:44',NULL,2,'WEB','ACTIVO'),(53,50,'Administradores','list','#',NULL,0,1,0,'2022-01-19 19:50:44',NULL,3,'WEB','ACTIVO'),(54,50,'Alicuotas','list','#',NULL,0,1,0,'2022-01-19 19:50:44',NULL,4,'WEB','ACTIVO'),(55,50,'Extras','list','#',NULL,0,1,0,'2022-01-19 19:50:45',NULL,5,'WEB','ACTIVO'),(56,50,'Configuraciones','list','#',NULL,0,1,0,'2022-01-19 19:50:45',NULL,6,'WEB','ACTIVO'),(57,6,'Parámetros','list','#',NULL,0,1,0,'2022-01-19 19:50:33',NULL,2,'WEB','ACTIVO'),(58,7,'Licencia','list','#',NULL,0,1,0,'2022-01-19 19:50:34',NULL,3,'WEB','ACTIVO'),(59,8,'Módulos','list','#',NULL,0,1,0,'2022-01-19 19:50:35',NULL,4,'WEB','ACTIVO'),(60,34,'Ventas por fecha','list','#',NULL,0,1,0,'2022-01-19 19:50:41',NULL,2,'WEB','INACTIVO'),(61,34,'Recaudaciones','list','#',NULL,0,1,0,'2022-01-19 19:50:40',NULL,3,'WEB','INACTIVO'),(62,34,'Deudores','list','#',NULL,0,1,0,'2022-01-19 19:50:40',NULL,4,'WEB','INACTIVO'),(63,34,'Contable','list','#',NULL,0,1,0,'2022-01-19 19:50:40',NULL,5,'WEB','INACTIVO'),(64,0,'Recursos Humanos','user-circle','#','menurecursosh',0,1,0,'2022-03-28 12:20:27',NULL,7,'WEB','INACTIVO'),(65,64,'Departamentos','list','/recursoshumanos/departamentos',NULL,0,1,0,'2021-07-13 10:21:11',NULL,1,'WEB','ACTIVO'),(66,64,'Áreas','list','#',NULL,0,1,0,'2021-07-23 09:13:34',NULL,2,'WEB','INACTIVO'),(67,64,'Empleados','list','/recursoshumanos/empleados',NULL,0,1,0,'2021-07-13 08:32:24',NULL,3,'WEB','ACTIVO'),(68,64,'Roles de pago','list','#',NULL,0,1,0,'2021-07-23 09:13:23',NULL,4,'WEB','INACTIVO'),(69,64,'Marcajes','list','/recursoshumanos/marcajes',NULL,0,1,0,'2021-07-13 11:46:30',NULL,5,'WEB','ACTIVO'),(70,64,'Configuraciones','list','#',NULL,0,1,0,'2021-07-23 09:13:55',NULL,6,'WEB','INACTIVO'),(71,9,'Facturación E.','list','#',NULL,0,1,0,'2022-02-07 21:16:12',NULL,2,'WEB','INACTIVO'),(72,9,'Cierre diario','list','#',NULL,0,1,0,'2022-02-17 07:49:47',NULL,3,'WEB','INACTIVO'),(73,9,'Facturas','list','/facturacion/facturas',NULL,0,1,0,'2022-01-19 19:50:36',NULL,1,'WEB','ACTIVO'),(74,9,'Anulación de Fac.','list','#',NULL,1,1,0,'2022-01-25 21:33:56',NULL,5,'WEB','ACTIVO'),(75,9,'Configuraciones','list','#',NULL,0,1,0,'2022-01-19 19:50:36',NULL,6,'WEB','ACTIVO'),(76,6,'Empresas','list','#',NULL,0,1,0,'2020-10-25 10:08:49',NULL,3,'WEB','ACTIVO'),(77,6,'Empresa activa','list','#',NULL,0,1,0,'2020-10-25 10:10:26',NULL,4,'WEB','ACTIVO'),(78,6,'Sucursales','list','#',NULL,0,1,0,'2020-10-25 10:56:32',NULL,5,'WEB','ACTIVO'),(81,0,'Cotizaciones','list','#','menucotizaciones',0,1,0,'2022-03-28 12:20:34',NULL,6,'WEB','INACTIVO'),(83,81,'Cotizaciones','list','#',NULL,0,1,0,'2020-10-25 13:38:19',NULL,1,'WEB','ACTIVO'),(84,81,'Orden de trabajo','list','#',NULL,0,1,0,'2020-10-25 13:38:36',NULL,2,'WEB','ACTIVO'),(85,81,'Orden de ingreso','list','#',NULL,0,1,0,'2020-10-25 13:39:04',NULL,3,'WEB','ACTIVO'),(86,34,'Cuentas por pagar','list','/reportes/cuentasporpagar',NULL,0,1,0,'2022-03-14 10:27:17',NULL,1,'WEB','INACTIVO'),(87,0,'Servicio Comida','list','#','menuservicio',1,1,0,'2022-03-28 12:20:44',NULL,8,'WEB','INACTIVO'),(88,87,'Servicios','list','/serviciocomida/servicios',NULL,0,1,0,'2022-01-19 19:50:49',NULL,1,'WEB','ACTIVO'),(89,87,'Marcaciones de servicios','list','/serviciocomida/marcaciones',NULL,0,1,0,'2022-01-19 19:50:48',NULL,2,'WEB','ACTIVO'),(90,0,'Restaurante','cutlery fa','#','menurestaurante',0,1,0,'2022-03-28 12:20:49',NULL,6,'WEB','INACTIVO'),(91,90,'Almuerzos','list','/restaurante/almuerzos',NULL,0,1,0,'2021-10-21 14:25:42',NULL,1,'WEB','ACTIVO'),(92,90,'Menú diario','list','/restaurante/menudiario',NULL,0,1,0,'2021-10-21 14:26:09',NULL,2,'WEB','ACTIVO'),(93,90,'Pedidos','cart-plus','/restaurante/pedidos',NULL,0,1,0,'2021-10-21 14:36:42',NULL,3,'WEB','ACTIVO'),(94,90,'Solicitud Crédito','list-ul','/restaurante/credito',NULL,0,1,0,'2021-10-21 14:40:34',NULL,5,'WEB','ACTIVO'),(95,90,'Entregas','motorcycle','/produccion/entregas',NULL,0,1,0,'2022-01-19 18:19:16',NULL,4,'WEB','ACTIVO'),(96,19,'Roles','user-secret','/usuarios/roles','roles',0,1,0,'2022-04-01 10:48:15',NULL,3,'WEB','ACTIVO'),(97,0,'Mantenimientos','list','#','menumantenimiento',0,1,0,'2022-03-28 12:20:54',NULL,9,'WEB','ACTIVO'),(98,97,'Clientes','list','/mantenimientos/clientes','clientes',0,1,0,'2022-04-04 23:47:41',NULL,2,'WEB','ACTIVO'),(99,97,'Proveedores','list','/mantenimientos/proveedores','proveedores',0,1,0,'2022-04-04 23:47:45',NULL,10,'WEB','ACTIVO'),(100,97,'Socios','list','/mantenimientos/socios','socios',0,1,0,'2022-04-04 23:47:48',NULL,11,'WEB','ACTIVO'),(101,41,'Cuentas','list','/contabilidad/cuentas',NULL,0,1,0,'2021-12-08 07:44:51',NULL,1,'WEB','ACTIVO'),(102,41,'Asientos diarios','list','/contabilidad/asientos',NULL,0,1,0,'2021-12-08 07:49:39',NULL,1,'WEB','ACTIVO'),(104,41,'Anticipo Empleados','list','/contabilidad/anticipoemp',NULL,0,1,0,'2021-12-08 07:51:19',NULL,10,'WEB','ACTIVO'),(105,64,'Rol de pagos','list','/recursoshumanos/roldepagos',NULL,0,1,0,'2021-12-08 07:53:02',NULL,4,'WEB','ACTIVO'),(106,0,'Producción','list','#','menuproduccion',0,1,0,'2022-03-28 12:21:00',NULL,9,'WEB','INACTIVO'),(107,106,'Orden de producción','list','/produccion/ordendeprod',NULL,0,1,0,'2021-12-08 07:55:07',NULL,1,'WEB','ACTIVO'),(108,106,'Producto terminado','list','/produccion/productoterminado',NULL,0,1,0,'2021-12-08 07:56:09',NULL,2,'WEB','ACTIVO'),(109,106,'Orden de trabajo','list','/produccion/ordendetrab',NULL,0,1,0,'2021-12-08 07:56:59',NULL,3,'WEB','ACTIVO'),(110,106,'Entregas','list','/produccion/entregas',NULL,0,1,0,'2022-01-19 18:19:25',NULL,4,'WEB','INACTIVO'),(111,0,'Ventas','list','#','menuventas',0,1,0,'2022-03-28 12:21:11',NULL,10,'WEB','INACTIVO'),(112,9,'Vendedores','list','/facturacion/vendedores',NULL,0,1,0,'2022-02-07 20:08:31',NULL,7,'WEB','ACTIVO'),(113,111,'Entregas','list','/ventas/entregas',NULL,0,1,0,'2022-01-19 18:19:43',NULL,2,'WEB','INACTIVO'),(114,9,'Comisiones','list','/ventas/comisiones',NULL,0,1,0,'2022-02-07 21:16:27',NULL,8,'WEB','INACTIVO'),(115,9,'Entregas','list','/facturacion/entregas',NULL,0,1,0,'2022-02-07 21:45:15',NULL,8,'WEB','ACTIVO'),(116,41,'Periodo Fiscal','list','/contabilidad/periodofiscal',NULL,0,1,0,'2021-12-21 12:53:20',NULL,11,'WEB','ACTIVO'),(117,5,'Menú Admin','list','/configuraciones/menuadmin','menuadmin',0,1,0,'2022-04-01 17:36:21',NULL,1,'WEB','ACTIVO'),(118,5,'Licencia','list','/configuraciones/licencia',NULL,0,1,0,'2022-01-19 19:32:07',NULL,2,'WEB','ACTIVO'),(119,5,'parent','task','#',NULL,1,1,1,'2022-01-24 23:35:32',NULL,10,'WEB','ACTIVO'),(120,5,'dwqdwdq','task','#',NULL,1,1,1,'2022-01-24 23:35:14',NULL,11,'WEB','ACTIVO'),(121,97,'Tipo Cheque','task','/mantenimientos/tipocheque','tipocheque',0,1,0,'2022-04-04 23:47:52',NULL,12,'WEB','INACTIVO'),(122,41,'Bancos Mov','list','/contabilidad/bancosmov',NULL,0,1,1,'2022-02-07 13:51:36',NULL,3,'WEB','ACTIVO'),(123,41,'Caja','list','/contabilidad/caja',NULL,0,1,1,'2022-02-07 13:52:14',NULL,4,'WEB','ACTIVO'),(124,2,'Produccion','list','/inventario/produccion',NULL,0,1,1,'2022-02-14 21:16:25',NULL,4,'WEB','ACTIVO'),(125,97,'Operarios','list','/mantenimientos/operarios','operarios',0,1,0,'2022-04-04 23:47:55',NULL,6,'WEB','INACTIVO'),(126,97,'Transporte','list','/mantenimientos/transporte','transporte',0,1,0,'2022-04-04 23:48:00',NULL,16,'WEB','INACTIVO'),(127,41,'Retenciones','list','/contabilidad/retenciones',NULL,0,1,1,'2022-02-17 17:38:10',NULL,11,'WEB','ACTIVO'),(128,41,'Retenciones cxc','list','/contabilidad/retencionescxc',NULL,0,1,1,'2022-02-17 17:38:46',NULL,13,'WEB','ACTIVO'),(129,0,'Procesos','list','#','menuprocesos',0,1,1,'2022-03-28 12:21:16',NULL,12,'WEB','INACTIVO'),(130,129,'Cierre de año','list','/procesos/cierredeanio',NULL,0,1,1,'2022-02-20 22:15:48',NULL,1,'WEB','ACTIVO'),(131,34,'E.C. Proveedores','list','/reportes/estadoproveedores',NULL,0,1,1,'2022-03-14 10:27:18',NULL,3,'WEB','INACTIVO'),(132,34,'E.C. Clientes','list','/reportes/estadocliente',NULL,0,1,1,'2022-03-14 10:27:19',NULL,4,'WEB','INACTIVO'),(133,97,'Pacientes','list','/mantenimientos/pacientes','pacientes',0,1,0,'2022-04-04 23:48:03',NULL,7,'WEB','ACTIVO'),(134,97,'Patologías','list','/mantenimientos/patologias','patologias',0,1,0,'2022-04-04 23:48:08',NULL,8,'WEB','ACTIVO'),(135,0,'Recepción','list','#','menuagendamiento',0,1,0,'2022-05-25 16:33:03',NULL,3,'WEB','ACTIVO'),(136,135,'Citas Médicas','list','/agendamientos/citas','citas',0,1,0,'2022-04-04 16:15:27',NULL,1,'WEB','ACTIVO'),(137,97,'Profesiones','list','/mantenimientos/profesiones','profesiones',0,1,0,'2022-04-04 23:48:11',NULL,9,'WEB','ACTIVO'),(138,135,'Consultas Médicas','list','/agendamientos/consultasmed',NULL,0,1,0,'2022-03-14 10:26:11',NULL,2,'WEB','ACTIVO'),(139,34,'Agendamientos','list','/reportes/agendamientos',NULL,0,1,0,'2022-03-14 10:27:57',NULL,1,'WEB','ACTIVO'),(140,34,'Citas Medicas','list','/reportes/citasmedicas',NULL,0,1,0,'2022-03-14 10:28:13',NULL,2,'WEB','ACTIVO'),(141,34,'Patologías','list','/reportes/patologias',NULL,0,1,0,'2022-03-14 10:28:50',NULL,3,'WEB','ACTIVO'),(142,1,'Mensajes','list','/escritorio/mensajes','mensajes',0,1,0,'2022-04-01 11:08:19',NULL,1,'WEB','ACTIVO'),(143,1,'Notificaciones','list','/escritorio/notificaciones','notificaciones',0,1,0,'2022-04-01 11:05:39',NULL,2,'WEB','ACTIVO'),(144,97,'Doctores','list','/mantenimientos/doctores','doctores',0,1,1,'2022-04-21 16:41:57',NULL,4,'WEB','ACTIVO'),(145,97,'Motivo Consulta','list','/mantenimientos/motivoconsulta','motivoconsulta',0,1,1,'2022-04-04 23:48:21',NULL,5,'WEB','ACTIVO'),(146,97,'Tipo Consulta','list','/mantenimientos/tipoconsulta','tipoconsulta',0,1,1,'2022-04-04 23:48:25',NULL,14,'WEB','ACTIVO'),(147,97,'Tipo Examenes','list','/mantenimientos/tipoexamenes','tipoexamenes',0,1,1,'2022-04-04 23:48:31',NULL,15,'WEB','ACTIVO'),(148,97,'Consultorios','list','/mantenimientos/consultorios','consultorios',0,1,1,'2022-04-04 23:48:34',NULL,3,'WEB','ACTIVO'),(149,97,'Ciudad','list','/mantenimientos/ciudades','ciudad',0,1,1,'2022-04-04 23:48:37',NULL,1,'WEB','ACTIVO'),(150,97,'Zona / Sector','list','/mantenimientos/zonasector','sector',0,1,1,'2022-04-04 23:48:41',NULL,17,'WEB','ACTIVO'),(151,97,'Tipo cobro','list','/mantenimientos/tipocobro','tipocobro',0,1,1,'2022-04-04 23:48:45',NULL,13,'WEB','ACTIVO'),(152,0,'Pacientes','user-md','#','menupacientes',0,1,1,'2022-03-28 12:21:25',NULL,7,'WEB','ACTIVO'),(153,152,'Historia Clínica','stethoscope','/pacientes/historiaclinica','historiaclinica',0,1,1,'2022-04-04 12:23:38',NULL,2,'WEB','ACTIVO'),(154,5,'Sistema','list','configuraciones/sistema',NULL,0,1,1,'2022-03-24 10:37:18',NULL,3,'WEB','ACTIVO'),(155,5,'Módulos Roles','list','modulosroles',NULL,0,1,1,'2022-03-24 10:48:42',NULL,4,'WEB','ACTIVO'),(156,5,'Módulos subroles','list','configuraciones/modulossubroles',NULL,0,1,1,'2022-03-24 10:49:35',NULL,5,'WEB','ACTIVO'),(157,0,'Auditoria','list','#',NULL,0,1,1,'2022-03-28 12:30:46',NULL,25,'WEB','INACTIVO'),(158,152,'Atención Pacientes','list','/pacientes/agenda','agenda',0,1,1,'2022-05-25 16:34:02',NULL,1,'WEB','ACTIVO'),(159,34,'Atención Pac.','list','/reportes/atencionpacientes','atencionpacientes',0,1,1,'2022-04-04 12:49:05',NULL,1,'WEB','ACTIVO');

/*Table structure for table `menuprincipal` */

DROP TABLE IF EXISTS `menuprincipal`;

CREATE TABLE `menuprincipal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `ico` varchar(100) DEFAULT NULL,
  `link` varchar(300) NOT NULL DEFAULT '#',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` varchar(50) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `creado_por` varchar(55) DEFAULT NULL,
  `modificado_por` varchar(55) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `menuprincipal` */

insert  into `menuprincipal`(`id`,`nombre`,`descripcion`,`ico`,`link`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`orden`,`creado_por`,`modificado_por`,`estado`) values (1,'Inicio',' ','','/',0,'2019-05-14 14:13:35','',1,NULL,NULL,'Activo'),(2,'Vender','','vender.png','/frontend/web/site/comofunciona',0,'2019-05-14 14:13:39','',2,NULL,NULL,'Activo'),(3,'Categorías',' ','categorias.png','/frontend/web/site/clases',0,'2019-05-23 09:42:00',' ',3,NULL,NULL,'Activo'),(4,'Ayuda','','ayuda.png','/frontend/web/site/pinturas',0,'2019-06-19 17:09:14','',4,NULL,NULL,'Activo'),(5,'Términos y Condiciones','','terminos.png','/frontend/web/site/galeria',0,'2019-05-14 14:13:43','',5,NULL,NULL,'Activo'),(6,'Login','','','/frontend/web/site/login',0,'2019-05-14 14:13:55','',7,NULL,NULL,'Inactivo'),(7,'CARRITO',NULL,'','/frontend/web/site/tiendavirtual',0,'2019-09-02 14:21:53',NULL,6,NULL,NULL,'Inactivo');

/*Table structure for table `menurestaurante` */

DROP TABLE IF EXISTS `menurestaurante`;

CREATE TABLE `menurestaurante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` mediumblob,
  `fechacombo` date NOT NULL,
  `producto1` int(11) NOT NULL,
  `producto2` int(11) NOT NULL,
  `producto3` int(11) DEFAULT NULL,
  `producto4` int(11) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recargo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `producto1` (`producto1`),
  KEY `producto2` (`producto2`),
  KEY `producto3` (`producto3`),
  KEY `producto4` (`producto4`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `menurestaurante_ibfk_1` FOREIGN KEY (`producto1`) REFERENCES `productos` (`id`),
  CONSTRAINT `menurestaurante_ibfk_2` FOREIGN KEY (`producto2`) REFERENCES `productos` (`id`),
  CONSTRAINT `menurestaurante_ibfk_3` FOREIGN KEY (`producto3`) REFERENCES `productos` (`id`),
  CONSTRAINT `menurestaurante_ibfk_4` FOREIGN KEY (`producto4`) REFERENCES `productos` (`id`),
  CONSTRAINT `menurestaurante_ibfk_5` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menurestaurante` */

/*Table structure for table `modelo` */

DROP TABLE IF EXISTS `modelo`;

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `modelo` */

/*Table structure for table `motivoanulacion` */

DROP TABLE IF EXISTS `motivoanulacion`;

CREATE TABLE `motivoanulacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `motivoanulacion_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `motivoanulacion` */

/*Table structure for table `motivoconsulta` */

DROP TABLE IF EXISTS `motivoconsulta`;

CREATE TABLE `motivoconsulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `motivoconsulta_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

/*Data for the table `motivoconsulta` */

insert  into `motivoconsulta`(`id`,`nombre`,`descripcion`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`fechaact`,`usuarioact`,`estatus`) values (1,'PN','',0,'2015-06-29 11:24:43',1,'2015-08-02 22:20:39',1,'ACTIVO'),(207,'PA','',0,'2015-06-29 11:24:50',1,'2015-08-02 22:20:51',1,'ACTIVO'),(216,'OJO ROJO','',0,'2015-08-02 22:21:08',1,'2015-08-19 16:56:51',1,'ACTIVO'),(217,'CONTROL','',0,'2015-08-02 23:04:36',1,'2015-08-19 16:57:27',1,'ACTIVO'),(218,'EMERGENCIA','',0,'2015-08-02 23:04:45',1,'0000-00-00 00:00:00',0,'ACTIVO'),(219,'CIRUGIA','',0,'2015-08-02 23:04:54',1,'0000-00-00 00:00:00',0,'ACTIVO'),(244,'AMETROPIAS','',0,'2015-08-19 16:57:46',1,'0000-00-00 00:00:00',0,'ACTIVO'),(245,'PRESBICIA','',0,'2015-08-19 16:57:59',1,'0000-00-00 00:00:00',0,'ACTIVO'),(246,'BLEFARITIS','',0,'2015-08-19 16:58:11',1,'0000-00-00 00:00:00',0,'ACTIVO'),(247,'CATARATA','',0,'2015-08-19 16:58:21',1,'0000-00-00 00:00:00',0,'ACTIVO'),(248,'CHALAZION','',0,'2015-08-19 16:58:31',1,'0000-00-00 00:00:00',0,'ACTIVO'),(249,'CONJUNTIVITIS ALERGICA','',0,'2015-08-19 16:58:47',1,'0000-00-00 00:00:00',0,'ACTIVO'),(250,'CONJUNTIVITIS BACTERIANA','',0,'2015-08-19 16:58:59',1,'0000-00-00 00:00:00',0,'ACTIVO'),(251,'CONJUNTIVITIS TRAUMATICA','',0,'2015-08-19 16:59:11',1,'0000-00-00 00:00:00',0,'ACTIVO'),(252,'CONJUNTIVITIS VIRAL','',0,'2015-08-19 16:59:49',1,'0000-00-00 00:00:00',0,'ACTIVO'),(253,'ASTIGMATISMO','',0,'2015-08-19 17:01:55',1,'0000-00-00 00:00:00',0,'ACTIVO'),(254,'DESPRENDIMIENTO DE RETINA','',0,'2015-08-19 17:02:12',1,'0000-00-00 00:00:00',0,'ACTIVO'),(255,'DISMINUCION DE LA AGUDEZA VISUAL','',0,'2015-08-19 17:02:36',1,'0000-00-00 00:00:00',0,'ACTIVO'),(256,'DOLOR OCULAR','',0,'2015-08-19 17:02:50',1,'0000-00-00 00:00:00',0,'ACTIVO'),(257,'ENDOFTALMITIS','',0,'2015-08-19 17:03:07',1,'0000-00-00 00:00:00',0,'ACTIVO'),(258,'EPIESCLERITIS','',0,'2015-08-19 17:03:25',1,'0000-00-00 00:00:00',0,'ACTIVO'),(259,'EROCION CORNEAL','',0,'2015-08-19 17:03:45',1,'0000-00-00 00:00:00',0,'ACTIVO'),(260,'ESCLERITIS','',0,'2015-08-19 17:03:58',1,'0000-00-00 00:00:00',0,'ACTIVO'),(261,'GLAUCOMA','',0,'2015-08-19 17:04:11',1,'0000-00-00 00:00:00',0,'ACTIVO'),(262,'IRIDOCICLITIS','',0,'2015-08-19 17:04:34',1,'0000-00-00 00:00:00',0,'ACTIVO'),(263,'MIOPIA','',0,'2015-08-19 17:04:56',1,'0000-00-00 00:00:00',0,'ACTIVO'),(264,'NEURITIS OPTICA','',0,'2015-08-19 17:05:07',1,'0000-00-00 00:00:00',0,'ACTIVO'),(265,'OFTALMOPATIAS DIAGNOSTICO','',0,'2015-08-19 17:05:25',1,'0000-00-00 00:00:00',0,'ACTIVO'),(266,'ORZUELO','',0,'2015-08-19 17:05:43',1,'0000-00-00 00:00:00',0,'ACTIVO'),(267,'PTERIGION','',0,'2015-08-19 17:05:56',1,'0000-00-00 00:00:00',0,'ACTIVO'),(268,'QUERATITIS','',0,'2015-08-19 17:06:08',1,'0000-00-00 00:00:00',0,'ACTIVO'),(269,'TRAUMATISMO OCULAR','',0,'2015-08-19 17:06:25',1,'0000-00-00 00:00:00',0,'ACTIVO'),(270,'UVEITIS','',0,'2015-08-19 17:06:36',1,'0000-00-00 00:00:00',0,'ACTIVO'),(282,'HIPERMETROPIA','',0,'2015-08-24 09:10:57',1,'0000-00-00 00:00:00',0,'ACTIVO'),(283,'PUCKER MACULAR','',0,'2015-08-26 08:51:33',1,'0000-00-00 00:00:00',0,'ACTIVO'),(284,'PSEUDOFAQUIA','',0,'2015-08-26 08:51:47',1,'0000-00-00 00:00:00',0,'ACTIVO'),(287,'FUNCIONAL','',0,'2015-09-07 14:32:23',1,'0000-00-00 00:00:00',0,'ACTIVO'),(288,'YAG LASER','',0,'2015-09-07 14:32:35',1,'0000-00-00 00:00:00',0,'ACTIVO'),(289,'IRIDOTOMIA','',0,'2015-09-07 14:32:58',1,'0000-00-00 00:00:00',0,'ACTIVO'),(290,'TRATAMIENTO LASER','',0,'2015-09-07 14:34:08',1,'0000-00-00 00:00:00',0,'ACTIVO'),(291,'RESULTADOS','',0,'2015-09-07 14:34:30',1,'0000-00-00 00:00:00',0,'ACTIVO'),(292,'CONTROL DE CIRUGIA','',0,'2015-09-07 14:34:51',1,'0000-00-00 00:00:00',0,'ACTIVO'),(293,'IOP','',0,'2015-09-07 14:35:48',1,'0000-00-00 00:00:00',0,'ACTIVO'),(294,'IOL MASTER','',0,'2015-09-07 14:36:21',1,'0000-00-00 00:00:00',0,'ACTIVO'),(295,'EXAMENES','',0,'2015-09-07 14:37:04',1,'0000-00-00 00:00:00',0,'ACTIVO'),(296,'CONSULTA','',0,'2015-09-11 12:03:13',1,'0000-00-00 00:00:00',0,'ACTIVO'),(307,'CITA CANCELADA','',0,'2015-10-08 10:31:10',1,'0000-00-00 00:00:00',0,'ACTIVO'),(308,'MEDICAMENTOS','',0,'2015-10-08 10:31:20',1,'0000-00-00 00:00:00',0,'ACTIVO'),(309,'POSTFECHADO','',0,'2015-10-08 10:31:42',1,'0000-00-00 00:00:00',0,'ACTIVO'),(325,'TRATAMIENTO','',0,'2016-07-11 17:16:16',1,'0000-00-00 00:00:00',0,'ACTIVO'),(326,'prueba','prueba',1,'2022-03-21 11:20:09',1,NULL,NULL,'ACTIVO');

/*Table structure for table `notificaciones` */

DROP TABLE IF EXISTS `notificaciones`;

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` longblob NOT NULL,
  `mensaje` longblob NOT NULL,
  `destinatario` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatusnot` enum('NOTIFICADO','LEIDO','NO LEIDO') NOT NULL DEFAULT 'NOTIFICADO',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `destinatario` (`destinatario`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`destinatario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notificaciones` */

/*Table structure for table `operarios` */

DROP TABLE IF EXISTS `operarios`;

CREATE TABLE `operarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `operarios_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operarios` */

/*Table structure for table `ordeningreso` */

DROP TABLE IF EXISTS `ordeningreso`;

CREATE TABLE `ordeningreso` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idmodelo` int(11) DEFAULT NULL,
  `idmarca` int(11) DEFAULT NULL,
  `observaciones` longblob,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaingreso` datetime DEFAULT NULL,
  `fechaentrega` datetime DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `cotizacion` decimal(10,2) DEFAULT NULL,
  `liberacion` int(1) DEFAULT NULL,
  `equipom` int(1) DEFAULT NULL,
  `reemplazos` int(1) DEFAULT NULL,
  `software` int(1) DEFAULT NULL,
  `observacionen` longblob,
  `celularad` varchar(10) DEFAULT NULL,
  `estatus` enum('NUEVO','ACTIVO','INACTIVO','ENTREGADO','EN REVISIÓN','EN REPARACIÓN','REPARADO','POR ENTREGAR','DEVUELTO') DEFAULT 'NUEVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ordeningreso` */

/*Table structure for table `pacientes` */

DROP TABLE IF EXISTS `pacientes`;

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` longblob NOT NULL,
  `apellidos` longblob NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `direccion` longblob,
  `telefono` varchar(40) DEFAULT NULL,
  `correo` longblob NOT NULL,
  `idhistorialc` int(11) DEFAULT NULL,
  `idenfermedades` int(11) DEFAULT NULL,
  `idgenero` int(11) DEFAULT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `idprofesion` int(11) DEFAULT NULL,
  `nombresemer` longblob,
  `telefonoemer` varchar(40) DEFAULT NULL,
  `direccionemer` longblob,
  `fechanac` date DEFAULT NULL,
  `tiposangre` varchar(2) DEFAULT NULL,
  `antecedentesp` longblob,
  `antecedenteso` longblob,
  `antecedentesf` longblob,
  `enfermedada` longblob,
  `alerta` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuarioc` (`usuariocreacion`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `pacientes` */

insert  into `pacientes`(`id`,`nombres`,`apellidos`,`cedula`,`direccion`,`telefono`,`correo`,`idhistorialc`,`idenfermedades`,`idgenero`,`idciudad`,`idprofesion`,`nombresemer`,`telefonoemer`,`direccionemer`,`fechanac`,`tiposangre`,`antecedentesp`,`antecedenteso`,`antecedentesf`,`enfermedada`,`alerta`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`estatus`) values (12,'JOHNNY EDINSON','GONZALEZ LAINEZ','0918857244','BASTION POPULAR BLOQUE 5 MZ. 859 SL. 13',NULL,'golay8@hotmail.com',NULL,NULL,1,10901,316,NULL,'','','1978-07-19','','','','','','',0,'2022-05-10 15:56:36',NULL,10014,NULL,'ACTIVO'),(13,'SONNIA MARIA ',' UBILLUS MENDOZA','0701582637','URB. MATICES MZ. 46 V.35',NULL,'sonniaubillus26hotmail.com',NULL,NULL,2,10901,285,NULL,'','','1962-04-26','','','','','','',0,'2022-05-10 16:00:59',NULL,10014,NULL,'ACTIVO'),(14,'KEVIN JAVIER','SERRANO UBILLUS','0704706837','URB. MATICES MZ. 46 V.35 TELF. 				0989509679',NULL,'sonniaubillus26hotmail.com',NULL,NULL,1,10901,286,NULL,'','','1996-04-22','','','','','','',0,'2022-05-10 16:04:01',NULL,10014,NULL,'ACTIVO'),(15,'JOSE ANTONIO ','CATUTO RODRIGUEZ','0911023943','GUASMO SUR OESTE MZ. K10 ',NULL,'ma.josecatuto@live.com',NULL,NULL,1,10901,316,NULL,'','','1968-12-04','','','','','','',0,'2022-05-10 16:06:29',NULL,10014,NULL,'ACTIVO'),(16,'ADISH ','NAIR ALBAN','0958728354','KM 11.5 VIA A LA COSTA',NULL,'denys_albancampbell@yahoo.com',NULL,NULL,1,10901,286,NULL,'','','2014-04-24','','','','','','',0,'2022-05-10 16:09:33',NULL,10014,NULL,'ACTIVO'),(17,'IVAN RAFAEL ','ANDRADE RODRIGUEZ','0932768070','VIA A LA COSTA URB. CIUDAD OLIMPO 3',NULL,'krodriguezaveiga2@gamail.com',NULL,NULL,1,10901,286,NULL,'','','2015-04-28','','','','','','',0,'2022-05-10 16:11:26',NULL,10014,NULL,'ACTIVO'),(18,'DENYS MARIA ',' ALBAN CAMPBELL','0920230455','KM 11.5 VIA A LA COSTA',NULL,'denys_albancampbell@yahoo.com',NULL,NULL,2,10901,285,NULL,'','','1980-11-20','','','','','','',0,'2022-05-10 16:13:24',NULL,10014,NULL,'ACTIVO'),(19,'EISIS TERESA','BONE MINA ','0914035811','VILLA BONITA ',NULL,'raulgersonv@hotmail.com',NULL,NULL,2,10901,285,NULL,'','','1968-11-12','','','','','','',0,'2022-05-10 16:15:58',NULL,10014,NULL,'ACTIVO'),(20,'Jessenia Stefania','Viñan Guaman','0951079474','MAPASINGUE ESTE COOP. COLINAS DE URDENOR',NULL,'stefyvg_26@hotmail.com',NULL,NULL,2,10901,114,NULL,'','','1994-09-26','','','','papa hta','','',0,'2022-05-11 09:09:49','2022-05-11 09:09:49',10014,10022,'ACTIVO'),(21,'Imanol Alexander','Terranova Macias','1208001998','Cdla. 1ero de diciembre ',NULL,'icleamacias2019@gmail.com',NULL,NULL,1,11201,310,NULL,'','','2008-08-24','','','cix estrabismo od  2011 ','abuela diabetica ','medias 3 años \r\nod   -8.00 -0.75 x 180\r\noi     -8.00 -0.75 x 180 ','',0,'2022-05-11 10:01:36','2022-05-11 10:01:36',10014,10022,'ACTIVO'),(22,'Piedad Abigail','Merino Rosero','0904643178','Mapasingue Oeste',NULL,'camilagil020@gmail.com',NULL,NULL,2,10901,285,NULL,'','','1943-08-16','','','','','catarata oi>od','',0,'2022-05-18 10:54:56','2022-05-18 10:54:56',10014,10022,'ACTIVO'),(23,'Gilma Bertha','Merino Rosero','0600210587','Mapasingue Oeste',NULL,'camilagil020@gmail.com',NULL,NULL,2,10901,285,NULL,'','','1937-05-11','','','cancer od   2016','','rx en uso \r\nOd.i n /+3.00 bifoc inv . ','',0,'2022-05-11 10:56:56','2022-05-11 10:56:56',10014,10022,'ACTIVO'),(24,'Fernando Antonio','Bernita Indacochea','0918070517','Balzar',NULL,'fernadobernita64@gmail.com',NULL,NULL,1,10904,321,NULL,'','','1976-11-13','','hta  1 dia ','seudomonas  oi, razon de la enucleacion. 2016.','papa hta y glaucoma. ','rx en uso \r\nao   +0.50/ +1.25  bifocal invis\r\n','',0,'2022-05-11 14:41:32','2022-05-11 14:41:32',10014,10022,'ACTIVO'),(25,'vanessa','tomala calle','0915617187','via a la costa',NULL,'vanessa@hotmail.com',NULL,NULL,2,150,285,NULL,'','','2022-05-11','','','','','','',0,'2022-05-25 16:08:48','2022-05-25 16:08:48',10014,1,'ACTIVO'),(26,'ALFREDO','ESPINOZA MUÑOZ','0900567215','ALBORADA 6ETAPA MZ. 6 V.1',NULL,'drespinoza2604@hotmail.com',NULL,NULL,1,10901,64,NULL,'','','1946-04-26','','hta ,  diabetico 2000','','','','',0,'2022-05-18 08:55:07','2022-05-18 08:55:07',10014,10022,'ACTIVO'),(27,'JORGE WASHINGTON','IBAÑEZ GOMEZ','0700902752','ALBORADA 6 ETAPA MZ. 666 SL. 8',NULL,'femoribcia@yahoo.com.ar',NULL,NULL,1,10901,66,NULL,'','','1954-12-29','','','glaucoma','','','',0,'2022-05-18 09:06:11','2022-05-18 09:06:11',10014,10022,'ACTIVO'),(28,'PETITA VALERIANA','MENDEZ PRECIADO','0907905426','18AVA E/PEDRO PABLO GOMEZ Y ALCEDO',NULL,'damarisplua2001@gmail.com',NULL,NULL,2,10901,285,NULL,'','','1964-01-28','','','olof x1 6meses. ciprodex 10 noches c2 meses, hylo dual x4 ao.','','od lagrimeo, pero no se ve la lagrimas. ','',0,'2022-05-18 11:47:03','2022-05-18 11:47:03',10014,10019,'ACTIVO'),(29,'LUIS GUILLERMO','CASAL MURILLO','0900013889','ALBORADA 14AVA ETAPA MZ. 10 V. 3',NULL,'luis@gmail.com',NULL,NULL,1,10901,299,NULL,'','','1945-06-02','','hta  2012','','','','',0,'2022-05-18 12:30:22','2022-05-18 12:30:22',10014,10022,'ACTIVO'),(30,'ARTURO EDUARDO','ESPINOZA RAMIREZ','0904275211','ARGENTINA 2913 E/ LEONIDAS PLAZA Y GUERRERO MARTINEZ',NULL,'arturo@gmail.com',NULL,NULL,1,10901,299,NULL,'','','1954-03-01','','','cix catarata ao 2012','','','',0,'2022-05-18 12:33:15','2022-05-18 12:33:15',10014,10022,'ACTIVO'),(31,'NATHALY VALERIA','IÑIGUEZ GARCIA','0952363091','CDLA COVIEM MZ. 45 V. 4',NULL,'javybonus@gmail.com',NULL,NULL,2,10901,310,NULL,'','','2008-03-03','','','','','anemia ','',0,'2022-05-18 13:03:49','2022-05-18 13:03:49',10014,10022,'ACTIVO'),(32,'XAVIER GERMANICO','RAMOS TRUJILLO','1801791243','SAUCES 1',NULL,'xramostrujillo@gmail.com',NULL,NULL,1,10901,114,NULL,'','','1968-08-28','','','','mama  hta .  glaucoma ','','',0,'2022-05-20 09:44:51','2022-05-20 09:44:51',10014,10022,'ACTIVO'),(33,'ALBA PATRICIA','OCAÑA PALACIOS','1802737177','SAUCES 1',NULL,'xramostrujillo@gmail.com',NULL,NULL,2,10901,285,NULL,'','','1975-07-27','','','','mama hta , abuela diabetica . ','','',0,'2022-05-20 10:03:01','2022-05-20 10:03:01',10014,10022,'ACTIVO'),(34,'ANGELA ANITA','CHALEN VELIZ ','0907686224','MUCHO LOTE 1 ',NULL,'anitachalen@gmail.com',NULL,NULL,2,10901,64,NULL,'','','1961-08-02','','','','','','',0,'2022-05-20 10:16:34','2022-05-20 10:16:34',10014,10022,'ACTIVO'),(35,'ANGELA MAGDALENA','SELLAN ACOSTA','0909939019','45 Y LA G',NULL,'angelasellan@hotmail.com',NULL,NULL,2,10901,285,NULL,'','','1966-05-27','','','','','','',0,'2022-05-20 10:33:19','2022-05-20 10:33:19',10014,10022,'ACTIVO'),(36,'WILSON COLON','SORNOZA DELGADO','1305846451','SAN PAULO DE PUEBLO NUEVO',NULL,'sornoza@gmail.com',NULL,NULL,1,11308,321,NULL,'','','1963-05-10','','TRAUMA OCULAR OJO DERECHO HACE 2 MESES','TRAUMA OCULAR CON HERIDA ABIERTA AUTOSELLADA','mama diabetica / hta','','',0,'2022-05-27 09:13:55','2022-05-27 09:13:55',10014,10018,'ACTIVO'),(37,'LUIS ANTONIO','ARTEAGA  VERA','0902160258','NAVAL NORTE',NULL,'luisartegag@gmail.com',NULL,NULL,1,10901,299,NULL,'','','1951-04-26','','Diabetes / Hta','','','','',0,'2022-05-27 09:31:41','2022-05-27 09:31:41',10014,10022,'ACTIVO'),(38,'Carlos Gabriel','Suarez Proaño','0911113009','chember 5508 y la 29',NULL,'casupro@hotmail.com',NULL,NULL,1,10901,313,NULL,'','','1968-07-27','','','','hta  padres.','','',0,'2022-05-24 09:50:39','2022-05-24 09:50:39',10014,10022,'ACTIVO'),(39,'Oswaldo Perez','Jorge A','0923136021','edwed','0987418663','recepcion123@gmail.com',NULL,NULL,1,10703,26,NULL,'','','1984-05-03','o+','','','','','nnn',0,'2022-05-24 10:41:56',NULL,10014,NULL,'ACTIVO'),(40,'Jesus Cristobal','Gutierrez Morales','0905414942','Cla Vergeles Mz. 113 V. 43','0958738191','jesusmisil1@hotmail.com',NULL,NULL,1,10901,299,NULL,'','','1955-10-30','','hta 2017','','','','',0,'2022-05-24 14:16:24','2022-05-24 14:16:24',10014,10022,'ACTIVO'),(41,'Angelita Judith','Merino Rosero','1300888953','Mapasingue Oeste','0997026079','camilagil@hotmail.com',NULL,NULL,2,10901,299,NULL,'','','1934-12-20','','hta. 2012','herpes  / cix derrame  oi\r\ngolpe fuerte od ','','','',0,'2022-05-25 12:33:28','2022-05-25 12:33:28',10014,10022,'ACTIVO'),(42,'Luis Enrique','Salazar Neiza','0903211340','Mapasingue oeste','0997026079','camilagil@hotmail.com',NULL,NULL,1,10901,299,NULL,'','','1937-05-24','','','','','','',0,'2022-05-25 11:50:30','2022-05-25 11:50:30',10014,10022,'ACTIVO'),(43,'Piedad Elena','Iturralde Espinoza','0600860696','San Eduardo Mz. 282 Sl. 19','044620695','ORLANDOHERMIDA@YAHOO.COM',NULL,NULL,2,10901,285,NULL,'','','1953-06-09','','diabetes.','operación catarata ao','','','',0,'2022-05-27 10:11:26','2022-05-27 10:11:26',10014,10022,'ACTIVO'),(44,'Matias Gael','Cordova Zambrano','0962248191','Bastion popular bloque 1A','0962092713','estebancordovagall@hotmail.com',NULL,NULL,1,10901,310,NULL,'','','2018-02-27','',' PROCESO RESPIRATORIO','NO REFIERE','TIOS Y PADRE USA LENTES','PACIENTE DE 4 ANOS ACUDE POR PARPADEO DESDE HACE 5 DIAS  Y NOTA QUE SE ACERCA PARA VER','',0,'2022-05-27 10:59:25','2022-05-27 10:59:25',10014,10015,'ACTIVO'),(45,'Washington Enrique','Benites Bermeo','0900487745','San Martin 4325 y la 19ava','44614177','recepcion@mir.com.ec',NULL,NULL,1,10901,299,NULL,'','','1946-10-29','','hta ','','','','',0,'2022-05-27 11:05:38','2022-05-27 11:05:38',10014,10022,'ACTIVO');

/*Table structure for table `pais` */

DROP TABLE IF EXISTS `pais`;

CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(10) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `pais` */

insert  into `pais`(`id`,`nombre`,`sufijo`,`fechacreacion`,`usuariocreacion`,`estatus`) values (1,'ECUADOR','ECU','2022-03-22 11:45:25',1,'ACTIVO');

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `nombres` longblob NOT NULL,
  `direccion` longblob NOT NULL,
  `telefono` longblob NOT NULL,
  `idzona` int(11) NOT NULL DEFAULT '1',
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `recargo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatuspedido` enum('NUEVO','ACEPTADO','PREPARANDO','EN CAMINO','ENTREGADO','CANCELADO','CANCELADO R') NOT NULL DEFAULT 'NUEVO',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idcliente` (`idcliente`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idzona` (`idzona`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `user` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`idzona`) REFERENCES `pedidozona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidos` */

/*Table structure for table `pedidosdetalle` */

DROP TABLE IF EXISTS `pedidosdetalle`;

CREATE TABLE `pedidosdetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `combo` longblob,
  `nombreprod` longblob NOT NULL,
  `descripcion` longblob,
  `observacion` longblob,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idpedido` (`idpedido`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `pedidosdetalle_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `pedidosdetalle_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `pedidosdetalle_ibfk_3` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pedidosdetalle` */

/*Table structure for table `pedidozona` */

DROP TABLE IF EXISTS `pedidozona`;

CREATE TABLE `pedidozona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longblob NOT NULL,
  `observacion` longblob NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `pedidominimo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`,`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pedidozona` */

/*Table structure for table `periodofiscal` */

DROP TABLE IF EXISTS `periodofiscal`;

CREATE TABLE `periodofiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` longblob NOT NULL,
  `anioinicio` year(4) NOT NULL,
  `aniofin` year(4) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO','CERRADO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `periodofiscal_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `periodofiscal` */

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `historiaclinica` bigint(20) NOT NULL,
  `iddiagnostico` bigint(20) NOT NULL,
  `tiempo` int(11) NOT NULL,
  `desde` date NOT NULL,
  `hasta` date NOT NULL,
  `contenido` longblob,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechau` datetime DEFAULT NULL,
  `usuarioc` int(11) NOT NULL,
  `usuariou` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permisos` */

/*Table structure for table `presentacion` */

DROP TABLE IF EXISTS `presentacion`;

CREATE TABLE `presentacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(1) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `presentacion_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `presentacion` */

/*Table structure for table `produccion` */

DROP TABLE IF EXISTS `produccion`;

CREATE TABLE `produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo` varchar(100) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` longblob NOT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `cierre` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `usuariogencosto` int(11) DEFAULT NULL,
  `fechagencosto` datetime DEFAULT NULL,
  `costoproduccion` decimal(10,3) DEFAULT NULL,
  `usuariocierra` int(11) DEFAULT NULL,
  `fechacierra` datetime DEFAULT NULL,
  `unidadesprod` decimal(10,3) DEFAULT NULL,
  `kilosprod` decimal(10,3) DEFAULT NULL,
  `materialprep` float(10,3) DEFAULT NULL,
  `desperdicio` float(10,3) DEFAULT NULL,
  `diferencia` float(10,3) DEFAULT NULL,
  `movprodterminado` int(11) DEFAULT NULL,
  `costoprodadicional` float(10,3) DEFAULT NULL,
  `unidadsec` int(11) DEFAULT NULL,
  `rangodefadicional` float(10,3) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `produccion` */

/*Table structure for table `produccionoperarios` */

DROP TABLE IF EXISTS `produccionoperarios`;

CREATE TABLE `produccionoperarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `operario` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `produccionoperarios` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `codigonew` varchar(50) DEFAULT NULL,
  `nombreproducto` varchar(200) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `tipoproducto` int(11) NOT NULL,
  `idpresentacion` int(11) DEFAULT NULL,
  `descuento` decimal(10,3) DEFAULT NULL,
  `grabaiva` int(1) DEFAULT '1',
  `stockinicial` decimal(10,3) DEFAULT NULL,
  `stockactual` decimal(10,3) DEFAULT NULL,
  `stockmaximo` decimal(10,3) DEFAULT NULL,
  `stockminimo` decimal(10,3) DEFAULT NULL,
  `costoant` decimal(10,3) DEFAULT NULL,
  `costoini` decimal(10,3) DEFAULT NULL,
  `costo` decimal(10,3) DEFAULT NULL,
  `costofob` decimal(10,3) DEFAULT NULL,
  `precio` decimal(10,3) DEFAULT NULL,
  `preciodist2` decimal(10,3) DEFAULT NULL,
  `preciodist3` decimal(10,3) DEFAULT NULL,
  `preciopvp` decimal(10,3) DEFAULT NULL,
  `inicialant` decimal(10,3) DEFAULT NULL,
  `caracteristicas` varchar(200) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT '1',
  `ultimacompra` date DEFAULT NULL,
  `numeroultc` int(11) DEFAULT NULL,
  `cantidadultc` int(11) DEFAULT NULL,
  `unibulto` decimal(10,3) DEFAULT NULL,
  `ultimaventa` date DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `facturacost` decimal(10,3) DEFAULT NULL,
  `porfacturacost` decimal(10,3) DEFAULT NULL,
  `usuactprecio` int(11) DEFAULT NULL,
  `fechaactprecio` datetime DEFAULT NULL,
  `idpresentacionsec` int(11) DEFAULT NULL,
  `coeficiente` decimal(10,3) DEFAULT NULL,
  `preciomayor` decimal(10,3) DEFAULT NULL,
  `caracteristica` int(11) DEFAULT NULL,
  `noinccosteo` decimal(10,3) DEFAULT NULL,
  `usuarioactcosto` int(11) DEFAULT NULL,
  `fechaactcosto` datetime DEFAULT NULL,
  `costoprod` decimal(10,3) DEFAULT NULL,
  `materialprep` decimal(10,3) DEFAULT NULL,
  `desperdicio` decimal(10,3) DEFAULT NULL,
  `codigoalterno` varchar(50) DEFAULT NULL,
  `marca` int(11) DEFAULT '1',
  `codigoprov` longblob,
  `color` int(11) DEFAULT '1',
  `costototprod` decimal(10,3) DEFAULT NULL,
  `unidadsechabil` int(11) DEFAULT NULL,
  `unidadsecinv` int(11) DEFAULT NULL,
  `unidadsecinvdesde` int(11) DEFAULT NULL,
  `unidadsecinvhasta` int(11) DEFAULT NULL,
  `unidadseccostounit` int(11) DEFAULT NULL,
  `unidadseccostoprod` int(11) DEFAULT NULL,
  `unidadseccostounitant` int(11) DEFAULT NULL,
  `tiempotarea` int(11) DEFAULT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `actualizaprecio` int(11) DEFAULT NULL,
  `modelo` int(11) NOT NULL DEFAULT '1',
  `idempresa` int(11) NOT NULL DEFAULT '1',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`,`idempresa`,`tipoproducto`),
  KEY `tipoproducto` (`tipoproducto`),
  KEY `idempresa` (`idempresa`),
  KEY `idproveedor` (`idproveedor`),
  KEY `modelo` (`modelo`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `productos_ibfk_4` (`marca`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `productos_ibfk_5` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

/*Table structure for table `productos2` */

DROP TABLE IF EXISTS `productos2`;

CREATE TABLE `productos2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longblob,
  `link` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `usuariocreacion` varchar(55) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `orden` int(11) NOT NULL DEFAULT '0',
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productos2` */

/*Table structure for table `profesion` */

DROP TABLE IF EXISTS `profesion`;

CREATE TABLE `profesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sectipo` int(11) DEFAULT '0',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `profesion_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;

/*Data for the table `profesion` */

insert  into `profesion`(`id`,`nombre`,`sectipo`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`usuarioact`,`fechaact`,`estatus`) values (1,'N/A',1,0,1,'2022-03-21 11:42:08',NULL,NULL,'ACTIVO'),(14,'Abogado',1,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(15,'Académico',2,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(16,'Administrador',3,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(17,'Agrónomo',4,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(18,'Alergólogo',5,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(19,'Anatomista',6,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(20,'Anestesiólogo',7,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(21,'Antropólogo',8,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(22,'Archivero',9,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(23,'Arqueólogo',10,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(24,'Arquitecto',11,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(25,'Asesor',12,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(26,'Asistente',13,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(27,'Astrofísico',14,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(28,'Astrólogo',15,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(29,'Astrónomo',16,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(30,'Atleta',17,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(31,'Autor',18,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(32,'Autora',19,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(33,'Auxiliar',20,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(34,'Bacteriólogo',21,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(35,'Bibliógrafo',22,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(36,'Bibliotecario',23,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(37,'Biofísico',24,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(38,'Biógrafo',25,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(39,'Biólogo',26,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(40,'Bioquímico',27,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(41,'Botánico',28,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(42,'Cancerólogo',29,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(43,'Cardiólogo',30,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(44,'Cartógrafo',31,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(45,'Catedrático',32,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(46,'Cirujano',33,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(47,'Climatólogo',34,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(48,'Codirector',35,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(49,'Consejero',36,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(50,'Conserje',37,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(51,'Coordinador',38,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(52,'Cosmólogo',39,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(53,'Criminalista',40,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(54,'Decano',41,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(55,'Decorador',42,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(56,'Defensor',43,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(57,'Delegado',44,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(58,'Dentista',45,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(59,'Dermatólogo',46,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(60,'Dibujante',47,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(61,'Directivo',48,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(62,'Director',49,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(63,'Dirigente',50,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(64,'Doctor',51,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(65,'Ecólogo',52,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(66,'Economista',53,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(67,'Educador',54,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(68,'Egiptólogo',55,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(69,'Endocrinólogo',56,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(70,'Enfermero',57,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(71,'Enólogo',58,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(72,'Entomólogo',59,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(73,'Epidemiólogo',60,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(74,'Especialista',61,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(75,'Estadista',62,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(76,'Estadístico',63,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(77,'Etimólogo',64,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(78,'Etnógrafo',65,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(79,'Etnólogo',66,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(80,'Etólogo',67,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(81,'Examinador',68,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(82,'Farmacéutico',69,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(83,'Farmacólogo',70,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(84,'Filósofo',71,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(85,'Fiscal',72,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(86,'Físico',73,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(87,'Fisiólogo',74,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(88,'Fisioterapeuta',75,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(89,'Fonólogo',76,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(90,'Forense',77,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(91,'Fotógrafo',78,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(92,'Funcionaria',79,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(93,'Genetista',80,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(94,'Geobotánica',81,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(95,'Geofísico',82,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(96,'Geógrafo',83,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(97,'Geólogo',84,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(98,'Geómetra',85,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(99,'Geoquímica',86,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(100,'Gerente',87,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(101,'Geriatra',88,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(102,'Gerontólogo',89,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(103,'Gestor',90,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(104,'Grabador',91,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(105,'Graduado social',92,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(106,'Grafólogo',93,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(107,'Gramático',94,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(108,'Hematólogo',95,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(109,'Hepatóloga',96,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(110,'Hidrógrafo',97,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(111,'Historiador',98,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(112,'Homeópata',99,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(113,'Informático',100,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(114,'Ingeniera',101,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(115,'Ingeniera técnica',102,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(116,'Ingeniero',103,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(117,'Ingeniero técnico',104,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(118,'Inmunólogo',105,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(119,'Inspector',106,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(120,'Investigador',107,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(121,'Jardinero',108,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(122,'Jefe',109,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(123,'Juez',110,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(124,'Lexicógrafo',111,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(125,'Licenciado',112,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(126,'Lingüista',113,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(127,'Maestro',114,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(128,'Matemático',115,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(129,'Medico',116,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(130,'Meteorólogo',117,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(131,'Microbiológico',118,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(132,'Microcirujano',119,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(133,'Nefrólogo',120,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(134,'Neumólogo',121,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(135,'Neurobiólogo',122,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(136,'Neurocirujano',123,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(137,'Neurólogo',124,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(138,'Nutrólogo',125,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(139,'Oceanógrafo',126,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(140,'Odontólogo',127,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(141,'Oficial',128,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(142,'Oficinista',129,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(143,'Oftalmólogo',130,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(144,'Oncólogo',131,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(145,'Óptico',132,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(146,'Optometrista',133,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(147,'Orientador',134,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(148,'Ortopedista',135,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(149,'Paleontólogo',136,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(150,'Patólogo',137,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(151,'Pedagogo',138,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(152,'Pediatra',139,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(153,'Periodista',140,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(154,'Presidente',141,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(155,'Profesor',142,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(156,'Programador',143,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(157,'Psicoanalista',144,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(158,'Psicólogo',145,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(159,'Psicopedagogo',146,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(160,'Psicoterapeuta',147,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(161,'Psiquiatra',148,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(162,'Publicista',149,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(163,'Químico',150,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(164,'Quiropráctico',151,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(165,'Radiólogo',152,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(166,'Radiotécnico',153,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(167,'Rector',154,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(168,'Secretario',155,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(169,'Sexólogo',156,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(170,'Sismólogo',157,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(171,'Sociólogo',158,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(172,'Subdirector',159,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(173,'Subsecretario',160,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(174,'Técnico',161,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(175,'Telefonista',162,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(176,'Teólogo',163,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(177,'Terapeuta',164,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(178,'Toxicólogo',165,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(179,'Traductor',166,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(180,'Transcriptor',167,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(181,'Traumatólogo',168,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(182,'Urólogo',169,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(183,'Veterinario',170,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(184,'Vicedecano',171,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(185,'Vicedirector',172,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(186,'Vicegerente',173,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(187,'Vicepresidente',174,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(188,'Vicerrector',175,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(189,'Vulcanólogo',176,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(190,'Zoólogo',177,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(285,'AMA DE CASA',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(286,'ESTUDIANTE',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(299,'JUBILADO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(300,'CHOFER',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(301,'COMERCIANTE',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(302,'POLICIA ACTIVO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(303,'POLICIA PASIVO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(304,'PASTOR',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(305,'DISEÑADOR',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(306,'EMPRESARIO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(310,'MENOR',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(311,'DOCENTE UNIVERSITARIO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(313,'MECANICO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(314,'EJECUTIVO (A)',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(315,'CONTADOR',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(316,'EMPLEADO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(317,'EMPLEADO PUBLICO',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(318,'COORDINADORA DE EVENTOS',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(319,'GINECOLOGA',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(321,'AGRICULTOR',0,0,1,'2022-03-14 08:40:35',1,'2022-03-21 12:07:50','ACTIVO'),(322,'RELIGIOSA',0,0,1,'2022-03-14 08:40:35',NULL,NULL,'ACTIVO'),(323,'rererger',0,1,1,'2022-03-21 12:01:27',NULL,NULL,'ACTIVO');

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob,
  `direccion` longblob,
  `telefono` varchar(60) DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  `extranjero` int(1) DEFAULT '0',
  `natural` int(1) DEFAULT '0',
  `tipoiden` int(1) DEFAULT '1',
  `identificacion` varchar(13) DEFAULT NULL,
  `contacto` longblob,
  `fax` varchar(30) DEFAULT NULL,
  `correo` longblob,
  `ciudad` int(11) DEFAULT NULL,
  `pais` int(11) DEFAULT '1',
  `notas` longblob,
  `debito` decimal(10,3) DEFAULT NULL,
  `credito` decimal(10,3) DEFAULT '0.000',
  `ultimopago` datetime DEFAULT NULL,
  `ultimafactura` datetime DEFAULT NULL,
  `cuentacontable` longblob,
  `autorizacion` longblob,
  `validez` date DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` datetime DEFAULT NULL,
  `comprobanteelec` int(1) DEFAULT NULL,
  `cuentaanticipo` longblob,
  `razoncomercial` longblob,
  `barrio` int(11) DEFAULT NULL,
  `obligadoconta` int(1) DEFAULT '0',
  `provincia` int(1) NOT NULL DEFAULT '1',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `proveedores` */

/*Table structure for table `provincias` */

DROP TABLE IF EXISTS `provincias`;

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpais` int(11) NOT NULL DEFAULT '1',
  `nombre` longblob,
  `codigo` int(11) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) DEFAULT '1',
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table `provincias` */

insert  into `provincias`(`id`,`idpais`,`nombre`,`codigo`,`fechacreacion`,`usuariocreacion`,`fechaact`,`usuarioact`,`estatus`) values (22,6,'VALLE',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(23,7,'ASUNCION',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(24,6,'ANTIOQUIA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(107,1,'EL ORO',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(108,1,'ESMERALDAS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(109,1,'GUAYAS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(112,1,'LOS RIOS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(113,1,'MANABI',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(201,1,'AZUAY',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(202,1,'BOLIVAR',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(203,1,'CAÑAR',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(204,1,'CARCHI',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(205,1,'COTOPAXI',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(206,1,'CHIMBORAZO',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(210,1,'IMBABURA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(211,1,'LOJA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(217,1,'PICHINCHA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(218,1,'TUNGURAHUA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(224,1,'SANTO DOMINGO DE LOS TSACHILAS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(314,1,'MORONA SANTIAGO',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(315,1,'NAPO',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(316,1,'PASTAZA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(319,1,'ZAMORA CHINCHIPE',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(321,1,'SUCUMBIOS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(322,1,'ORELLANA',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(420,1,'GALAPAGOS',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(999,1,'VERIFICAR',0,'2022-03-22 11:49:55',1,NULL,NULL,'ACTIVO'),(1000,6,'CUCUTA',NULL,'2015-06-22 16:51:26',1,NULL,NULL,'ACTIVO');

/*Table structure for table `recaudaciones` */

DROP TABLE IF EXISTS `recaudaciones`;

CREATE TABLE `recaudaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('ABONO','PAGO TOTAL') DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `estatus` enum('ACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recaudaciones` */

/*Table structure for table `receta` */

DROP TABLE IF EXISTS `receta`;

CREATE TABLE `receta` (
  `int` bigint(20) NOT NULL AUTO_INCREMENT,
  `historiaclinica` bigint(20) NOT NULL,
  `idmedicamento` bigint(20) NOT NULL,
  `volumen` varchar(100) NOT NULL,
  `administracion` longblob NOT NULL,
  `observacion` longblob NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechau` datetime DEFAULT NULL,
  `usuarioc` int(11) NOT NULL,
  `usuariou` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`int`,`estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `receta` */

/*Table structure for table `recetamedica` */

DROP TABLE IF EXISTS `recetamedica`;

CREATE TABLE `recetamedica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `iddiagnostico` int(11) NOT NULL,
  `medicamento` longblob NOT NULL,
  `prescripcion` longblob NOT NULL,
  `isDeleted` int(1) DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaact` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idconsulta`),
  KEY `usuariocreacion` (`usuariocreacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recetamedica` */

/*Table structure for table `retencioncxc` */

DROP TABLE IF EXISTS `retencioncxc`;

CREATE TABLE `retencioncxc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipoorigen` int(11) DEFAULT NULL,
  `origen` int(11) DEFAULT NULL,
  `rubro` int(11) DEFAULT NULL,
  `tiporetencion` int(11) DEFAULT NULL,
  `concepto` longblob,
  `porcentaje` decimal(10,2) DEFAULT NULL,
  `valorretenido` decimal(10,2) DEFAULT NULL,
  `baseimponible` decimal(10,2) DEFAULT NULL,
  `facturanum` int(11) DEFAULT NULL,
  `facturacanal` int(11) DEFAULT NULL,
  `debito` int(11) DEFAULT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  `tipodoc` int(11) DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `usuariodeclara` int(11) DEFAULT NULL,
  `fechadeclara` datetime DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `retencioncxc` */

/*Table structure for table `retenciones` */

DROP TABLE IF EXISTS `retenciones`;

CREATE TABLE `retenciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origencomprobante` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `serie` varchar(40) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `origen` int(11) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL,
  `rubro` int(11) NOT NULL,
  `tiporetencion` int(11) DEFAULT NULL,
  `concepto` longblob,
  `porcentaje` decimal(10,2) DEFAULT NULL,
  `valorretenido` decimal(10,2) DEFAULT NULL,
  `baseimponible` decimal(10,2) DEFAULT NULL,
  `comprobante` varchar(80) DEFAULT NULL,
  `tipocomprobante` int(11) DEFAULT NULL,
  `identificacion` varchar(13) DEFAULT NULL,
  `tipoidentificacion` int(11) DEFAULT NULL,
  `direccion` longblob,
  `ciudad` int(11) DEFAULT NULL,
  `beneficiario` longblob,
  `autorizacion` varchar(80) DEFAULT NULL,
  `validez` date DEFAULT NULL,
  `retencionaut` varchar(80) DEFAULT NULL,
  `tipodocumento` int(11) DEFAULT NULL,
  `usuariodeclara` int(11) DEFAULT NULL,
  `fechadeclara` datetime DEFAULT NULL,
  `declaracionmov` int(11) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`,`rubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `retenciones` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`nombre`,`descripcion`,`usuariocreacion`,`fechacreacion`,`usuarioact`,`fechaact`,`isDeleted`,`estatus`) values (1,'SuperAdmin','Usuario de Sistema',1,'2021-12-01 19:54:52',1,'2022-04-04 23:45:05',0,'ACTIVO'),(2,'Administrador','Usuario Administrador',1,'2021-12-01 20:59:14',NULL,NULL,0,'ACTIVO'),(3,'Facturacion','Facturacion',1,'2021-12-01 20:00:43',NULL,NULL,0,'ACTIVO'),(4,'Reportes','Reportes',1,'2021-12-01 20:00:55',NULL,NULL,0,'ACTIVO'),(5,'Bodega','Usuarios Bodega',1,'2021-12-01 20:01:23',NULL,NULL,1,'ACTIVO'),(6,'Comprobantes','Usuarios Comprobante',1,'2021-12-01 20:33:17',NULL,NULL,0,'ACTIVO'),(7,'SuperAdmin','Usuario de Sistema SA',1,'2021-12-01 20:58:22',1,'2022-04-01 17:34:03',1,'ACTIVO'),(28,'rol nuevo','rol nuevo',1,'2022-01-20 18:21:24',NULL,NULL,1,'ACTIVO'),(33,'sdsds','dsdsds',1,'2022-04-01 18:27:40',NULL,NULL,1,'ACTIVO'),(34,'sdsds','dsdsds',1,'2022-04-01 18:27:52',NULL,NULL,1,'ACTIVO'),(35,'sdsds','dsdsds',1,'2022-04-01 18:28:35',NULL,NULL,1,'ACTIVO'),(36,'Doctores','dsdsds',1,'2022-04-01 18:29:38',1,'2022-05-25 16:41:22',0,'ACTIVO'),(37,'Recepcion','Rol para recepcion',1,'2022-04-04 16:12:43',1,'2022-05-25 17:03:29',0,'ACTIVO'),(38,'prueba','prueba',1,'2022-04-04 16:55:47',NULL,NULL,1,'ACTIVO'),(39,'Optometrista','Rol para optometristas',1,'2022-04-22 10:29:35',1,'2022-05-25 16:49:06',0,'ACTIVO');

/*Table structure for table `rolesmodulo` */

DROP TABLE IF EXISTS `rolesmodulo`;

CREATE TABLE `rolesmodulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `nameint` longblob,
  `idmenu` int(11) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idmenu` (`idmenu`),
  CONSTRAINT `rolesmodulo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `rolesmodulo_ibfk_2` FOREIGN KEY (`idmenu`) REFERENCES `menuadmin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `rolesmodulo` */

insert  into `rolesmodulo`(`id`,`nombre`,`descripcion`,`nameint`,`idmenu`,`usuariocreacion`,`fechacreacion`,`isDeleted`,`estatus`) values (1,'Usuarios','MODULO USUARIOS','usuarios',19,1,'2021-12-01 20:52:34',0,'ACTIVO'),(2,'Contabilidad','MODULO CONTABLE','contabilidad',41,1,'2021-12-01 20:53:40',0,'ACTIVO'),(3,'Facturación','MODULA DE FACTURACIÓN','facturacion',9,1,'2021-12-01 20:54:07',0,'ACTIVO'),(4,'Inventario','MODULO DE INVENTARIO','inventario',2,1,'2021-12-01 20:54:31',0,'ACTIVO'),(5,'R. Humanos','MODULO DE RECURSOS HUMANOS','recursoshumanos',64,1,'2021-12-01 20:54:59',0,'ACTIVO'),(6,'Reportes','MODULO DE REPORTES','reportes',34,1,'2021-12-01 20:55:23',0,'ACTIVO'),(7,'Mantenimientos','MODULO DE MANTENIMIENTOS','mantenimiento',97,1,'2021-12-01 20:55:46',0,'ACTIVO'),(8,'Auditoria','MODULO DE AUDITORIA','sistema',157,1,'2021-12-01 20:56:12',0,'ACTIVO'),(9,'Configuraciones','MODULO DE CONFIGURACIONES GENERALES','configuraciones',5,1,'2021-12-01 20:56:51',0,'ACTIVO'),(11,'Sistema','MÓDULO DE SISTEMA','sistema',6,1,'2022-03-24 10:30:28',0,'ACTIVO'),(12,'Pacientes','MODULO DE PACIENTES','paciente',152,1,'2022-03-24 10:30:51',0,'ACTIVO'),(13,'Agendamientos','MÓDULO DE AGENDAMIENTOS','agendamiento',135,1,'2022-03-24 10:31:09',0,'ACTIVO'),(14,'Escritorio','ESCRITORIO DEL SISTEMA','menuescritorio',1,1,'2022-03-28 12:26:06',0,'ACTIVO');

/*Table structure for table `rolespermisodef` */

DROP TABLE IF EXISTS `rolespermisodef`;

CREATE TABLE `rolespermisodef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmodulo` int(11) NOT NULL,
  `idsubmodulo` int(11) DEFAULT NULL,
  `idmenu` int(11) DEFAULT NULL,
  `nombreint` longblob,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idmodulo` (`idmodulo`),
  CONSTRAINT `rolespermisodef_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `rolespermisodef_ibfk_2` FOREIGN KEY (`idmodulo`) REFERENCES `rolesmodulo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `rolespermisodef` */

insert  into `rolespermisodef`(`id`,`idmodulo`,`idsubmodulo`,`idmenu`,`nombreint`,`nombre`,`descripcion`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`estatus`) values (1,14,NULL,1,'menuescritorio','Escritorio',NULL,0,1,'2022-03-28 12:31:50','ACTIVO'),(2,1,NULL,19,'menuusuario','Usuarios',NULL,0,1,'2022-03-28 13:05:35','ACTIVO'),(3,14,NULL,NULL,'mensajes','Mensajes',NULL,0,1,'2022-04-01 11:02:19','ACTIVO'),(4,14,NULL,NULL,'notificaciones','Notificaciones',NULL,0,1,'2022-04-01 11:09:58','ACTIVO'),(7,1,NULL,19,'miperfil','Mi perfil',NULL,0,1,'2022-04-03 22:04:48','ACTIVO');

/*Table structure for table `rolespermisos` */

DROP TABLE IF EXISTS `rolespermisos`;

CREATE TABLE `rolespermisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `idsubmodulo` int(11) DEFAULT NULL,
  `descripcion` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idmodulo` (`idmodulo`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `rolespermisos_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `rolespermisos_ibfk_2` FOREIGN KEY (`idmodulo`) REFERENCES `rolesmodulo` (`id`),
  CONSTRAINT `rolespermisos_ibfk_3` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=870 DEFAULT CHARSET=utf8;

/*Data for the table `rolespermisos` */

insert  into `rolespermisos`(`id`,`idrol`,`idmodulo`,`idsubmodulo`,`descripcion`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`estatus`) values (10,2,1,NULL,'',0,1,'2021-12-01 20:59:57','ACTIVO'),(11,2,2,NULL,'',0,1,'2021-12-01 21:00:00','ACTIVO'),(12,2,3,NULL,'',0,1,'2021-12-01 21:00:03','ACTIVO'),(13,2,4,NULL,'',0,1,'2021-12-01 21:00:06','ACTIVO'),(14,2,5,NULL,'',0,1,'2021-12-01 21:00:09','ACTIVO'),(15,2,6,NULL,'',0,1,'2021-12-01 21:00:12','ACTIVO'),(16,2,7,NULL,'',0,1,'2021-12-01 21:00:15','ACTIVO'),(17,2,9,NULL,'',0,1,'2021-12-01 21:00:18','ACTIVO'),(75,7,1,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(76,7,2,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(77,7,3,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(78,7,4,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(79,7,5,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(80,7,6,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(81,7,7,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(82,7,8,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(83,7,9,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(84,7,11,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(85,7,12,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(86,7,13,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(87,7,14,NULL,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(88,7,9,47,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(89,7,9,48,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(90,7,9,49,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(91,7,9,50,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(92,7,1,51,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(93,7,1,52,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(94,7,9,58,NULL,0,1,'2022-04-01 17:34:03','ACTIVO'),(441,38,1,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(442,38,2,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(443,38,3,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(444,38,7,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(445,38,8,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(446,38,9,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(447,38,11,NULL,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(448,38,1,51,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(449,38,1,61,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(450,38,1,62,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(451,38,1,63,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(452,38,1,64,NULL,0,1,'2022-04-04 16:55:47','ACTIVO'),(492,1,1,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(493,1,2,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(494,1,3,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(495,1,4,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(496,1,5,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(497,1,6,NULL,NULL,0,1,'2022-04-04 23:45:05','ACTIVO'),(498,1,7,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(499,1,8,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(500,1,9,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(501,1,11,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(502,1,12,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(503,1,13,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(504,1,14,NULL,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(505,1,1,1,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(506,1,1,2,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(507,1,1,3,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(508,1,1,4,NULL,0,1,'2022-04-04 23:45:06','ACTIVO'),(509,1,2,5,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(510,1,2,6,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(511,1,2,7,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(512,1,2,8,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(513,1,2,9,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(514,1,2,10,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(515,1,2,11,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(516,1,2,12,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(517,1,2,13,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(518,1,2,14,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(519,1,2,15,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(520,1,2,16,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(521,1,2,17,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(522,1,2,18,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(523,1,2,19,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(524,1,2,20,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(525,1,2,21,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(526,1,2,22,NULL,0,1,'2022-04-04 23:45:07','ACTIVO'),(527,1,2,23,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(528,1,2,24,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(529,1,2,25,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(530,1,2,26,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(531,1,2,27,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(532,1,2,28,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(533,1,3,29,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(534,1,3,30,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(535,1,3,31,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(536,1,3,32,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(537,1,4,33,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(538,1,4,34,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(539,1,4,35,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(540,1,4,36,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(541,1,5,37,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(542,1,5,38,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(543,1,5,39,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(544,1,5,40,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(545,1,6,41,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(546,1,6,42,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(547,1,7,43,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(548,1,7,44,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(549,1,7,45,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(550,1,7,46,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(551,1,9,47,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(552,1,9,48,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(553,1,9,49,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(554,1,9,50,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(555,1,1,51,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(556,1,1,52,NULL,0,1,'2022-04-04 23:45:08','ACTIVO'),(557,1,3,53,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(558,1,4,54,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(559,1,5,55,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(560,1,6,56,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(561,1,7,57,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(562,1,9,58,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(563,1,12,60,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(564,1,1,61,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(565,1,1,62,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(566,1,1,63,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(567,1,1,64,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(568,1,12,65,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(569,1,13,66,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(570,1,12,67,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(571,1,6,68,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(572,1,7,71,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(573,1,7,72,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(574,1,7,73,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(575,1,7,74,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(576,1,7,75,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(577,1,7,76,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(578,1,7,77,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(579,1,7,78,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(580,1,7,79,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(581,1,7,80,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(582,1,7,81,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(583,1,7,82,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(584,1,7,83,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(585,1,7,84,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(586,1,7,85,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(587,1,8,86,NULL,0,1,'2022-04-04 23:45:09','ACTIVO'),(588,1,8,87,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(589,1,8,88,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(590,1,8,89,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(591,1,8,90,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(592,1,8,91,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(593,1,8,92,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(594,1,8,93,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(595,1,13,95,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(596,1,13,96,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(597,1,13,97,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(598,1,13,98,NULL,0,1,'2022-04-04 23:45:10','ACTIVO'),(655,36,12,NULL,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(656,36,1,1,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(657,36,1,2,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(658,36,1,3,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(659,36,1,4,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(660,36,12,65,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(661,36,12,67,NULL,0,1,'2022-05-25 16:41:22','ACTIVO'),(726,39,12,NULL,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(727,39,13,NULL,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(728,39,12,60,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(729,39,12,65,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(730,39,13,66,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(731,39,12,67,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(732,39,13,95,NULL,0,1,'2022-05-25 16:49:06','ACTIVO'),(834,37,7,NULL,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(835,37,12,NULL,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(836,37,13,NULL,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(837,37,7,43,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(838,37,7,44,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(839,37,7,45,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(840,37,7,46,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(841,37,7,57,NULL,0,1,'2022-05-25 17:03:29','ACTIVO'),(842,37,12,60,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(843,37,12,65,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(844,37,13,66,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(845,37,12,67,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(846,37,7,71,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(847,37,7,72,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(848,37,7,73,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(849,37,7,74,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(850,37,7,75,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(851,37,7,76,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(852,37,7,77,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(853,37,7,78,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(854,37,7,79,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(855,37,7,80,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(856,37,7,81,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(857,37,7,82,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(858,37,7,83,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(859,37,7,84,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(860,37,7,85,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(861,37,13,95,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(862,37,13,96,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(863,37,13,97,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(864,37,13,98,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(865,37,7,99,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(866,37,7,100,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(867,37,7,101,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(868,37,7,102,NULL,0,1,'2022-05-25 17:03:30','ACTIVO'),(869,37,7,103,NULL,0,1,'2022-05-25 17:03:30','ACTIVO');

/*Table structure for table `rolessubmodulo` */

DROP TABLE IF EXISTS `rolessubmodulo`;

CREATE TABLE `rolessubmodulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmodulo` int(11) NOT NULL,
  `idmenu` int(11) DEFAULT NULL,
  `nombreint` longblob,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idmodulo` (`idmodulo`),
  CONSTRAINT `rolessubmodulo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `rolessubmodulo_ibfk_2` FOREIGN KEY (`idmodulo`) REFERENCES `rolesmodulo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

/*Data for the table `rolessubmodulo` */

insert  into `rolessubmodulo`(`id`,`idmodulo`,`idmenu`,`nombreint`,`nombre`,`descripcion`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`estatus`) values (1,1,NULL,'verusuario','Ver Usuario',NULL,0,1,'2022-04-01 16:17:04','ACTIVO'),(2,1,NULL,'agregarusuario','Agregar Usuario',NULL,0,1,'2022-04-01 16:17:08','ACTIVO'),(3,1,NULL,'eliminarusuario','Eliminar Usuario',NULL,0,1,'2022-04-01 16:17:12','ACTIVO'),(4,1,NULL,'editarusuario','Editar Usuario',NULL,0,1,'2022-04-01 16:17:18','ACTIVO'),(5,2,NULL,'vercxc','Ver CXC',NULL,0,1,'2022-03-24 12:24:15','ACTIVO'),(6,2,NULL,'agregarcxc','Agregar CXC',NULL,0,1,'2022-03-24 12:24:20','ACTIVO'),(7,2,NULL,'editarcxc','Editar CXC',NULL,0,1,'2022-03-24 12:24:25','ACTIVO'),(8,2,NULL,'eliminarcxc','Eliminar CXC',NULL,0,1,'2022-03-24 12:24:29','ACTIVO'),(9,2,NULL,'vecxc','Ver CXP',NULL,0,1,'2022-03-24 12:24:33','ACTIVO'),(10,2,NULL,'agregarcxp','Agregar CXP',NULL,0,1,'2022-03-24 12:24:38','ACTIVO'),(11,2,NULL,'editarcxp','Editar CXP',NULL,0,1,'2022-03-24 12:24:42','ACTIVO'),(12,2,NULL,'eliminarcxp','Eliminar CXP',NULL,0,1,'2022-03-24 12:24:46','ACTIVO'),(13,2,NULL,'verdiario','Ver Diario',NULL,0,1,'2022-03-24 12:24:52','ACTIVO'),(14,2,NULL,'agregardiario','Agregar Diario',NULL,0,1,'2022-03-24 12:24:59','ACTIVO'),(15,2,NULL,'editardiario','Editar Diario',NULL,0,1,'2022-03-24 12:25:03','ACTIVO'),(16,2,NULL,'eliminardiario','Eliminar Diario',NULL,0,1,'2022-03-24 12:25:06','ACTIVO'),(17,2,NULL,'verperiodo','Ver Periodo',NULL,0,1,'2022-03-24 12:25:17','ACTIVO'),(18,2,NULL,'agregarperiodo','Agregar Periodo',NULL,0,1,'2022-03-24 12:25:27','ACTIVO'),(19,2,NULL,'editarperiodo','Editar Periodo',NULL,0,1,'2022-03-24 12:25:34','ACTIVO'),(20,2,NULL,'eliminarperiodo','Eliminar Periodo',NULL,0,1,'2022-03-24 12:25:38','ACTIVO'),(21,2,NULL,'verbancos','Ver Bancos',NULL,0,1,'2022-03-24 12:25:42','ACTIVO'),(22,2,NULL,'agregarbancos','Agregar Bancos',NULL,0,1,'2022-03-24 12:25:47','ACTIVO'),(23,2,NULL,'editarbancos','Editar Bancos',NULL,0,1,'2022-03-24 12:25:51','ACTIVO'),(24,2,NULL,'eliminarbancos','Eliminar Bancos',NULL,0,1,'2022-03-24 12:25:57','ACTIVO'),(25,2,NULL,'verbancosmov','Ver Bancos Mov',NULL,0,1,'2022-03-24 12:26:03','ACTIVO'),(26,2,NULL,'agregarbancosmov','Agregar Bancos Mov',NULL,0,1,'2022-03-24 12:26:12','ACTIVO'),(27,2,NULL,'editarbancosmov','Editar Bancos Mov',NULL,0,1,'2022-03-24 12:26:20','ACTIVO'),(28,2,NULL,'eliminarbancosmov','Eliminar Bancos Mov',NULL,0,1,'2022-03-24 12:26:25','ACTIVO'),(29,3,NULL,'verfacturas','Ver facturas',NULL,0,1,'2022-03-28 11:06:17','ACTIVO'),(30,3,NULL,'editarfacturas','Editar facturas',NULL,0,1,'2022-03-28 11:06:34','ACTIVO'),(31,3,NULL,'eliminarfacturas','Eliminar Facturas',NULL,0,1,'2022-03-28 11:06:50','ACTIVO'),(32,3,NULL,'agregarfacturas','Agregar Facturas',NULL,0,1,'2022-03-28 11:07:11','ACTIVO'),(33,4,NULL,'verproducto','Ver Producto',NULL,0,1,'2022-03-28 11:07:45','ACTIVO'),(34,4,NULL,'agregarproducto','Agregar Producto',NULL,0,1,'2022-03-28 11:11:16','ACTIVO'),(35,4,NULL,'editarproducto','Editar Producto',NULL,0,1,'2022-03-28 11:11:10','ACTIVO'),(36,4,NULL,'eliminarproducto','Eliminar Producto',NULL,0,1,'2022-03-28 11:11:06','ACTIVO'),(37,5,NULL,'verempleado','Ver Empleado',NULL,0,1,'2022-03-28 11:11:24','ACTIVO'),(38,5,NULL,'editarempleado','Editar Empleado',NULL,0,1,'2022-03-28 11:09:35','ACTIVO'),(39,5,NULL,'agregarempleado','Agregar Empleado',NULL,0,1,'2022-03-28 11:10:11','ACTIVO'),(40,5,NULL,'eliminarempleado','Eliminar Empleado',NULL,0,1,'2022-03-28 11:10:27','ACTIVO'),(41,6,NULL,'verreporte','Ver Reportes',NULL,0,1,'2022-03-28 11:13:29','ACTIVO'),(42,6,NULL,'generarreporte','Generar Reporte',NULL,0,1,'2022-03-28 11:14:14','ACTIVO'),(43,7,NULL,'verdoctores','Ver Doctores',NULL,0,1,'2022-03-28 11:14:48','ACTIVO'),(44,7,NULL,'agregardoctores','Agregar Doctores',NULL,0,1,'2022-03-28 11:15:05','ACTIVO'),(45,7,NULL,'editardoctores','Editar Doctores',NULL,0,1,'2022-03-28 11:15:17','ACTIVO'),(46,7,NULL,'eliminardoctores','Eliminar Doctores',NULL,0,1,'2022-03-28 11:15:36','ACTIVO'),(47,9,NULL,'vermenuadmin','Ver Menú Admin',NULL,0,1,'2022-03-28 11:16:45','ACTIVO'),(48,9,NULL,'agregarmenuadmin','Agregar Menú Admin',NULL,0,1,'2022-03-28 11:17:04','ACTIVO'),(49,9,NULL,'editarmenuadmin','Editar Menú Admin',NULL,0,1,'2022-03-28 11:17:19','ACTIVO'),(50,9,NULL,'eliminarmenuadmin','Eliminar Menú Admin',NULL,0,1,'2022-03-28 11:17:39','ACTIVO'),(51,1,NULL,'usuarios','Usuarios',NULL,0,1,'2022-04-01 16:18:35','ACTIVO'),(52,1,NULL,'roles','Roles Usuario',NULL,0,1,'2022-04-01 16:18:12','ACTIVO'),(53,3,NULL,'menufacturacion','Menú Facturación',NULL,0,1,'2022-03-28 11:26:11','ACTIVO'),(54,4,NULL,'menuinventario','Inventario',NULL,0,1,'2022-04-04 10:33:31','ACTIVO'),(55,5,NULL,'menurecursosh','Menú R. Humanos',NULL,0,1,'2022-03-28 11:26:18','ACTIVO'),(56,6,NULL,'menureportes','Menú Reportes',NULL,0,1,'2022-03-28 11:26:19','ACTIVO'),(57,7,NULL,'menumantenimiento','Menú Mantenimiento',NULL,0,1,'2022-03-28 11:26:28','ACTIVO'),(58,9,NULL,'menuadmin','Menú Admin',NULL,0,1,'2022-04-01 17:41:41','ACTIVO'),(59,11,NULL,'menusistema','Menú Sistema',NULL,0,1,'2022-03-28 11:26:54','ACTIVO'),(60,12,NULL,'menupacientes','Pacientes',NULL,0,1,'2022-04-04 10:27:16','ACTIVO'),(61,1,NULL,'verrol','Ver Rol',NULL,0,1,'2022-04-01 16:30:31','ACTIVO'),(62,1,NULL,'agregarrol','Agregar Rol',NULL,0,1,'2022-04-01 16:30:50','ACTIVO'),(63,1,NULL,'editarrol','Editar Rol',NULL,0,1,'2022-04-01 16:31:03','ACTIVO'),(64,1,NULL,'eliminarrol','Eliminar Rol',NULL,0,1,'2022-04-01 16:31:25','ACTIVO'),(65,12,NULL,'historiaclinica','Historia Clínica',NULL,0,1,'2022-04-04 10:26:47','ACTIVO'),(66,13,NULL,'citas','Citas',NULL,0,1,'2022-04-04 10:27:53','ACTIVO'),(67,12,NULL,'agenda','Agenda',NULL,0,1,'2022-04-04 12:22:54','ACTIVO'),(68,6,NULL,'atencionpacientes','Atención Pacientes',NULL,0,1,'2022-04-04 12:43:44','ACTIVO'),(71,7,NULL,'pacientes','Pacientes',NULL,0,1,'2022-04-04 23:29:48','ACTIVO'),(72,7,NULL,'verpeciente','Ver paciente',NULL,0,1,'2022-04-04 23:30:32','ACTIVO'),(73,7,NULL,'agregarpaciente','Agregar Paciente',NULL,0,1,'2022-04-04 23:30:49','ACTIVO'),(74,7,NULL,'eliminarpaciente','Eliminar paciente',NULL,0,1,'2022-04-04 23:31:07','ACTIVO'),(75,7,NULL,'editarpacientes','Editar Paciente',NULL,0,1,'2022-04-04 23:31:28','ACTIVO'),(76,7,NULL,'motivoconsulta','Motivo Consulta',NULL,0,1,'2022-04-04 23:33:08','ACTIVO'),(77,7,NULL,'vermotivo','Ver Motivo',NULL,0,1,'2022-04-04 23:34:50','ACTIVO'),(78,7,NULL,'editarmotivo','Editar Motivo',NULL,0,1,'2022-04-04 23:33:37','ACTIVO'),(79,7,NULL,'agregarmotivo','Agregar Motivo',NULL,0,1,'2022-04-04 23:33:59','ACTIVO'),(80,7,NULL,'eliminarmotivo','Eliminar Motivo',NULL,0,1,'2022-04-04 23:34:15','ACTIVO'),(81,7,NULL,'ciudad','Ciudad',NULL,0,1,'2022-04-04 23:35:39','ACTIVO'),(82,7,NULL,'verciudad','Ver Ciudad',NULL,0,1,'2022-04-04 23:35:49','ACTIVO'),(83,7,NULL,'editarciudad','Editar Ciudad',NULL,0,1,'2022-04-04 23:36:06','ACTIVO'),(84,7,NULL,'eliminarciudad','Eliminar Ciudad',NULL,0,1,'2022-04-04 23:36:18','ACTIVO'),(85,7,NULL,'agregarciudad','Agregar Ciudad',NULL,0,1,'2022-04-04 23:36:30','ACTIVO'),(86,8,NULL,'modulocontable','Módulo Contable',NULL,0,1,'2022-04-04 23:37:38','ACTIVO'),(87,8,NULL,'modulorrhh','Módulo R. Humanos',NULL,0,1,'2022-04-04 23:37:51','ACTIVO'),(88,8,NULL,'modulosistemas','Módulo Sistemas',NULL,0,1,'2022-04-04 23:38:14','ACTIVO'),(89,8,NULL,'modulofacturacion','Módulo Facturación',NULL,0,1,'2022-04-04 23:38:30','ACTIVO'),(90,8,NULL,'moduloagendamiento','Módulo Agendamiento',NULL,0,1,'2022-04-04 23:38:45','ACTIVO'),(91,8,NULL,'modulopacientes','Módulo Pacientes',NULL,0,1,'2022-04-04 23:39:02','ACTIVO'),(92,8,NULL,'modulousuarios','Módulo Usuarios',NULL,0,1,'2022-04-04 23:39:47','ACTIVO'),(93,8,NULL,'moduloconfiguraciones','Módulo Configuraciones',NULL,0,1,'2022-04-04 23:40:09','ACTIVO'),(95,13,NULL,'vercitas','Ver citas',NULL,0,1,'2022-04-04 23:41:05','ACTIVO'),(96,13,NULL,'agregarcitas','Agregar Citas',NULL,0,1,'2022-04-04 23:41:19','ACTIVO'),(97,13,NULL,'eliminarcitas','Eliminar Citas',NULL,0,1,'2022-04-04 23:41:37','ACTIVO'),(98,13,NULL,'editarcitas','Editar Citas',NULL,0,1,'2022-04-04 23:41:52','ACTIVO'),(99,7,NULL,'doctores','Doctores',NULL,0,1,'2022-04-21 16:38:08','ACTIVO'),(100,7,NULL,'verdoctores','Ver Doctores',NULL,0,1,'2022-04-21 16:39:08','ACTIVO'),(101,7,NULL,'editardoctores','Editar Doctor',NULL,0,1,'2022-04-21 16:39:34','ACTIVO'),(102,7,NULL,'agregardoctores','Agregar Doctor',NULL,0,1,'2022-04-21 16:39:55','ACTIVO'),(103,7,NULL,'eliminardoctores','Eliminar Doctor',NULL,0,1,'2022-04-21 16:40:13','ACTIVO');

/*Table structure for table `rolesusuario` */

DROP TABLE IF EXISTS `rolesusuario`;

CREATE TABLE `rolesusuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idrol` (`idrol`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `rolesusuario_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `rolesusuario_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`),
  CONSTRAINT `rolesusuario_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `rolesusuario` */

insert  into `rolesusuario`(`id`,`idrol`,`idusuario`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`estatus`) values (1,1,1,0,'2022-03-28 13:28:11',1,'ACTIVO'),(2,3,10001,0,'2022-03-28 13:28:30',1,'ACTIVO'),(3,36,10012,0,'2022-04-04 10:59:14',1,'ACTIVO'),(4,36,10013,0,'2022-04-04 16:10:55',1,'ACTIVO'),(5,37,10014,0,'2022-04-04 16:13:38',1,'ACTIVO'),(6,36,10015,0,'2022-04-12 16:12:54',1,'ACTIVO'),(7,36,10016,0,'2022-04-12 16:16:45',1,'ACTIVO'),(8,36,10017,0,'2022-04-12 16:18:36',1,'ACTIVO'),(9,36,10018,0,'2022-04-12 16:20:21',1,'ACTIVO'),(10,36,10019,0,'2022-04-12 16:21:38',1,'ACTIVO'),(11,36,10020,0,'2022-04-12 16:22:53',1,'ACTIVO'),(12,37,10021,0,'2022-04-12 16:26:02',1,'ACTIVO'),(13,36,10022,0,'2022-04-21 16:51:33',1,'ACTIVO'),(14,36,10023,0,'2022-04-29 12:44:15',1,'ACTIVO'),(15,39,10024,0,'2022-05-24 11:59:23',1,'ACTIVO'),(16,39,10025,0,'2022-05-24 17:02:41',1,'ACTIVO');

/*Table structure for table `rubroretencion` */

DROP TABLE IF EXISTS `rubroretencion`;

CREATE TABLE `rubroretencion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) NOT NULL,
  `concepto` longblob NOT NULL,
  `porsociedad` decimal(10,2) DEFAULT NULL,
  `ctasociedad` varchar(50) DEFAULT NULL,
  `pornatural` decimal(10,2) DEFAULT NULL,
  `ctanatural` varchar(50) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `cuentasociedadcxc` varchar(50) DEFAULT NULL,
  `cuentanaturalcxc` varchar(50) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rubroretencion` */

/*Table structure for table `sexo` */

DROP TABLE IF EXISTS `sexo`;

CREATE TABLE `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) DEFAULT '1',
  `fechaact` datetime DEFAULT NULL,
  `usuarioact` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `sexo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sexo` */

insert  into `sexo`(`id`,`nombre`,`sufijo`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`fechaact`,`usuarioact`,`estatus`) values (1,'MASCULINO','M',0,'2022-03-22 12:18:28',1,NULL,NULL,'ACTIVO'),(2,'FEMENINO','F',0,'2022-03-22 12:18:34',1,NULL,NULL,'ACTIVO');

/*Table structure for table `slider` */

DROP TABLE IF EXISTS `slider`;

CREATE TABLE `slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `link` varchar(200) NOT NULL DEFAULT '#',
  `image` varchar(200) NOT NULL,
  `imageresponsive` varchar(200) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `creado_por` varchar(55) DEFAULT NULL,
  `modificado_por` varchar(55) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orden` int(11) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `slider` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo` varchar(80) NOT NULL,
  `bodega` int(11) NOT NULL,
  `inicial` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stock` */

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `direccion` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechamod` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `sucursal` */

insert  into `sucursal`(`id`,`idempresa`,`nombre`,`isDeleted`,`direccion`,`usuariocreacion`,`fechacreacion`,`fechamod`,`estatus`) values (1,1,'MATRIZ',0,'GUAYAQUIL',1,'2022-04-04 10:39:22',NULL,'ACTIVO');

/*Table structure for table `sustentotributario` */

DROP TABLE IF EXISTS `sustentotributario`;

CREATE TABLE `sustentotributario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` longblob NOT NULL,
  `tipocomprobante` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `sustentotributario_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sustentotributario` */

/*Table structure for table `tipoarticulo` */

DROP TABLE IF EXISTS `tipoarticulo`;

CREATE TABLE `tipoarticulo` (
  `id` int(11) NOT NULL,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(10) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` datetime NOT NULL,
  `estatus` varchar(10) NOT NULL DEFAULT 'ACTIVO',
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipoarticulo_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipoarticulo` */

/*Table structure for table `tipobanco` */

DROP TABLE IF EXISTS `tipobanco`;

CREATE TABLE `tipobanco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipobanco_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipobanco` */

/*Table structure for table `tipocomprobante` */

DROP TABLE IF EXISTS `tipocomprobante`;

CREATE TABLE `tipocomprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipocomprobante_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipocomprobante` */

/*Table structure for table `tipocxcdeposito` */

DROP TABLE IF EXISTS `tipocxcdeposito`;

CREATE TABLE `tipocxcdeposito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(5) NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipocxcdeposito_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipocxcdeposito` */

/*Table structure for table `tipodiario` */

DROP TABLE IF EXISTS `tipodiario`;

CREATE TABLE `tipodiario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipodiario_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipodiario` */

/*Table structure for table `tipodocautorizados` */

DROP TABLE IF EXISTS `tipodocautorizados`;

CREATE TABLE `tipodocautorizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `descripcion` longblob NOT NULL,
  `codigosecuencia` longblob NOT NULL,
  `sustentotri` longblob NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipodocautorizados` */

/*Table structure for table `tipodocumento` */

DROP TABLE IF EXISTS `tipodocumento`;

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipodocumento` */

/*Table structure for table `tipoexamenes` */

DROP TABLE IF EXISTS `tipoexamenes`;

CREATE TABLE `tipoexamenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `descripcion` longblob,
  `valor` decimal(10,3) NOT NULL DEFAULT '0.000',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipoexamenes_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;

/*Data for the table `tipoexamenes` */

insert  into `tipoexamenes`(`id`,`nombre`,`descripcion`,`valor`,`isDeleted`,`usuariocreacion`,`fechacreacion`,`usuarioact`,`fechaact`,`estatus`) values (1,'ORA','',40.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(223,'OCTN+MACULA+CONTROL','',210.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(224,'OCT MACULA','',85.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(225,'ANGIOGRAFIA','',85.000,0,1,'2020-02-01 00:00:00',1,'2022-03-21 14:52:01','ACTIVO'),(233,'CAMPIMETRIA','',50.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(234,'OCT  MACULA O NERVIO','',85.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(235,'OCT MACULA + NERVIO','',130.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(236,'PAQUIMETRIA','',40.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(237,'ENDOTELIAL/PAQ','',40.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(238,'IOL MASTER','',60.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(239,'ECOGRAFIA','',60.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(240,'RETINOGRAFIA','',45.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(241,'ORA + PAQUIMETRIA','',80.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(242,'TOPOGRAFIA','',60.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(243,'MEDICION DE LENTES','',50.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(271,'UBM','',120.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(298,'POLICIA','',0.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(328,'OCT ANGULO','',0.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(331,'MEIBOMIOGRAFIA','',25.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO'),(332,'TRATAMIENTO IPL','',200.000,0,1,'2020-02-01 00:00:00',NULL,NULL,'ACTIVO');

/*Table structure for table `tipoidentificacion` */

DROP TABLE IF EXISTS `tipoidentificacion`;

CREATE TABLE `tipoidentificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipoinformante` varchar(5) NOT NULL,
  `maximo` int(11) DEFAULT NULL,
  `ats` int(11) DEFAULT NULL,
  `compra` varchar(10) DEFAULT NULL,
  `venta` varchar(10) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipoidentificacion_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoidentificacion` */

/*Table structure for table `tipoinventario` */

DROP TABLE IF EXISTS `tipoinventario`;

CREATE TABLE `tipoinventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `signo` decimal(10,0) NOT NULL,
  `contabilizar` int(11) NOT NULL DEFAULT '1',
  `sufijo` varchar(10) NOT NULL,
  `mostrarinv` int(11) NOT NULL DEFAULT '0',
  `filtroinv` int(11) NOT NULL DEFAULT '0',
  `importar` int(11) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipoinventario_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoinventario` */

/*Table structure for table `tipoorigencompra` */

DROP TABLE IF EXISTS `tipoorigencompra`;

CREATE TABLE `tipoorigencompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `sufijo` varchar(10) NOT NULL,
  `filtro` int(11) NOT NULL DEFAULT '0',
  `filtrotipop` int(11) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipoorigencompra_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoorigencompra` */

/*Table structure for table `tipopago` */

DROP TABLE IF EXISTS `tipopago`;

CREATE TABLE `tipopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` varchar(200) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipopago` */

/*Table structure for table `tipopagobanco` */

DROP TABLE IF EXISTS `tipopagobanco`;

CREATE TABLE `tipopagobanco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `mostrar` int(11) DEFAULT NULL,
  `reporte` int(11) DEFAULT NULL,
  `sufijo` varchar(10) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipopagobanco_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipopagobanco` */

/*Table structure for table `tipopagocaja` */

DROP TABLE IF EXISTS `tipopagocaja`;

CREATE TABLE `tipopagocaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `mostrar` int(11) NOT NULL,
  `sufijo` varchar(10) NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipopagocaja_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipopagocaja` */

/*Table structure for table `tipopreciofactura` */

DROP TABLE IF EXISTS `tipopreciofactura`;

CREATE TABLE `tipopreciofactura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipopreciofactura` */

/*Table structure for table `tipoproducto` */

DROP TABLE IF EXISTS `tipoproducto`;

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cuentainv` varchar(50) DEFAULT NULL,
  `cuentaventas` varchar(50) DEFAULT NULL,
  `cuentaventasdes` varchar(50) DEFAULT NULL,
  `cuentaventasdev` varchar(50) DEFAULT NULL,
  `cuentacostos` varchar(50) DEFAULT NULL,
  `cuentacostosdes` varchar(50) DEFAULT NULL,
  `cuentacostosdev` varchar(50) DEFAULT NULL,
  `cuentasalidainv` varchar(50) DEFAULT NULL,
  `cuentasalidamue` varchar(50) DEFAULT NULL,
  `cuentaentradainv` varchar(50) DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipoproducto` */

/*Table structure for table `tipounidad` */

DROP TABLE IF EXISTS `tipounidad`;

CREATE TABLE `tipounidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `tipounidad_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipounidad` */

/*Table structure for table `transporte` */

DROP TABLE IF EXISTS `transporte`;

CREATE TABLE `transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `direccion` longblob,
  `telefonos` varchar(40) DEFAULT NULL,
  `observaciones` longblob,
  `contacto` longblob,
  `ruc` varchar(13) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `transporte_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `transporte` */

/*Table structure for table `turnos` */

DROP TABLE IF EXISTS `turnos`;

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `turnos` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `cedula` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '9999999999',
  `idrol` int(11) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `fotoperfil` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user2-160x160.png',
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('Activo','Inactivo') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Activo',
  `idsucursal` int(11) NOT NULL DEFAULT '1',
  `creado_por` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`cedula`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  KEY `idsucursal` (`idsucursal`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`nombres`,`apellidos`,`cedula`,`idrol`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`isDeleted`,`created_at`,`updated_at`,`fotoperfil`,`fechacreacion`,`estatus`,`idsucursal`,`creado_por`) values (1,'mario','Mario','Aguilar','8888888888',1,'sPLOVRHcWZjqnQLCfFIQytZimLIuxXbl','$2y$13$z/0M2JiQbcIJNrySYNp4s.HXWfPKRJGqvAVgAOPQaBmvwhGYsnIuK',NULL,'marioaguilar1990@gmail.com',10,0,1543813416,1543813416,'marioaguilar.png','2019-07-14 19:48:00','Activo',1,'1'),(21,'usuario','USUARIO','USUARIO','900000001',2,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$z/0M2JiQbcIJNrySYNp4s.HXWfPKRJGqvAVgAOPQaBmvwhGYsnIuK',NULL,'usuario@gmail.com',10,0,1634843998,1634843998,'user2-160x160.png','0000-00-00 00:00:00','Activo',1,'1'),(10001,'maferitoag','Mario F','Aguilar G','0911969095',2,'NSN-4dv8OL3HBjalR3rQTTEhwQpLh8xf','$2y$13$z/0M2JiQbcIJNrySYNp4s.HXWfPKRJGqvAVgAOPQaBmvwhGYsnIuK',NULL,'mariofaguilarg@gmail.com',10,0,1232334343,1223232333,'user2-160x160.png','2019-11-17 10:21:46','Activo',1,'1'),(10012,'fiturralde','Felix','Iturralde','0923136022',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$YZjZ2Zcf/d7qmtcqaC1OgeMEGNsv641oQP9g.L8cZII/g94eFhSNG',NULL,'marioaguilarg1990@gmail.com',10,0,1,1,'user2-160x160.png','2022-04-04 10:59:14','Activo',1,'1'),(10013,'nmatamoros','Nelson','Matamoros','0923136033',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$2HbF5PX7S0YKnJWXQrVdCuRCcB0R86Ns6.ELRR5nKqD9Gz1DpKzC6',NULL,'nelsonmata@gmail.com',10,0,1,1,'user2-160x160.png','2022-04-04 16:10:55','Activo',1,'1'),(10014,'recepcion','Recepción','','1234567890',37,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$/AvtCYBEhRX7/eHBgbgpyeEPnBPAf.4d/2PC2fTEP/fTLg7E0.93.',NULL,'recepcion@mir.com.ec',10,0,1,1,'user2-160x160.png','2022-04-04 16:13:37','Activo',1,'1'),(10015,'ALUNA','ANA','LUNA','0912345678',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$Kw2AXzUrV6vV3OlsfCtUT.XFd.Gi0x6HO3877Ov8lU5O0VG9HSjbC',NULL,'ALUNA@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:12:54','Activo',1,'1'),(10016,'ASUAREZ','ANDRES','SUAREZ','091234578',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$FNCRON06unuEQkO2ZNsKi.gg5fFINvb0qLVINVCxolkqE5ZuWTH0y',NULL,'ASUAREZ@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:16:45','Activo',1,'1'),(10017,'RAGUIRRE','ROSITA','AGUIRRE','0912345678',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$9n96s44ySCzkGtRH5ge7RONmfYDiFjdYIB0dsAjdOHNmiBq4EtJUq',NULL,'RAGUIRRE@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:18:36','Activo',1,'1'),(10018,'DRODRIGUEZ','DANIELA','RODRIGUEZ','0912345678',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$AKkwcGpb/Qn7SoDiGyvgIOh2zmYOtnGvMCsumfXWxy.XwuDZjWmZG',NULL,'DRODRIGUEZ@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:20:21','Activo',1,'1'),(10019,'GZUÑIGA','GLADYS','ZUÑIGA','0912345678',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$e62F3ppEwzAe2.1G8DH0peWTQ2QGefCu1HXItZlaDaJyrvwkyZI0u',NULL,'GZUÑIGA@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:21:38','Activo',1,'1'),(10020,'RMATAMOROS','ROBERTO','MATAMOROS','0912345678',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$x/uyBSF9ZmpO84KiaO/c.O022zyJ0j8fSCendEMvPZhTlTK/7jDba',NULL,'RMATAMOROS@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:22:53','Activo',1,'1'),(10021,'RECEPMIR','RECEP','RECEPZ','0912345678',37,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$k8KjU75N0rC2bhPABp65bOssPzuZQ1tarqst7Rk.eYdNyWOD/lss2',NULL,'RECEPMIR@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-04-12 16:26:02','Activo',1,'1'),(10022,'vtomala','Vanessa','Tomalá','0915617187',39,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$gmLm0KJkmNQC17xncyVQOutplwfAMrAx8HHyIiH/itS0jREO1wyxO',NULL,'vanessatomalac23@gmail.com',10,0,1,1,'user2-160x160.png','2022-04-21 16:51:33','Activo',1,'1'),(10023,'NMS','NELSON','MATAMOROS S','0987654321',36,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$QMCKLMa11fYyuEO/JZDu.OBhws3p.SWh8w9Y9Y1kDhWsBP05ac3qa',NULL,'nms@mir.com.ec',10,0,1,1,'user2-160x160.png','2022-04-29 12:44:15','Activo',1,'1'),(10024,'OPTOREC','OPTOREC','OPTO','123456789',39,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$/9z2WsKvq0wilxoQDjD41OC0Yoop7.pelwsrW8IQpnzCHbQ0oa0yi',NULL,'OPTOREC@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-05-24 11:59:23','Activo',1,'1'),(10025,'DORTIZ','DANIELA','ORTIZ','098765432',39,'qBsm2pBnvWqODXkw8497oMu6BCKknip-','$2y$13$wmjsEyXiNaaJZKnfVu49meNJyt7FQET44FNn.I4oKSgeO6y1KeH.y',NULL,'DORTIZ@MIR.COM.EC',10,0,1,1,'user2-160x160.png','2022-05-24 17:02:41','Activo',1,'1');

/*Table structure for table `usuariorol` */

DROP TABLE IF EXISTS `usuariorol`;

CREATE TABLE `usuariorol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuariocreacion` int(11) NOT NULL DEFAULT '1',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `idrol` (`idrol`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `usuariorol_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `usuariorol_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`),
  CONSTRAINT `usuariorol_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuariorol` */

/*Table structure for table `vendedores` */

DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` longblob NOT NULL,
  `ingreso` date NOT NULL,
  `direccion` longblob,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `ultimacomision` int(11) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `ultimoproceso` date DEFAULT NULL,
  `notas` longblob,
  `usuariocreacion` int(11) NOT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioact` int(11) DEFAULT NULL,
  `fechaact` date DEFAULT NULL,
  `usuarioan` int(11) DEFAULT NULL,
  `fechaan` date DEFAULT NULL,
  `proforma` int(1) DEFAULT '0',
  `fechanac` date DEFAULT NULL,
  `tipoidentificacion` int(11) DEFAULT NULL,
  `identificacion` varchar(13) DEFAULT NULL,
  `comision` decimal(10,2) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `usuariocreacion` (`usuariocreacion`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vendedores` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;