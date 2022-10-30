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
  `estatuscita` enum('AGENDADA','CONFIRMADA','CANCELADA','REAGENDADA','ATENDIDA','PREPARACIÓN','EN ATENCIÓN','CONSULTA MED') NOT NULL DEFAULT 'AGENDADA',
  `via` enum('WEB','ONLINE') NOT NULL DEFAULT 'WEB',
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idusuario` (`idusuario`),
  KEY `usuariocreacion` (`usuariocreacion`),
  KEY `iddoctor` (`iddoctor`),
  KEY `idoptometrista` (`idoptometrista`),
  CONSTRAINT `citasmedicas_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `citasmedicas_ibfk_2` FOREIGN KEY (`usuariocreacion`) REFERENCES `user` (`id`),
  CONSTRAINT `citasmedicas_ibfk_3` FOREIGN KEY (`iddoctor`) REFERENCES `doctores` (`id`),
  CONSTRAINT `citasmedicas_ibfk_4` FOREIGN KEY (`idoptometrista`) REFERENCES `doctores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `citasmedicas` */

insert  into `citasmedicas`(`id`,`idusuario`,`observacion`,`fechacita`,`horacita`,`isDeleted`,`fechacreacion`,`fechaact`,`idoptometrista`,`iddoctor`,`usuariocreacion`,`usuarioact`,`estatuscita`,`via`,`estatus`) values (1,20,'','2022-05-11','09:30:00',0,'2022-05-11 11:22:19',NULL,6,9,10014,NULL,'ATENDIDA','WEB','ACTIVO'),(2,21,'','2022-05-11','10:00:00',0,'2022-05-11 11:22:29',NULL,6,9,10014,NULL,'ATENDIDA','WEB','ACTIVO'),(3,22,'Examenes, Tomografia de nervio, Paquimetria','2022-05-11','10:30:00',0,'2022-05-11 10:25:50',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(4,23,'','2022-05-11','11:00:00',0,'2022-05-11 10:26:00',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(5,24,'','2022-05-11','12:00:00',0,'2022-05-11 11:22:06',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(6,25,'datos de prueba para doc luna ','2022-05-11','16:30:00',0,'2022-05-11 16:18:11',NULL,6,7,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(7,26,'','2022-05-18','09:00:00',0,'2022-05-18 08:47:45',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(8,27,'','2022-05-18','09:30:00',0,'2022-05-18 08:47:52',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(9,22,'REVISION RESULTADOS','2022-05-18','10:00:00',0,'2022-05-18 10:53:55',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(10,28,'','2022-05-18','10:30:00',0,'2022-05-18 10:53:07','2022-05-18 10:53:07',6,9,10014,10014,'AGENDADA','WEB','ACTIVO'),(11,29,'','2022-05-18','12:00:00',0,'2022-05-18 11:47:02',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(12,30,'','2022-05-18','11:30:00',0,'2022-05-18 11:47:29',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO'),(13,31,'','2022-05-18','12:30:00',0,'2022-05-18 12:28:50',NULL,6,9,10014,NULL,'EN ATENCIÓN','WEB','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedica` */

insert  into `consultamedica`(`id`,`idcitamedica`,`idpaciente`,`observacion`,`fechacita`,`horacita`,`isDeleted`,`fechacreacion`,`fechaact`,`idoptometrista`,`iddoctor`,`fechainatencion`,`fechafinatencion`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,20,'-','2022-05-11','09:30:00',0,'2022-05-11 09:01:05',NULL,1,1,'2022-05-11 09:01:05',NULL,10022,NULL,'ACTIVO'),(2,2,21,'-','2022-05-11','10:00:00',0,'2022-05-11 09:40:28',NULL,2,2,'2022-05-11 09:40:28',NULL,10022,NULL,'ACTIVO'),(3,4,23,'-','2022-05-11','11:00:00',0,'2022-05-11 10:48:39',NULL,4,4,'2022-05-11 10:48:39',NULL,10022,NULL,'ACTIVO'),(5,3,22,'-','2022-05-11','10:30:00',0,'2022-05-11 11:44:40',NULL,3,3,'2022-05-11 11:44:40',NULL,10022,NULL,'ACTIVO'),(12,5,24,'-','2022-05-11','12:00:00',0,'2022-05-11 11:56:22',NULL,5,5,'2022-05-11 11:56:22',NULL,10022,NULL,'ACTIVO'),(13,6,25,'-','2022-05-11','16:30:00',0,'2022-05-11 16:21:05',NULL,6,6,'2022-05-11 04:21:05',NULL,10015,NULL,'ACTIVO'),(14,7,26,'-','2022-05-18','09:00:00',0,'2022-05-18 08:48:39',NULL,7,7,'2022-05-18 08:48:39',NULL,10022,NULL,'ACTIVO'),(15,8,27,'-','2022-05-18','09:30:00',0,'2022-05-18 08:58:31',NULL,8,8,'2022-05-18 08:58:31',NULL,10022,NULL,'ACTIVO'),(16,9,22,'-','2022-05-18','10:00:00',0,'2022-05-18 10:35:05',NULL,9,9,'2022-05-18 10:35:05',NULL,10019,NULL,'ACTIVO'),(17,10,28,'-','2022-05-18','10:30:00',0,'2022-05-18 11:46:03',NULL,10,10,'2022-05-18 11:46:03',NULL,10019,NULL,'ACTIVO'),(18,12,30,'-','2022-05-18','11:30:00',0,'2022-05-18 11:54:24',NULL,12,12,'2022-05-18 11:54:24',NULL,10022,NULL,'ACTIVO'),(19,11,29,'-','2022-05-18','12:00:00',0,'2022-05-18 12:12:05',NULL,11,11,'2022-05-18 12:12:05',NULL,10022,NULL,'ACTIVO');

/*Table structure for table `consultamedicadet` */

DROP TABLE IF EXISTS `consultamedicadet`;

CREATE TABLE `consultamedicadet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `causaconsulta` longblob,
  `agudezavscod` varchar(30) DEFAULT NULL,
  `agudezavscoi` varchar(30) DEFAULT NULL,
  `agudezavcod` varchar(30) DEFAULT NULL,
  `agudezavcoi` varchar(30) DEFAULT NULL,
  `agudezavotr` varchar(30) DEFAULT NULL,
  `visioncscod` varchar(30) DEFAULT NULL,
  `visioncosci` varchar(30) DEFAULT NULL,
  `visionccod` varchar(30) DEFAULT NULL,
  `visionccid` varchar(30) DEFAULT NULL,
  `visioncotr` varchar(30) DEFAULT NULL,
  `visionlscod` varchar(30) DEFAULT NULL,
  `visionlscoi` varchar(30) DEFAULT NULL,
  `visionlcod` varchar(30) DEFAULT NULL,
  `visionlcoi` varchar(30) DEFAULT NULL,
  `visionlcotr` varchar(30) DEFAULT NULL,
  `pioscod` varchar(30) DEFAULT NULL,
  `pioscoi` varchar(30) DEFAULT NULL,
  `piocod` varchar(30) DEFAULT NULL,
  `piocoi` varchar(30) DEFAULT NULL,
  `piootr` varchar(30) DEFAULT NULL,
  `biomicroscopia` varchar(50) DEFAULT NULL,
  `visiondecolores` varchar(30) DEFAULT NULL,
  `visionprofundidad` varchar(30) DEFAULT NULL,
  `reflejospup` varchar(30) DEFAULT NULL,
  `campovisual` varchar(30) DEFAULT NULL,
  `fondoojood` varchar(30) DEFAULT NULL,
  `fondoojooi` varchar(30) DEFAULT NULL,
  `agujeroest` varchar(30) DEFAULT NULL,
  `examenes` longblob,
  `impdiag1` varchar(30) DEFAULT NULL,
  `impdiag2` varchar(30) DEFAULT NULL,
  `impdiag3` varchar(30) DEFAULT NULL,
  `cie1001` varchar(30) DEFAULT NULL,
  `cie1002` varchar(30) DEFAULT NULL,
  `cie1003` varchar(30) DEFAULT NULL,
  `usolentes` varchar(30) DEFAULT NULL,
  `campim` varchar(30) DEFAULT NULL,
  `octangular` varchar(30) DEFAULT NULL,
  `octm` varchar(30) DEFAULT NULL,
  `octn` varchar(30) DEFAULT NULL,
  `biood` varchar(30) DEFAULT NULL,
  `bioid` varchar(30) DEFAULT NULL,
  `paquimod` varchar(30) DEFAULT NULL,
  `paquimid` varchar(30) DEFAULT NULL,
  `ora` varchar(30) DEFAULT NULL,
  `topografia` varchar(30) DEFAULT NULL,
  `angiog` varchar(30) DEFAULT NULL,
  `ecogra` varchar(30) DEFAULT NULL,
  `endote` varchar(30) DEFAULT NULL,
  `ubm` varchar(30) DEFAULT NULL,
  `retinografia` varchar(30) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedicadet` */

insert  into `consultamedicadet`(`id`,`idconsulta`,`causaconsulta`,`agudezavscod`,`agudezavscoi`,`agudezavcod`,`agudezavcoi`,`agudezavotr`,`visioncscod`,`visioncosci`,`visionccod`,`visionccid`,`visioncotr`,`visionlscod`,`visionlscoi`,`visionlcod`,`visionlcoi`,`visionlcotr`,`pioscod`,`pioscoi`,`piocod`,`piocoi`,`piootr`,`biomicroscopia`,`visiondecolores`,`visionprofundidad`,`reflejospup`,`campovisual`,`fondoojood`,`fondoojooi`,`agujeroest`,`examenes`,`impdiag1`,`impdiag2`,`impdiag3`,`cie1001`,`cie1002`,`cie1003`,`usolentes`,`campim`,`octangular`,`octm`,`octn`,`biood`,`bioid`,`paquimod`,`paquimid`,`ora`,`topografia`,`angiog`,`ecogra`,`endote`,`ubm`,`retinografia`,`img1`,`img2`,`img3`,`img4`,`img5`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,NULL,NULL,NULL,NULL,NULL,NULL,'j1','j1','','','','20/20','20/20','','','dp 60','13','14',NULL,NULL,NULL,'','','','normal ','','ok','ok','','','blefaromeibomitis ao','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 10:02:01','2022-05-11 10:02:01',10022,10019,'ACTIVO'),(2,2,'chequeo . ',NULL,NULL,NULL,NULL,NULL,'20/400','20/400',' j4','j5','','20/400','20/400','-9.00-2.25 x 180  20/30-2 +ag','-9.50 -2.25 x 180 20/40+2 +ag ','dp  65 ','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 10:01:36','2022-05-11 10:01:36',10022,10022,'ACTIVO'),(3,3,'resultados ',NULL,NULL,NULL,NULL,NULL,'pl','20/200-1','+3.00  --','+3.00  j5','','pl','20/30-2','--','neutro 20/30-2','dp 61','10','11',NULL,NULL,NULL,'','','','','','','','','','','','','','','','on',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-12 09:30:01','2022-05-11 11:22:40',10022,10019,'ACTIVO'),(5,5,'',NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','','F0023--ODOS-220511121414.jpg',NULL,NULL,NULL,NULL,0,'2022-05-11 11:44:40',NULL,10022,NULL,'ACTIVO'),(12,12,'protesis oi sin sacar 1 año. \r\npeontrobal plus x2 oi.',NULL,NULL,NULL,NULL,NULL,'j7','protesis ','+1.50     j1 ','+1.50  --','','20/70','protesis ','+0.50-0.50 x 180   20/25 +ag ','--','dp  ??','12','',NULL,NULL,NULL,'oi retiro puntos, adelgaz conj oi, evisceracion oi','','','','','ok','','','plan recubrimiento conjunctival previo a prótesis oi,','oi evisceracion . ','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-12 09:24:59',NULL,10022,NULL,'ACTIVO'),(13,13,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-11 16:21:28','2022-05-11 16:21:28',10015,10015,'ACTIVO'),(14,14,NULL,NULL,NULL,NULL,NULL,NULL,'j16','j16','','','','20/100','20/100','','','','16','20',NULL,NULL,NULL,'','','','normales ','','.3/','.3 cd ratio, pvd','','rx en uso : +2.00/add +3.00 prog. \r\n\r\noct n, paq, cv.','nuclear catarata ao','blefaromeibomitis ao','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 10:27:16','2022-05-18 10:27:16',10022,10019,'ACTIVO'),(15,15,NULL,NULL,NULL,NULL,NULL,NULL,'20/400','20/16','','','','20/80','20/40','','','','13','13',NULL,NULL,NULL,'','','','','','','','','rx en uso  +1.75 \r\n                     +1.50 /  2.50  progresivo','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 09:59:31','2022-05-18 09:59:31',10022,10019,'ACTIVO'),(16,16,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'od:22.5/oi:22 diop.','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F0023--ODOS-220511121414.jpg','F0023_20220511_113340_OCTReport_L_001.jpg','F0023_20220511_112533_OCTReport_N_001.jpg',NULL,NULL,0,'2022-05-18 12:29:10','2022-05-18 12:29:10',10019,10019,'ACTIVO'),(17,17,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 12:13:24','2022-05-18 12:13:24',10019,10019,'ACTIVO'),(18,18,'no ve ',NULL,NULL,NULL,NULL,NULL,'20/800','20/800','+3.00  20/800','+3.00 20/800','','20/400','20/400','neutro  20/400 +ag ','neutro  20/400 +ag ','dp 60','24','21',NULL,NULL,NULL,'','','','normales','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 12:33:15','2022-05-18 12:33:15',10022,10022,'ACTIVO'),(19,19,'lagrimeo abundante , disminución visión oi  5 años .\r\n',NULL,NULL,NULL,NULL,NULL,'j6','j10','+3.00 j2','+3.00  j4','','20/60-2','20/150-1','-1.00 -2.25 x 105   20/30+ag','-3.50 -1.00 x 115   20/50+ag ','69','16','18',NULL,NULL,NULL,'','','','','','','','','rx en uso \r\nod -1.50 -0.75 x 105 \r\noi  -1.50 -3.00 x 75 / +2.50 progr','','','','','','',NULL,'','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,0,'2022-05-18 12:30:22','2022-05-18 12:30:22',10022,10022,'ACTIVO');

/*Table structure for table `consultamedicadiag` */

DROP TABLE IF EXISTS `consultamedicadiag`;

CREATE TABLE `consultamedicadiag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idconsulta` int(11) NOT NULL,
  `orbita` varchar(30) DEFAULT NULL,
  `globos` varchar(30) DEFAULT NULL,
  `lagrim` varchar(30) DEFAULT NULL,
  `escler` varchar(30) DEFAULT NULL,
  `conjunt` varchar(30) DEFAULT NULL,
  `limbo` varchar(30) DEFAULT NULL,
  `parpados` varchar(30) DEFAULT NULL,
  `camant` varchar(30) DEFAULT NULL,
  `iris` varchar(30) DEFAULT NULL,
  `cornea` varchar(30) DEFAULT NULL,
  `presion` varchar(30) DEFAULT NULL,
  `piocc` varchar(30) DEFAULT NULL,
  `reflpup` varchar(30) DEFAULT NULL,
  `cristal` varchar(30) DEFAULT NULL,
  `midria` varchar(30) DEFAULT NULL,
  `observacion` varchar(30) DEFAULT NULL,
  `metodo` varchar(30) DEFAULT NULL,
  `vitreo` varchar(30) DEFAULT NULL,
  `papila` varchar(30) DEFAULT NULL,
  `polpost` varchar(30) DEFAULT NULL,
  `macula` varchar(50) DEFAULT NULL,
  `ecuador` varchar(50) DEFAULT NULL,
  `vasos` varchar(50) DEFAULT NULL,
  `perif` varchar(30) DEFAULT NULL,
  `nervioopt` varchar(30) DEFAULT NULL,
  `observacion2` longblob,
  `visioncol` varchar(30) DEFAULT NULL,
  `esteriopsis` varchar(30) DEFAULT NULL,
  `ordenatencion` varchar(30) DEFAULT NULL,
  `yaglaser` varchar(30) DEFAULT NULL,
  `segantodp` varchar(50) DEFAULT NULL,
  `segantodd` varchar(30) DEFAULT NULL,
  `segantidp` varchar(30) DEFAULT NULL,
  `segantidd` varchar(30) DEFAULT NULL,
  `compliant` longblob,
  `segposodp` varchar(30) DEFAULT NULL,
  `segaposodd` varchar(30) DEFAULT NULL,
  `segposidp` varchar(30) DEFAULT NULL,
  `segposidd` varchar(30) DEFAULT NULL,
  `complipost` longblob,
  `laserrodt` varchar(30) DEFAULT NULL,
  `laserrodti` varchar(30) DEFAULT NULL,
  `laserrodn` varchar(30) DEFAULT NULL,
  `laserrodp` varchar(30) DEFAULT NULL,
  `laserroidt` varchar(30) DEFAULT NULL,
  `laserroiti` varchar(30) DEFAULT NULL,
  `laserroin` varchar(30) DEFAULT NULL,
  `laserroip` varchar(30) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `consultamedicadiag` */

insert  into `consultamedicadiag`(`id`,`idconsulta`,`orbita`,`globos`,`lagrim`,`escler`,`conjunt`,`limbo`,`parpados`,`camant`,`iris`,`cornea`,`presion`,`piocc`,`reflpup`,`cristal`,`midria`,`observacion`,`metodo`,`vitreo`,`papila`,`polpost`,`macula`,`ecuador`,`vasos`,`perif`,`nervioopt`,`observacion2`,`visioncol`,`esteriopsis`,`ordenatencion`,`yaglaser`,`segantodp`,`segantodd`,`segantidp`,`segantidd`,`compliant`,`segposodp`,`segaposodd`,`segposidp`,`segposidd`,`complipost`,`laserrodt`,`laserrodti`,`laserrodn`,`laserrodp`,`laserroidt`,`laserroiti`,`laserroin`,`laserroip`,`med1`,`presc1`,`med2`,`presc2`,`med3`,`presc3`,`med4`,`presc4`,`med5`,`presc5`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`estatus`) values (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hylo dual ','1 gota x3','ciprodex ung','10noc, c2 meses','','','','','','',0,'2022-05-11 10:02:01','2022-05-11 10:02:01',10019,10019,'ACTIVO'),(2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-11 10:48:53','2022-05-11 10:48:53',10019,10019,'ACTIVO'),(3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cristaltears','x6 ao','ciprodex ung','10 noches c2 meses . ao','','','','','','',0,'2022-05-11 12:35:03','2022-05-11 12:35:03',10019,10019,'ACTIVO'),(4,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hylo comod','6 ao','ciprodex','10noc c2 meses ao','zymaran','2, 10 dias oi','','','','',0,'2022-05-12 09:25:52','2022-05-11 13:15:42',10019,10019,'ACTIVO'),(5,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'systame ','1 gita ao x 1 semnanana','','','','','','','','',0,'2022-05-11 16:21:28',NULL,10015,NULL,'ACTIVO'),(6,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ciprodex','10 noches','hylo comod','4','','','','','','',0,'2022-05-18 10:27:16','2022-05-18 10:27:16',10019,10019,'ACTIVO'),(7,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-18 10:19:18','2022-05-18 10:19:18',10019,10019,'ACTIVO'),(8,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'olof ','1 6 meses','hylo dual ','4','ciprodex','10 noches, c2 meses','','','','',0,'2022-05-18 12:13:24',NULL,10019,NULL,'ACTIVO'),(9,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','',0,'2022-05-18 12:29:10',NULL,10019,NULL,'ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `doctores` */

insert  into `doctores`(`id`,`nombres`,`apellidos`,`cedula`,`direccion`,`telefono`,`correo`,`fechanac`,`tiposangre`,`idprofesion`,`isDeleted`,`fechacreacion`,`fechaact`,`usuariocreacion`,`usuarioact`,`idususistem`,`estatus`) values (1,'ROYLE','COLCHA','0918564684','BRISAS DEL RIO','023546546','eldoc@gmail.com','1986-09-09','o+',137,0,'2022-03-14 17:38:36',NULL,1,NULL,0,'ACTIVO'),(2,'Jacqueline','Inca','1303078933','Urbanor',NULL,'marioaguilar1990@gmail.com','1993-03-31','o+',130,0,'2022-03-22 11:40:38','2022-03-22 11:40:38',1,1,0,'ACTIVO'),(3,'Mario','Aguilar','1303078932','Urbanor',NULL,'mariofaguilarg@gmail.com','1990-09-09','O+',83,0,'2022-03-22 03:16:56',NULL,1,NULL,0,'ACTIVO'),(4,'Nelson','Matamoros Sotomayor','0700971724','',NULL,'info@iom.com',NULL,'',64,0,'2022-04-21 17:07:00',NULL,10014,NULL,10013,'ACTIVO'),(5,'Roberto','Matamoros Sanchez','0901052876','',NULL,'info@iom.com',NULL,'',64,0,'2022-04-21 17:07:02',NULL,10014,NULL,10020,'ACTIVO'),(6,'Vanessa','Tomalá Calle','0915617187','',NULL,'vanessatomalac23@gmail.com',NULL,'',146,0,'2022-04-21 17:06:25',NULL,10014,NULL,10022,'ACTIVO'),(7,'Ana María','Luna Rodriguez','0905236485','Bello Horizonte',NULL,'anamaluro@yahoo.es','1966-11-24','',64,0,'2022-05-04 10:08:28',NULL,10014,NULL,10015,'ACTIVO'),(8,'Daniela','Rodríguez Mesias','0918256682','ksjkjahsjgasy',NULL,'kasajhasjh@hotmail.com','1980-05-06','',64,0,'2022-05-04 10:08:29',NULL,10014,NULL,10018,'ACTIVO'),(9,'GLADYS','ZUÑIGA ','1706091483','CHIMBORAZO 3402',NULL,'gladyszu@yahoo.com','1962-10-07','o+',143,0,'2022-05-04 10:07:15',NULL,10021,NULL,10019,'ACTIVO');

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

insert  into `inventario_bck`(`id`,`idproducto`,`idpresentacion`,`cantidadini`,`cantidadcaja`,`stock`,`precioint`,`preciov1`,`preciov2`,`preciovp`,`codigobarras`,`codigocaja`,`isDeleted`,`fechacreacion`,`usuariocreacion`,`estatus`) values (1,1,1,10,10,10,0.60,0.80,0.90,0.95,'032251488986','032251488986',0,'2019-10-13 10:41:30',1,'ACTIVO'),(3,672,1,1,1,1,0.70,0.70,0.70,0.70,'4713435795965','16516',0,'2020-02-24 19:52:24',1,'ACTIVO'),(4,44,1,1111,2,21,0.00,1.00,1.26,1.35,'7861055900904','78610559009041',0,'2020-02-24 20:30:03',1,'ACTIVO'),(5,11,1,11,2,2,1.15,1.20,1.30,1.35,'7861055900904','78610559009041',0,'2020-02-24 20:32:24',1,'ACTIVO'),(6,502,1,1,1,1,0.80,0.90,1.00,1.10,'7861055900904','78610559009041',0,'2020-02-24 20:35:25',1,'ACTIVO'),(7,697,1,1,1,1,4.00,5.00,5.00,6.00,'2002002','2002002',1,'2020-02-25 12:21:14',1,'ACTIVO'),(8,700,1,15,1,15,1.40,1.40,1.40,1.40,'2002001','2002001',1,'2020-02-25 12:23:23',1,'ACTIVO'),(9,697,1,15,1,15,0.80,1.40,1.40,1.40,'2002002','2002002',0,'2020-02-25 12:28:41',1,'ACTIVO'),(10,700,1,15,1,15,0.40,0.70,0.70,0.70,'2002001','2002001',0,'2020-02-25 12:37:17',1,'ACTIVO'),(11,696,1,1,1,1,4.00,5.00,5.00,6.00,'2002003','2002003',0,'2020-02-25 12:42:28',1,'ACTIVO'),(12,728,1,30,1,30,2.25,3.25,3.25,3.50,'200104','200104',0,'2020-02-25 14:49:12',1,'ACTIVO'),(13,727,1,30,1,30,1.35,2.25,2.25,2.25,'200103','200103',0,'2020-02-25 14:53:14',1,'ACTIVO'),(14,726,1,40,1,40,0.45,0.80,0.80,0.80,'200102','200102',0,'2020-02-25 14:57:52',1,'ACTIVO'),(15,774,1,32,1,32,0.55,0.65,0.65,0.65,'200601','200601',1,'2020-02-25 17:04:28',1,'ACTIVO'),(16,772,1,32,1,32,1.10,1.30,1.30,1.30,'200602','200602',0,'2020-02-25 17:13:09',1,'ACTIVO'),(17,763,1,1,1,1,0.30,0.50,0.50,0.50,'200501','200501',1,'2020-02-25 17:26:44',1,'ACTIVO'),(18,763,1,5,1,5,0.30,0.50,0.50,0.50,'200501','200501',0,'2020-02-25 18:43:31',1,'ACTIVO'),(19,730,1,12,1,12,0.85,0.95,0.95,0.95,'7861061940406','7861061940406',0,'2020-02-25 19:02:52',1,'ACTIVO'),(20,900,1,24,12,24,0.80,0.95,0.95,0.95,'7861138608611','7861138608611',1,'2020-02-25 19:17:24',1,'ACTIVO'),(21,900,1,40,12,40,0.85,1.00,1.00,1.00,'7861138608611','7861138608611',0,'2020-02-25 19:19:57',1,'ACTIVO'),(22,901,1,23,1,23,0.42,0.50,0.50,0.50,'7861138608628','7861138608628',0,'2020-02-25 19:21:59',1,'ACTIVO'),(23,902,1,19,1,19,0.22,0.30,0.30,0.30,'7861138604361','7861138604361',0,'2020-02-25 19:23:57',1,'ACTIVO'),(24,733,1,1,20,1,0.42,0.50,0.50,0.50,'7861002002521','7861002002521',0,'2020-02-25 19:29:43',1,'ACTIVO'),(25,787,1,6,1,6,2.00,2.35,2.35,2.35,'7861055900720','7861055900720',0,'2020-02-25 19:49:19',1,'ACTIVO'),(26,785,1,2,6,2,0.46,0.55,0.55,0.55,'7861055902724','7861055902724',0,'2020-02-25 19:53:15',1,'ACTIVO'),(27,775,10,7,12,7,0.87,1.00,1.00,1.00,'7861055903349','7861055903349',0,'2020-02-25 20:27:21',1,'ACTIVO'),(28,777,10,12,12,12,0.90,1.00,1.00,1.00,'7861055903356','7861055903356',0,'2020-02-25 20:30:08',1,'ACTIVO'),(29,778,10,19,12,19,1.11,1.25,1.25,1.25,'7861055903370','7861055903370',0,'2020-02-25 20:37:02',1,'ACTIVO'),(30,750,9,10,12,10,1.11,1.25,1.25,1.25,'7861055900904','7861055900904',0,'2020-02-25 20:41:55',1,'ACTIVO'),(31,782,9,16,12,16,1.20,1.30,1.30,1.30,'7861029401635','7861029401635',0,'2020-02-25 20:44:29',1,'ACTIVO'),(32,755,9,11,12,11,1.25,1.40,1.40,1.40,'7861055900928','7861055900928',0,'2020-02-25 20:49:58',1,'ACTIVO'),(33,759,9,6,12,6,1.25,1.45,1.45,1.45,'7861055901048','7861055901048',0,'2020-02-25 20:52:34',1,'ACTIVO'),(34,762,9,3,12,3,1.10,1.30,1.30,1.30,'7861029404780','7861029404780',0,'2020-02-25 21:01:37',1,'ACTIVO'),(35,765,9,6,12,6,1.10,1.30,1.30,1.30,'7861029404803','7861029404803',0,'2020-02-25 21:04:07',1,'ACTIVO'),(36,822,9,6,12,6,1.80,2.05,2.05,2.05,'7861001235715','7861001235715',0,'2020-02-26 08:29:36',1,'ACTIVO'),(37,738,9,10,12,10,1.18,1.35,1.35,1.35,'7861001234893','7861001234893',1,'2020-02-26 08:39:16',1,'ACTIVO'),(38,777,9,22,12,22,1.28,1.45,1.45,1.45,'7861001234909','7861001200140',0,'2020-02-26 08:45:43',1,'ACTIVO'),(39,738,9,34,12,34,1.18,1.35,1.35,1.35,'7861001234893','7861001200058',0,'2020-02-26 08:51:10',1,'ACTIVO'),(40,622,11,37,48,37,1.41,1.75,1.75,1.75,'090388111115','090388111115',0,'2020-02-26 09:44:02',1,'ACTIVO'),(41,615,1,71,24,1,2.48,3.00,3.00,3.00,'090388002376','090388002376',1,'2020-02-26 09:48:10',1,'ACTIVO'),(42,615,11,71,24,71,2.48,3.00,3.00,3.00,'090388002376','090388002376',0,'2020-02-26 09:57:01',1,'ACTIVO'),(43,618,11,192,48,192,1.15,1.50,1.50,1.50,'090388000792','090388000792',0,'2020-02-26 10:04:57',1,'ACTIVO'),(44,783,5,64,1,1,0.55,0.70,0.70,0.70,'200301','200301',1,'2020-02-26 10:33:55',1,'ACTIVO'),(45,925,5,26,1,26,1.10,1.40,1.40,1.40,'200302','200302',0,'2020-02-26 10:38:11',1,'ACTIVO'),(46,783,5,64,1,64,0.55,0.70,0.70,0.70,'200301','200301',0,'2020-02-26 10:43:57',1,'ACTIVO'),(47,926,5,8,1,8,3.30,3.90,3.90,3.90,'200303','200303',0,'2020-02-26 10:48:06',1,'ACTIVO'),(48,927,5,0,1,0,5.50,6.50,6.50,6.50,'200304','200304',0,'2020-02-26 10:50:49',1,'ACTIVO'),(49,784,5,0,1,0,1.80,2.40,2.40,2.40,'200503','200503',0,'2020-02-26 11:03:03',1,'ACTIVO'),(50,940,5,0,1,0,3.00,4.00,4.00,4.00,'200504','200504',0,'2020-02-26 11:04:44',1,'ACTIVO'),(51,760,5,24,1,24,0.60,1.00,1.00,1.00,'200502','200502',0,'2020-02-26 11:11:16',1,'ACTIVO'),(52,950,5,0,1,0,0.30,0.50,0.50,0.50,'200201','200201',0,'2020-02-26 11:22:11',1,'ACTIVO'),(53,953,5,0,1,0,0.60,1.00,1.00,1.00,'200202','200202',0,'2020-02-26 11:23:29',1,'ACTIVO'),(54,960,5,44,1,44,0.33,0.50,0.50,0.50,'200401','200401',0,'2020-02-26 11:33:38',1,'ACTIVO'),(55,931,6,18,1,18,1.10,1.50,1.50,1.50,'2001002','2001002',0,'2020-02-26 11:34:59',1,'ACTIVO'),(56,961,5,38,1,38,0.65,1.00,1.00,1.00,'200402','200402',0,'2020-02-26 11:35:57',1,'ACTIVO'),(57,932,6,19,1,19,0.55,0.75,0.75,0.75,'2001001','2001001',0,'2020-02-26 11:38:56',1,'ACTIVO'),(58,945,6,10,1,10,0.25,0.40,0.40,0.40,'2005001','2005001',0,'2020-02-26 11:41:31',1,'ACTIVO'),(59,946,6,15,1,15,0.60,0.80,0.80,0.80,'2005002','2005002',0,'2020-02-26 11:43:17',1,'ACTIVO'),(60,937,5,65,1,65,0.22,0.50,0.50,0.50,'200801','200801',0,'2020-02-26 11:45:14',1,'ACTIVO'),(61,938,5,53,1,53,0.44,1.00,1.00,1.00,'200802','200802',0,'2020-02-26 11:47:31',1,'ACTIVO'),(62,955,6,13,1,13,0.85,1.30,1.30,1.30,'200702','200702',0,'2020-02-26 12:02:00',1,'ACTIVO'),(63,954,6,27,1,27,0.43,0.65,0.65,0.65,'200701','200701',0,'2020-02-26 12:05:58',1,'ACTIVO'),(64,786,6,67,1,67,0.15,0.20,0.20,0.20,'300001','300001',0,'2020-02-26 12:16:46',1,'ACTIVO'),(65,968,9,3,1,3,1.76,2.10,2.10,2.10,'7861001235807','7861001235807',0,'2020-02-26 12:23:24',1,'ACTIVO'),(66,814,6,13,1,13,0.87,1.20,1.20,1.20,'300005','300005',0,'2020-02-26 12:23:40',1,'ACTIVO'),(67,786,6,35,1,35,0.29,0.40,0.40,0.40,'300002','300002',0,'2020-02-26 12:26:37',1,'ACTIVO'),(68,788,6,10,1,10,1.45,1.75,1.75,1.75,'380003','380003',0,'2020-02-26 12:30:06',1,'ACTIVO'),(69,792,6,4,1,4,7.25,8.00,8.00,8.00,'300004','300004',0,'2020-02-26 12:32:41',1,'ACTIVO'),(70,986,6,2,1,2,31.00,33.00,33.00,33.00,'300006','300006',0,'2020-02-26 12:39:33',1,'ACTIVO'),(71,974,6,74,1,74,0.16,0.25,0.25,0.25,'300301','300301',0,'2020-02-26 12:55:38',1,'ACTIVO'),(72,975,6,28,1,28,0.32,0.50,0.50,0.50,'300302','300302',0,'2020-02-26 12:57:23',1,'ACTIVO'),(73,976,6,4,1,4,1.60,2.25,2.25,2.25,'300303','300303',0,'2020-02-26 12:59:32',1,'ACTIVO'),(74,977,6,4,1,4,3.20,4.00,4.00,4.00,'300304','300304',0,'2020-02-26 13:01:19',1,'ACTIVO'),(75,978,6,4,1,4,8.00,9.00,9.00,9.00,'300305','300305',0,'2020-02-26 13:02:57',1,'ACTIVO'),(76,1007,5,23,15,23,0.73,1.00,1.00,1.00,'7861029700080','17861029700087',0,'2020-02-26 13:26:06',1,'ACTIVO'),(77,1011,5,166,10,166,1.44,1.80,1.80,1.80,'7861029700035','10117861029700032',0,'2020-02-26 13:49:29',1,'ACTIVO'),(78,1002,5,148,15,148,0.73,1.00,1.00,1.00,'7861029700042','27861029700046',0,'2020-02-26 13:55:33',1,'ACTIVO'),(79,1000,5,318,10,318,1.44,1.80,1.80,1.80,'7861029700028','117861029700025',0,'2020-02-26 14:04:28',1,'ACTIVO'),(80,999,5,611,40,611,0.40,0.50,0.50,0.50,'7861029700097','17861029700094',0,'2020-02-26 14:20:22',1,'ACTIVO'),(81,997,5,1096,60,1096,0.20,0.30,0.30,0.30,'7861029700141','17861029700148',0,'2020-02-26 14:26:12',1,'ACTIVO'),(82,1008,5,33,50,33,0.43,0.50,0.50,0.50,'7861057500010','7861057500010',0,'2020-02-26 15:22:02',1,'ACTIVO'),(83,1009,5,18,25,18,0.70,0.85,0.85,0.85,'7861057500027','7861057500027',0,'2020-02-26 15:26:50',1,'ACTIVO'),(84,1056,5,138,100,138,0.26,0.35,0.35,0.35,'7861057500034','7861057500034',0,'2020-02-26 15:28:38',1,'ACTIVO'),(85,228,2,27,15,27,2.77,3.30,3.30,3.30,'7861048610087','27861048610081',0,'2020-02-26 15:46:41',1,'ACTIVO'),(86,235,2,2,24,2,0.71,1.00,1.00,1.00,'7861002559377','7861002559377',0,'2020-02-26 16:32:14',1,'ACTIVO'),(87,4,1,21,2,21,0.00,1.00,1.26,1.35,'7861055900904','78610559009041',0,'2020-02-26 16:42:28',1,'ACTIVO'),(88,231,2,54,30,54,0.76,1.00,1.00,1.00,'7861048690737','17861048690734',0,'2020-02-26 16:43:21',1,'ACTIVO'),(89,226,2,43,30,143,1.61,1.90,1.90,1.90,'7861048610094','7861048610094',0,'2020-02-26 16:48:45',1,'ACTIVO'),(90,232,2,76,15,76,1.30,1.70,1.70,1.70,'7861048690256','17861048690253',0,'2020-02-26 16:57:19',1,'ACTIVO'),(91,225,2,75,30,75,1.62,1.00,1.00,1.00,'7861048680592','17861048680599',1,'2020-02-26 17:00:37',1,'ACTIVO'),(92,217,2,34,30,34,1.62,2.00,2.00,2.00,'7861048690225','17861048690222',0,'2020-02-26 17:06:45',1,'ACTIVO'),(93,225,2,105,30,105,0.78,1.00,1.00,1.00,'7861048680592','17861048680599',0,'2020-02-26 17:10:20',1,'ACTIVO'),(94,624,11,46,100,46,0.76,0.95,0.95,0.95,'090388003519','090388003519',0,'2020-02-26 17:27:14',1,'ACTIVO'),(95,1135,7,1,1,1,1.35,1.35,1.35,1.35,'2805922004444','2805922004444',0,'2020-02-26 17:27:44',1,'ACTIVO'),(96,1136,7,1,1,1,2.00,2.00,2.00,2.00,'2805921006005','2805921006005',0,'2020-02-26 17:28:08',1,'ACTIVO'),(97,1136,7,1,1,1,1.18,1.18,1.18,1.18,'2805922003898','2805922003898',0,'2020-02-26 17:31:40',1,'ACTIVO'),(98,1136,7,1,1,1,1.80,1.80,1.80,1.80,'2805921005411','2805921005411',0,'2020-02-26 17:32:16',1,'ACTIVO'),(99,1136,7,1,1,1,1.71,1.71,1.71,1.71,'2805921005145','2805921005145',0,'2020-02-26 17:33:25',1,'ACTIVO'),(100,1137,11,40,100,40,0.60,0.75,0.75,0.75,'722008000317','722008000317',0,'2020-02-26 17:33:36',1,'ACTIVO'),(101,1136,7,1,1,1,2.01,2.01,2.01,2.01,'2805921006036','2805921006036',0,'2020-02-26 17:36:47',1,'ACTIVO'),(102,1135,7,1,1,1,1.23,1.23,1.23,1.23,'2805922004048','2805922004048',0,'2020-02-26 17:38:10',1,'ACTIVO'),(103,1139,11,139,48,139,1.20,1.50,1.50,1.50,'8426920213009','8426920213009',0,'2020-02-26 17:38:24',1,'ACTIVO'),(104,1136,7,1,1,1,1.90,1.90,1.90,1.90,'2805921005701','2805921005701',0,'2020-02-26 17:38:33',1,'ACTIVO'),(105,1136,7,1,1,1,1.91,1.91,1.91,1.91,'2805921005749','2805921005749',0,'2020-02-26 17:39:46',1,'ACTIVO'),(106,1135,7,1,1,1,1.18,1.18,1.18,1.18,'2805922003881','2805922003881',0,'2020-02-26 17:40:05',1,'ACTIVO'),(107,1135,7,1,1,1,1.26,1.26,1.26,1.26,'2805922004130','2805922004130',0,'2020-02-26 17:40:37',1,'ACTIVO'),(108,588,11,1,48,1,2.60,3.00,3.00,3.00,'8410111004569','8410111004569',0,'2020-02-26 17:40:52',1,'ACTIVO'),(109,1136,7,1,1,1,1.75,1.75,1.75,1.75,'2805921005251','2805921005251',0,'2020-02-26 17:41:11',1,'ACTIVO'),(110,1136,7,1,1,1,2.07,2.07,2.07,2.07,'2805921006227','2805921006227',0,'2020-02-26 17:41:46',1,'ACTIVO'),(111,869,7,28,28,28,0.00,0.00,0.00,0.75,'7861048601658','7861048601658',0,'2020-02-26 17:50:20',1,'ACTIVO'),(113,856,7,48,1,48,0.00,0.00,0.00,1.15,'78600676','78600676',0,'2020-02-26 17:57:56',1,'ACTIVO'),(114,601,11,16,6,16,5.55,7.00,7.00,7.00,'8410111216009','8410111216009',0,'2020-02-26 17:58:16',1,'ACTIVO'),(115,858,7,26,1,26,0.00,0.00,0.00,0.55,'78600652','78600652',0,'2020-02-26 17:59:00',1,'ACTIVO'),(116,871,7,23,1,23,0.00,0.00,0.00,0.65,'7861048637510','7861048637510',0,'2020-02-26 18:00:51',1,'ACTIVO'),(117,1146,11,52,3,52,1.70,2.20,2.20,2.20,'7862119505509','7862119505509',0,'2020-02-26 18:01:52',1,'ACTIVO'),(120,1145,11,77,16,77,1.95,2.30,2.30,2.30,'722008000133','722008000133',0,'2020-02-26 18:04:20',1,'ACTIVO'),(121,1143,11,8,1,8,1.95,2.30,2.30,2.30,'8426920010196','8426920010196',0,'2020-02-26 18:05:46',1,'ACTIVO'),(122,612,11,82,1,82,1.10,1.25,1.25,1.25,'722008000218','722008000218',0,'2020-02-26 18:08:24',1,'ACTIVO'),(126,613,11,32,48,32,1.33,1.60,1.60,1.60,'9001001','9001001',0,'2020-02-26 18:18:53',1,'ACTIVO'),(127,1138,5,27,1,27,1.00,1.00,1.00,1.00,'7861001301212','7861001301212',0,'2020-02-26 18:19:38',1,'ACTIVO'),(128,1140,5,2,1,2,2.00,2.00,2.00,2.00,'7861001301267','7861001301267',0,'2020-02-26 18:21:27',1,'ACTIVO'),(129,1149,5,11,1,11,2.00,2.00,2.00,2.00,'7861001301250','7861001301250',0,'2020-02-26 18:23:19',1,'ACTIVO'),(130,1147,5,44,1,44,1.00,1.00,1.00,1.00,'7861001301342','7861001301342',0,'2020-02-26 18:25:49',1,'ACTIVO'),(131,625,11,27,1,27,1.10,1.30,1.30,1.30,'7861021250019','7861021250019',0,'2020-02-26 18:26:04',1,'ACTIVO'),(132,1154,7,31,1,31,0.65,0.00,0.00,0.65,'7861048636070','7861048636070',0,'2020-02-26 18:26:18',1,'ACTIVO'),(133,1148,5,4,1,4,1.50,1.50,1.50,1.50,'7861001301236','7861001301236',0,'2020-02-26 18:27:40',1,'ACTIVO'),(134,860,7,34,1,34,0.45,0.00,0.00,0.45,'7861001714203','7861001714203',0,'2020-02-26 18:28:53',1,'ACTIVO'),(135,1158,11,40,24,40,2.55,3.00,3.00,3.00,'722008000249','722008000249',0,'2020-02-26 18:32:41',1,'ACTIVO'),(136,867,13,11,1,11,0.65,0.00,0.00,0.65,'7861048600736','7861048600736',0,'2020-02-26 18:34:30',1,'ACTIVO'),(137,1116,5,29,1,29,0.50,0.50,0.50,0.50,'7861001301205','7861001301205',0,'2020-02-26 18:37:32',1,'ACTIVO'),(138,889,4,6,1,6,1.97,0.00,0.00,1.97,'7861038057571','7861038057571',0,'2020-02-26 18:44:36',1,'ACTIVO'),(139,606,11,17,1,17,1.35,1.60,1.60,1.60,'722008000324','722008000324',0,'2020-02-26 18:45:12',1,'ACTIVO'),(140,889,4,1,1,1,1.97,0.00,0.00,1.97,'7861038057588','7861038057588',0,'2020-02-26 18:45:39',1,'ACTIVO'),(141,898,4,16,1,16,1.60,0.00,0.00,1.60,'7702010382130','7702010382130',0,'2020-02-26 18:52:30',1,'ACTIVO'),(142,894,4,19,1,19,0.90,0.00,0.00,0.90,'7702010382123','7702010382123',0,'2020-02-26 18:53:45',1,'ACTIVO'),(143,890,4,5,1,5,0.75,0.00,0.00,0.75,'7861048632157','7861048632157',0,'2020-02-26 18:54:31',1,'ACTIVO'),(144,895,4,4,1,4,1.60,0.00,0.00,1.60,'7702010380747','7702010380747',0,'2020-02-26 18:56:47',1,'ACTIVO'),(145,1166,11,7,1,7,1.35,1.60,1.60,1.60,'722008000102','722008000102',0,'2020-02-26 18:57:42',1,'ACTIVO'),(146,896,4,1,1,1,1.60,0.00,0.00,1.60,'7702010381881','7702010381881',0,'2020-02-26 18:57:45',1,'ACTIVO'),(147,893,4,3,1,3,0.90,0.00,0.00,0.90,'7702010382116','7702010382116',0,'2020-02-26 18:58:49',1,'ACTIVO'),(148,1167,4,2,1,2,0.75,0.00,0.00,0.75,'7861048632171','7861048632171',0,'2020-02-26 19:00:35',1,'ACTIVO'),(149,1164,13,97,97,97,0.90,0.90,0.90,0.90,'7861001343632','7861001343632',0,'2020-02-26 19:03:38',1,'ACTIVO'),(150,1165,13,47,1,47,0.65,0.00,0.00,0.65,'7861001349214','7861001349214',0,'2020-02-26 19:04:16',1,'ACTIVO'),(151,891,4,12,1,12,0.90,0.00,0.00,0.90,'7702010381256','7702010381256',0,'2020-02-26 19:06:28',1,'ACTIVO'),(152,1168,11,8,1,8,6.50,8.00,8.00,8.00,'722008000294','722008000294',0,'2020-02-26 19:07:37',1,'ACTIVO'),(153,1163,13,16,1,16,0.90,0.00,0.00,0.90,'7861001349252','7861001349252',0,'2020-02-26 19:07:58',1,'ACTIVO'),(154,1165,13,82,1,82,0.65,0.00,0.00,0.65,'7861001343649','7861001343649',0,'2020-02-26 19:08:39',1,'ACTIVO'),(155,875,4,3,1,3,0.90,0.00,0.00,0.90,'7861036712106','7861036712106',0,'2020-02-26 19:10:33',1,'ACTIVO'),(156,876,4,3,1,3,0.90,0.00,0.00,0.90,'7861036712229','7861036712229',0,'2020-02-26 19:11:05',1,'ACTIVO'),(157,1169,4,5,1,5,0.90,0.00,0.00,0.90,'7861036712212','7861036712212',0,'2020-02-26 19:15:29',1,'ACTIVO'),(158,1171,4,2,1,2,1.23,0.00,0.00,1.23,'7751851004923','7751851004923',0,'2020-02-26 19:16:44',1,'ACTIVO'),(159,1159,11,42,1,42,3.90,4.50,4.50,4.50,'722008001482','722008001482',0,'2020-02-26 19:17:07',1,'ACTIVO'),(160,1170,4,6,1,6,0.90,0.00,0.00,0.90,'7861036712236','7861036712236',0,'2020-02-26 19:17:44',1,'ACTIVO'),(161,1173,4,1,1,1,1.65,0.00,0.00,1.65,'7861036713158','7861036713158',0,'2020-02-26 19:20:37',1,'ACTIVO'),(162,1174,13,1,1,1,0.65,0.00,0.00,0.65,'7861001716825','7861001716825',0,'2020-02-26 19:25:02',1,'ACTIVO'),(163,1172,13,1,1,1,0.65,0.00,0.00,0.65,'7861001716764','7861001716764',0,'2020-02-26 19:25:50',1,'ACTIVO'),(164,1175,13,9,1,9,0.65,0.00,0.00,0.65,'7861001716788','7861001716788',0,'2020-02-26 19:26:50',1,'ACTIVO'),(165,549,11,4,1,4,1.90,2.40,2.40,2.40,'044695002758','044695002758',0,'2020-02-26 19:28:47',1,'ACTIVO'),(166,1176,13,2,1,2,0.65,0.00,0.00,0.65,'7861001718713','7861001718713',0,'2020-02-26 19:28:49',1,'ACTIVO'),(167,1175,13,1,1,1,0.45,0.00,0.00,0.45,'7861001716856','7861001716856',0,'2020-02-26 19:29:40',1,'ACTIVO'),(168,550,11,4,1,4,3.00,3.50,3.50,3.50,'044695002727','044695002727',0,'2020-02-26 19:30:18',1,'ACTIVO'),(169,1177,7,11,1,11,1.00,0.00,0.00,1.00,'7861001718638','7861001718638',0,'2020-02-26 19:30:37',1,'ACTIVO'),(170,542,11,10,1,10,0.85,1.10,1.10,1.10,'044695061007','044695061007',0,'2020-02-26 19:31:52',1,'ACTIVO'),(171,555,11,82,24,82,1.50,2.00,2.00,2.00,'044695000150','044695000150',0,'2020-02-26 19:33:54',1,'ACTIVO'),(172,548,11,6,1,6,1.65,2.15,2.15,2.15,'044695000167','044695000167',0,'2020-02-26 19:37:00',1,'ACTIVO'),(173,1181,2,13,1,13,1.60,0.00,0.00,1.60,'7861032255485','7861032255485',0,'2020-02-26 19:37:43',1,'ACTIVO'),(174,1180,4,10,1,10,4.40,0.00,0.00,4.40,'7861032200034','7861032200034',0,'2020-02-26 19:39:01',1,'ACTIVO'),(175,1179,13,2,1,2,0.65,0.00,0.00,0.65,'7861001717297','7861001717297',0,'2020-02-26 19:39:36',1,'ACTIVO'),(176,541,11,1,1,1,1.40,1.90,1.90,1.90,'044695000846','044695000846',0,'2020-02-26 19:40:11',1,'ACTIVO'),(177,1178,13,3,1,3,0.65,0.00,0.00,0.65,'7861001716801','7861001716801',0,'2020-02-26 19:40:25',1,'ACTIVO'),(178,543,11,6,1,6,2.24,2.50,2.50,2.50,'044695041009','044695041009',0,'2020-02-26 19:42:48',1,'ACTIVO'),(179,539,11,5,1,5,1.53,1.90,1.90,1.90,'044695018001','044695018001',0,'2020-02-26 19:43:58',1,'ACTIVO'),(180,538,11,3,1,3,1.53,2.00,2.00,2.00,'044695001096','044695001096',0,'2020-02-26 19:45:35',1,'ACTIVO'),(181,1185,4,17,1,17,4.24,0.00,0.00,4.24,'7751851006620','7751851006620',0,'2020-02-26 19:46:34',1,'ACTIVO'),(182,1182,4,25,1,25,1.00,0.00,0.00,1.00,'2301415990008','2301415990008',0,'2020-02-26 19:48:48',1,'ACTIVO'),(183,1183,10,9,1,9,1.00,0.00,0.00,1.00,'7702010283215','7702010283215',0,'2020-02-26 19:49:31',1,'ACTIVO'),(184,545,11,2,1,2,1.75,2.15,2.15,2.15,'044695003427','044695003427',0,'2020-02-26 19:50:17',1,'ACTIVO'),(185,537,11,5,1,5,1.60,1.95,1.95,1.95,'044695033004','044695033004',0,'2020-02-26 19:52:02',1,'ACTIVO'),(186,1189,2,2,1,2,4.81,0.00,0.00,4.81,'7751851006613','7751851006613',0,'2020-02-26 19:52:23',1,'ACTIVO'),(187,552,11,6,1,6,1.45,1.75,1.75,1.75,'044695010005','044695010005',0,'2020-02-26 19:53:46',1,'ACTIVO'),(188,1193,2,12,1,12,2.00,0.00,0.00,2.00,'7861032238990','7861032238990',0,'2020-02-26 19:55:49',1,'ACTIVO'),(189,1191,2,1,1,1,1.30,1.70,1.70,1.70,'044695012900','044695012900',0,'2020-02-26 19:57:39',1,'ACTIVO'),(190,1194,14,5,1,5,5.00,0.00,0.00,5.00,'7591005993051','7591005993051',0,'2020-02-26 19:58:38',1,'ACTIVO'),(191,547,11,4,1,4,1.60,1.90,1.90,1.90,'044695022008','044695022008',0,'2020-02-26 19:59:09',1,'ACTIVO'),(192,1195,14,6,1,6,3.50,0.00,0.00,3.50,'7591005993068','7591005993068',0,'2020-02-26 19:59:51',1,'ACTIVO'),(193,556,11,29,1,29,0.60,0.90,0.90,0.90,'044695004035','044695004035',0,'2020-02-26 20:01:38',1,'ACTIVO'),(194,1192,7,22,22,22,1.00,1.00,1.00,1.00,'7861048601252','7861048601252',0,'2020-02-26 20:02:42',1,'ACTIVO'),(195,1188,10,4,1,4,1.00,0.00,0.00,1.00,'7861001300574','7861001300574',0,'2020-02-26 20:03:38',1,'ACTIVO'),(196,1187,10,16,1,16,1.00,0.00,0.00,1.00,'7861001300567','7861001300567',0,'2020-02-26 20:04:46',1,'ACTIVO'),(197,1186,10,16,1,16,1.00,0.00,0.00,1.00,'7861001300581','7861001300581',0,'2020-02-26 20:05:20',1,'ACTIVO'),(198,1190,10,20,1,20,1.00,0.00,0.00,1.00,'7861001300598','7861001300598',0,'2020-02-26 20:05:50',1,'ACTIVO'),(199,554,11,6,1,6,2.50,3.00,3.00,3.00,'044695003526','044695003526',0,'2020-02-26 20:08:50',1,'ACTIVO'),(200,1184,10,13,1,13,1.25,0.00,0.00,1.25,'7702010282751','7702010282751',0,'2020-02-26 20:09:30',1,'ACTIVO'),(201,1196,7,14,1,14,1.00,0.00,0.00,1.00,'7861001714296','7861001714296',0,'2020-02-26 20:12:32',1,'ACTIVO'),(202,1199,11,2,1,2,0.90,1.25,1.25,1.25,'044695019503','044695019503',0,'2020-02-26 20:13:35',1,'ACTIVO'),(203,1203,7,41,1,41,1.00,0.00,0.00,1.00,'7861023208032','7861023208032',0,'2020-02-26 20:18:06',1,'ACTIVO'),(204,1204,7,48,1,48,1.25,0.00,0.00,1.25,'7861023206953','7861023206953',0,'2020-02-26 20:18:41',1,'ACTIVO'),(205,1205,11,2,1,2,2.50,3.40,3.40,3.40,'7861015122001','7861015122001',0,'2020-02-26 20:22:45',1,'ACTIVO'),(206,1152,5,13,1,13,3.30,0.00,0.00,3.30,'7861001300949','7861001300949',0,'2020-02-26 20:23:19',1,'ACTIVO'),(207,1144,5,13,1,13,3.30,0.00,0.00,3.30,'7861001300932','7861001300932',0,'2020-02-26 20:24:06',1,'ACTIVO'),(208,1155,5,6,1,6,3.30,0.00,0.00,3.30,'7861001300956','7861001300956',0,'2020-02-26 20:28:17',1,'ACTIVO'),(209,1207,11,67,24,67,2.50,3.00,3.00,3.00,'044695000143','044695000143',0,'2020-02-26 20:31:26',1,'ACTIVO'),(210,1153,5,22,1,22,1.00,1.00,1.00,1.00,'7861001301335','7861001301335',0,'2020-02-26 20:35:14',1,'ACTIVO'),(211,1147,5,44,1,44,1.00,1.00,1.00,1.00,'7861001301335','7861001301335',0,'2020-02-26 20:36:24',1,'ACTIVO'),(212,1156,5,49,1,49,1.00,1.00,1.00,1.00,'7861001360868','7861001360868',0,'2020-02-26 20:37:52',1,'ACTIVO'),(213,1141,5,59,1,59,1.00,1.00,1.00,1.00,'7861001301304','7861001301304',0,'2020-02-26 20:39:05',1,'ACTIVO'),(214,1150,5,46,1,46,1.00,1.00,1.00,1.00,'7861001301328','7861001301328',0,'2020-02-26 20:40:23',1,'ACTIVO'),(215,1198,7,203,203,203,1.00,1.00,1.00,1.00,'7702010111501','7702010111501',0,'2020-02-26 20:41:48',1,'ACTIVO'),(216,509,5,8,1,8,0.50,0.70,0.70,0.70,'7861025522587','7861025522587',0,'2020-02-26 20:44:09',1,'ACTIVO'),(217,1138,5,27,27,27,0.50,0.50,0.50,0.50,'7861001301212','7861001301212',0,'2020-02-26 20:44:15',1,'ACTIVO'),(219,512,5,0,1,0,0.90,1.20,1.20,1.20,'7861025522303','7861025522303',0,'2020-02-26 20:46:11',1,'ACTIVO'),(220,1213,15,292,292,292,0.30,0.30,0.30,0.30,'7861020000110','7861020000110',0,'2020-02-26 20:47:12',1,'ACTIVO'),(221,519,5,4,1,4,2.00,2.40,2.40,2.40,'7861029300006','7861029300006',0,'2020-02-26 20:48:54',1,'ACTIVO'),(222,1200,7,2,2,2,1.50,1.50,1.50,1.50,'7702010112003','7702010112003',0,'2020-02-26 20:52:16',1,'ACTIVO'),(223,1208,7,15,15,15,1.00,1.00,1.00,1.00,'7702354928216','7702354928216',0,'2020-02-26 20:53:23',1,'ACTIVO'),(224,1214,5,14,14,14,1.00,1.00,1.00,1.00,'7861001300710','7861001300710',0,'2020-02-26 20:53:37',1,'ACTIVO'),(225,1206,7,15,15,15,1.00,1.00,1.00,1.00,'6902088607437','6902088607437',0,'2020-02-26 20:54:31',1,'ACTIVO'),(226,1209,7,23,23,23,0.75,0.75,0.75,0.75,'7861048603133','7861048603133',0,'2020-02-26 20:55:32',1,'ACTIVO'),(227,1211,2,11,11,11,1.50,1.50,1.50,1.50,'7861038058400','7861038058400',0,'2020-02-26 20:56:34',1,'ACTIVO'),(228,1210,10,16,16,16,1.00,1.00,1.00,1.00,'7861001300840','7861001300840',0,'2020-02-26 20:57:27',1,'ACTIVO'),(229,1218,11,2,1,2,2.00,2.45,2.45,2.45,'044695002130','044695002130',0,'2020-02-26 20:58:47',1,'ACTIVO'),(230,1216,7,4,4,4,1.50,1.50,1.50,1.50,'7702027048548','7702027048548',0,'2020-02-26 21:04:13',1,'ACTIVO'),(231,521,7,34,1,34,1.50,1.75,1.75,1.75,'739907000010','739907000010',0,'2020-02-26 21:04:30',1,'ACTIVO'),(232,1217,7,7,7,7,1.50,1.50,1.50,1.50,'7702027444685','7702027444685',0,'2020-02-26 21:05:01',1,'ACTIVO'),(234,1215,7,39,39,39,1.40,1.40,1.40,1.40,'7861003121214','7861003121214',0,'2020-02-26 21:08:30',1,'ACTIVO'),(235,1142,5,6,6,6,3.00,3.00,3.00,3.00,'7861001350180','7861001350180',0,'2020-02-26 21:10:43',1,'ACTIVO'),(237,227,2,11,1,11,5.00,5.00,5.00,5.00,'7861048610100','7861048610100',0,'2020-02-26 21:13:02',1,'ACTIVO'),(238,254,2,14,15,14,2.00,2.50,2.50,2.50,'7861001714029','7861001714029',0,'2020-02-26 21:16:05',1,'ACTIVO'),(239,1219,7,28,28,28,1.25,1.25,1.25,1.25,'7702031787570','7702031787570',0,'2020-02-26 21:16:57',1,'ACTIVO'),(240,254,2,15,1,15,1.35,1.70,1.70,1.70,'7861001712292','7861001712292',0,'2020-02-26 21:18:11',1,'ACTIVO'),(241,1220,7,18,18,18,1.25,1.25,1.25,1.25,'7861003113080','7861003113080',0,'2020-02-26 21:18:12',1,'ACTIVO'),(242,1090,2,2,1,2,2.25,2.70,2.70,2.70,'7861002512600','7861002512600',0,'2020-02-26 21:19:34',1,'ACTIVO'),(243,1222,7,10,10,10,1.50,1.50,1.50,1.50,'7702027044250','7702027044250',0,'2020-02-26 21:21:04',1,'ACTIVO'),(244,1223,7,9,9,9,1.00,1.00,1.00,1.00,'000900124370','000900124370',0,'2020-02-26 21:21:47',1,'ACTIVO'),(245,234,2,2,1,10,1.60,2.00,2.00,2.00,'7861002511108','7861002511108',0,'2020-02-26 21:23:10',1,'ACTIVO'),(246,1221,7,10,10,10,1.50,1.50,1.50,1.50,'7702027434020','7702027434020',0,'2020-02-26 21:23:18',1,'ACTIVO'),(247,1224,7,8,8,8,1.00,1.00,1.00,1.00,'000900124301','000900124301',0,'2020-02-26 21:24:15',1,'ACTIVO'),(248,236,2,20,1,20,1.25,1.50,1.50,1.50,'7861002513126','7861002513126',0,'2020-02-26 21:25:15',1,'ACTIVO'),(249,1212,2,8,8,8,1.80,1.80,1.80,1.80,'7862112290044','7862112290044',0,'2020-02-26 21:25:25',1,'ACTIVO'),(250,256,2,4,1,4,2.55,2.80,2.80,2.80,'7861015103130','7861015103130',0,'2020-02-26 21:26:32',1,'ACTIVO'),(251,1229,10,3,3,3,2.50,2.50,2.50,2.50,'7702626214948','7702626214948',0,'2020-02-26 21:32:01',1,'ACTIVO'),(252,1232,10,3,3,3,2.50,2.50,2.50,2.50,'7702626214931','7702626214931',0,'2020-02-26 21:34:03',1,'ACTIVO'),(253,551,11,23,1,23,3.00,3.75,3.75,3.75,'044695002734','044695002734',0,'2020-02-26 21:35:26',1,'ACTIVO'),(254,1228,10,10,10,10,0.60,0.60,0.60,0.60,'7702010311000','7702010311000',0,'2020-02-26 21:35:34',1,'ACTIVO'),(255,1227,10,14,14,14,0.60,0.60,0.60,0.60,'7702010311604','7702010311604',0,'2020-02-26 21:37:23',1,'ACTIVO'),(256,1230,11,9,1,9,2.00,2.35,2.35,2.35,'7862111520012','7862111520012',0,'2020-02-26 21:38:01',1,'ACTIVO'),(257,1226,10,4,4,4,0.60,0.60,0.60,0.60,'7702010310997','7702010310997',0,'2020-02-26 21:38:04',1,'ACTIVO'),(258,1239,2,1,1,1,2.15,2.15,2.15,2.15,'7861048635844','7861048635844',0,'2020-02-26 21:43:39',1,'ACTIVO'),(259,1238,2,4,4,4,2.15,2.15,2.15,2.15,'7861048634069','7861048634069',0,'2020-02-26 21:44:29',1,'ACTIVO'),(260,1240,2,5,1,5,2.20,2.50,2.50,2.50,'7861015112309','7861015112309',0,'2020-02-26 21:44:37',1,'ACTIVO'),(261,1237,2,1,1,1,2.15,2.15,2.15,2.15,'7861048635820','7861048635820',0,'2020-02-26 21:45:18',1,'ACTIVO'),(262,221,2,3,1,3,3.20,3.50,3.50,3.50,'7861048690812','7861048690812',0,'2020-02-26 21:48:58',1,'ACTIVO'),(263,255,2,27,1,27,0.60,0.85,0.85,0.85,'7861001757163','7861001757163',0,'2020-02-26 21:54:27',1,'ACTIVO'),(264,1242,4,29,29,29,0.30,0.30,0.30,0.30,'7861020337186','7861020337186',0,'2020-02-26 21:54:54',1,'ACTIVO'),(265,1243,4,13,13,13,1.50,1.50,1.50,1.50,'7861194608303','7861194608303',0,'2020-02-26 21:56:41',1,'ACTIVO'),(266,257,2,14,1,14,1.50,0.70,1.70,1.70,'7861048680561','7861048680561',0,'2020-02-26 21:56:54',1,'ACTIVO'),(267,1245,4,9,9,9,0.80,0.80,0.80,0.80,'4895138013963','4895138013963',0,'2020-02-26 21:57:12',1,'ACTIVO'),(268,1247,4,2,2,2,1.75,1.75,1.75,1.75,'7861123902519','7861123902519',0,'2020-02-26 21:57:58',1,'ACTIVO'),(269,1233,5,9,9,9,0.50,0.50,0.50,0.50,'7861001362367','7861001362367',0,'2020-02-26 21:59:16',1,'ACTIVO'),(270,222,2,2,1,2,4.00,4.00,4.00,4.00,'7861048601122','7861048601122',0,'2020-02-26 21:59:32',1,'ACTIVO'),(271,1234,5,13,13,13,0.50,0.50,0.50,0.50,'7861001362404','7861001362404',0,'2020-02-26 22:00:04',1,'ACTIVO'),(272,1231,5,6,6,6,0.50,0.50,0.50,0.50,'7861001362329','7861001362329',0,'2020-02-26 22:00:42',1,'ACTIVO'),(273,1241,10,12,12,12,1.00,1.00,1.00,1.00,'7861201100516','7861201100516',0,'2020-02-26 22:02:32',1,'ACTIVO'),(274,233,2,1,1,1,0.75,1.00,1.00,1.00,'7861002560205','7861002560205',0,'2020-02-26 22:03:25',1,'ACTIVO'),(275,1236,10,7,7,7,1.30,1.30,1.30,1.30,'7861038056468','7861038056468',0,'2020-02-26 22:03:30',1,'ACTIVO'),(276,1235,10,3,3,3,1.30,1.30,1.30,1.30,'7861038057502','7861038057502',0,'2020-02-26 22:04:54',1,'ACTIVO'),(277,1246,10,3,3,3,1.50,1.50,1.50,1.50,'7501080954786','7501080954786',0,'2020-02-26 22:06:07',1,'ACTIVO'),(278,1249,5,18,18,18,1.00,1.00,1.00,1.00,'7861001301809','7861001301809',0,'2020-02-26 22:06:51',1,'ACTIVO'),(279,1248,5,14,14,14,1.00,1.00,1.00,1.00,'7861001301779','7861001301779',0,'2020-02-26 22:07:33',1,'ACTIVO'),(280,1250,16,3,1,3,0.40,0.50,0.50,0.50,'7861048690607','7861048690607',0,'2020-02-26 22:13:05',1,'ACTIVO'),(281,1255,16,6,1,36,0.31,0.40,0.40,0.40,'7861002559452','7861002559452',0,'2020-02-26 22:19:35',1,'ACTIVO'),(282,1252,5,6,6,6,1.00,1.00,1.00,1.00,'7861001361681','7861001361681',0,'2020-02-26 22:19:51',1,'ACTIVO'),(283,1253,5,3,3,3,3.00,3.00,3.00,3.00,'7861001342826','7861001342826',0,'2020-02-26 22:21:27',1,'ACTIVO'),(284,1251,5,15,15,15,1.00,1.00,1.00,1.00,'7861001301748','7861001301748',0,'2020-02-26 22:22:24',1,'ACTIVO'),(285,1254,5,4,4,4,3.00,3.00,3.00,3.00,'7861001343120','7861001343120',0,'2020-02-26 22:23:19',1,'ACTIVO'),(286,1244,16,6,6,6,1.30,1.30,1.30,1.30,'7501199413006','7501199413006',0,'2020-02-26 22:24:07',1,'ACTIVO'),(287,1260,2,3,3,3,1.80,1.80,1.80,1.80,'7861038061240','7861038061240',0,'2020-02-26 22:26:39',1,'ACTIVO'),(288,1256,16,13,13,13,1.00,1.00,1.00,1.00,'7702191162620','7702191162620',0,'2020-02-26 22:28:10',1,'ACTIVO'),(289,1262,5,11,1,11,1.05,1.30,1.30,1.30,'7861029300013','7861029300013',0,'2020-02-26 22:34:16',1,'ACTIVO'),(290,1261,7,2,1,2,1.05,1.30,1.30,1.30,'7861006920036','7861006920036',0,'2020-02-26 22:35:52',1,'ACTIVO'),(291,1258,7,12,1,12,0.60,0.70,0.70,0.70,'7861006920050','7861006920050',0,'2020-02-26 22:37:10',1,'ACTIVO'),(292,326,2,1,1,1,1.50,1.85,1.85,1.85,'7861021206078','7861021206078',0,'2020-02-27 08:00:46',1,'ACTIVO'),(293,323,2,6,1,6,1.75,1.95,1.95,1.95,'7861021206061','7861021206061',0,'2020-02-27 08:02:08',1,'ACTIVO'),(294,328,2,7,1,7,0.85,1.10,1.10,1.10,'7861021206054','7861021206054',0,'2020-02-27 08:03:26',1,'ACTIVO'),(295,330,2,3,1,3,1.40,1.65,1.65,1.65,'7861021206009','7861021206009',0,'2020-02-27 08:04:30',1,'ACTIVO'),(296,324,2,5,1,5,0.92,1.25,1.25,1.25,'7861021207174','7861021207174',0,'2020-02-27 08:05:21',1,'ACTIVO'),(297,341,16,9,1,9,0.51,0.65,0.65,0.65,'7861021200502','7861021200502',0,'2020-02-27 08:07:02',1,'ACTIVO'),(298,338,16,10,1,10,0.40,0.55,0.55,0.55,'7861021200465','7861021200465',0,'2020-02-27 08:09:49',1,'ACTIVO'),(299,347,16,4,1,4,0.64,0.85,0.85,0.85,'7861021200434','7861021200434',0,'2020-02-27 08:13:05',1,'ACTIVO'),(300,343,16,12,1,12,0.46,0.55,0.55,0.55,'7861021200427','7861021200427',0,'2020-02-27 08:14:47',1,'ACTIVO'),(301,348,16,7,1,7,0.35,0.50,0.50,0.50,'7861021209413','7861021209413',0,'2020-02-27 08:15:50',1,'ACTIVO'),(302,321,2,6,1,6,0.82,1.05,1.05,1.05,'7861021206412','7861021206412',0,'2020-02-27 08:18:28',1,'ACTIVO'),(303,1266,11,9,1,9,2.75,3.00,3.00,3.00,'7861026031842','7861026031842',0,'2020-02-27 08:20:02',1,'ACTIVO'),(304,1267,16,8,1,8,0.34,0.40,0.40,0.40,'7861021200410','7861021200410',0,'2020-02-27 08:21:17',1,'ACTIVO'),(305,342,16,9,1,9,0.50,0.55,0.55,0.55,'7861021203817','7861021203817',0,'2020-02-27 08:30:40',1,'ACTIVO'),(306,272,16,43,14,43,0.82,0.90,0.90,0.90,'7861001201789','7861001201789',0,'2020-02-27 08:34:25',1,'ACTIVO'),(307,335,16,11,1,11,0.40,0.45,0.45,0.45,'7861021200472','7861021200472',0,'2020-02-27 08:37:04',1,'ACTIVO'),(308,337,16,11,1,11,0.44,0.50,0.50,0.50,'7861021200458','7861021200458',0,'2020-02-27 08:40:38',1,'ACTIVO'),(309,352,5,55,1,55,0.07,0.10,0.10,0.10,'100001101','100001101',0,'2020-02-27 08:46:34',1,'ACTIVO'),(310,354,5,37,1,37,0.21,0.25,0.25,0.25,'7861021207020','7861021207020',0,'2020-02-27 08:50:46',1,'ACTIVO'),(311,334,5,11,1,11,0.21,0.25,0.25,0.25,'7861021207082','7861021207082',0,'2020-02-27 08:52:11',1,'ACTIVO'),(312,373,5,22,1,22,0.21,0.25,0.25,0.25,'7861021203350','7861021203350',0,'2020-02-27 08:55:44',1,'ACTIVO'),(313,349,5,4,1,4,0.44,0.50,0.50,0.50,'7861021208843','7861021208843',0,'2020-02-27 08:56:55',1,'ACTIVO'),(314,345,5,3,1,3,2.05,2.35,2.35,2.35,'7861021200724','7861021200724',0,'2020-02-27 08:59:44',1,'ACTIVO'),(315,1269,16,16,14,30,0.55,0.60,0.60,0.60,'7861001239225','7861001239225',0,'2020-02-27 09:00:04',1,'ACTIVO'),(316,1272,16,18,14,32,0.50,0.60,0.60,0.60,'7861001236101','7861001236101',0,'2020-02-27 09:01:43',1,'ACTIVO'),(317,336,5,2,1,2,1.85,1.95,1.95,1.95,'7861021200793','7861021200793',0,'2020-02-27 09:02:10',1,'ACTIVO'),(318,1271,16,96,12,96,0.77,0.80,0.80,0.80,'7861001234695','7861001234695',0,'2020-02-27 09:04:35',1,'ACTIVO'),(319,1273,16,6,12,72,1.00,1.20,1.20,1.20,'7861001290301','7861001290301',0,'2020-02-27 09:08:02',1,'ACTIVO'),(320,1274,16,132,12,132,1.00,1.20,1.20,1.20,'7861001219876','7861001219876',0,'2020-02-27 09:09:28',1,'ACTIVO'),(321,344,5,19,1,19,0.03,0.05,0.05,0.05,'100001102','100001102',0,'2020-02-27 09:10:10',1,'ACTIVO'),(322,1270,16,120,12,120,1.00,1.20,1.20,1.20,'7861001219852','7861001219852',1,'2020-02-27 09:11:37',1,'ACTIVO'),(323,313,5,31,1,31,0.13,0.15,0.15,0.15,'100001103','100001103',0,'2020-02-27 09:11:57',1,'ACTIVO'),(324,1275,16,120,12,120,0.60,0.80,0.80,0.80,'7861001293623','7861001293623',0,'2020-02-27 09:13:32',1,'ACTIVO'),(325,346,5,82,1,82,0.30,0.05,0.05,0.05,'100001104','100001104',0,'2020-02-27 09:14:15',1,'ACTIVO'),(326,1270,16,120,12,120,1.00,1.20,1.20,1.20,'7861001219852','7861001219852',0,'2020-02-27 09:18:24',1,'ACTIVO'),(327,284,4,5,1,5,2.65,3.00,3.00,3.00,'7861007361708','7861007361708',0,'2020-02-27 09:24:37',1,'ACTIVO'),(328,274,17,2,1,5,2.40,2.80,2.80,2.80,'7861001261189','7861001261189',0,'2020-02-27 09:25:04',1,'ACTIVO'),(329,1277,5,2,1,2,1.85,2.00,2.00,2.00,'7861021200717','7861021200717',0,'2020-02-27 09:25:48',1,'ACTIVO'),(330,1279,5,2,1,2,3.50,3.65,3.65,3.65,'7861021200731','7861021200731',0,'2020-02-27 09:28:14',1,'ACTIVO'),(331,1265,16,4,4,4,1.00,1.00,1.00,1.00,'7702191162903','7702191162903',0,'2020-02-27 09:28:50',1,'ACTIVO'),(332,279,17,4,1,4,1.10,1.35,1.35,1.35,'7411000200254','7411000200254',0,'2020-02-27 09:30:50',1,'ACTIVO'),(333,1281,17,7,1,13,1.20,1.45,1.45,1.45,'7861001267556','7861001267556',0,'2020-02-27 09:31:11',1,'ACTIVO'),(334,1282,17,1,1,4,2.10,2.30,2.30,2.30,'7861001267778','7861001267778',0,'2020-02-27 09:34:31',1,'ACTIVO'),(335,320,2,6,1,6,0.90,1.00,1.00,1.00,'7861021206122','7861021206122',0,'2020-02-27 09:37:24',1,'ACTIVO'),(336,1286,13,2,2,2,1.00,1.00,1.00,1.00,'7702010420849','7702010420849',0,'2020-02-27 09:37:42',1,'ACTIVO'),(337,1289,17,4,1,1,1.80,2.15,2.15,2.15,'7861001238563','7861001238563',0,'2020-02-27 09:37:45',1,'ACTIVO'),(338,1292,13,10,10,10,1.00,1.00,1.00,1.00,'7702010420511','7702010420511',0,'2020-02-27 09:38:30',1,'ACTIVO'),(339,1291,13,36,36,36,1.00,1.00,1.00,1.00,'7702010420344','7702010420344',0,'2020-02-27 09:39:01',1,'ACTIVO'),(340,1290,13,18,18,18,1.00,1.00,1.00,1.00,'7702010420382','7702010420382',0,'2020-02-27 09:39:27',1,'ACTIVO'),(341,311,4,2,1,2,1.35,1.50,1.50,1.50,'7861021203572','7861021203572',0,'2020-02-27 09:40:07',1,'ACTIVO'),(342,1287,17,5,1,13,0.85,1.00,1.00,1.00,'7861001238549','7861001238549',0,'2020-02-27 09:40:22',1,'ACTIVO'),(343,1284,17,13,1,13,0.85,1.00,1.00,1.00,'7861001267761','7861001267761',0,'2020-02-27 09:42:05',1,'ACTIVO'),(344,331,2,6,1,6,0.40,0.55,0.55,0.55,'7861021200991','7861021200991',0,'2020-02-27 09:43:18',1,'ACTIVO'),(345,1297,7,2,2,2,2.50,2.50,2.50,2.50,'7702010920967','7702010920967',0,'2020-02-27 09:45:24',1,'ACTIVO'),(346,1299,7,4,4,4,2.50,2.50,2.50,2.50,'7702010920660','7702010920660',0,'2020-02-27 09:46:07',1,'ACTIVO'),(347,1302,7,2,2,2,2.50,2.50,2.50,2.50,'7702010921391','7702010921391',0,'2020-02-27 09:46:49',1,'ACTIVO'),(348,1298,4,10,10,10,2.50,2.50,2.50,2.50,'7702010920622','7702010920622',0,'2020-02-27 09:47:33',1,'ACTIVO'),(349,1301,17,1,1,3,2.90,3.35,3.35,3.35,'7861001299601','7861001299601',0,'2020-02-27 09:49:04',1,'ACTIVO'),(350,1303,17,12,1,1,1.00,1.35,1.35,1.35,'7861001261868','7861001261868',0,'2020-02-27 09:50:21',1,'ACTIVO'),(351,1305,17,8,1,8,1.00,1.20,1.20,1.20,'7861001240955','7861001240955',0,'2020-02-27 09:51:46',1,'ACTIVO'),(352,1308,2,12,1,12,0.40,0.55,0.55,0.55,'7861021200854','7861021200854',0,'2020-02-27 09:58:26',1,'ACTIVO'),(353,1310,13,9,9,9,0.50,0.50,0.50,0.50,'7861048601979','7861048601979',0,'2020-02-27 10:00:00',1,'ACTIVO'),(354,1311,13,10,10,10,0.50,0.50,0.50,0.50,'7861048601900','7861048601900',0,'2020-02-27 10:00:37',1,'ACTIVO'),(355,1312,13,3,3,3,0.50,0.50,0.50,0.50,'7861048601870','7861048601870',0,'2020-02-27 10:01:03',1,'ACTIVO'),(356,1313,7,15,15,15,1.50,1.50,1.50,1.50,'7861048602402','7861048602402',0,'2020-02-27 10:01:35',1,'ACTIVO'),(357,1316,4,4,1,4,1.90,2.20,2.20,2.20,'7861021201844','7861021201844',0,'2020-02-27 10:02:20',1,'ACTIVO'),(358,1321,4,4,1,4,0.85,1.20,1.20,1.20,'7861021200847','7861021200847',0,'2020-02-27 10:07:59',1,'ACTIVO'),(359,1323,13,4,4,4,1.00,1.00,1.00,1.00,'7702031953272','7702031953272',0,'2020-02-27 10:08:49',1,'ACTIVO'),(360,1324,13,15,15,15,1.00,1.00,1.00,1.00,'7702031999034','7702031999034',0,'2020-02-27 10:10:26',1,'ACTIVO'),(361,1325,13,8,8,8,1.00,1.00,1.00,1.00,'7702031858997','7702031858997',0,'2020-02-27 10:10:57',1,'ACTIVO'),(362,1328,13,10,10,10,0.80,0.80,0.80,0.80,'7702191660645','7702191660645',0,'2020-02-27 10:12:28',1,'ACTIVO'),(363,1327,13,13,13,13,0.80,0.80,0.80,0.80,'7702191660669','7702191660669',0,'2020-02-27 10:13:56',1,'ACTIVO'),(364,1337,7,19,19,19,2.25,2.25,2.25,2.25,'7702191661512','7702191661512',0,'2020-02-27 10:17:55',1,'ACTIVO'),(365,1336,7,23,23,23,2.25,2.25,2.25,2.25,'7702191660652','7702191660652',0,'2020-02-27 10:18:32',1,'ACTIVO'),(366,1342,13,2,2,2,1.00,1.00,1.00,1.00,'7702010410857','7702010410857',0,'2020-02-27 10:30:34',1,'ACTIVO'),(367,1341,13,7,7,7,1.00,1.00,1.00,1.00,'7702010410840','7702010410840',0,'2020-02-27 10:31:02',1,'ACTIVO'),(368,1343,13,4,4,4,1.00,1.00,1.00,1.00,'7702010410895','7702010410895',0,'2020-02-27 10:31:29',1,'ACTIVO'),(369,1344,13,3,3,3,1.00,1.00,1.00,1.00,'7702010410901','7702010410901',0,'2020-02-27 10:32:06',1,'ACTIVO'),(370,1348,7,2,2,2,2.50,2.50,2.50,2.50,'7702010911583','7702010911583',0,'2020-02-27 10:32:40',1,'ACTIVO'),(371,1347,13,1,1,1,2.50,2.50,2.50,2.50,'7702010911613','7702010911613',0,'2020-02-27 10:33:35',1,'ACTIVO'),(372,1346,13,2,2,2,2.50,2.50,2.50,2.50,'7702010911590','7702010911590',0,'2020-02-27 10:34:03',1,'ACTIVO'),(373,1330,16,25,1,25,0.65,0.80,0.80,0.80,'7861018290530','7861018290530',0,'2020-02-27 10:50:32',1,'ACTIVO'),(374,1354,13,9,9,9,1.00,1.00,1.00,1.00,'7898422746759','7898422746759',0,'2020-02-27 10:50:35',1,'ACTIVO'),(375,1356,13,7,7,7,1.00,1.00,1.00,1.00,'7898422746827','7898422746827',0,'2020-02-27 10:50:58',1,'ACTIVO'),(376,1355,13,4,4,4,1.00,1.00,1.00,1.00,'7891150034075','7891150034075',0,'2020-02-27 10:51:23',1,'ACTIVO'),(377,1332,4,2,1,2,2.00,2.40,2.40,2.40,'7861015100597','7861015100597',0,'2020-02-27 10:52:06',1,'ACTIVO'),(378,1340,17,4,1,4,1.20,1.25,1.25,1.25,'7750243051446','7750243051446',0,'2020-02-27 10:53:37',1,'ACTIVO'),(379,1338,16,9,1,9,0.85,1.00,1.00,1.00,'7613038062310','7613038062310',0,'2020-02-27 10:54:58',1,'ACTIVO'),(380,1358,13,70,70,70,0.80,0.80,0.80,0.80,'7702191000922','7702191000922',0,'2020-02-27 10:56:26',1,'ACTIVO'),(381,1359,13,9,9,9,0.80,0.80,0.80,0.80,'7702191000946','7702191000946',0,'2020-02-27 10:56:51',1,'ACTIVO'),(382,1350,5,8,1,8,0.30,0.40,0.40,0.40,'7861021203343','7861021203343',0,'2020-02-27 10:59:03',1,'ACTIVO'),(383,1335,17,2,1,1,1.60,1.70,1.70,1.70,'7750243051422','7750243051422',0,'2020-02-27 10:59:09',1,'ACTIVO'),(384,1361,7,17,17,17,2.25,2.25,2.25,2.25,'7702191000861','7702191000861',0,'2020-02-27 10:59:14',1,'ACTIVO'),(385,1360,7,3,3,3,2.25,2.25,2.25,2.25,'7702191000885','7702191000885',0,'2020-02-27 10:59:59',1,'ACTIVO'),(386,1353,4,2,1,2,3.30,3.60,3.60,3.60,'7861007305030','7861007305030',0,'2020-02-27 11:00:18',1,'ACTIVO'),(387,634,17,4,1,4,1.10,1.30,1.30,1.30,'7861015102201','7861015102201',0,'2020-02-27 11:00:37',1,'ACTIVO'),(388,641,17,2,1,1,1.10,1.30,1.30,1.30,'7861015102218','7861015102218',0,'2020-02-27 11:02:11',1,'ACTIVO'),(389,1357,2,3,1,3,1.20,1.50,1.50,1.50,'7862129831155','7862129831155',0,'2020-02-27 11:05:06',1,'ACTIVO'),(390,1363,4,3,1,3,1.60,1.80,1.80,1.80,'7861007914591','7861007914591',0,'2020-02-27 11:06:16',1,'ACTIVO'),(391,1162,13,5,5,5,0.90,0.90,0.90,0.90,'7861001343595','7861001343595',0,'2020-02-27 11:07:29',1,'ACTIVO'),(392,1352,4,6,1,6,0.90,1.20,1.20,1.20,'7861007907999','7861007907999',0,'2020-02-27 11:07:40',1,'ACTIVO'),(393,1365,17,3,1,3,1.10,1.30,1.30,1.30,'7861015102294','7861015102294',0,'2020-02-27 11:10:39',1,'ACTIVO'),(394,1320,17,5,1,5,0.90,1.12,1.12,1.12,'7861015109682','7861015109682',0,'2020-02-27 11:12:12',1,'ACTIVO'),(395,1331,17,5,1,5,0.45,0.65,0.65,0.65,'7861021202674','7861021202674',0,'2020-02-27 11:12:43',1,'ACTIVO'),(396,1334,17,1,1,1,0.45,0.65,0.65,0.65,'7861021202667','7861021202667',0,'2020-02-27 11:13:38',1,'ACTIVO'),(397,1318,17,4,1,1,0.80,0.95,0.95,0.95,'7861015107664','7861015107664',0,'2020-02-27 11:13:47',1,'ACTIVO'),(398,276,17,13,1,13,1.10,1.35,1.35,1.35,'7861015103789','7861015103789',0,'2020-02-27 11:15:25',1,'ACTIVO'),(399,1373,13,9,9,9,1.00,1.00,1.00,1.00,'7861048602099','7861048602099',0,'2020-02-27 11:15:41',1,'ACTIVO'),(400,1339,4,4,1,4,2.50,2.75,2.75,2.75,'7861007801624','7861007801624',0,'2020-02-27 11:15:43',1,'ACTIVO'),(401,1371,1,8,8,8,1.00,1.00,1.00,1.00,'7861048602112','7861048602112',0,'2020-02-27 11:16:07',1,'ACTIVO'),(402,1369,13,9,9,9,1.00,1.00,1.00,1.00,'7861048602082','7861048602082',0,'2020-02-27 11:16:30',1,'ACTIVO'),(403,1349,5,2,1,2,2.50,3.00,3.00,3.00,'7861021209307','7861021209307',0,'2020-02-27 11:17:53',1,'ACTIVO'),(404,1378,7,2,2,2,3.00,3.00,3.00,3.00,'7861048602068','7861048602068',0,'2020-02-27 11:21:32',1,'ACTIVO'),(405,1377,7,2,2,2,3.00,3.00,3.00,3.00,'7861048602105','7861048602105',0,'2020-02-27 11:22:00',1,'ACTIVO'),(406,1376,7,2,2,2,3.00,3.00,3.00,3.00,'7861048602075','7861048602075',0,'2020-02-27 11:22:27',1,'ACTIVO'),(407,1317,17,6,1,6,1.65,1.85,1.65,1.85,'7411000201060','7411000201060',0,'2020-02-27 11:25:27',1,'ACTIVO'),(408,1322,17,16,1,16,0.85,0.95,0.95,0.95,'7861015103802','7861015103802',0,'2020-02-27 11:27:37',1,'ACTIVO'),(409,1367,2,6,1,6,1.00,1.25,1.25,1.25,'7861015140067','7861015140067',0,'2020-02-27 11:27:42',1,'ACTIVO'),(410,1314,17,6,1,6,1.10,1.30,1.30,1.30,'7861015102287','7861015102287',0,'2020-02-27 11:29:29',1,'ACTIVO'),(411,269,16,256,20,256,0.25,0.30,0.30,0.30,'8719200452886','8719200453210',0,'2020-02-27 11:35:01',1,'ACTIVO'),(412,632,16,12,1,12,0.50,0.60,0.60,0.60,'7861015100955','7861015100955',0,'2020-02-27 11:35:16',1,'ACTIVO'),(413,636,16,4,1,4,0.50,0.60,0.60,0.60,'7861015100979','7861015100979',0,'2020-02-27 11:37:02',1,'ACTIVO'),(414,267,4,44,48,44,1.00,1.25,1.25,1.25,'8719200452862','8719200452862',0,'2020-02-27 11:37:07',1,'ACTIVO'),(415,640,16,9,1,9,0.50,0.60,0.60,0.60,'7861015101945','7861015101945',0,'2020-02-27 11:38:12',1,'ACTIVO'),(416,268,4,28,24,28,2.00,2.30,2.30,2.30,'8719200452879','8719200452879',0,'2020-02-27 11:38:31',1,'ACTIVO'),(417,277,16,10,1,10,0.60,0.75,0.75,0.75,'7861015130044','7861015130044',0,'2020-02-27 11:39:53',1,'ACTIVO'),(418,264,4,48,48,48,0.75,1.00,1.00,1.00,'7861048601504','7861048601504',0,'2020-02-27 11:40:17',1,'ACTIVO'),(419,645,4,2,2,2,1.60,1.90,1.90,1.90,'7861015112194','7861015112194',0,'2020-02-27 11:41:36',1,'ACTIVO'),(420,265,4,2,24,2,1.80,2.25,2.25,2.25,'7861048601511','7861048601511',0,'2020-02-27 11:41:42',1,'ACTIVO'),(421,270,5,4,1,4,0.35,0.50,0.50,0.50,'7861002563282','7861002563282',0,'2020-02-27 11:46:14',1,'ACTIVO'),(422,1385,16,8,1,8,0.45,0.55,0.55,0.55,'7861015110107','7861015110107',0,'2020-02-27 11:48:31',1,'ACTIVO'),(423,1384,16,11,1,11,0.50,0.60,0.60,0.60,'7861015100986','7861015100986',0,'2020-02-27 11:49:49',1,'ACTIVO'),(424,305,2,16,1,16,1.15,1.30,1.30,1.30,'7861007900020','7861007900020',0,'2020-02-27 11:49:53',1,'ACTIVO'),(425,301,2,66,1,66,0.70,0.85,0.85,0.85,'7861007900037','7861007900037',0,'2020-02-27 11:52:35',1,'ACTIVO'),(426,1383,4,1,1,1,1.70,1.90,1.90,1.90,'7861015112170','7861015112170',0,'2020-02-27 11:52:44',1,'ACTIVO'),(427,302,2,14,1,14,0.60,0.70,0.70,0.70,'7861007907463','7861007907463',0,'2020-02-27 11:58:51',1,'ACTIVO'),(428,1391,2,8,1,8,1.25,1.50,1.50,1.50,'7862120140959','7862120140959',0,'2020-02-27 12:04:07',1,'ACTIVO'),(429,300,2,9,1,9,1.00,1.30,1.30,1.30,'7861007902017','7861007902017',0,'2020-02-27 12:06:42',1,'ACTIVO'),(430,315,2,3,1,3,0.60,0.70,0.70,0.70,'7861021202001','7861021202001',0,'2020-02-27 12:08:49',1,'ACTIVO'),(431,1397,2,7,1,7,1.40,1.50,1.50,1.50,'7861007900082','7861007900082',0,'2020-02-27 12:09:44',1,'ACTIVO'),(432,298,2,24,1,24,0.60,0.85,0.85,0.85,'7861007902024','7861007902024',0,'2020-02-27 12:10:40',1,'ACTIVO'),(433,316,2,10,1,10,0.35,0.40,0.40,0.40,'7861021201998','7861021201998',0,'2020-02-27 12:13:22',1,'ACTIVO'),(434,1413,5,12,1,12,0.80,1.00,1.00,1.00,'7861002563299','7861002563299',0,'2020-02-27 12:19:43',1,'ACTIVO'),(435,1408,2,1,1,1,4.50,4.50,4.50,4.50,'7861001361766','7861001361766',0,'2020-02-27 12:22:24',1,'ACTIVO'),(436,1411,2,1,1,1,4.50,4.50,4.50,4.50,'7861001301120','7861001301120',0,'2020-02-27 12:23:19',1,'ACTIVO'),(437,1407,4,1,1,1,4.50,4.50,4.50,4.50,'7861001301090','7861001301090',0,'2020-02-27 12:24:03',1,'ACTIVO'),(438,1409,4,1,1,1,4.50,4.50,4.50,4.50,'7861001361889','7861001361889',0,'2020-02-27 12:24:44',1,'ACTIVO'),(439,1419,4,1,1,1,4.50,4.50,4.50,4.50,'7506306233249','7506306233249',0,'2020-02-27 12:25:31',1,'ACTIVO'),(440,1420,4,1,1,1,4.50,4.50,4.50,4.50,'7501056340131','7501056340131',0,'2020-02-27 12:26:02',1,'ACTIVO'),(441,1418,4,2,2,2,6.00,6.00,6.00,6.00,'7501001170073','7501001170073',0,'2020-02-27 12:26:38',1,'ACTIVO'),(442,369,7,71,25,1,0.03,0.05,0.05,0.05,'100001106','7861021208041',0,'2020-02-27 12:32:46',1,'ACTIVO'),(443,1425,17,2,1,2,2.50,3.00,3.00,3.00,'7750243051453','7750243051453',0,'2020-02-27 12:33:39',1,'ACTIVO'),(444,368,7,103,25,103,0.03,0.05,0.05,0.05,'100001107','7861021208010',0,'2020-02-27 12:35:31',1,'ACTIVO'),(445,1410,17,6,1,6,1.00,1.30,1.30,1.30,'7861015111821','7861015111821',0,'2020-02-27 12:35:49',1,'ACTIVO'),(446,1422,17,2,1,2,2.70,2.90,2.90,2.90,'7861015111852','7861015111852',0,'2020-02-27 12:37:30',1,'ACTIVO'),(447,367,7,101,25,101,0.03,0.05,0.05,0.05,'100001108','7861021208072',0,'2020-02-27 12:38:22',1,'ACTIVO'),(448,1402,16,13,13,13,1.00,1.00,1.00,1.00,'7861048600415','7861048600415',0,'2020-02-27 12:42:17',1,'ACTIVO'),(449,364,7,100,25,100,0.03,0.05,0.05,0.05,'100001109','7861021208133',0,'2020-02-27 12:42:32',1,'ACTIVO'),(450,1424,17,6,1,6,2.30,2.45,2.45,2.45,'7861015111838','7861015111838',0,'2020-02-27 12:43:02',1,'ACTIVO'),(451,1403,16,12,12,12,1.00,1.00,1.00,1.00,'7861048601566','7861048601566',0,'2020-02-27 12:43:24',1,'ACTIVO'),(452,1401,16,9,9,9,1.00,1.00,1.00,1.00,'7861048600408','7861048600408',0,'2020-02-27 12:44:01',1,'ACTIVO'),(453,365,7,69,25,69,0.03,0.05,0.05,0.05,'100001110','7861021208089',0,'2020-02-27 12:44:25',1,'ACTIVO'),(454,1399,16,14,14,14,1.00,1.00,1.00,1.00,'7861048601320','7861048601320',0,'2020-02-27 12:44:41',1,'ACTIVO'),(455,1435,17,7,1,7,2.80,3.00,3.00,3.00,'7861015130228','7861015130228',0,'2020-02-27 12:46:40',1,'ACTIVO'),(456,363,7,85,25,85,0.03,0.05,0.05,0.05,'100001111','7861021208096',0,'2020-02-27 12:51:08',1,'ACTIVO'),(457,1333,17,10,1,10,0.80,1.00,1.00,1.00,'7861021202759','7861021202759',0,'2020-02-27 12:55:11',1,'ACTIVO'),(458,1446,5,19,1,19,0.20,0.25,0.25,0.25,'7861021207013','7861021207013',0,'2020-02-27 13:01:47',1,'ACTIVO'),(459,1415,4,1,1,1,1.80,1.80,1.80,1.80,'7861038005329','7861038005329',0,'2020-02-27 13:06:29',1,'ACTIVO'),(460,1428,4,2,2,2,3.00,3.00,3.00,3.00,'7506306237391','7506306237391',0,'2020-02-27 13:08:04',1,'ACTIVO'),(461,1434,4,1,1,1,3.00,3.00,3.00,3.00,'7506306237407','7506306237407',0,'2020-02-27 13:09:36',1,'ACTIVO'),(462,1432,4,2,2,2,3.00,3.00,3.00,3.00,'7506306237841','7506306237841',0,'2020-02-27 13:10:23',1,'ACTIVO'),(463,1433,4,3,3,3,3.00,3.00,3.00,3.00,'7506306237834','7506306237834',0,'2020-02-27 13:11:26',1,'ACTIVO'),(464,1440,14,3,3,3,3.50,3.50,3.50,3.50,'7861038057205','7861038057205',0,'2020-02-27 13:13:12',1,'ACTIVO'),(465,1451,7,86,25,86,0.03,0.05,0.05,0.05,'100001112','7861021208133',0,'2020-02-27 13:15:39',1,'ACTIVO'),(466,1442,14,3,3,3,3.50,3.50,3.50,3.50,'7861038057199','7861038057199',0,'2020-02-27 13:17:44',1,'ACTIVO'),(467,307,2,5,1,5,0.90,1.18,1.18,1.18,'7861007907470','7861007907470',0,'2020-02-27 13:18:12',1,'ACTIVO'),(468,1441,14,2,2,2,3.50,3.50,3.50,3.50,'7861038054266','7861038054266',0,'2020-02-27 13:18:46',1,'ACTIVO'),(469,304,2,5,1,5,1.40,1.65,1.65,1.65,'7861007908972','7861007908972',0,'2020-02-27 13:19:18',1,'ACTIVO'),(470,1450,14,3,3,3,3.50,3.50,3.50,3.50,'7861038061776','7861038061776',0,'2020-02-27 13:19:53',1,'ACTIVO'),(471,1443,14,2,2,2,3.50,3.50,3.50,3.50,'7861038054259','7861038054259',0,'2020-02-27 13:20:40',1,'ACTIVO'),(472,1448,14,4,4,4,1.99,1.99,1.99,1.99,'7861038061820','7861038061820',0,'2020-02-27 13:23:51',1,'ACTIVO'),(473,1453,17,5,1,5,2.10,2.30,2.30,2.30,'7861015111838','7861015111838',0,'2020-02-27 13:24:11',1,'ACTIVO'),(474,1447,14,1,1,1,1.99,1.99,1.99,1.99,'7861038061899','7861038061899',0,'2020-02-27 13:24:55',1,'ACTIVO'),(475,1455,17,6,1,6,2.80,3.00,3.00,3.00,'7861015111852','7861015111852',0,'2020-02-27 13:25:15',1,'ACTIVO'),(476,1388,2,15,15,15,0.50,0.50,0.50,0.50,'7861038060694','7861038060694',0,'2020-02-27 13:28:24',1,'ACTIVO'),(477,1026,2,20,1,20,3.60,4.00,4.00,4.00,'7861020100797','7861020100797',0,'2020-02-27 13:28:59',1,'ACTIVO'),(478,1393,2,21,21,21,0.50,0.50,0.50,0.50,'7861038060618','7861038060618',0,'2020-02-27 13:29:30',1,'ACTIVO'),(479,1394,2,21,21,21,0.50,0.50,0.50,0.50,'7861038060656','7861038060656',0,'2020-02-27 13:30:35',1,'ACTIVO'),(480,1027,2,31,1,31,3.60,4.00,4.00,4.00,'7861020100803','7861020100803',0,'2020-02-27 13:30:47',1,'ACTIVO'),(481,1426,4,4,4,4,3.50,3.50,3.50,3.50,'7501001303396','7501001303396',0,'2020-02-27 13:34:13',1,'ACTIVO'),(482,1458,4,1,1,1,3.50,3.50,3.50,3.50,'7500435019705','7500435019705',0,'2020-02-27 13:36:22',1,'ACTIVO'),(483,1452,4,3,3,3,4.00,4.00,4.00,4.00,'7500435019958','7500435019958',0,'2020-02-27 13:38:05',1,'ACTIVO'),(484,1457,4,2,2,2,4.00,4.00,4.00,4.00,'7500435138017','7500435138017',0,'2020-02-27 13:38:51',1,'ACTIVO'),(485,1460,4,2,2,2,4.00,4.00,4.00,4.00,'7500435019811','7500435019811',0,'2020-02-27 13:39:24',1,'ACTIVO'),(486,1392,2,21,21,21,0.50,0.50,0.50,0.50,'7861038060663','7861038060663',0,'2020-02-27 13:49:36',1,'ACTIVO'),(487,1389,2,21,21,21,0.50,0.50,0.50,0.50,'7861038060779','7861038060779',0,'2020-02-27 13:51:14',1,'ACTIVO'),(488,1465,4,2,2,2,3.50,3.50,3.50,3.50,'7501001169091','7501001169091',0,'2020-02-27 13:53:00',1,'ACTIVO'),(489,1456,7,53,25,53,0.03,0.05,0.05,0.05,'100001118','7861021208287',0,'2020-02-27 13:54:48',1,'ACTIVO'),(490,1461,15,43,25,43,0.03,0.05,0.05,0.05,'100001119','7861026031026',0,'2020-02-27 13:57:29',1,'ACTIVO'),(491,1475,2,38,38,38,0.50,0.50,0.50,0.50,'7861038060670','7861038060670',0,'2020-02-27 13:58:44',1,'ACTIVO'),(492,1459,15,24,25,42,0.03,0.05,0.05,0.05,'100001120','7861021208195',0,'2020-02-27 13:59:09',1,'ACTIVO'),(493,1474,2,20,20,20,0.50,0.50,0.50,0.50,'7861038060670','7861038060670',0,'2020-02-27 14:00:47',1,'ACTIVO'),(494,1469,2,1,1,1,0.60,0.75,0.75,0.75,'7861021206931','7861021206931',0,'2020-02-27 14:01:53',1,'ACTIVO'),(495,1472,2,2,1,2,1.25,1.50,1.50,1.50,'7862120140034','7862120140034',0,'2020-02-27 14:02:43',1,'ACTIVO'),(496,1400,16,2,2,2,0.50,0.50,0.50,0.50,'7861048634199','7861048634199',0,'2020-02-27 14:03:12',1,'ACTIVO'),(497,1468,2,4,1,4,1.80,2.15,2.15,2.15,'7861021209390','7861021209390',0,'2020-02-27 14:03:39',1,'ACTIVO'),(498,1404,16,4,4,4,0.40,0.50,0.50,0.50,'7861048634229','7861048634229',0,'2020-02-27 14:06:18',1,'ACTIVO'),(499,1396,16,4,4,4,0.50,0.50,0.50,0.50,'7861048634205','7861048634205',0,'2020-02-27 14:07:44',1,'ACTIVO'),(500,1470,2,1,1,1,2.00,2.00,2.00,2.00,'7702137628654','7702137628654',0,'2020-02-27 14:10:31',1,'ACTIVO'),(501,1471,2,5,5,5,2.00,2.00,2.00,2.00,'7862112290280','7862112290280',0,'2020-02-27 14:11:51',1,'ACTIVO'),(502,1478,15,156,52,156,0.25,0.30,0.30,0.30,'100001114','100001114',0,'2020-02-27 14:12:25',1,'ACTIVO'),(503,1449,4,2,2,2,1.65,1.65,1.65,1.65,'7861038008115','7861038008115',0,'2020-02-27 14:13:58',1,'ACTIVO'),(504,1466,4,6,1,6,2.20,2.60,2.60,2.60,'7861002806068','7861002806068',0,'2020-02-27 14:14:20',1,'ACTIVO'),(505,1477,15,240,48,240,0.15,0.20,0.20,0.20,'100001113','7861210700493',0,'2020-02-27 14:14:38',1,'ACTIVO'),(506,1476,15,144,48,144,0.15,0.20,0.20,0.20,'100001121','7861001231991',0,'2020-02-27 14:17:02',1,'ACTIVO'),(507,1414,2,2,2,2,1.80,1.80,1.80,1.80,'7861038005367','7861038005367',0,'2020-02-27 14:17:29',1,'ACTIVO'),(508,1467,4,1,1,1,2.25,2.50,2.50,2.50,'7861015112156','7861015112156',0,'2020-02-27 14:18:11',1,'ACTIVO'),(509,1416,2,2,2,2,1.80,1.80,1.80,1.80,'7861038005336','7861038005336',0,'2020-02-27 14:18:43',1,'ACTIVO'),(511,456,5,9,1,9,0.85,0.95,0.95,0.95,'7861007908101','7861007908101',0,'2020-02-27 14:24:18',1,'ACTIVO'),(512,458,5,34,1,34,0.40,0.55,0.55,0.55,'7861007912955','7861007912955',0,'2020-02-27 14:26:02',1,'ACTIVO'),(513,466,5,55,1,55,0.55,0.55,0.55,0.65,'7861007912139','7861007912139',0,'2020-02-27 14:27:22',1,'ACTIVO'),(514,459,5,15,1,15,0.85,0.95,0.95,0.95,'7861007912719','7861007912719',0,'2020-02-27 14:29:38',1,'ACTIVO'),(515,1481,17,4,1,4,0.60,0.75,0.75,0.75,'7861007308222','7861007308222',0,'2020-02-27 14:31:20',1,'ACTIVO'),(516,460,5,15,1,15,1.60,1.75,1.75,1.75,'7861007912726','7861007912726',0,'2020-02-27 14:32:45',1,'ACTIVO'),(517,1486,17,8,1,8,0.60,0.85,0.85,0.85,'7861007308215','7861007308215',0,'2020-02-27 14:33:12',1,'ACTIVO'),(518,474,5,12,1,12,0.55,0.65,0.65,0.65,'7861007905155','7861007905155',0,'2020-02-27 14:34:16',1,'ACTIVO'),(519,473,5,7,1,7,0.55,0.65,0.65,0.65,'7861007905148','7861007905148',0,'2020-02-27 14:35:28',1,'ACTIVO'),(520,1484,4,1,1,1,1.65,1.65,1.65,1.65,'7861038008108','7861038008108',0,'2020-02-27 14:39:14',1,'ACTIVO'),(521,1462,4,1,1,1,2.25,2.25,2.25,2.25,'7861038057663','7861038057663',0,'2020-02-27 14:41:38',1,'ACTIVO'),(522,1492,2,1,1,1,1.80,1.80,1.80,1.80,'7861038057045','7861038057045',0,'2020-02-27 14:42:42',1,'ACTIVO'),(523,528,5,19,1,19,0.30,0.40,0.40,0.40,'7861052003554','7861052003554',0,'2020-02-27 14:43:32',1,'ACTIVO'),(524,526,5,12,1,12,0.30,0.40,0.40,0.40,'7861052003530','7861052003530',0,'2020-02-27 14:44:40',1,'ACTIVO'),(525,525,5,6,1,6,0.30,0.40,0.40,0.40,'7861052003561','7861052003561',0,'2020-02-27 14:45:26',1,'ACTIVO'),(526,1488,2,1,1,1,2.50,2.50,2.50,2.50,'7702010311161','7702010311161',0,'2020-02-27 14:46:28',1,'ACTIVO'),(527,527,5,9,1,9,0.90,1.05,1.05,1.05,'7861052000010','7861052000010',0,'2020-02-27 14:47:14',1,'ACTIVO'),(528,1500,2,5,5,5,1.50,1.50,1.50,1.50,'7862103530012','7862103530012',0,'2020-02-27 14:49:04',1,'ACTIVO'),(529,1503,5,4,1,4,0.95,1.05,1.05,1.05,'7861052000058','7861052000058',0,'2020-02-27 14:50:59',1,'ACTIVO'),(530,1502,5,5,1,5,0.95,1.05,1.05,1.05,'7861052000027','7861052000027',0,'2020-02-27 14:52:04',1,'ACTIVO'),(531,1489,2,4,4,4,1.25,1.25,1.25,1.25,'7861048634670','7861048634670',0,'2020-02-27 14:52:55',1,'ACTIVO'),(532,1517,5,19,12,67,1.10,1.30,1.30,1.30,'7861002560212','7861002560212',0,'2020-02-27 15:36:33',1,'ACTIVO'),(533,1490,2,5,5,5,1.25,1.25,1.25,1.25,'7861048634656','7861048634656',0,'2020-02-27 15:36:34',1,'ACTIVO'),(534,1491,2,5,5,5,1.25,1.25,1.25,1.25,'7861048634649','7861048634649',0,'2020-02-27 15:37:51',1,'ACTIVO'),(535,244,5,16,1,1,0.40,0.50,0.50,0.50,'7861002563138','7861002563138',0,'2020-02-27 15:39:06',1,'ACTIVO'),(536,1499,2,3,3,3,1.25,1.25,1.25,1.25,'7702010311178','7702010311178',0,'2020-02-27 15:40:43',1,'ACTIVO'),(537,1498,2,7,7,7,1.25,1.25,1.25,1.25,'7702010225222','7702010225222',0,'2020-02-27 15:41:45',1,'ACTIVO'),(538,241,5,29,1,29,0.20,0.25,0.25,0.25,'7861002563121','7861002563121',0,'2020-02-27 15:42:28',1,'ACTIVO'),(539,1501,2,5,5,5,1.00,1.00,1.00,1.00,'100001122','100001122',0,'2020-02-27 15:43:30',1,'ACTIVO'),(540,258,16,27,1,27,0.40,0.50,0.50,0.50,'7861015113498','7861015113498',0,'2020-02-27 15:44:01',1,'ACTIVO'),(541,1463,14,2,2,2,1.99,1.99,1.99,1.99,'7861038061875','7861038061875',0,'2020-02-27 15:45:36',1,'ACTIVO'),(542,1464,14,2,2,2,1.99,1.99,1.99,1.99,'7861038061882','7861038061882',0,'2020-02-27 15:46:23',1,'ACTIVO'),(543,1523,5,9,1,39,0.74,1.00,1.00,1.00,'7861002563145','7861002563145',0,'2020-02-27 15:48:46',1,'ACTIVO'),(544,1482,2,22,22,22,0.40,0.40,0.40,0.40,'7861038061905','7861038061905',0,'2020-02-27 15:51:27',1,'ACTIVO'),(545,1483,2,8,8,8,1.20,1.20,1.20,1.20,'7862112291003','7862112291003',0,'2020-02-27 15:53:25',1,'ACTIVO'),(546,1479,2,3,3,3,1.20,1.20,1.20,1.20,'7862112290990','7862112290990',0,'2020-02-27 15:54:05',1,'ACTIVO'),(547,1528,16,75,1,75,0.20,0.25,0.25,0.25,'7861048691161','7861048691161',0,'2020-02-27 15:54:06',1,'ACTIVO'),(548,1480,2,2,2,2,1.20,1.20,1.20,1.20,'7862112290839','7862112290839',0,'2020-02-27 15:55:27',1,'ACTIVO'),(549,1525,16,29,25,29,0.40,0.50,0.50,0.50,'7861048681049','7861048681049',0,'2020-02-27 15:55:31',1,'ACTIVO'),(550,1512,14,3,3,3,2.45,2.45,2.45,2.45,'7861048670807','7861048670807',0,'2020-02-27 16:00:14',1,'ACTIVO'),(551,1505,16,3,3,6,1.50,1.50,1.50,1.50,'7702006299640','7702006299640',0,'2020-02-27 16:01:36',1,'ACTIVO'),(552,1531,1,32,20,32,0.60,0.80,0.80,0.80,'7861002561103','17861002561100',0,'2020-02-27 16:01:46',1,'ACTIVO'),(553,1513,14,2,2,2,4.00,4.00,4.00,4.00,'7861038058882','7861038058882',0,'2020-02-27 16:02:23',1,'ACTIVO'),(554,1504,7,17,17,17,1.50,1.50,1.50,1.50,'7752191000118','7752191000118',0,'2020-02-27 16:04:16',1,'ACTIVO'),(555,1538,7,42,42,42,0.25,0.25,0.25,0.25,'7862108350134','7862108350134',0,'2020-02-27 16:46:40',1,'ACTIVO'),(556,1534,7,14,14,14,1.30,1.30,1.30,1.30,'7702026020187','7702026020187',0,'2020-02-27 16:48:14',1,'ACTIVO'),(557,1537,7,70,70,70,0.35,0.35,0.35,0.35,'7861003120187','7861003120187',0,'2020-02-27 16:49:18',1,'ACTIVO'),(558,1532,7,8,8,8,3.50,3.50,3.50,3.50,'7702425679207','7702425679207',0,'2020-02-27 16:50:14',1,'ACTIVO'),(559,1535,7,11,11,11,1.00,1.00,1.00,1.00,'7702026625351','7702026625351',0,'2020-02-27 16:55:09',1,'ACTIVO'),(560,1530,7,5,5,5,4.00,4.00,4.00,4.00,'7702026062163','7702026062163',0,'2020-02-27 16:58:25',1,'ACTIVO'),(561,1527,7,8,8,8,3.50,3.50,3.50,3.50,'7861003112540','7861003112540',0,'2020-02-27 17:00:18',1,'ACTIVO'),(562,1546,14,2,2,2,2.30,2.30,2.30,2.30,'7861001800111','7861001800111',0,'2020-02-27 17:04:07',1,'ACTIVO'),(563,1545,14,1,1,1,2.50,2.50,2.50,2.50,'000900106031','000900106031',0,'2020-02-27 17:05:35',1,'ACTIVO'),(564,1516,7,237,237,237,0.90,0.90,0.90,0.90,'7861003112083','7861003112083',0,'2020-02-27 17:06:43',1,'ACTIVO'),(565,1519,7,249,249,249,0.45,0.45,0.45,0.45,'7861003100707','7861003100707',0,'2020-02-27 17:07:50',1,'ACTIVO'),(566,1547,14,1,1,1,2.30,2.30,2.30,2.30,'7861001800104','7861001800104',0,'2020-02-27 17:09:01',1,'ACTIVO'),(567,1521,7,6,6,6,2.00,2.00,2.00,2.00,'7861003113219','7861003113219',0,'2020-02-27 17:10:26',1,'ACTIVO'),(568,1544,4,3,3,3,3.00,3.00,3.00,3.00,'000900129047','000900129047',0,'2020-02-27 17:11:12',1,'ACTIVO'),(569,1576,7,6,6,16,0.60,0.60,0.60,0.60,'7861013735104','7861013735104',0,'2020-02-27 17:14:30',1,'ACTIVO'),(570,1575,7,11,11,19,1.00,1.00,1.00,1.00,'7861002821733','7861002821733',0,'2020-02-27 17:15:57',1,'ACTIVO'),(571,1569,16,19,1,19,0.25,0.30,0.30,0.30,'7702354928650','7702354928650',0,'2020-02-27 17:20:33',1,'ACTIVO'),(572,1570,16,21,1,21,0.25,0.30,0.30,0.30,'7702354928636','7702354928636',0,'2020-02-27 17:21:17',1,'ACTIVO'),(573,1577,7,10,10,10,0.60,0.60,0.60,0.60,'7861003121849','7861003121849',0,'2020-02-27 17:21:51',1,'ACTIVO'),(574,1574,16,12,1,12,0.25,0.30,0.30,0.30,'7702354928728','7702354928728',0,'2020-02-27 17:22:24',1,'ACTIVO'),(575,1572,7,19,19,19,0.60,0.60,0.60,0.60,'7861013731472','7861013731472',0,'2020-02-27 17:23:04',1,'ACTIVO'),(576,1578,7,12,12,12,1.00,1.00,1.00,1.00,'7702026020156','7702026020156',0,'2020-02-27 17:23:27',1,'ACTIVO'),(577,1566,16,16,1,16,0.25,0.30,0.30,0.30,'7702354928704','7702354928704',0,'2020-02-27 17:23:51',1,'ACTIVO'),(578,1564,7,9,3,9,0.89,1.00,1.00,1.00,'7861013731496','7861013731496',0,'2020-02-27 17:24:39',1,'ACTIVO'),(579,1571,16,1,1,12,0.25,0.30,0.30,0.30,'7702354928643','7702354928643',0,'2020-02-27 17:25:41',1,'ACTIVO'),(580,1563,7,5,5,5,1.15,1.15,1.15,1.15,'7861013731632','7861013731632',0,'2020-02-27 17:26:02',1,'ACTIVO'),(581,1573,16,15,1,15,0.25,0.30,0.30,0.30,'7702354928698','7702354928698',0,'2020-02-27 17:27:21',1,'ACTIVO'),(582,1557,7,5,5,5,1.45,1.45,1.45,1.45,'7861002826042','7861002826042',0,'2020-02-27 17:27:25',1,'ACTIVO'),(583,1553,7,4,4,4,3.14,3.14,3.14,3.14,'7861002827063','7861002827063',0,'2020-02-27 17:28:10',1,'ACTIVO'),(584,1562,16,22,1,22,0.30,0.35,0.35,0.35,'7622210882110','7622210882110',0,'2020-02-27 17:29:34',1,'ACTIVO'),(585,1556,16,24,1,24,0.30,0.35,0.35,0.35,'7622210882660','7622210882660',0,'2020-02-27 17:30:38',1,'ACTIVO'),(586,1580,5,4,1,4,1.80,2.00,2.00,2.00,'7861035520405','7861035520405',0,'2020-02-27 17:30:44',1,'ACTIVO'),(587,1522,7,21,21,21,3.80,3.80,3.80,3.80,'7861003121528','7861003121528',0,'2020-02-27 17:30:53',1,'ACTIVO'),(588,1560,16,19,1,19,0.30,0.35,0.35,0.35,'7622210882585','7622210882585',0,'2020-02-27 17:31:27',1,'ACTIVO'),(589,1558,16,7,1,7,0.30,0.35,0.35,0.35,'7622210882219','7622210882219',0,'2020-02-27 17:32:27',1,'ACTIVO'),(590,1541,2,2,2,2,5.00,5.00,5.00,5.00,'7861001301106','7861001301106',0,'2020-02-27 17:33:12',1,'ACTIVO'),(591,1555,16,17,1,17,0.30,0.35,0.35,0.35,'7622210882257','7622210882257',0,'2020-02-27 17:33:46',1,'ACTIVO'),(592,1542,2,2,2,2,5.00,5.00,5.00,5.00,'7861001301113','7861001301113',0,'2020-02-27 17:34:10',1,'ACTIVO'),(593,1579,5,6,1,6,0.55,0.65,0.65,0.65,'7861021200779','7861021200779',0,'2020-02-27 17:35:22',1,'ACTIVO'),(594,1561,16,37,1,37,0.30,0.35,0.35,0.35,'7702354031459','7702354031459',0,'2020-02-27 17:36:06',1,'ACTIVO'),(595,1533,5,2,1,2,0.90,1.10,1.10,1.10,'7861007800276','7861007800276',0,'2020-02-27 17:36:17',1,'ACTIVO'),(596,1542,2,1,1,1,5.00,5.00,5.00,5.00,'7862106702751','7862106702751',0,'2020-02-27 17:36:45',1,'ACTIVO'),(597,1526,5,15,1,15,0.65,0.75,0.75,0.75,'7861007800399','7861007800399',0,'2020-02-27 17:37:17',1,'ACTIVO'),(598,1552,16,22,1,22,0.30,0.35,0.35,0.35,'7702354935801','7702354935801',0,'2020-02-27 17:37:18',1,'ACTIVO'),(599,1543,2,1,1,1,5.00,5.00,5.00,5.00,'7862106703413','7862106703413',0,'2020-02-27 17:37:34',1,'ACTIVO'),(600,1559,16,16,1,26,0.30,0.35,0.35,0.35,'7702354933852','7702354933852',0,'2020-02-27 17:39:02',1,'ACTIVO'),(601,1585,4,10,10,10,1.50,1.50,1.50,1.50,'7861001362114','7861001362114',0,'2020-02-27 17:39:53',1,'ACTIVO'),(602,1554,16,34,1,34,0.00,0.00,0.00,0.00,'7702354031466','7702354031466',0,'2020-02-27 17:40:10',1,'ACTIVO'),(603,1583,4,3,3,3,1.00,1.00,1.00,1.00,'7861001362152','7861001362152',0,'2020-02-27 17:40:42',1,'ACTIVO'),(604,1582,4,1,1,1,1.00,1.00,1.00,1.00,'7861001301465','7861001301465',0,'2020-02-27 17:41:26',1,'ACTIVO'),(605,1506,5,6,1,6,1.00,1.25,1.25,1.25,'7861021200540','7861021200540',0,'2020-02-27 17:42:12',1,'ACTIVO'),(606,1567,5,6,1,6,1.00,1.20,1.20,1.20,'7861007906626','7861007906626',0,'2020-02-27 17:42:57',1,'ACTIVO'),(607,1588,16,24,24,24,0.25,0.25,0.25,0.25,'7861001300802','7861001300802',0,'2020-02-27 17:43:06',1,'ACTIVO'),(608,1587,16,24,24,24,0.25,0.25,0.25,0.25,'7861001301489','7861001301489',0,'2020-02-27 17:44:41',1,'ACTIVO'),(609,1520,5,6,1,6,0.90,1.10,1.10,1.10,'7861052002014','7861052002014',0,'2020-02-27 17:44:50',1,'ACTIVO'),(610,1568,7,5,5,5,3.00,3.00,3.00,3.00,'7702026060619','7702026060619',0,'2020-02-27 17:46:04',1,'ACTIVO'),(611,1565,5,4,1,4,2.20,2.45,2.45,2.45,'7861021204784','7861021204784',0,'2020-02-27 17:46:04',1,'ACTIVO'),(612,1591,7,4,4,4,1.68,1.68,1.68,1.68,'7861013734213','7861013734213',0,'2020-02-27 17:48:56',1,'ACTIVO'),(613,1529,5,6,1,6,0.90,1.05,1.05,1.05,'7861052002038','7861052002038',0,'2020-02-27 17:49:09',1,'ACTIVO'),(614,1589,7,2,2,2,2.75,2.75,2.75,2.75,'7861013735173','7861013735173',0,'2020-02-27 17:49:45',1,'ACTIVO'),(615,1590,7,1,1,1,1.70,1.70,1.70,1.70,'7861013735166','7861013735166',0,'2020-02-27 17:50:21',1,'ACTIVO'),(616,1536,6,159,159,159,0.45,0.45,0.45,0.45,'7861023206892','7861023206892',0,'2020-02-27 17:51:38',1,'ACTIVO'),(617,1539,2,1,1,1,1.50,1.50,1.50,1.50,'7702010225147','7702010225147',0,'2020-02-27 17:52:33',1,'ACTIVO'),(618,1599,7,6,6,6,0.65,0.65,0.65,0.65,'7861002823195','7861002823195',0,'2020-02-27 17:53:31',1,'ACTIVO'),(619,1601,16,25,1,25,0.30,0.35,0.35,0.35,'7622210882431','7622210882431',0,'2020-02-27 17:54:21',1,'ACTIVO'),(620,1597,7,12,12,16,0.60,0.60,0.60,0.60,'7861002823188','7861002823188',0,'2020-02-27 17:54:39',1,'ACTIVO'),(621,1596,16,1,1,1,0.25,0.30,0.30,0.30,'7702354928759','7702354928759',0,'2020-02-27 17:55:41',1,'ACTIVO'),(622,1592,7,2,2,2,4.91,4.91,4.91,4.91,'7861013731304','7861013731304',0,'2020-02-27 17:55:56',1,'ACTIVO'),(623,1603,7,6,6,12,1.00,1.00,1.00,1.00,'7861002820453','7861002820453',0,'2020-02-27 17:56:44',1,'ACTIVO'),(624,1595,16,15,1,15,0.25,0.30,0.30,0.30,'7702354928681','7702354928681',0,'2020-02-27 17:56:57',1,'ACTIVO'),(625,1593,16,45,1,45,0.30,0.35,0.35,0.35,'7862106703314','7862106703314',0,'2020-02-27 17:57:59',1,'ACTIVO'),(626,1600,16,51,1,51,0.30,0.35,0.35,0.35,'7622210882158','7622210882158',0,'2020-02-27 17:59:10',1,'ACTIVO'),(627,1605,4,12,1,12,1.40,1.65,1.65,1.65,'8719200453371','8719200453371',0,'2020-02-27 18:00:52',1,'ACTIVO'),(628,1548,7,4,4,4,1.10,1.10,1.10,1.10,'7861038005121','7861038005121',0,'2020-02-27 18:05:49',1,'ACTIVO'),(629,1550,7,7,7,7,1.10,1.10,1.10,1.10,'7861038005114','7861038005114',0,'2020-02-27 18:07:07',1,'ACTIVO'),(630,444,5,2,1,2,1.40,1.70,1.70,1.70,'7861026001760','7861026001760',0,'2020-02-27 18:07:23',1,'ACTIVO'),(631,1611,7,33,3,3,0.80,0.80,0.80,0.80,'7861191924277','7861191924277',0,'2020-02-27 18:08:10',1,'ACTIVO'),(632,1609,7,2,2,2,0.80,0.80,0.80,0.80,'7861191924321','7861191924321',0,'2020-02-27 18:08:54',1,'ACTIVO'),(633,1607,7,1,1,1,0.80,0.80,0.80,0.80,'7861191924284','7861191924284',0,'2020-02-27 18:09:34',1,'ACTIVO'),(634,390,5,5,1,5,1.30,1.70,1.70,1.70,'7750243286138','7750243286138',0,'2020-02-27 18:10:34',1,'ACTIVO'),(635,1514,2,4,4,4,1.00,1.00,1.00,1.00,'7708350073332','7708350073332',0,'2020-02-27 18:10:50',1,'ACTIVO'),(636,1507,2,4,4,4,1.00,1.00,1.00,1.00,'7708350073226','7708350073226',0,'2020-02-27 18:11:53',1,'ACTIVO'),(637,407,5,8,1,8,0.60,0.75,0.75,0.75,'7861002305547','7861002305561',0,'2020-02-27 18:17:37',1,'ACTIVO'),(638,410,5,7,1,7,0.60,0.75,0.75,0.75,'7861002370538','7861002370538',0,'2020-02-27 18:18:52',1,'ACTIVO'),(639,398,5,13,1,13,0.60,0.75,0.75,0.75,'7861002305684','7861002305684',0,'2020-02-27 18:20:44',1,'ACTIVO'),(640,396,5,19,1,19,0.60,0.75,0.75,0.75,'7861002305523','7861002305523',0,'2020-02-27 18:22:09',1,'ACTIVO'),(641,415,5,9,1,9,1.30,1.50,1.50,1.50,'7861002305516','7861002305516',0,'2020-02-27 18:23:58',1,'ACTIVO'),(642,452,5,16,1,16,0.70,0.80,0.80,0.80,'7862112900387','7862112900387',0,'2020-02-27 18:26:11',1,'ACTIVO'),(643,429,5,46,25,46,0.50,0.75,0.75,0.75,'7861004920458','7861004920458',0,'2020-02-27 18:30:16',1,'ACTIVO'),(644,436,5,18,1,18,0.50,0.75,0.75,0.75,'7861004920526','7861004920526',1,'2020-02-27 18:31:38',1,'ACTIVO'),(645,1624,4,3,1,3,0.80,0.90,0.90,0.90,'7861007911910','7861007911910',0,'2020-02-27 18:32:27',1,'ACTIVO'),(646,1623,15,18,1,18,0.28,0.35,0.35,0.35,'7861007906008','7861007906008',0,'2020-02-27 18:33:21',1,'ACTIVO'),(647,1630,7,5,5,5,1.10,1.10,1.10,1.10,'7861038005121','7861038005121',0,'2020-02-27 18:35:48',1,'ACTIVO'),(648,434,5,18,1,18,0.50,0.75,0.75,0.75,'7861004920526','7861004920526',0,'2020-02-27 18:36:48',1,'ACTIVO'),(649,1625,7,2,2,2,1.10,1.10,1.10,1.10,'7861038005046','7861038005046',0,'2020-02-27 18:37:00',1,'ACTIVO'),(650,1627,7,1,1,1,1.10,1.10,1.10,1.10,'7861038005060','7861038005060',0,'2020-02-27 18:37:39',1,'ACTIVO'),(651,524,5,12,1,12,0.30,0.40,0.40,0.40,'7861052003547','7861052003547',0,'2020-02-27 18:38:00',1,'ACTIVO'),(652,1628,7,1,1,1,1.10,1.10,1.10,1.10,'7861038056444','7861038056444',0,'2020-02-27 18:38:19',1,'ACTIVO'),(653,442,5,8,1,8,0.50,0.75,0.75,0.75,'7861004920366','7861004920366',0,'2020-02-27 18:39:15',1,'ACTIVO'),(654,476,4,13,1,13,0.85,1.00,1.00,1.00,'7861007914508','7861007914508',0,'2020-02-27 18:39:20',1,'ACTIVO'),(655,479,4,3,1,3,0.75,0.85,0.85,0.85,'7861000260916','7861000260916',0,'2020-02-27 18:40:18',1,'ACTIVO'),(656,467,5,5,1,5,0.55,0.65,0.65,0.65,'7861007912696','7861007912696',0,'2020-02-27 18:41:06',1,'ACTIVO'),(657,1612,8,3,1,3,3.00,4.00,4.00,4.00,'8004092000124','8004092000124',0,'2020-02-27 18:41:41',1,'ACTIVO'),(658,1610,2,3,1,3,3.75,4.50,4.50,4.50,'8420701101134','8420701101134',0,'2020-02-27 18:42:35',1,'ACTIVO'),(659,1608,2,6,1,6,5.00,6.00,6.00,6.00,'8420701101448','8420701101448',0,'2020-02-27 18:43:13',1,'ACTIVO'),(660,1642,5,13,13,13,2.80,2.80,2.80,2.80,'7406171029797','7406171029797',0,'2020-02-27 18:43:36',1,'ACTIVO'),(661,381,15,4,1,4,2.00,3.00,3.00,3.00,'7861002382258','7861002382258',0,'2020-02-27 18:43:55',1,'ACTIVO'),(662,1640,5,20,20,20,2.80,2.80,2.80,2.80,'7406171029841','7406171029841',0,'2020-02-27 18:44:15',1,'ACTIVO'),(663,383,15,4,1,4,4.00,5.00,5.00,5.00,'7861002300214','7861002300214',0,'2020-02-27 18:44:28',1,'ACTIVO'),(664,1639,5,12,12,12,2.80,2.80,2.80,2.80,'7406171029902','7406171029902',0,'2020-02-27 18:44:47',1,'ACTIVO'),(665,1617,4,1,1,1,0.75,0.85,0.85,0.85,'7861000260930','7861000260930',0,'2020-02-27 18:44:54',1,'ACTIVO'),(666,1615,4,3,1,3,0.75,0.85,0.85,0.85,'7861007913372','7861007913372',0,'2020-02-27 18:45:40',1,'ACTIVO'),(667,718,5,7,7,7,3.00,3.00,3.00,3.00,'7861048602693','7861048602693',0,'2020-02-27 18:46:01',1,'ACTIVO'),(668,1649,5,9,1,9,0.40,0.50,0.50,0.50,'7861026000312','7861026000312',0,'2020-02-27 18:51:09',1,'ACTIVO'),(669,1650,5,9,1,9,0.40,0.50,0.50,0.50,'7861026004891','7861026004891',0,'2020-02-27 18:51:59',1,'ACTIVO'),(670,1647,5,4,1,4,0.40,0.50,0.50,0.50,'7861026001777','7861026001777',0,'2020-02-27 18:53:17',1,'ACTIVO'),(671,1646,5,17,1,17,0.40,0.50,0.50,0.50,'7861026001494','7861026001494',0,'2020-02-27 18:54:12',1,'ACTIVO'),(672,1641,16,33,1,33,0.40,0.50,0.50,0.50,'7861026000114','7861026000114',0,'2020-02-27 18:55:11',1,'ACTIVO'),(673,1655,7,4,4,4,1.25,1.25,1.25,1.25,'7702048283546','7702048283546',0,'2020-02-27 18:56:39',1,'ACTIVO'),(674,1653,7,4,4,4,1.70,1.70,1.70,1.70,'7702048281528','7702048281528',0,'2020-02-27 18:57:35',1,'ACTIVO'),(675,1655,7,42,42,42,1.25,1.25,1.25,1.25,'7702048293620','7702048293620',0,'2020-02-27 18:58:40',1,'ACTIVO'),(676,1630,7,1,1,1,1.10,1.10,1.10,1.10,'7861038005015','7861038005015',0,'2020-02-27 19:01:20',1,'ACTIVO'),(677,1659,5,8,1,8,0.40,0.50,0.50,0.50,'7861026000121','7861026000121',0,'2020-02-27 19:08:18',1,'ACTIVO'),(678,1660,5,1,1,1,0.45,0.60,0.60,0.60,'7861002388540','7861002388540',0,'2020-02-27 19:08:47',1,'ACTIVO'),(679,1657,5,17,1,17,0.40,0.50,0.50,0.50,'7861026000145','7861026000145',0,'2020-02-27 19:09:27',1,'ACTIVO'),(680,481,15,6,1,6,4.00,5.00,5.00,5.00,'7861026032290','7861026032290',0,'2020-02-27 19:09:46',1,'ACTIVO'),(681,480,15,4,1,4,2.50,3.50,3.50,3.50,'7861026032306','7861026032306',0,'2020-02-27 19:10:34',1,'ACTIVO'),(682,1652,4,5,1,5,0.75,0.85,0.85,0.85,'7861190400376','7861190400376',0,'2020-02-27 19:13:26',1,'ACTIVO'),(683,477,4,12,1,12,0.75,0.85,0.85,0.85,'7861007913679','7861007913679',0,'2020-02-27 19:14:22',1,'ACTIVO'),(684,1656,5,11,1,11,0.40,0.50,0.50,0.50,'7861026001524','7861026001524',0,'2020-02-27 19:15:31',1,'ACTIVO'),(685,1677,5,7,1,7,0.20,0.25,0.25,0.25,'7861004920311','7861004920311',0,'2020-02-27 19:27:56',1,'ACTIVO'),(686,1675,5,19,1,19,0.15,0.20,0.20,0.20,'7861004920106','7861004920106',0,'2020-02-27 19:39:55',1,'ACTIVO'),(687,1191,2,1,1,1,1.40,1.80,1.80,1.80,'044695012900','044695012900',0,'2020-02-27 19:40:49',1,'ACTIVO'),(688,1676,5,17,1,17,0.15,0.20,0.20,0.20,'7861004920076','7861004920076',0,'2020-02-27 19:42:31',1,'ACTIVO'),(689,1685,2,20,1,20,1.60,1.80,1.80,1.80,'7861018200720','7861018200720',0,'2020-02-27 19:42:37',1,'ACTIVO'),(690,1687,2,34,1,34,0.90,1.00,1.00,1.00,'7861018201086','7861018201086',0,'2020-02-27 19:43:05',1,'ACTIVO'),(691,1684,17,2,1,2,0.85,1.00,1.00,1.00,'7861018220230','7861018220230',0,'2020-02-27 19:43:44',1,'ACTIVO'),(692,1681,16,11,1,11,0.55,0.65,0.65,0.65,'7861018220223','7861018220223',0,'2020-02-27 19:44:25',1,'ACTIVO'),(693,1700,16,5,1,5,0.75,0.85,0.85,0.85,'7861018200881','7861018200881',0,'2020-02-27 19:50:22',1,'ACTIVO'),(694,1667,5,74,20,74,0.20,0.25,0.25,0.25,'7861026004204','7861026004204',0,'2020-02-27 19:51:46',1,'ACTIVO'),(695,1670,5,17,1,17,0.40,0.50,0.50,0.50,'7861026004228','7861026004228',0,'2020-02-27 19:52:59',1,'ACTIVO'),(696,1672,5,3,1,3,0.60,0.80,0.80,0.80,'7861026006130','7861026006130',0,'2020-02-27 19:53:52',1,'ACTIVO'),(697,395,5,14,1,14,0.20,0.25,0.25,0.25,'7861002389097','7861002389097',0,'2020-02-27 19:56:13',1,'ACTIVO'),(698,456,5,33,1,33,0.25,0.30,0.30,0.30,'7861007908118','7861007908118',0,'2020-02-27 20:02:29',1,'ACTIVO'),(699,1711,5,5,1,5,0.60,0.80,0.80,0.80,'7861063501742','7861063501742',0,'2020-02-27 20:14:45',1,'ACTIVO'),(700,1707,5,14,1,14,0.50,0.75,0.75,0.75,'7861004920564','7861004920564',0,'2020-02-27 20:16:58',1,'ACTIVO'),(701,1705,5,23,1,23,0.50,0.75,0.75,0.75,'7861004920120','7861004920120',0,'2020-02-27 20:18:23',1,'ACTIVO'),(702,1709,5,9,1,9,0.60,0.80,0.80,0.80,'7862112900202','7862112900202',0,'2020-02-27 20:29:37',1,'ACTIVO'),(703,533,5,20,1,20,0.80,1.00,1.00,1.00,'7861035520054','7861035520054',0,'2020-02-27 20:31:54',1,'ACTIVO'),(704,534,5,18,1,18,0.40,0.50,0.50,0.50,'7861035520061','7861035520061',0,'2020-02-27 20:34:18',1,'ACTIVO'),(705,535,5,70,1,70,0.15,0.20,0.20,0.20,'7861035520030','7861035520030',0,'2020-02-27 20:36:05',1,'ACTIVO'),(706,532,5,9,1,9,0.50,0.60,0.60,0.60,'7861035520191','7861035520191',0,'2020-02-27 20:38:53',1,'ACTIVO'),(707,1749,5,10,1,10,1.10,1.30,1.30,1.30,'7862126580070','7862126580070',0,'2020-02-27 21:07:05',1,'ACTIVO'),(708,1748,5,9,1,9,0.55,0.65,0.65,0.65,'7862126580094','7862126580094',0,'2020-02-27 21:09:06',1,'ACTIVO'),(709,1750,5,8,1,8,1.10,1.25,1.25,1.25,'7861035520023','7861035520023',0,'2020-02-27 21:11:10',1,'ACTIVO'),(710,1742,5,16,1,15,0.15,0.20,0.20,0.20,'7861004920373','7861004920373',0,'2020-02-27 21:12:24',1,'ACTIVO'),(711,1739,5,8,1,8,0.15,0.20,0.20,0.20,'7861004920434','7861004920434',0,'2020-02-27 21:13:29',1,'ACTIVO'),(712,1745,5,19,1,19,0.20,0.25,0.25,0.25,'7861026001579','7861026001579',0,'2020-02-27 21:15:06',1,'ACTIVO'),(713,1737,5,51,1,51,0.25,0.30,0.30,0.30,'7861004920502','7861004920502',0,'2020-02-27 21:23:33',1,'ACTIVO'),(714,445,5,26,1,26,0.90,1.00,1.00,1.00,'7861026001012','7861026001012',0,'2020-02-27 21:40:05',1,'ACTIVO'),(715,1729,5,8,1,8,0.40,0.50,0.50,0.50,'7861026030814','7861026030814',0,'2020-02-27 21:40:39',1,'ACTIVO'),(716,1634,4,3,3,3,3.00,3.00,3.00,3.00,'7790740505523','7790740505523',0,'2020-02-27 21:41:09',1,'ACTIVO'),(717,1631,2,1,1,1,3.00,3.00,3.00,3.00,'7790740505547','7790740505547',0,'2020-02-27 21:41:42',1,'ACTIVO'),(718,392,5,15,1,19,0.85,0.05,0.95,0.95,'7750243016117','7750243016117',0,'2020-02-27 21:42:20',1,'ACTIVO'),(719,1632,4,2,2,2,3.00,3.00,3.00,3.00,'7790740505530','7790740505530',0,'2020-02-27 21:42:20',1,'ACTIVO'),(720,1651,7,3,3,3,3.00,3.00,3.00,3.00,'7790740502423','7790740502423',0,'2020-02-27 21:43:26',1,'ACTIVO'),(721,1735,5,40,1,40,0.40,0.50,0.50,0.50,'7862112900196','7862112900196',0,'2020-02-27 21:43:34',1,'ACTIVO'),(722,1731,5,12,1,12,1.50,1.75,1.75,1.75,'7861002300153','7861002300153',0,'2020-02-27 21:44:33',1,'ACTIVO'),(723,1759,5,10,1,10,0.90,1.00,1.00,1.00,'7861006905804','7861006905804',0,'2020-02-27 21:46:34',1,'ACTIVO'),(724,1761,5,2,1,2,1.60,1.85,1.85,1.85,'7861026032825','7861026032825',0,'2020-02-27 21:47:25',1,'ACTIVO'),(725,1678,2,2,2,2,4.00,4.00,4.00,4.00,'7708350073998','7708350073998',0,'2020-02-27 21:47:26',1,'ACTIVO'),(726,1762,5,12,1,12,1.50,1.85,1.85,1.85,'7861026032832','7861026032832',0,'2020-02-27 21:48:13',1,'ACTIVO'),(727,1691,7,25,25,25,1.20,1.20,1.20,1.20,'9557702126213','9557702126213',0,'2020-02-27 21:48:18',1,'ACTIVO'),(728,1661,7,6,6,6,1.90,1.90,1.90,1.90,'7702026311339','7702026311339',0,'2020-02-27 21:49:43',1,'ACTIVO'),(729,1663,7,4,4,4,2.25,2.25,2.25,2.25,'7896018700628','7896018700628',0,'2020-02-27 21:50:29',1,'ACTIVO'),(730,1658,7,6,6,6,2.50,2.50,2.50,2.50,'7709990968569','7709990968569',0,'2020-02-27 21:51:10',1,'ACTIVO'),(731,1682,7,4,4,4,1.00,1.00,1.00,1.00,'7862110202261','7862110202261',0,'2020-02-27 21:51:52',1,'ACTIVO'),(732,1763,7,12,12,12,2.00,2.00,2.00,2.00,'100001124','100001124',0,'2020-02-27 21:54:57',1,'ACTIVO'),(733,1714,7,2,2,2,5.00,5.00,5.00,5.00,'7861076256028','7861076256028',0,'2020-02-27 21:55:43',1,'ACTIVO'),(734,1648,7,3,3,3,1.10,1.10,1.10,1.10,'7861038056420','7861038056420',0,'2020-02-27 21:56:22',1,'ACTIVO'),(735,1712,7,11,11,11,0.25,0.25,0.25,0.25,'7861036711215','7861036711215',0,'2020-02-27 21:57:20',1,'ACTIVO'),(736,1710,7,25,25,25,0.25,0.25,0.25,0.25,'7861036711208','7861036711208',0,'2020-02-27 21:58:26',1,'ACTIVO'),(737,1666,2,8,8,8,2.00,2.00,2.00,2.00,'7861001800173','7861001800173',0,'2020-02-27 21:59:36',1,'ACTIVO'),(738,1693,2,20,20,20,0.50,0.50,0.50,0.50,'7862109020012','7862109020012',0,'2020-02-27 22:01:20',1,'ACTIVO'),(739,1694,2,7,7,7,1.30,1.30,1.30,1.30,'7862101172429','7862101172429',0,'2020-02-27 22:02:10',1,'ACTIVO'),(740,1733,4,22,22,22,1.25,1.25,1.25,1.25,'7861191932906','7861191932906',0,'2020-02-27 22:03:29',1,'ACTIVO'),(741,1713,4,6,6,6,1.80,1.80,1.80,1.80,'8690757732013','8690757732013',0,'2020-02-27 22:04:28',1,'ACTIVO'),(742,1708,7,4,4,4,3.50,3.50,3.50,3.50,'7861038058608','7861038058608',0,'2020-02-27 22:05:12',1,'ACTIVO'),(743,1718,4,2,2,2,1.70,1.70,1.70,1.70,'7861067902071','7861067902071',0,'2020-02-27 22:06:07',1,'ACTIVO'),(744,1755,7,6,6,6,1.25,1.25,1.25,1.25,'7861026031460','7861026031460',0,'2020-02-27 22:08:51',1,'ACTIVO'),(745,1773,5,8,1,8,0.25,0.40,0.40,0.40,'7861021208805','7861021208805',0,'2020-02-27 22:09:31',1,'ACTIVO'),(746,1756,4,5,5,5,1.25,1.25,1.25,1.25,'7861026031477','7861026031477',0,'2020-02-27 22:10:03',1,'ACTIVO'),(747,1754,4,5,5,5,0.85,0.85,0.85,0.85,'7861026031484','7861026031484',0,'2020-02-27 22:11:05',1,'ACTIVO'),(748,1766,5,18,1,18,0.10,0.15,0.15,0.15,'7861021207068','7861021207068',0,'2020-02-27 22:11:40',1,'ACTIVO'),(749,1776,5,27,1,27,0.20,0.30,0.30,0.30,'7861021207075','7861021207075',0,'2020-02-27 22:12:39',1,'ACTIVO'),(750,1785,2,1,1,1,2.00,2.00,2.00,2.00,'7861001800166','7861001800166',0,'2020-02-27 22:13:26',1,'ACTIVO'),(751,1787,2,1,1,1,2.00,2.00,2.00,2.00,'7861001800159','7861001800159',0,'2020-02-27 22:14:05',1,'ACTIVO'),(752,1734,4,65,65,65,0.75,0.75,0.75,0.80,'7509546015040','7509546015040',0,'2020-02-27 22:15:21',1,'ACTIVO'),(753,1765,5,2,1,2,0.30,0.40,0.40,0.40,'7861021207037','7861021207037',0,'2020-02-27 22:15:59',1,'ACTIVO'),(754,1732,16,25,25,25,0.30,0.30,0.30,0.30,'7862112291171','7862112291171',0,'2020-02-27 22:16:07',1,'ACTIVO'),(755,1764,4,5,5,5,3.00,3.00,3.00,3.00,'7861032224511','7861032224511',0,'2020-02-27 22:17:04',1,'ACTIVO'),(756,1800,4,8,8,8,1.00,1.00,1.00,1.00,'100001125','100001125',0,'2020-02-27 22:19:36',1,'ACTIVO'),(757,1760,4,36,36,36,0.40,0.40,0.40,0.40,'070330703629','070330703629',0,'2020-02-27 22:20:18',1,'ACTIVO'),(758,1768,5,86,1,86,0.12,0.15,0.15,0.15,'100001127','100001127',0,'2020-02-27 22:20:52',1,'ACTIVO'),(759,1798,4,15,15,15,2.00,2.00,2.00,2.00,'100001126','100001126',0,'2020-02-27 22:21:44',1,'ACTIVO'),(760,1772,5,49,1,49,0.13,0.15,0.15,0.15,'100001128','100001128',0,'2020-02-27 22:23:09',1,'ACTIVO'),(761,1793,7,58,58,58,1.00,1.00,1.00,1.00,'6924932661884','6924932661884',0,'2020-02-27 22:23:24',1,'ACTIVO'),(762,1747,4,15,15,15,0.25,0.25,0.25,0.25,'8901751351286','8901751351286',0,'2020-02-27 22:24:17',1,'ACTIVO'),(763,1746,7,6,6,6,0.25,0.25,0.25,0.25,'8901751352993','8901751352993',0,'2020-02-27 22:24:55',1,'ACTIVO'),(764,1780,5,6,1,6,0.13,0.15,0.15,0.15,'100001129','100001129',0,'2020-02-27 22:25:26',1,'ACTIVO'),(765,1741,7,7,7,7,0.25,0.25,0.25,0.25,'8901751351293','8901751351293',0,'2020-02-27 22:26:02',1,'ACTIVO'),(766,1802,4,5,5,5,2.00,2.00,2.00,2.00,'7861026031538','7861026031538',0,'2020-02-27 22:26:50',1,'ACTIVO'),(767,1801,5,41,1,41,0.80,1.00,1.00,1.00,'7861007913822','7861007913822',0,'2020-02-27 22:27:12',1,'ACTIVO'),(768,1784,5,45,1,45,0.03,0.05,0.05,0.05,'100001130','100001130',0,'2020-02-27 22:27:54',1,'ACTIVO'),(769,1723,2,4,4,4,1.50,1.50,1.50,1.50,'7861003202029','7861003202029',0,'2020-02-27 22:27:55',1,'ACTIVO'),(770,1792,5,28,1,28,0.85,0.95,0.95,0.95,'7862112900189','7862112900189',0,'2020-02-27 22:28:23',1,'ACTIVO'),(771,1728,16,31,31,31,0.50,0.50,0.50,0.50,'7702626204642','7702626204642',0,'2020-02-27 22:28:42',1,'ACTIVO'),(772,1795,5,4,1,4,1.00,1.30,1.30,1.30,'7861006905705','7861006905705',0,'2020-02-27 22:29:27',1,'ACTIVO'),(773,1730,16,34,34,34,0.50,0.50,0.50,0.50,'7702626204208','7702626204208',0,'2020-02-27 22:29:33',1,'ACTIVO'),(774,1799,5,13,1,13,0.50,0.70,0.70,0.70,'7861006905903','7861006905903',0,'2020-02-27 22:29:56',1,'ACTIVO'),(775,1790,7,34,34,34,3.00,3.00,3.00,3.00,'7702027040252','7702027040252',0,'2020-02-27 22:30:15',1,'ACTIVO'),(776,1791,5,41,1,41,0.07,0.10,0.10,0.10,'100001131','100001131',0,'2020-02-27 22:31:20',1,'ACTIVO'),(777,1788,5,44,1,44,0.40,0.55,0.55,0.55,'7861004920472','7861004920472',0,'2020-02-27 22:31:32',1,'ACTIVO'),(778,1789,5,24,1,24,0.70,0.80,0.80,0.80,'7861004920489','7861004920489',0,'2020-02-27 22:32:00',1,'ACTIVO'),(779,1786,5,123,1,123,0.03,0.05,0.05,0.05,'100001132','100001132',0,'2020-02-27 22:36:41',1,'ACTIVO'),(780,1721,16,145,145,145,0.05,0.05,0.05,0.05,'7702136645003','7702136645003',0,'2020-02-27 22:41:06',1,'ACTIVO'),(781,1804,16,46,46,46,0.70,0.70,0.70,0.70,'7702626206653','7702626206653',0,'2020-02-27 22:41:56',1,'ACTIVO'),(782,462,5,10,1,10,0.40,0.80,0.80,0.80,'7861007913792','7861007913792',0,'2020-02-27 22:42:24',1,'ACTIVO'),(783,1816,7,40,40,40,0.25,0.25,0.25,0.25,'100001134','100001134',0,'2020-02-27 22:51:49',1,'ACTIVO'),(784,1821,4,7,7,7,0.25,0.25,0.25,0.25,'100001133','100001133',0,'2020-02-27 22:53:33',1,'ACTIVO'),(785,1820,4,21,21,21,0.25,0.25,0.25,0.25,'100001135','100001135',0,'2020-02-27 22:54:30',1,'ACTIVO'),(786,1833,19,17,30,17,2.70,3.00,3.00,3.00,'100001136','100001130',0,'2020-02-28 08:03:34',1,'ACTIVO'),(787,1834,19,50,15,50,1.35,1.50,1.50,1.50,'100001137','100001137',0,'2020-02-28 08:05:38',1,'ACTIVO'),(788,1832,5,12,1,12,0.30,0.35,0.35,0.35,'7702024069218','7702024069218',0,'2020-02-28 08:08:16',1,'ACTIVO'),(789,1829,5,18,1,18,0.20,0.25,0.25,0.25,'7861091133267','7861091133267',0,'2020-02-28 08:08:40',1,'ACTIVO'),(790,1835,19,50,9,50,0.81,1.00,1.00,1.00,'100001138','100001138',0,'2020-02-28 08:09:06',1,'ACTIVO'),(791,1831,5,17,1,17,0.20,0.25,0.25,0.25,'7861091133304','7861091133304',0,'2020-02-28 08:09:24',1,'ACTIVO'),(792,1830,5,17,1,17,0.20,0.25,0.25,0.25,'7861091133281','7861091133281',0,'2020-02-28 08:09:49',1,'ACTIVO'),(793,1827,5,28,1,28,0.20,0.25,0.25,0.25,'7861091133243','7861091133243',0,'2020-02-28 08:10:21',1,'ACTIVO'),(794,1828,5,17,1,17,0.20,0.25,0.25,0.25,'7861091133328','7861091133328',0,'2020-02-28 08:10:42',1,'ACTIVO'),(795,1836,19,50,4,50,0.36,0.50,0.50,0.50,'100001139','100001139',0,'2020-02-28 08:10:51',1,'ACTIVO'),(796,1837,19,50,2,50,0.18,0.25,0.25,0.25,'100001140','100001140',0,'2020-02-28 08:11:59',1,'ACTIVO'),(797,1689,5,6,1,6,1.70,1.85,1.85,1.85,'7861004812036','7861004812036',0,'2020-02-28 08:17:30',1,'ACTIVO'),(798,1680,5,6,1,6,1.70,1.88,1.88,1.88,'7861004812067','7861004812067',0,'2020-02-28 08:19:17',1,'ACTIVO'),(799,1683,5,6,1,6,1.75,1.85,1.85,1.85,'7861004812012','7861004812012',0,'2020-02-28 08:23:30',1,'ACTIVO'),(800,1839,5,24,1,24,0.30,0.40,0.40,0.40,'7861091140234','7861091140234',0,'2020-02-28 08:26:32',1,'ACTIVO'),(801,1838,5,8,1,8,0.40,0.50,0.50,0.50,'7613037471694','7613037471694',0,'2020-02-28 08:27:02',1,'ACTIVO'),(802,1671,5,6,1,6,1.75,1.88,1.88,1.88,'7861004812050','7861004812050',0,'2020-02-28 08:27:37',1,'ACTIVO'),(803,1690,5,4,1,4,1.75,1.88,1.88,1.88,'7861004812043','7861004812043',0,'2020-02-28 08:28:55',1,'ACTIVO'),(804,1686,5,5,1,5,1.75,1.88,1.88,1.88,'7861004812005','7861004812005',0,'2020-02-28 08:30:45',1,'ACTIVO'),(805,1679,5,6,1,6,1.75,1.88,1.88,1.88,'7861004812074','7861004812074',0,'2020-02-28 08:32:12',1,'ACTIVO'),(806,1696,5,6,1,6,1.50,1.60,1.60,1.60,'7702103015099','7702103015099',0,'2020-02-28 08:35:28',1,'ACTIVO'),(807,1695,5,10,1,10,1.50,1.60,1.60,1.60,'7702103015082','7702103015082',0,'2020-02-28 08:40:39',1,'ACTIVO'),(808,1846,5,4,1,4,0.65,0.75,0.75,0.75,'7702103015310','7702103015310',0,'2020-02-28 08:44:45',1,'ACTIVO'),(809,1699,5,6,1,6,1.10,1.25,1.25,1.25,'7861001239508','7861001239508',0,'2020-02-28 08:46:10',1,'ACTIVO'),(810,1698,5,6,1,6,1.10,1.25,1.25,1.25,'7861001239515','7861001239515',0,'2020-02-28 08:47:09',1,'ACTIVO'),(811,1697,5,13,1,13,1.45,1.60,1.60,1.60,'7702103015105','7702103015105',0,'2020-02-28 08:48:58',1,'ACTIVO'),(812,1692,5,4,1,4,0.65,0.75,0.75,0.75,'7702103015303','7702103015303',0,'2020-02-28 08:52:40',1,'ACTIVO'),(813,797,9,2,1,2,2.50,2.70,2.70,2.70,'7861001237016','7861001237016',0,'2020-02-28 08:57:30',1,'ACTIVO'),(814,911,11,6,1,12,2.35,2.50,2.50,2.50,'7802950066906','7802950066906',0,'2020-02-28 08:59:09',1,'ACTIVO'),(815,914,4,5,1,5,4.50,5.00,5.00,5.00,'7861001235746','7861001235746',0,'2020-02-28 09:00:57',1,'ACTIVO'),(816,1701,3,3,1,3,3.00,3.60,3.60,3.60,'7861035510604','7861035510604',0,'2020-02-28 09:06:27',1,'ACTIVO'),(817,1668,3,2,1,2,3.40,3.00,3.00,3.00,'7861004810940','7861004810940',0,'2020-02-28 09:09:29',1,'ACTIVO'),(818,912,11,15,1,27,0.90,1.00,1.00,1.00,'7802950063523','7802950063523',0,'2020-02-28 09:12:26',1,'ACTIVO'),(819,791,9,4,1,4,1.35,1.50,1.50,1.50,'7861001214147','7861001214147',0,'2020-02-28 09:13:50',1,'ACTIVO'),(820,1856,5,8,1,8,1.20,1.40,1.40,1.40,'7861091196798','7861091196798',0,'2020-02-28 09:22:07',1,'ACTIVO'),(821,1853,7,1,1,1,1.70,2.00,2.00,2.00,'7861091133250','7861091133250',0,'2020-02-28 09:23:43',1,'ACTIVO'),(822,1842,5,8,1,8,0.80,0.90,0.90,0.90,'7861091196743','7861091196743',0,'2020-02-28 09:25:05',1,'ACTIVO'),(823,1843,5,4,1,4,0.80,0.90,0.90,0.90,'7861091157461','7861091157461',0,'2020-02-28 09:27:33',1,'ACTIVO'),(824,1854,7,3,1,3,1.80,2.00,2.00,2.00,'7861091133311','7861091133311',0,'2020-02-28 09:33:17',1,'ACTIVO'),(825,1855,7,3,1,3,1.70,2.00,2.00,2.00,'7861091133298','7861091133298',0,'2020-02-28 09:34:23',1,'ACTIVO'),(826,1852,7,1,1,1,1.70,2.00,2.00,2.00,'7861091133274','7861091133274',0,'2020-02-28 09:35:05',1,'ACTIVO'),(827,1851,7,1,1,1,1.70,2.00,2.00,2.00,'7861091133335','7861091133335',0,'2020-02-28 09:38:26',1,'ACTIVO'),(828,1850,5,10,1,10,0.70,0.80,0.80,0.80,'7861091157768','7861091157768',0,'2020-02-28 09:39:21',1,'ACTIVO'),(829,1849,5,23,1,23,0.30,0.40,0.40,0.40,'7861091190192','7861091190192',0,'2020-02-28 09:42:53',1,'ACTIVO'),(830,1844,5,14,1,14,0.50,0.60,0.60,0.60,'7861091155740','7861091155740',0,'2020-02-28 09:44:20',1,'ACTIVO'),(831,1848,5,9,1,9,0.50,0.60,0.60,0.60,'7861091155573','7861091155573',0,'2020-02-28 09:45:09',1,'ACTIVO'),(832,1847,5,9,1,9,0.50,0.60,0.60,0.60,'7861091140432','7861091140432',0,'2020-02-28 09:47:03',1,'ACTIVO'),(833,1806,7,17,17,17,0.50,0.50,0.50,0.50,'7861026005430','7861026005430',0,'2020-02-28 09:47:59',1,'ACTIVO'),(834,1866,5,1,1,13,1.40,1.70,1.70,1.70,'7750243286145','7750243286145',0,'2020-02-28 09:48:26',1,'ACTIVO'),(835,1841,5,10,1,10,0.70,0.85,0.85,0.85,'7861091199539','7861091199539',0,'2020-02-28 09:48:30',1,'ACTIVO'),(836,1840,5,5,1,5,0.60,0.75,0.75,0.75,'7861091140265','7861091140265',0,'2020-02-28 09:49:56',1,'ACTIVO'),(837,1859,5,2,1,2,3.50,3.85,3.85,3.85,'7861001293746','7861001293746',0,'2020-02-28 09:50:12',1,'ACTIVO'),(838,1858,5,10,1,10,1.80,2.00,2.00,2.00,'7861001293753','7861001293753',0,'2020-02-28 09:51:47',1,'ACTIVO'),(839,1826,7,19,19,19,0.50,0.50,0.50,0.50,'7861026005386','7861026005386',0,'2020-02-28 09:52:05',1,'ACTIVO'),(840,1858,5,19,1,19,0.80,1.00,1.00,1.00,'7861001217131','7861001217131',0,'2020-02-28 09:53:26',1,'ACTIVO'),(841,1862,5,6,1,6,0.25,0.30,0.30,0.30,'7861001291070','7861001291070',0,'2020-02-28 09:54:32',1,'ACTIVO'),(842,1860,5,4,1,4,2.70,2.90,2.90,2.90,'7501059276604','7501059276604',0,'2020-02-28 09:56:15',1,'ACTIVO'),(843,1863,5,19,1,19,0.40,0.50,0.50,0.50,'7861001240078','7861001240078',0,'2020-02-28 09:59:09',1,'ACTIVO'),(844,665,5,3,1,3,1.50,1.60,1.60,1.60,'7861009940109','7861009940109',0,'2020-02-28 09:59:55',1,'ACTIVO'),(845,1861,5,3,1,3,2.75,3.00,3.00,3.00,'7613032444761','7613032444761',0,'2020-02-28 10:00:13',1,'ACTIVO'),(846,664,5,3,1,4,1.50,1.60,1.60,1.60,'7861009940093','7861009940093',0,'2020-02-28 10:00:58',1,'ACTIVO'),(847,1865,7,23,1,23,0.90,1.00,1.00,1.00,'7862122701448','7862122701448',0,'2020-02-28 10:04:06',1,'ACTIVO'),(848,1867,5,8,1,11,0.80,1.00,1.00,1.00,'7861009940918','7861009940918',0,'2020-02-28 10:04:40',1,'ACTIVO'),(849,649,5,14,1,14,1.45,1.70,1.70,1.70,'7861009942837','7861009942837',0,'2020-02-28 10:05:59',1,'ACTIVO'),(850,1869,5,1,1,1,2.20,2.45,2.45,2.45,'7861009942424','7861009942424',0,'2020-02-28 10:11:11',1,'ACTIVO'),(851,652,5,4,1,4,3.00,3.30,3.30,3.30,'7861009941878','7861009941878',0,'2020-02-28 10:12:09',1,'ACTIVO'),(852,1870,5,2,1,2,0.80,1.00,1.00,1.00,'7861009941892','7861009941892',0,'2020-02-28 10:17:37',1,'ACTIVO'),(853,654,5,1,1,4,1.20,1.45,1.45,1.45,'7861009943285','7861009943285',0,'2020-02-28 10:19:49',1,'ACTIVO'),(854,1871,7,7,1,7,1.50,1.75,1.75,1.75,'7861001293951','7861001293951',0,'2020-02-28 10:21:50',1,'ACTIVO'),(855,1872,7,14,14,14,0.50,0.50,0.50,0.50,'7861026005393','7861026005393',0,'2020-02-28 10:24:05',1,'ACTIVO'),(856,1874,5,1,1,1,1.85,2.10,2.10,2.10,'7861009941977','7861009941977',0,'2020-02-28 10:29:10',1,'ACTIVO'),(857,667,5,1,1,2,1.80,2.00,2.00,2.00,'7861009940857','7861009940857',0,'2020-02-28 10:31:08',1,'ACTIVO'),(858,1879,4,3,1,3,2.20,2.50,2.50,2.50,'7862106454803','7862106454803',0,'2020-02-28 10:34:33',1,'ACTIVO'),(859,1878,4,8,1,8,2.60,2.75,2.75,2.75,'7861001217230','7861001217230',0,'2020-02-28 10:35:49',1,'ACTIVO'),(860,1877,4,23,1,23,0.85,1.00,1.00,1.00,'7861001237924','7861001237924',0,'2020-02-28 10:36:59',1,'ACTIVO'),(861,650,5,1,1,1,1.80,2.00,2.00,2.00,'7861009980242','7861009980242',0,'2020-02-28 10:37:21',1,'ACTIVO'),(862,1876,4,2,1,2,1.60,1.80,1.80,1.80,'7702007216127','7702007216127',0,'2020-02-28 10:38:22',1,'ACTIVO'),(863,1880,7,23,21,23,0.65,0.65,0.65,0.65,'7750373104586','7750373104586',0,'2020-02-28 10:43:31',1,'ACTIVO'),(864,1873,4,21,1,21,0.20,0.25,0.25,0.25,'7702007018981','7702007018981',0,'2020-02-28 10:44:20',1,'ACTIVO'),(865,1881,5,1,1,2,2.20,2.45,2.45,2.45,'7861009940314','7861009940314',0,'2020-02-28 10:46:01',1,'ACTIVO'),(866,1882,7,9,9,9,1.40,1.65,1.65,1.65,'7702026144579','7702026144579',0,'2020-02-28 10:46:19',1,'ACTIVO'),(867,1883,4,5,1,5,0.80,1.00,1.00,1.00,'7702007052985','7702007052985',0,'2020-02-28 10:48:19',1,'ACTIVO'),(868,1884,7,6,6,6,2.50,2.50,2.50,2.50,'7702026145026','7702026145026',0,'2020-02-28 10:49:14',1,'ACTIVO'),(869,1885,5,1,1,1,2.20,2.45,2.45,2.45,'7861009940253','7861009940253',0,'2020-02-28 10:49:15',1,'ACTIVO'),(870,1886,7,4,4,4,2.20,2.70,2.70,2.70,'7702027440434','7702027440434',0,'2020-02-28 10:51:38',1,'ACTIVO'),(871,1887,5,1,1,1,2.40,2.75,2.75,2.75,'7861009941328','7861009941328',0,'2020-02-28 10:52:47',1,'ACTIVO'),(872,1890,7,16,16,16,0.20,0.20,0.20,0.20,'7861006002060','7861006002060',0,'2020-02-28 10:58:35',1,'ACTIVO'),(873,1891,5,3,1,3,0.80,1.00,1.00,1.00,'7861106300769','7861106300769',0,'2020-02-28 11:05:21',1,'ACTIVO'),(874,1894,5,2,1,2,1.20,1.45,1.45,1.45,'7861106300059','7861106300059',0,'2020-02-28 11:14:03',1,'ACTIVO'),(875,1892,16,19,19,19,0.25,0.25,0.25,0.25,'7406171033435','7406171033435',0,'2020-02-28 11:18:56',1,'ACTIVO'),(876,1805,16,7,7,7,0.75,0.75,0.75,0.75,'7702626210582','7702626210582',0,'2020-02-28 11:21:37',1,'ACTIVO'),(877,1868,7,1,1,1,0.50,0.50,0.50,0.50,'7861038058332','7861038058332',0,'2020-02-28 11:34:23',1,'ACTIVO'),(878,1900,4,2,2,2,2.00,2.00,2.00,2.00,'7503002163610','7503002163610',0,'2020-02-28 11:40:01',1,'ACTIVO'),(879,1897,5,3,1,3,0.80,1.00,1.00,1.00,'7861106300394','7861106300394',0,'2020-02-28 11:44:05',1,'ACTIVO'),(880,1898,2,1,1,1,8.00,9.00,9.00,9.00,'7891000076699','7891000076699',0,'2020-02-28 11:51:03',1,'ACTIVO'),(881,1899,2,2,1,2,4.00,4.80,4.80,4.80,'7891000076675','7891000076675',0,'2020-02-28 11:52:46',1,'ACTIVO'),(882,1907,2,5,6,5,1.00,1.25,1.25,1.25,'78930841','78930841',0,'2020-02-28 12:18:33',1,'ACTIVO'),(883,1902,2,1,1,1,5.00,6.00,6.00,6.00,'7702032253869','7702032253869',0,'2020-02-28 12:18:44',1,'ACTIVO'),(884,1910,4,3,3,3,1.00,1.00,1.00,1.00,'7702006202596','7702006202596',0,'2020-02-28 12:22:10',1,'ACTIVO'),(885,1901,2,1,1,1,1.30,1.50,1.50,1.50,'7702032253098','7702032253098',0,'2020-02-28 12:23:41',1,'ACTIVO'),(886,1911,4,5,5,5,2.25,2.25,2.25,2.25,'78924413','78924413',0,'2020-02-28 12:24:17',1,'ACTIVO'),(887,1905,5,3,1,3,0.80,1.00,1.00,1.00,'7861106300684','7861106300684',0,'2020-02-28 12:24:44',1,'ACTIVO'),(888,1888,2,3,1,3,8.00,9.00,9.00,9.00,'7707211630486','7707211630486',0,'2020-02-28 12:24:59',1,'ACTIVO'),(889,1909,5,2,1,2,1.80,2.00,2.00,2.00,'7861106300530','7861106300530',0,'2020-02-28 12:25:34',1,'ACTIVO'),(890,1889,2,4,1,4,4.50,5.50,5.50,5.50,'7707211630493','7707211630493',0,'2020-02-28 12:26:12',1,'ACTIVO'),(891,1908,5,2,1,2,1.80,20.00,2.00,2.00,'7861106300448','7861106300448',0,'2020-02-28 12:27:04',1,'ACTIVO'),(892,1895,2,3,1,3,3.00,4.00,4.00,4.00,'7707211631209','7707211631209',0,'2020-02-28 12:27:34',1,'ACTIVO'),(893,1912,18,1,1,1,4.00,4.00,4.00,4.00,'7791293025834','7791293025834',0,'2020-02-28 12:28:15',1,'ACTIVO'),(894,1896,2,4,1,4,3.00,3.50,3.50,3.50,'7707211630219','7707211630219',0,'2020-02-28 12:28:50',1,'ACTIVO'),(895,1903,4,6,1,6,2.50,3.00,3.00,3.00,'7861017962001','7861017962001',0,'2020-02-28 12:31:01',1,'ACTIVO'),(896,1913,14,1,1,1,4.00,4.00,4.00,4.00,'7506306208469','7506306208469',0,'2020-02-28 12:31:52',1,'ACTIVO'),(897,1914,18,2,2,2,4.00,4.00,4.00,4.00,'7791293025889','7791293025889',0,'2020-02-28 12:34:05',1,'ACTIVO'),(898,1915,18,1,1,1,4.00,4.00,4.00,4.00,'7506306202849','7506306202849',0,'2020-02-28 12:38:10',1,'ACTIVO'),(899,1916,18,1,1,1,4.50,4.50,4.50,4.50,'7791293032450','7791293032450',0,'2020-02-28 12:41:21',1,'ACTIVO'),(900,1917,4,3,3,3,2.25,2.25,2.25,2.25,'78928503','78928503',0,'2020-02-28 12:44:12',1,'ACTIVO'),(901,1918,5,1,1,1,1.80,2.00,2.00,2.00,'7861106300516','7861106300516',0,'2020-02-28 12:46:57',1,'ACTIVO'),(902,1919,4,2,2,2,1.25,1.25,1.25,1.25,'75036508','75036508',0,'2020-02-28 12:47:27',1,'ACTIVO'),(903,1921,4,6,6,6,2.25,2.25,2.25,2.25,'78924895','78924895',0,'2020-02-28 12:50:17',1,'ACTIVO'),(904,1920,5,6,1,6,0.90,1.00,1.00,1.00,'7861106300653','7861106300653',0,'2020-02-28 12:50:47',1,'ACTIVO'),(905,1922,4,4,4,4,1.25,1.25,1.25,1.25,'78924222','78924222',0,'2020-02-28 12:52:23',1,'ACTIVO'),(906,1923,5,4,1,4,1.30,1.50,1.50,1.50,'7861106300226','7861106300226',0,'2020-02-28 12:53:43',1,'ACTIVO'),(907,568,2,3,3,3,3.00,3.00,3.00,3.00,'7861024604222','7861024604222',0,'2020-02-28 12:54:34',1,'ACTIVO'),(908,557,2,12,12,12,0.50,0.50,0.50,0.50,'7861024626255','7861024626255',1,'2020-02-28 12:56:32',1,'ACTIVO'),(909,559,2,7,7,7,0.60,0.60,0.60,0.60,'7861024620307','7861024620307',0,'2020-02-28 12:58:33',1,'ACTIVO'),(910,561,2,2,2,2,1.00,1.00,1.00,1.00,'7861024607643','7861024607643',0,'2020-02-28 12:59:46',1,'ACTIVO'),(911,566,2,10,10,10,2.40,2.50,2.50,2.50,'7861024600873','7861024600873',0,'2020-02-28 13:00:38',1,'ACTIVO'),(912,565,2,16,16,16,0.75,0.80,0.80,0.80,'7861024609876','7861024609876',0,'2020-02-28 13:02:10',1,'ACTIVO'),(913,596,2,17,17,17,0.45,0.50,0.50,0.50,'7861024621113','7861024621113',0,'2020-02-28 13:03:18',1,'ACTIVO'),(914,150,2,10,10,10,0.40,0.40,0.40,0.40,'7861024611640','7861024611640',0,'2020-02-28 13:04:42',1,'ACTIVO'),(915,1924,5,1,1,1,1.20,1.50,1.50,1.50,'7861106300011','7861106300011',0,'2020-02-28 13:04:45',1,'ACTIVO'),(916,147,2,9,9,9,0.40,0.40,0.40,0.40,'78604162','78604162',0,'2020-02-28 13:05:26',1,'ACTIVO'),(917,158,3,11,11,11,0.20,0.25,0.25,0.25,'7861024621199','7861024621199',0,'2020-02-28 13:10:02',1,'ACTIVO'),(918,563,2,17,17,17,0.30,0.35,0.35,0.35,'7861024626262','7861024626262',0,'2020-02-28 13:13:41',1,'ACTIVO'),(919,584,2,6,6,6,0.35,0.35,0.35,0.35,'7861024626231','7861024626231',0,'2020-02-28 13:14:29',1,'ACTIVO'),(920,589,2,3,3,3,0.35,0.35,0.35,0.35,'7861024626224','7861024626224',0,'2020-02-28 13:15:11',1,'ACTIVO'),(921,578,2,8,8,8,0.35,0.35,0.35,0.35,'7861024626217','7861024626217',0,'2020-02-28 13:15:53',1,'ACTIVO'),(922,595,2,8,8,8,0.20,0.25,0.25,0.25,'7861024605946','7861024605946',0,'2020-02-28 13:16:46',1,'ACTIVO'),(923,165,2,12,12,12,0.20,0.25,0.25,0.25,'7861024624091','7861024624091',0,'2020-02-28 13:18:56',1,'ACTIVO'),(924,576,2,3,3,3,3.00,3.00,3.00,3.00,'7861024604284','7861024604284',0,'2020-02-28 13:20:37',1,'ACTIVO'),(925,593,2,4,4,4,3.00,3.00,3.00,3.00,'7861024604291','7861024604291',0,'2020-02-28 13:22:49',1,'ACTIVO'),(926,1485,5,11,1,11,0.22,0.25,0.25,0.25,'7861065503706','7861065503706',0,'2020-02-28 13:23:45',1,'ACTIVO'),(927,146,2,11,11,11,1.10,1.10,1.10,1.10,'7861024621243','7861024621243',0,'2020-02-28 13:24:10',1,'ACTIVO'),(928,1487,5,21,1,21,0.23,0.25,0.25,0.25,'7861065503713','7861065503713',0,'2020-02-28 13:24:58',1,'ACTIVO'),(929,167,2,16,16,16,0.60,0.60,0.60,0.60,'7861024624725','7861024624725',0,'2020-02-28 13:25:07',1,'ACTIVO'),(930,319,5,5,1,11,0.22,0.25,0.25,0.25,'7861065505069','7861065505069',0,'2020-02-28 13:26:08',1,'ACTIVO'),(931,148,2,10,10,10,1.10,1.10,1.10,1.10,'7861024621465','7861024621465',0,'2020-02-28 13:26:23',1,'ACTIVO'),(932,312,5,9,1,9,0.23,0.25,0.25,0.25,'7861065505656','7861065505656',0,'2020-02-28 13:27:20',1,'ACTIVO'),(933,151,2,11,11,11,1.10,1.10,1.10,1.10,'7861024621458','7861024621458',0,'2020-02-28 13:27:38',1,'ACTIVO'),(934,159,9,6,6,6,1.20,1.20,1.20,1.20,'7861024610438','7861024610438',0,'2020-02-28 13:28:35',1,'ACTIVO'),(935,1494,5,7,1,7,0.22,0.25,0.25,0.25,'7861065504055','7861065504055',0,'2020-02-28 13:29:22',1,'ACTIVO'),(936,144,2,4,4,4,0.75,0.75,0.75,0.75,'7861024620604','7861024620604',0,'2020-02-28 13:30:36',1,'ACTIVO'),(937,1495,5,11,1,11,0.08,0.10,0.10,0.10,'7861031400015','7861031400015',0,'2020-02-28 13:34:05',1,'ACTIVO'),(938,1496,5,9,1,9,0.23,0.25,0.25,0.25,'7861031400022','7861031400022',0,'2020-02-28 13:35:32',1,'ACTIVO'),(939,1508,5,4,1,4,0.40,0.50,0.50,0.50,'7861065508145','7861065508145',1,'2020-02-28 13:36:27',1,'ACTIVO'),(940,261,5,4,1,4,0.90,1.00,1.00,1.00,'7861065503379','7861065503379',0,'2020-02-28 13:38:37',1,'ACTIVO'),(941,299,5,1,1,1,0.40,0.50,0.50,0.50,'7861065504178','7861065504178',0,'2020-02-28 13:41:00',1,'ACTIVO'),(942,239,5,3,1,3,0.90,1.00,1.00,1.00,'7861065504376','7861065504376',0,'2020-02-28 13:43:09',1,'ACTIVO'),(943,246,5,3,1,3,0.90,1.00,1.00,1.00,'7861065503843','7861065503843',0,'2020-02-28 13:44:12',1,'ACTIVO'),(944,1941,5,3,1,3,0.60,0.75,0.75,0.75,'7861124400205','7861124400205',0,'2020-02-28 13:52:09',1,'ACTIVO'),(945,253,5,4,1,4,0.30,0.40,0.40,0.40,'7861065504512','7861065504512',0,'2020-02-28 13:53:26',1,'ACTIVO'),(946,1930,5,5,1,5,0.80,0.90,0.90,0.90,'7702032104345','7702032104345',0,'2020-02-28 13:54:11',1,'ACTIVO'),(947,1508,5,3,1,9,0.22,0.25,0.25,0.25,'7861065508145','7861065508145',0,'2020-02-28 13:54:47',1,'ACTIVO'),(948,1509,5,3,1,9,0.22,0.25,0.25,0.25,'7861065507537','7861065507537',0,'2020-02-28 13:56:25',1,'ACTIVO'),(949,243,5,8,1,8,0.40,0.50,0.50,0.50,'7861065504185','7861065504185',0,'2020-02-28 13:57:40',1,'ACTIVO'),(950,247,5,8,1,8,0.40,0.50,0.50,0.50,'7861065504352','7861065504352',0,'2020-02-28 13:59:00',1,'ACTIVO'),(951,1929,20,4,1,4,0.70,0.80,0.80,0.80,'7702032253579','7702032253579',0,'2020-02-28 13:59:07',1,'ACTIVO'),(952,240,5,9,1,8,0.40,0.50,0.50,0.50,'7861065503911','7861065503911',0,'2020-02-28 14:00:03',1,'ACTIVO'),(953,1931,20,8,1,8,0.90,1.00,1.00,1.00,'7861001240566','7861001240566',0,'2020-02-28 14:00:23',1,'ACTIVO'),(954,1932,20,35,1,35,0.25,0.30,0.30,0.30,'7861001231328','7861001231328',0,'2020-02-28 14:01:56',1,'ACTIVO'),(955,1928,20,43,1,43,0.25,0.30,0.30,0.30,'7702032202010','7702032202010',0,'2020-02-28 14:03:49',1,'ACTIVO'),(956,1945,5,3,1,3,0.22,0.25,0.25,0.25,'7861065507285','7861065507285',0,'2020-02-28 14:04:57',1,'ACTIVO'),(957,1925,20,29,1,29,0.25,0.30,0.30,0.30,'7861026005751','7861026005751',0,'2020-02-28 14:05:34',1,'ACTIVO'),(958,1485,5,7,1,7,0.23,0.25,0.25,0.25,'7861065503706','7861065503706',1,'2020-02-28 14:06:31',1,'ACTIVO'),(959,1926,20,5,1,5,0.80,1.00,1.00,1.00,'7861026031651','7861026031651',0,'2020-02-28 14:07:46',1,'ACTIVO'),(960,1581,5,2,1,2,2.40,2.75,2.75,2.75,'7861018501032','7861018501032',0,'2020-02-28 14:08:07',1,'ACTIVO'),(961,1584,5,2,1,2,2.40,2.75,2.75,2.75,'7861018501025','7861018501025',0,'2020-02-28 14:09:34',1,'ACTIVO'),(962,1927,20,7,1,7,1.00,1.25,1.25,1.25,'7861026005720','7861026005720',0,'2020-02-28 14:09:39',1,'ACTIVO'),(963,1949,5,1,1,1,2.40,2.75,2.75,2.75,'7861018501049','7861018501049',0,'2020-02-28 14:21:58',1,'ACTIVO'),(964,382,5,1,1,1,0.80,1.00,1.00,1.00,'7861018507928','7861018507928',0,'2020-02-28 14:23:30',1,'ACTIVO'),(965,1497,5,4,1,4,0.40,0.50,0.50,0.50,'7861065508107','7861065508107',0,'2020-02-28 14:28:10',1,'ACTIVO'),(966,1958,2,2,1,2,0.75,0.00,0.00,0.75,'7861024620598','7861024620598',0,'2020-02-28 14:31:42',1,'ACTIVO'),(967,1959,5,7,1,7,0.23,0.25,0.25,0.25,'7861124400199','7861124400199',0,'2020-02-28 14:36:55',1,'ACTIVO'),(968,1937,20,110,1,110,0.85,1.00,1.00,1.00,'7861006800079','7861006800079',0,'2020-02-28 14:37:27',1,'ACTIVO'),(969,262,5,2,1,2,0.90,1.00,1.00,1.00,'7861065503430','7861065503430',0,'2020-02-28 14:39:41',1,'ACTIVO'),(970,1936,20,66,1,66,1.40,1.60,1.60,1.60,'7861006800024','7861006800024',0,'2020-02-28 14:39:44',1,'ACTIVO'),(971,306,5,9,1,9,0.23,0.25,0.25,0.25,'7861065503768','7861065503768',0,'2020-02-28 14:41:34',1,'ACTIVO'),(972,1934,20,2,1,2,2.40,2.60,2.60,2.60,'7861000291019','7861000291019',0,'2020-02-28 14:42:23',1,'ACTIVO'),(973,1938,20,32,1,32,1.00,1.25,1.25,1.25,'7862110910234','7862110910234',0,'2020-02-28 14:44:06',1,'ACTIVO'),(974,1933,20,17,1,17,0.80,1.00,1.00,1.00,'7707211630318','7707211630318',0,'2020-02-28 14:46:03',1,'ACTIVO'),(975,1952,2,9,1,9,0.55,0.60,0.60,0.60,'7861024611060','7861024611060',0,'2020-02-28 14:47:12',1,'ACTIVO'),(976,1935,20,523,80,523,0.22,0.30,0.30,0.30,'7861006800017','7861006800017',0,'2020-02-28 14:48:26',1,'ACTIVO'),(977,1965,5,4,1,4,1.60,1.60,1.60,1.60,'7861091901026','7861091901026',0,'2020-02-28 14:49:47',1,'ACTIVO'),(978,1950,2,17,1,17,0.35,0.00,0.00,0.35,'7861024627702','7861024627702',0,'2020-02-28 14:52:09',1,'ACTIVO'),(979,1951,2,10,1,10,0.35,0.00,0.00,0.35,'7861024621663','7861024621663',0,'2020-02-28 14:52:13',1,'ACTIVO'),(980,1966,5,1,1,1,1.60,1.80,1.80,1.80,'7861091901057','7861091901057',0,'2020-02-28 14:54:53',1,'ACTIVO'),(981,1957,2,4,1,4,0.60,0.00,0.00,0.60,'7861024627726','7861024627726',0,'2020-02-28 14:57:11',1,'ACTIVO'),(982,1956,2,4,1,4,0.50,0.00,0.00,0.50,'7861024627719','7861024627719',0,'2020-02-28 14:58:42',1,'ACTIVO'),(983,1967,2,5,1,5,0.60,0.60,0.60,0.60,'7861024627757','7861024627757',0,'2020-02-28 14:59:56',1,'ACTIVO'),(984,1955,9,11,1,11,0.20,0.00,0.00,0.25,'7861024621182','7861024621182',0,'2020-02-28 15:03:52',1,'ACTIVO'),(985,1954,2,6,1,6,1.00,0.00,0.00,1.00,'7861024608176','7861024608176',0,'2020-02-28 15:07:02',1,'ACTIVO'),(986,1961,2,3,1,3,3.00,0.00,0.00,3.00,'7861024604239','7861024604239',0,'2020-02-28 15:10:31',1,'ACTIVO'),(987,1970,5,3,1,3,1.60,1.80,1.80,1.80,'7861091900920','7861091900920',0,'2020-02-28 15:13:19',1,'ACTIVO'),(988,1977,2,2,1,2,1.00,0.00,0.00,1.00,'7861024607643','7861024607643',0,'2020-02-28 15:41:56',1,'ACTIVO'),(989,1976,2,7,1,7,0.60,0.00,0.00,0.60,'7861024620307','7861024620307',0,'2020-02-28 15:42:18',1,'ACTIVO'),(990,1975,2,12,1,12,0.45,0.50,0.50,0.50,'7861024626255','7861024626255',0,'2020-02-28 15:43:35',1,'ACTIVO'),(991,1995,2,3,1,3,1.50,0.00,0.00,1.50,'7861024610889','7861024610889',0,'2020-02-28 16:01:45',1,'ACTIVO'),(992,2007,5,2,1,2,1.20,1.40,1.40,1.40,'7861091900418','7861091900418',0,'2020-02-28 16:13:20',1,'ACTIVO'),(993,2012,5,2,1,2,0.90,1.10,1.10,1.10,'7861018515312','7861018515312',0,'2020-02-28 16:20:42',1,'ACTIVO'),(994,2000,21,0,15,0,26.00,30.00,30.00,30.00,'7861032234718','7861032234718',0,'2020-02-28 16:22:17',1,'ACTIVO'),(995,2014,9,4,1,4,1.20,0.00,0.00,1.20,'7861024610445','7861024610445',0,'2020-02-28 16:22:43',1,'ACTIVO'),(996,1594,5,3,1,1,0.90,1.10,1.10,1.10,'7861018515725','7861018515725',0,'2020-02-28 16:22:52',1,'ACTIVO'),(997,2010,21,0,15,0,40.00,45.00,45.00,45.00,'7861002830902','7861002830902',0,'2020-02-28 16:24:57',1,'ACTIVO'),(998,1598,5,4,1,4,0.90,1.10,1.10,1.10,'7861018515305','7861018515305',0,'2020-02-28 16:25:54',1,'ACTIVO'),(999,391,5,9,1,9,0.45,0.55,0.55,0.55,'7861018512564','7861018512564',0,'2020-02-28 16:27:22',1,'ACTIVO'),(1000,1998,21,0,1,0,38.00,43.00,43.00,43.00,'7861032269093','7861032269093',0,'2020-02-28 16:29:23',1,'ACTIVO'),(1001,2021,2,11,1,11,0.60,0.00,0.00,0.60,'7862113550796','7862113550796',0,'2020-02-28 16:34:25',1,'ACTIVO'),(1002,2021,2,38,1,38,0.20,0.25,0.25,0.25,'7862113550796','7862113550796',0,'2020-02-28 16:37:14',1,'ACTIVO'),(1003,2022,21,0,1,0,28.00,35.00,35.00,35.00,'7861002831015','7861002831015',0,'2020-02-28 16:37:46',1,'ACTIVO'),(1004,174,2,11,1,11,0.60,0.00,0.00,0.60,'759494000354','759494000354',0,'2020-02-28 16:37:55',1,'ACTIVO'),(1005,1602,5,3,1,3,0.40,0.50,0.50,0.50,'7861018515251','7861018515251',0,'2020-02-28 16:41:22',1,'ACTIVO'),(1006,2024,21,0,1,0,28.00,33.00,33.00,33.00,'7861032291162','7861032291162',0,'2020-02-28 16:44:34',1,'ACTIVO'),(1007,2029,5,4,1,4,0.40,0.50,0.50,0.50,'7861018515763','7861018515763',0,'2020-02-28 16:49:27',1,'ACTIVO'),(1008,2027,21,0,1,0,38.00,45.00,45.00,45.00,'7861002802039','7861002802039',0,'2020-02-28 16:49:38',1,'ACTIVO'),(1009,1984,6,10,1,10,0.30,0.00,0.00,0.30,'7861006005320','7861006005320',0,'2020-02-28 16:49:51',1,'ACTIVO'),(1010,2020,16,58,18,58,0.18,0.25,0.25,0.25,'7702010470523','7702010052231',0,'2020-02-28 16:50:05',1,'ACTIVO'),(1011,2018,16,21,18,21,0.18,0.25,0.25,0.25,'7702010470448','7702010051906',0,'2020-02-28 16:52:19',1,'ACTIVO'),(1012,1993,7,1,1,1,1.00,1.20,1.20,1.20,'7862117210122','7862117210122',0,'2020-02-28 16:57:27',1,'ACTIVO'),(1013,2013,16,90,18,90,0.18,0.25,0.25,0.25,'7702010470189','7702010051555',0,'2020-02-28 16:57:50',1,'ACTIVO'),(1014,2002,16,33,20,33,0.18,0.25,0.25,0.25,'7702006200950','7702006200912',0,'2020-02-28 17:01:56',1,'ACTIVO'),(1015,1990,13,4,1,4,1.60,1.80,1.80,1.80,'7868000836530','7868000836530',0,'2020-02-28 17:02:14',1,'ACTIVO'),(1016,1606,5,3,1,3,0.30,0.40,0.40,0.40,'7861019911229','7861019911229',0,'2020-02-28 17:03:03',1,'ACTIVO'),(1017,1988,13,4,1,4,2.50,3.20,3.20,3.20,'7868000836547','7868000836547',0,'2020-02-28 17:04:15',1,'ACTIVO'),(1018,2001,16,19,20,19,0.18,0.25,0.25,0.25,'7702006200967','7702006200929',0,'2020-02-28 17:04:49',1,'ACTIVO'),(1019,2036,5,3,1,3,0.40,0.50,0.50,0.50,'7861018515770','7861018515770',0,'2020-02-28 17:05:36',1,'ACTIVO'),(1020,1994,5,1,1,1,1.80,2.00,2.00,2.00,'7861091199805','7861091199805',0,'2020-02-28 17:06:34',1,'ACTIVO'),(1021,1613,5,6,1,6,0.45,0.55,0.55,0.55,'7861018515046','7861018515046',0,'2020-02-28 17:07:12',1,'ACTIVO'),(1022,1992,5,1,1,1,2.00,2.50,2.50,2.50,'7862122701585','7862122701585',0,'2020-02-28 17:08:08',1,'ACTIVO'),(1023,1989,7,1,1,1,2.00,0.00,0.00,2.00,'7861078304338','7861078304338',0,'2020-02-28 17:09:22',1,'ACTIVO'),(1024,1987,20,31,1,31,0.25,0.30,0.30,0.30,'7622210733214','7622210733214',0,'2020-02-28 17:10:36',1,'ACTIVO'),(1025,1999,16,28,12,28,0.20,0.25,0.25,0.25,'7702031350750','7702031364016',0,'2020-02-28 17:11:36',1,'ACTIVO'),(1026,1979,7,2,1,2,1.25,0.00,0.00,1.25,'7861004350408','7861004350408',0,'2020-02-28 17:12:03',1,'ACTIVO'),(1027,393,5,5,1,5,0.45,0.55,0.55,0.55,'7861018508369','7861018508369',0,'2020-02-28 17:12:24',1,'ACTIVO'),(1028,1978,7,5,1,5,1.50,0.00,0.00,1.50,'7861078301931','7861078301931',0,'2020-02-28 17:13:38',1,'ACTIVO'),(1029,1996,16,5,12,5,0.20,0.25,0.25,0.25,'7702031338260','7702031361664',0,'2020-02-28 17:15:16',1,'ACTIVO'),(1030,1614,5,5,1,5,0.45,0.55,0.55,0.55,'7861018512915','7861018512915',0,'2020-02-28 17:16:00',1,'ACTIVO'),(1031,1616,5,3,1,3,0.40,0.50,0.50,0.50,'7861018515817','7861018515817',0,'2020-02-28 17:19:26',1,'ACTIVO'),(1032,1983,16,2,1,2,1.00,0.00,0.00,1.00,'7862112290938','7862112290938',0,'2020-02-28 17:19:27',1,'ACTIVO'),(1033,1997,16,16,12,16,0.20,0.25,0.25,0.25,'7702031350712','7702031363989',0,'2020-02-28 17:19:37',1,'ACTIVO'),(1034,1619,5,5,1,5,0.40,0.50,0.50,0.50,'7861018515800','7861018515800',0,'2020-02-28 17:20:37',1,'ACTIVO'),(1035,1619,5,2,1,2,0.40,0.50,0.50,0.50,'7861018515794','7861018515794',0,'2020-02-28 17:23:18',1,'ACTIVO'),(1036,1621,5,2,1,2,0.30,0.40,0.40,0.40,'7861018514957','7861018514957',0,'2020-02-28 17:25:25',1,'ACTIVO'),(1037,1626,5,3,1,9,0.40,0.50,0.50,0.50,'7861011803034','7861011803034',0,'2020-02-28 17:27:18',1,'ACTIVO'),(1038,508,5,6,1,18,0.25,0.30,0.30,0.30,'7861011800583','7861011800583',0,'2020-02-28 17:30:33',1,'ACTIVO'),(1039,2044,7,22,1,22,0.40,0.40,0.40,0.40,'7750082082762','7750082082762',0,'2020-02-28 17:36:20',1,'ACTIVO'),(1040,1370,4,3,1,3,0.85,1.00,1.00,1.00,'7861006767532','7861006767532',0,'2020-02-28 17:40:45',1,'ACTIVO'),(1041,374,4,3,1,3,0.90,1.05,1.05,1.05,'7861018514346','7861018514346',0,'2020-02-28 17:43:03',1,'ACTIVO'),(1042,2046,7,15,1,15,0.50,0.50,0.50,0.50,'6949501132312','6949501132312',0,'2020-02-28 17:43:58',1,'ACTIVO'),(1043,494,4,2,1,2,2.10,2.30,2.30,2.30,'7861006751104','7861006751104',0,'2020-02-28 17:44:46',1,'ACTIVO'),(1044,2045,7,6,1,6,0.50,0.50,0.50,0.50,'3014260833176','3014260833176',0,'2020-02-28 17:45:59',1,'ACTIVO'),(1045,2048,7,7,1,7,0.40,0.40,0.40,0.40,'7750082001275','7750082001275',0,'2020-02-28 17:49:01',1,'ACTIVO'),(1046,2047,7,15,1,15,0.40,0.40,0.40,0.40,'7591163100223','7591163100223',0,'2020-02-28 17:52:13',1,'ACTIVO'),(1047,1379,4,2,1,2,2.50,2.70,2.70,2.70,'7861006745134','7861006745134',0,'2020-02-28 17:52:42',1,'ACTIVO'),(1048,2050,5,7,1,7,0.22,0.25,0.25,0.25,'7861018512618','7861018512618',0,'2020-02-28 17:53:17',1,'ACTIVO'),(1049,2051,5,6,1,6,0.23,0.25,0.25,0.25,'7861018512656','7861018512656',0,'2020-02-28 17:54:42',1,'ACTIVO'),(1050,2049,6,23,1,23,0.40,0.40,0.40,0.40,'7861186200379','7861186200379',0,'2020-02-28 17:55:41',1,'ACTIVO'),(1051,318,5,1,1,7,0.23,0.25,0.25,0.25,'7861065504154','7861065504154',0,'2020-02-28 17:55:49',1,'ACTIVO'),(1052,495,4,1,1,1,2.50,2.65,2.65,2.65,'7861006746537','7861006746537',0,'2020-02-28 17:56:44',1,'ACTIVO'),(1053,397,5,3,1,3,1.20,1.30,1.30,1.30,'7861018512779','7861018512779',0,'2020-02-28 17:59:18',1,'ACTIVO'),(1054,1375,4,3,1,3,0.90,1.00,1.00,1.00,'7861006767235','7861006767235',0,'2020-02-28 18:05:26',1,'ACTIVO'),(1055,1374,4,2,1,2,0.25,0.30,0.30,0.30,'7861006767136','7861006767136',0,'2020-02-28 18:07:02',1,'ACTIVO'),(1056,2058,2,2,1,2,2.00,2.25,2.25,2.25,'7861021209659','7861021209659',0,'2020-02-28 18:08:05',1,'ACTIVO'),(1057,431,4,2,1,2,1.15,1.25,1.25,1.25,'7861006752231','7861006752231',0,'2020-02-28 18:08:57',1,'ACTIVO'),(1058,1345,2,5,1,5,2.50,3.50,3.50,3.50,'7861000210997','7861000210997',0,'2020-02-28 18:13:44',1,'ACTIVO'),(1059,2056,5,3,1,9,0.40,0.55,0.55,0.55,'7861009941403','7861009941403',0,'2020-02-28 18:15:52',1,'ACTIVO'),(1060,2020,16,19,18,19,0.20,0.25,0.25,0.25,'7702010470455','7702010051999',0,'2020-02-28 18:15:59',1,'ACTIVO'),(1061,2055,5,7,1,7,0.45,0.55,0.55,0.55,'7861009941373','7861009941373',0,'2020-02-28 18:16:17',1,'ACTIVO'),(1062,2057,5,3,1,3,0.60,0.75,0.75,0.75,'7861009941540','7861009941540',0,'2020-02-28 18:17:45',1,'ACTIVO'),(1063,2059,5,3,1,3,0.60,0.75,0.75,0.75,'7861009941571','7861009941571',0,'2020-02-28 18:18:43',1,'ACTIVO'),(1064,1380,4,3,1,3,1.10,1.25,1.25,1.25,'7861006752637','7861006752637',0,'2020-02-28 18:20:02',1,'ACTIVO'),(1065,2060,5,5,1,7,0.90,1.10,1.10,1.10,'7861009941496','7861009941496',0,'2020-02-28 18:20:03',1,'ACTIVO'),(1066,2061,5,6,1,6,0.90,1.10,1.10,1.10,'7861009941465','7861009941465',0,'2020-02-28 18:20:51',1,'ACTIVO'),(1067,443,4,1,1,1,1.35,1.50,1.50,1.50,'7861006745530','7861006745530',0,'2020-02-28 18:21:20',1,'ACTIVO'),(1068,1381,4,2,1,2,1.80,2.10,2.10,2.10,'7861006762162','7861006762162',0,'2020-02-28 18:25:46',1,'ACTIVO'),(1069,432,4,5,1,5,1.35,1.50,1.50,1.50,'7861006751531','7861006751531',0,'2020-02-28 18:28:31',1,'ACTIVO'),(1070,439,4,8,1,8,1.35,1.50,1.50,1.50,'7861006744243','7861006744243',0,'2020-02-28 18:29:57',1,'ACTIVO'),(1071,435,4,2,1,2,1.40,1.50,1.50,1.50,'7861006746032','7861006746032',0,'2020-02-28 18:32:38',1,'ACTIVO'),(1072,437,4,2,1,2,1.40,1.50,1.50,1.50,'7861006746636','7861006746636',0,'2020-02-28 18:33:39',1,'ACTIVO'),(1073,422,4,1,1,1,1.65,1.80,1.80,1.80,'7861006751036','7861006751036',0,'2020-02-28 18:36:44',1,'ACTIVO'),(1074,2070,24,3,1,3,1.00,1.20,1.20,1.20,'7501000909889','7501000909889',0,'2020-02-28 18:39:26',1,'ACTIVO'),(1075,2068,24,3,1,3,1.00,1.20,1.20,1.20,'7501000909995','7501000909995',0,'2020-02-28 18:40:35',1,'ACTIVO'),(1076,1372,4,5,1,5,0.25,0.30,0.30,0.30,'7861006767433','7861006767433',0,'2020-02-28 18:40:50',1,'ACTIVO'),(1077,2062,24,1,1,1,1.00,1.20,1.20,1.20,'7501000909902','7501000909902',0,'2020-02-28 18:44:18',1,'ACTIVO'),(1078,2069,5,2,1,2,1.60,1.80,1.80,1.80,'7861009942639','7861009942639',0,'2020-02-28 18:45:57',1,'ACTIVO'),(1079,2064,24,6,1,6,1.00,1.20,1.20,1.20,'7501000909872','7501000909872',0,'2020-02-28 18:46:10',1,'ACTIVO'),(1080,2071,4,1,1,1,2.30,2.50,2.50,2.50,'7861006749538','7861006749538',0,'2020-02-28 18:46:59',1,'ACTIVO'),(1081,2067,5,2,1,2,1.60,1.80,1.80,1.80,'7861009940710','7861009940710',0,'2020-02-28 18:47:11',1,'ACTIVO'),(1082,2063,24,4,1,4,1.00,1.20,1.20,1.20,'7501000910007','7501000910007',0,'2020-02-28 18:47:25',1,'ACTIVO'),(1083,2065,5,3,1,5,0.60,0.75,0.75,0.75,'7861009941557','7861009941557',0,'2020-02-28 18:48:15',1,'ACTIVO'),(1084,2066,5,6,1,6,0.90,1.10,1.10,1.10,'7861009941472','7861009941472',0,'2020-02-28 18:49:40',1,'ACTIVO'),(1085,663,5,5,1,5,0.50,0.60,0.60,0.60,'7861106300660','7861106300660',0,'2020-02-28 18:50:50',1,'ACTIVO'),(1086,1386,4,3,1,3,0.65,0.75,0.75,0.75,'7861124401158','7861124401158',0,'2020-02-28 18:50:59',1,'ACTIVO'),(1087,461,4,5,1,5,0.45,0.55,0.55,0.55,'7861006750039','7861006750039',0,'2020-02-28 18:53:07',1,'ACTIVO'),(1088,1436,4,2,1,2,0.40,0.50,0.50,0.50,'7861006747831','7861006747831',0,'2020-02-28 18:55:11',1,'ACTIVO'),(1089,464,4,7,1,7,0.45,0.55,0.55,0.55,'7861006744045','7861006744045',0,'2020-02-28 18:57:17',1,'ACTIVO'),(1090,472,4,5,1,5,0.45,0.55,0.55,0.55,'7861006752033','7861006752033',0,'2020-02-28 18:58:18',1,'ACTIVO'),(1091,430,4,6,1,6,0.30,0.40,0.40,0.40,'7861006752132','7861006752132',1,'2020-02-28 19:00:07',1,'ACTIVO'),(1092,2072,16,6,1,6,0.25,0.25,0.25,0.25,'7861038061950','7861038061950',0,'2020-02-28 19:04:49',1,'ACTIVO'),(1093,430,4,9,1,9,0.30,0.40,0.40,0.40,'7861006752132','7861006752132',0,'2020-02-28 19:05:34',1,'ACTIVO'),(1094,1395,4,6,1,6,0.30,0.40,0.40,0.40,'7861006751432','7861006751432',0,'2020-02-28 19:07:30',1,'ACTIVO'),(1095,2082,7,3,1,3,1.40,1.80,1.80,1.80,'8410971032467','8410971032467',0,'2020-02-28 19:07:51',1,'ACTIVO'),(1096,1390,4,4,1,4,0.45,0.55,0.55,0.55,'7861006730338','7861006730338',0,'2020-02-28 19:09:21',1,'ACTIVO'),(1097,2077,20,5,1,5,1.00,1.15,1.15,1.15,'7861021204043','7861021204043',0,'2020-02-28 19:09:23',1,'ACTIVO'),(1098,2076,16,29,1,29,0.25,0.25,0.25,0.25,'7861038061967','7861038061967',0,'2020-02-28 19:10:24',1,'ACTIVO'),(1099,2073,20,2,1,2,1.00,1.15,1.15,1.15,'7861021203855','7861021203855',0,'2020-02-28 19:10:48',1,'ACTIVO'),(1100,2075,20,2,1,2,1.00,1.15,1.15,1.15,'7861021204067','7861021204067',0,'2020-02-28 19:11:49',1,'ACTIVO'),(1101,2074,16,19,1,19,0.25,0.25,0.25,0.25,'781038061929','781038061929',0,'2020-02-28 19:12:07',1,'ACTIVO'),(1102,1398,4,4,1,4,0.45,0.55,0.55,0.55,'7861006754839','7861006754839',0,'2020-02-28 19:12:54',1,'ACTIVO'),(1103,496,4,13,1,13,0.30,0.40,0.40,0.40,'7861006752538','7861006752538',0,'2020-02-28 19:14:41',1,'ACTIVO'),(1104,2079,5,10,1,10,0.60,0.75,0.75,0.75,'7861106300523','7861106300523',0,'2020-02-28 19:17:50',1,'ACTIVO'),(1105,1405,4,5,1,5,0.40,0.50,0.50,0.50,'7861006749040','7861006749040',0,'2020-02-28 19:18:26',1,'ACTIVO'),(1106,2078,5,4,1,4,0.50,0.60,0.60,0.60,'7861106300677','7861106300677',0,'2020-02-28 19:18:40',1,'ACTIVO'),(1107,2092,4,4,1,4,0.40,0.50,0.50,0.50,'7861006747930','7861006747930',0,'2020-02-28 19:21:30',1,'ACTIVO'),(1108,506,4,12,1,12,0.40,0.50,0.50,0.50,'7861006747152','7861006747152',0,'2020-02-28 19:22:49',1,'ACTIVO'),(1109,2080,5,1,1,1,1.60,1.80,1.80,1.80,'7861009940666','7861009940666',0,'2020-02-28 19:23:31',1,'ACTIVO'),(1110,1406,4,3,1,3,0.40,0.50,0.50,0.50,'7861006761240','7861006761240',0,'2020-02-28 19:24:52',1,'ACTIVO'),(1111,2084,5,6,1,6,0.80,1.00,1.00,1.00,'7861009910560','7861009910560',0,'2020-02-28 19:27:00',1,'ACTIVO'),(1112,2096,4,2,1,2,1.40,1.60,1.60,1.60,'8410971033785','8410971033785',0,'2020-02-28 19:27:01',1,'ACTIVO'),(1113,2094,4,5,1,5,1.40,1.60,1.60,1.60,'8410971031866','8410971031866',0,'2020-02-28 19:28:21',1,'ACTIVO'),(1114,2081,5,9,1,9,0.60,0.70,0.70,0.70,'7861106300127','7861106300127',0,'2020-02-28 19:28:37',1,'ACTIVO'),(1115,1412,4,17,1,17,0.40,0.50,0.50,0.50,'7861006748043','7861006748043',0,'2020-02-28 19:28:44',1,'ACTIVO'),(1116,2086,5,3,1,8,0.60,0.75,0.75,0.75,'7861009941021','7861009941021',0,'2020-02-28 19:29:24',1,'ACTIVO'),(1117,1423,4,3,1,3,1.35,1.50,1.50,1.50,'7861006749859','7861006749859',0,'2020-02-28 19:31:46',1,'ACTIVO'),(1118,499,4,1,1,1,1.35,1.50,1.50,1.50,'7861006748135','7861006748135',0,'2020-02-28 19:44:48',1,'ACTIVO'),(1119,507,4,3,1,3,0.50,0.60,0.60,0.60,'7861006743642','7861006743642',0,'2020-02-28 19:46:55',1,'ACTIVO'),(1120,1437,4,5,1,5,0.30,0.40,0.40,0.40,'7861006763138','7861006763138',0,'2020-02-28 19:48:59',1,'ACTIVO'),(1121,1445,4,3,1,3,0.15,0.20,0.20,0.20,'7861124400847','7861124400847',0,'2020-02-28 19:51:28',1,'ACTIVO'),(1122,1444,4,12,1,12,0.15,0.25,0.25,0.25,'7861124402018','7861124402018',0,'2020-02-28 19:52:55',1,'ACTIVO'),(1123,1439,4,4,1,4,0.20,0.25,0.25,0.25,'7861124400663','7861124400663',0,'2020-02-28 19:56:21',1,'ACTIVO'),(1124,1438,4,9,1,9,0.20,0.25,0.25,0.25,'7861124401271','7861124401271',0,'2020-02-28 19:57:38',1,'ACTIVO'),(1125,2102,5,3,1,3,0.80,1.00,1.00,1.00,'7861106300158','7861106300158',0,'2020-02-28 20:01:09',1,'ACTIVO'),(1126,2101,5,5,1,5,0.80,1.00,1.00,1.00,'7861106300042','7861106300042',0,'2020-02-28 20:02:42',1,'ACTIVO'),(1127,2105,7,1,1,1,1.20,1.50,1.50,1.50,'7861009943391','7861009943391',0,'2020-02-28 20:07:46',1,'ACTIVO'),(1128,2106,4,10,1,10,0.70,0.80,0.80,0.80,'7861091157775','7861091157775',0,'2020-02-28 20:12:01',1,'ACTIVO'),(1129,1429,4,9,1,9,0.20,0.25,0.25,0.25,'7861124401929','7861124401929',0,'2020-02-28 20:16:16',1,'ACTIVO'),(1130,2110,7,2,1,2,1.20,1.50,1.50,1.50,'7861000265072','7861000265072',0,'2020-02-28 20:21:52',1,'ACTIVO'),(1131,1906,15,1,1,1,4.00,4.50,4.50,4.50,'722776002735','722776002735',0,'2020-02-28 20:24:25',1,'ACTIVO'),(1132,1845,7,4,1,4,1.80,2.00,2.00,2.00,'7861006781446','7861006781446',0,'2020-02-28 20:27:45',1,'ACTIVO'),(1133,1904,7,13,1,13,0.60,0.75,0.75,0.75,'00722776002346','00722776002346',0,'2020-02-28 20:28:12',1,'ACTIVO'),(1134,633,2,6,6,6,0.50,0.50,0.50,0.50,'7862109430705','7862109430705',0,'2020-02-28 20:31:07',1,'ACTIVO'),(1135,2113,7,2,1,2,2.00,2.20,2.20,2.20,'7861006722326','7861006722326',0,'2020-02-28 20:31:54',1,'ACTIVO'),(1136,2114,15,2,1,2,2.00,2.20,2.20,2.20,'722776000175','722776000175',0,'2020-02-28 20:32:42',1,'ACTIVO'),(1137,631,2,1,1,1,0.30,0.30,0.30,0.30,'7862109439029','7862109439029',0,'2020-02-28 20:33:49',1,'ACTIVO'),(1138,621,2,6,6,6,1.00,1.00,1.00,1.00,'7862109432693','7862109432693',0,'2020-02-28 20:35:28',1,'ACTIVO'),(1139,619,2,1,1,1,0.50,0.50,0.50,0.50,'7862109438473','7862109438473',0,'2020-02-28 20:36:24',1,'ACTIVO'),(1140,614,2,17,17,17,0.50,0.50,0.50,0.50,'7862109438480','7862109438480',0,'2020-02-28 20:37:49',1,'ACTIVO'),(1141,639,2,1,1,1,2.50,2.50,2.50,2.50,'7862109430385','7862109430385',0,'2020-02-28 20:38:51',1,'ACTIVO'),(1142,611,2,1,1,1,0.50,0.50,0.50,0.50,'7862113551458','7862113551458',0,'2020-02-28 20:40:38',1,'ACTIVO'),(1143,2118,7,1,1,1,3.20,3.40,3.40,3.40,'7702133008252','7702133008252',0,'2020-02-28 20:44:12',1,'ACTIVO'),(1144,1715,7,1,1,1,3.00,3.25,3.25,3.25,'7622210854827','7622210854827',0,'2020-02-28 20:45:42',1,'ACTIVO'),(1145,1720,7,2,1,2,3.00,3.25,3.25,3.25,'7702133008276','7702133008276',0,'2020-02-28 20:49:13',1,'ACTIVO'),(1146,2122,2,9,9,9,0.50,0.50,0.50,0.50,'7862109438459','7862109438459',0,'2020-02-28 20:50:03',1,'ACTIVO'),(1147,1716,7,1,1,1,3.00,3.25,3.25,3.25,'7702133008290','7702133008290',0,'2020-02-28 20:51:10',1,'ACTIVO'),(1148,1719,7,2,1,2,3.00,3.25,3.25,3.25,'7702133008399','7702133008399',0,'2020-02-28 20:53:20',1,'ACTIVO'),(1149,1717,7,1,1,1,3.00,3.25,3.25,3.25,'7622210855015','7622210855015',0,'2020-02-28 20:56:14',1,'ACTIVO'),(1150,1727,7,2,1,2,2.00,2.15,2.15,2.15,'7702133008412','7702133008412',0,'2020-02-28 21:02:28',1,'ACTIVO'),(1151,1725,7,3,1,3,2.00,2.15,2.15,2.15,'7702133008450','7702133008450',0,'2020-02-28 21:03:56',1,'ACTIVO'),(1152,1726,7,2,1,2,2.00,2.15,2.15,2.15,'7702133008436','7702133008436',0,'2020-02-28 21:05:34',1,'ACTIVO'),(1153,1724,7,2,1,2,2.00,2.15,2.15,2.15,'7702133008474','7702133008474',0,'2020-02-28 21:07:24',1,'ACTIVO'),(1154,1736,7,5,1,5,1.50,1.75,1.75,1.75,'7702054088340','7702054088340',0,'2020-02-28 21:09:01',1,'ACTIVO'),(1155,2130,2,6,6,1,1.00,1.00,1.00,1.00,'7862109439753','7862109439753',0,'2020-02-28 21:10:07',1,'ACTIVO'),(1156,2119,5,9,1,9,1.80,2.00,2.00,2.00,'7862117870067','7862117870067',0,'2020-02-28 21:10:34',1,'ACTIVO'),(1157,2119,5,7,1,7,2.00,2.50,2.50,2.50,'7861000251754','7861000251754',0,'2020-02-28 21:12:35',1,'ACTIVO'),(1158,635,2,7,7,8,0.50,0.50,0.50,0.50,'7862109438466','7862109438466',0,'2020-02-28 21:12:36',1,'ACTIVO'),(1159,2033,5,1,1,1,4.00,5.00,5.00,5.00,'7702521104740','7702521104740',0,'2020-02-28 21:14:39',1,'ACTIVO'),(1160,1743,7,3,1,3,1.00,1.20,1.20,1.20,'7702133008610','7702133008610',0,'2020-02-28 21:15:51',1,'ACTIVO'),(1161,2128,24,1,1,1,3.20,3.70,3.70,3.70,'7861021201837','7861021201837',0,'2020-02-28 21:17:13',1,'ACTIVO'),(1162,1744,7,5,1,5,0.50,0.70,0.70,0.70,'7702133008597','7702133008597',0,'2020-02-28 21:17:18',1,'ACTIVO'),(1163,1740,7,7,1,7,1.50,1.65,1.65,1.65,'7702054091883','7702054091883',0,'2020-02-28 21:18:45',1,'ACTIVO'),(1164,2128,24,1,1,1,3.25,3.75,3.75,3.75,'7861021201837','7861021201837',1,'2020-02-28 21:21:23',1,'ACTIVO'),(1165,2138,2,4,1,4,3.00,0.00,0.00,3.00,'7862113550154','7862113550154',0,'2020-02-28 21:23:21',1,'ACTIVO'),(1166,2126,24,1,1,1,3.20,3.50,3.50,3.50,'7861021201820','7861021201820',0,'2020-02-28 21:25:42',1,'ACTIVO'),(1167,605,2,11,1,11,0.30,0.00,0.30,0.00,'7861074900619','7861074900619',0,'2020-02-28 21:26:10',1,'ACTIVO'),(1168,637,2,10,1,10,1.00,0.00,0.00,1.00,'7862109432358','7862109432358',0,'2020-02-28 21:27:35',1,'ACTIVO'),(1169,2015,7,4,1,4,4.00,5.00,5.00,5.00,'7702521104795','7702521104795',0,'2020-02-28 21:28:03',1,'ACTIVO'),(1170,195,2,4,1,4,0.50,0.00,0.00,0.50,'759494998309','759494998309',0,'2020-02-28 21:29:27',1,'ACTIVO'),(1171,1633,7,7,1,7,0.55,0.65,0.65,0.65,'7622300134051','7622300134051',0,'2020-02-28 21:33:05',1,'ACTIVO'),(1172,2141,7,3,1,3,1.30,1.50,1.50,1.50,'7861006723620','7861006723620',0,'2020-02-28 21:33:48',1,'ACTIVO'),(1173,1636,7,6,1,6,0.55,0.65,0.65,0.65,'7622300134112','7622300134112',0,'2020-02-28 21:34:16',1,'ACTIVO'),(1174,2121,24,3,1,3,3.50,4.00,4.00,4.00,'7861000213127','7861000213127',0,'2020-02-28 21:36:40',1,'ACTIVO'),(1175,1643,7,10,1,10,0.55,0.65,0.65,0.65,'7622300134037','7622300134037',0,'2020-02-28 21:37:04',1,'ACTIVO'),(1176,2124,20,54,1,54,0.10,0.15,0.15,0.15,'7759826006279','7759826006279',0,'2020-02-28 21:38:54',1,'ACTIVO'),(1177,2131,20,21,1,21,0.30,0.40,0.40,0.40,'7861000266987','7861000266987',0,'2020-02-28 21:40:18',1,'ACTIVO'),(1178,1637,7,6,1,6,0.55,0.65,0.65,0.65,'7622300134075','7622300134075',0,'2020-02-28 21:40:58',1,'ACTIVO'),(1179,2142,2,5,1,5,0.50,0.00,0.00,0.50,'759494998354','759494998354',0,'2020-02-28 21:41:46',1,'ACTIVO'),(1180,1635,7,9,1,9,0.55,0.65,0.65,0.65,'7622300134044','7622300134044',0,'2020-02-28 21:42:23',1,'ACTIVO'),(1181,2133,5,2,1,2,0.80,1.00,1.00,1.00,'7862124040255','7862124040255',0,'2020-02-28 21:42:24',1,'ACTIVO'),(1182,1644,7,12,1,12,0.55,0.65,0.65,0.65,'7622300134082','7622300134082',0,'2020-02-28 21:43:27',1,'ACTIVO'),(1183,1645,7,8,1,8,0.55,0.65,0.65,0.65,'7622210968173','7622210968173',0,'2020-02-28 21:44:45',1,'ACTIVO'),(1184,2147,2,11,11,11,0.30,0.30,0.30,0.30,'7862113550468','7862113550468',0,'2020-02-28 21:50:17',1,'ACTIVO'),(1185,623,2,1,1,1,2.50,2.50,2.50,2.50,'7862109439616','7862109439616',0,'2020-02-28 21:51:16',1,'ACTIVO'),(1186,607,2,6,6,6,1.00,1.00,1.00,1.00,'7861074900732','7861074900732',0,'2020-02-28 21:53:40',1,'ACTIVO'),(1187,1752,13,14,1,14,0.80,1.00,1.00,1.00,'7622300722197','7622300722197',0,'2020-02-28 21:54:23',1,'ACTIVO'),(1188,192,2,6,6,6,1.00,1.00,1.00,1.00,'759494999481','759494999481',0,'2020-02-28 21:56:12',1,'ACTIVO'),(1189,1751,13,8,1,8,1.25,1.50,1.50,1.50,'7622210693501','7622210693501',0,'2020-02-28 21:58:17',1,'ACTIVO'),(1190,2149,2,8,4,8,1.50,1.60,1.60,1.60,'759494003935','759494003935',0,'2020-02-28 21:59:25',1,'ACTIVO'),(1191,1753,5,8,1,8,0.35,0.45,0.45,0.45,'7622300124526','7622300124526',0,'2020-02-28 22:00:58',1,'ACTIVO'),(1192,1767,13,16,1,16,0.30,0.40,0.40,0.40,'7622300737719','7622300737719',0,'2020-02-28 22:04:28',1,'ACTIVO'),(1193,2152,2,7,7,7,0.75,0.75,0.75,0.75,'7862109439852','7862109439852',0,'2020-02-28 22:07:42',1,'ACTIVO'),(1194,2153,2,10,10,10,0.75,0.75,0.75,0.75,'7862109439845','7862109439845',0,'2020-02-28 22:08:25',1,'ACTIVO'),(1195,2157,2,3,3,3,1.00,1.00,1.00,1.00,'7862109430958','7862109430958',0,'2020-02-28 22:10:47',1,'ACTIVO'),(1196,1722,7,1,1,1,3.00,3.25,3.25,3.25,'7702133008337','7702133008337',0,'2020-02-28 22:11:04',1,'ACTIVO'),(1197,188,2,7,7,7,0.50,0.50,0.50,0.50,'7862109431634','7862109431634',0,'2020-02-28 22:12:33',1,'ACTIVO'),(1198,197,2,3,1,3,1.00,1.00,1.00,1.00,'759494005755','759494005755',0,'2020-02-28 22:14:27',1,'ACTIVO'),(1199,2159,7,9,1,9,0.40,0.50,0.50,0.50,'7861006722128','7861006722128',0,'2020-02-28 22:16:10',1,'ACTIVO'),(1200,2155,7,3,1,3,0.40,0.50,0.50,0.50,'78600553','78600553',0,'2020-02-28 22:18:12',1,'ACTIVO'),(1201,2160,2,1,1,1,0.50,0.50,0.50,0.50,'759494998439','759494998439',0,'2020-02-28 22:18:48',1,'ACTIVO'),(1202,2158,7,6,1,6,0.55,0.65,0.65,0.65,'78600560','78600560',0,'2020-02-28 22:19:09',1,'ACTIVO'),(1203,2151,7,12,1,12,0.60,0.70,0.70,0.70,'7861006716110','7861006716110',0,'2020-02-28 22:20:51',1,'ACTIVO'),(1204,2150,7,7,1,7,0.75,0.85,0.85,0.85,'78600515','78600515',0,'2020-02-28 22:21:51',1,'ACTIVO'),(1205,2156,7,4,1,4,0.55,0.65,0.65,0.65,'78600508','78600508',0,'2020-02-28 22:22:55',1,'ACTIVO'),(1206,2162,2,14,14,14,0.25,0.25,0.25,0.25,'759494099747','759494099747',0,'2020-02-28 22:23:13',1,'ACTIVO'),(1207,2154,7,6,1,6,0.75,0.85,0.85,0.85,'78600522','78600522',0,'2020-02-28 22:24:25',1,'ACTIVO'),(1208,2161,7,2,1,2,2.00,2.20,2.20,2.20,'7861006722326','7861006722326',0,'2020-02-28 22:25:50',1,'ACTIVO'),(1209,2163,2,11,11,11,0.60,0.60,0.60,0.60,'044695002437','044695002437',0,'2020-02-28 22:28:07',1,'ACTIVO'),(1210,2167,2,6,6,6,0.25,0.25,0.25,0.25,'7411204802353','7411204802353',0,'2020-02-28 22:33:10',1,'ACTIVO'),(1211,2164,5,3,1,3,2.50,3.00,3.00,3.00,'7862117870166','7862117870166',0,'2020-02-28 22:34:33',1,'ACTIVO'),(1212,2168,7,2,1,2,2.50,3.00,3.00,3.00,'067031109096','067031109096',0,'2020-02-28 22:35:14',1,'ACTIVO'),(1213,171,2,10,10,10,0.80,1.00,1.00,1.00,'7861074900022','7861074900022',0,'2020-02-28 22:35:40',1,'ACTIVO'),(1214,2166,5,2,1,2,1.80,2.00,2.00,2.00,'7861026005324','7861026005324',0,'2020-02-28 22:36:28',1,'ACTIVO'),(1215,2165,5,1,1,1,1.00,1.30,1.30,1.30,'7861026005355','7861026005355',0,'2020-02-28 22:37:21',1,'ACTIVO'),(1216,2169,2,12,12,12,0.40,0.40,0.40,0.40,'7861075201548','7861075201548',0,'2020-02-28 22:38:20',1,'ACTIVO'),(1217,199,2,13,0,13,1.00,1.00,1.00,1.00,'7862106704083','7862106704083',0,'2020-02-28 22:39:58',1,'ACTIVO'),(1218,965,4,10,10,10,0.85,0.85,0.85,0.85,'7861025803952','7861025803952',0,'2020-02-28 22:45:57',1,'ACTIVO'),(1219,963,4,17,17,17,0.50,0.50,0.50,0.50,'7861025804867','7861025804867',0,'2020-02-28 22:47:07',1,'ACTIVO'),(1220,1124,4,11,11,11,0.45,0.55,0.55,0.55,'7861012510191','7861012510191',0,'2020-02-28 22:54:08',1,'ACTIVO'),(1221,2170,4,1,1,1,0.70,0.80,0.80,0.80,'7861012500246','7861012500246',0,'2020-02-28 22:55:57',1,'ACTIVO'),(1222,1125,4,7,7,7,0.70,0.80,0.80,0.80,'7861012500239','7861012500239',0,'2020-02-28 22:57:55',1,'ACTIVO'),(1223,2173,4,8,8,8,0.70,0.85,0.85,0.85,'7861012509782','7861012509782',0,'2020-02-28 23:10:09',1,'ACTIVO'),(1224,2177,4,3,3,3,0.70,0.85,0.85,0.85,'7861012509805','7861012509805',0,'2020-02-28 23:11:51',1,'ACTIVO'),(1225,2178,4,2,2,2,0.75,0.85,0.85,0.85,'7861012509775','7861012509775',0,'2020-02-28 23:13:29',1,'ACTIVO'),(1226,2179,4,1,1,1,0.75,0.85,0.85,0.85,'7861012510047','7861012510047',0,'2020-02-28 23:15:21',1,'ACTIVO'),(1227,2180,4,2,2,2,0.75,0.85,0.85,0.85,'7861012509768','7861012509768',0,'2020-02-28 23:17:21',1,'ACTIVO'),(1228,2181,4,2,2,2,0.75,0.85,0.85,0.85,'7861012512041','7861012512041',0,'2020-02-28 23:18:43',1,'ACTIVO'),(1229,2185,4,4,4,4,1.15,1.35,1.35,1.35,'7861012508686','7861012508686',0,'2020-02-28 23:20:42',1,'ACTIVO'),(1230,2188,4,2,2,2,0.70,0.80,0.80,0.80,'7861012500277','7861012500277',0,'2020-02-28 23:23:14',1,'ACTIVO'),(1231,2190,9,7,7,7,0.70,0.80,0.80,0.80,'7861012511662','7861012511662',0,'2020-02-28 23:27:18',1,'ACTIVO'),(1232,2191,4,7,7,7,0.70,0.80,0.80,0.80,'7861012511587','7861012511587',0,'2020-02-28 23:28:48',1,'ACTIVO'),(1233,1089,2,13,13,13,0.40,0.55,0.55,0.55,'7861012510238','7861012510238',0,'2020-02-28 23:30:12',1,'ACTIVO'),(1234,2192,2,10,10,10,0.40,0.55,0.55,0.55,'7861012510986','7861012510986',0,'2020-02-28 23:32:41',1,'ACTIVO'),(1235,2193,2,11,11,11,0.70,0.80,0.80,0.80,'7861012500956','7861012500956',0,'2020-02-28 23:33:54',1,'ACTIVO'),(1236,2194,7,14,14,14,0.70,0.80,0.80,0.80,'7861012500406','7861012500406',0,'2020-02-28 23:35:16',1,'ACTIVO'),(1237,2195,7,4,4,4,0.40,0.50,0.50,0.50,'7861012501687','7861012501687',0,'2020-02-28 23:38:12',1,'ACTIVO'),(1238,2196,2,4,4,4,0.40,0.50,0.50,0.50,'7861012501694','7861012501694',0,'2020-02-28 23:39:35',1,'ACTIVO'),(1239,2197,4,3,3,3,0.40,0.50,0.50,0.50,'7861012501700','7861012501700',0,'2020-02-28 23:45:21',1,'ACTIVO'),(1240,2198,4,4,4,4,0.65,0.75,0.75,0.75,'7861012512300','7861012512300',0,'2020-02-28 23:47:11',1,'ACTIVO'),(1241,2199,4,4,4,4,0.65,0.75,0.75,0.75,'7861012511747','7861012511747',0,'2020-02-28 23:48:36',1,'ACTIVO'),(1242,2200,4,2,2,2,0.60,0.75,0.75,0.75,'7861012505456','7861012505456',0,'2020-02-28 23:50:07',1,'ACTIVO'),(1243,2201,4,7,7,7,0.65,0.75,0.75,0.75,'7861012505449','7861012505449',0,'2020-02-28 23:51:31',1,'ACTIVO'),(1244,2202,4,4,4,4,0.65,0.75,0.75,0.75,'7861012505463','7861012505463',0,'2020-02-28 23:53:18',1,'ACTIVO'),(1245,2203,9,3,3,3,0.85,1.00,1.00,1.00,'7861012510870','7861012510870',0,'2020-02-28 23:55:58',1,'ACTIVO'),(1246,2204,9,3,3,3,1.10,1.25,1.25,1.25,'7861012511167','7861012511167',0,'2020-02-28 23:57:53',1,'ACTIVO'),(1247,2205,9,3,3,3,1.80,2.00,2.00,2.00,'7861012511679','7861012511679',0,'2020-02-29 00:00:50',1,'ACTIVO'),(1248,2189,4,6,1,6,0.85,0.00,0.00,0.85,'7861025806014','7861025806014',0,'2020-02-29 00:01:53',1,'ACTIVO'),(1249,2206,4,11,11,11,0.40,0.50,0.50,0.50,'7861012512171','7861012512171',0,'2020-02-29 00:03:06',1,'ACTIVO'),(1250,1771,7,9,1,9,0.25,0.35,0.35,0.35,'7622300117207','7622300117207',0,'2020-02-29 00:04:12',1,'ACTIVO'),(1251,2207,4,2,2,2,0.40,0.50,0.50,0.50,'7861012512133','7861012512133',0,'2020-02-29 00:05:44',1,'ACTIVO'),(1252,2209,4,12,12,12,0.40,0.50,0.50,0.50,'7861012512119','7861012512119',0,'2020-02-29 00:07:49',1,'ACTIVO'),(1253,2208,4,2,2,2,0.40,0.50,0.50,0.50,'7861012512195','7861012512195',0,'2020-02-29 00:08:21',1,'ACTIVO'),(1254,1769,7,5,1,5,0.25,0.35,0.35,0.35,'7622300117245','7622300117245',0,'2020-02-29 00:09:53',1,'ACTIVO'),(1255,2210,4,3,3,3,2.20,2.50,2.50,2.50,'7861012500338','7861012500338',0,'2020-02-29 00:10:26',1,'ACTIVO'),(1256,2184,4,5,1,5,0.85,0.00,0.00,0.85,'7861025806021','7861025806021',0,'2020-02-29 00:11:52',1,'ACTIVO'),(1257,2211,4,11,11,11,0.40,0.50,0.50,0.50,'100001159','100001159',0,'2020-02-29 00:13:09',1,'ACTIVO'),(1258,2212,24,2,2,2,1.60,1.75,1.75,1.75,'7861012511402','7861012511402',0,'2020-02-29 00:15:07',1,'ACTIVO'),(1259,2213,24,1,1,1,1.60,1.75,1.75,1.75,'7861012511419','7861012511419',0,'2020-02-29 00:15:59',1,'ACTIVO'),(1260,2187,4,3,1,3,0.85,0.00,0.00,0.85,'7861025810288','7861025810288',0,'2020-02-29 00:16:54',1,'ACTIVO'),(1261,2182,4,6,1,6,0.50,0.00,0.00,0.50,'7861025805963','7861025805963',0,'2020-02-29 00:17:07',1,'ACTIVO'),(1262,2214,9,1,1,1,2.10,2.35,2.35,2.35,'7861012510566','7861012510566',0,'2020-02-29 00:18:38',1,'ACTIVO'),(1263,2215,2,2,2,2,3.00,3.15,3.15,3.15,'7861012511266','7861012511266',0,'2020-02-29 00:21:12',1,'ACTIVO'),(1264,1774,7,13,1,13,0.20,0.25,0.25,0.25,'7622210873002','7622210873002',0,'2020-02-29 00:22:34',1,'ACTIVO'),(1265,2217,2,1,1,1,3.00,3.15,3.15,3.15,'7861012511785','7861012511785',0,'2020-02-29 00:23:54',1,'ACTIVO'),(1266,2183,4,6,1,6,0.50,0.00,0.00,0.50,'7861025805970','7861025805970',0,'2020-02-29 00:24:26',1,'ACTIVO'),(1267,2218,2,1,1,1,4.80,5.10,5.10,5.10,'7861012511815','7861012511815',0,'2020-02-29 00:26:28',1,'ACTIVO'),(1268,2219,2,1,1,1,3.00,3.15,3.15,3.15,'7861012505494','7861012505494',0,'2020-02-29 00:27:20',1,'ACTIVO'),(1269,2175,4,6,1,6,0.75,0.00,0.00,0.75,'7861025805642','7861025805642',0,'2020-02-29 00:27:58',1,'ACTIVO'),(1270,2176,4,10,1,10,0.75,0.00,0.00,0.75,'7861025804928','7861025804928',0,'2020-02-29 00:28:40',1,'ACTIVO'),(1271,1778,7,15,1,15,0.20,0.25,0.25,0.25,'7622300258061','7622300258061',0,'2020-02-29 00:32:15',1,'ACTIVO'),(1272,1779,7,21,1,21,0.20,0.25,0.25,0.25,'7590011205158','7590011205158',0,'2020-02-29 00:34:09',1,'ACTIVO'),(1273,2171,4,3,1,3,0.75,0.00,0.00,0.75,'7861025804935','7861025804935',0,'2020-02-29 07:19:23',1,'ACTIVO'),(1274,2174,4,15,0,15,0.75,0.00,0.00,0.75,'7861025804973','7861025804973',0,'2020-02-29 07:20:47',1,'ACTIVO'),(1275,2172,4,5,1,5,0.75,0.00,0.00,0.75,'7861025804980','7861025804980',0,'2020-02-29 07:22:10',1,'ACTIVO'),(1276,1855,7,7,7,7,1.30,1.50,1.50,1.50,'7861091158048','7861091158048',0,'2020-02-29 07:28:47',1,'ACTIVO'),(1277,2220,4,3,1,3,2.40,0.00,0.00,2.40,'7861031501156','7861031501156',0,'2020-02-29 07:32:43',1,'ACTIVO'),(1278,2222,7,5,5,5,1.30,1.50,1.50,1.50,'7861091158031','7861091158031',0,'2020-02-29 07:33:33',1,'ACTIVO'),(1279,2221,4,11,1,11,1.50,0.00,0.00,1.50,'7861031501361','7861031501361',0,'2020-02-29 07:34:09',1,'ACTIVO'),(1280,2224,7,4,4,4,1.30,1.50,1.50,1.50,'7861091158062','7861091158062',0,'2020-02-29 07:35:58',1,'ACTIVO'),(1281,2225,7,3,3,3,1.30,1.50,1.50,1.50,'7861091158017','7861091158017',0,'2020-02-29 07:38:10',1,'ACTIVO'),(1282,2227,7,5,5,5,1.30,1.50,1.50,1.50,'7861091158055','7861091158055',0,'2020-02-29 07:41:49',1,'ACTIVO'),(1283,2228,7,7,7,7,1.30,1.50,1.50,1.50,'7861091158024','7861091158024',0,'2020-02-29 07:42:21',1,'ACTIVO'),(1284,2226,7,6,6,6,0.80,1.00,1.00,1.00,'7861091158345','7861091158345',0,'2020-02-29 07:44:11',1,'ACTIVO'),(1285,2229,7,10,10,10,0.80,1.00,1.00,1.00,'7861091158314','7861091158314',0,'2020-02-29 07:44:59',1,'ACTIVO'),(1286,2230,7,7,7,7,0.80,1.00,1.00,1.00,'7861091158307','7861091158307',0,'2020-02-29 07:46:00',1,'ACTIVO'),(1287,2231,7,2,2,2,0.80,1.00,1.00,1.00,'7861091158352','7861091158352',0,'2020-02-29 07:46:45',1,'ACTIVO'),(1288,2232,7,5,5,5,0.80,1.00,1.00,1.00,'7861091158321','7861091158321',0,'2020-02-29 07:47:45',1,'ACTIVO'),(1289,2233,7,8,8,8,0.80,1.00,1.00,1.00,'7861091158338','7861091158338',0,'2020-02-29 07:49:20',1,'ACTIVO'),(1290,2234,7,8,8,8,0.90,1.10,1.10,1.10,'7861091158109','7861091158109',0,'2020-02-29 07:51:22',1,'ACTIVO'),(1291,2235,7,22,22,22,0.40,0.50,0.50,0.50,'7862117320081','7862117320081',0,'2020-02-29 08:00:14',1,'ACTIVO'),(1292,2238,7,46,46,46,0.40,0.50,0.50,0.50,'7862117320203','7862117320203',0,'2020-02-29 08:02:21',1,'ACTIVO'),(1293,2237,7,7,7,7,0.40,0.50,0.50,0.50,'7862117320265','7862117320265',0,'2020-02-29 08:02:54',1,'ACTIVO'),(1294,2236,7,38,38,38,0.40,0.50,0.50,0.50,'7862117320142','7862117320142',0,'2020-02-29 08:03:50',1,'ACTIVO'),(1295,2241,7,9,9,9,0.40,0.50,0.50,0.50,'7862117320326','7862117320326',0,'2020-02-29 08:04:44',1,'ACTIVO'),(1296,2243,5,3,1,3,1.80,0.00,0.00,2.00,'7861091140425','7861091140425',0,'2020-02-29 08:11:04',1,'ACTIVO'),(1297,2244,7,2,1,2,3.50,3.65,3.65,3.65,'7861031523134','7861031523134',0,'2020-02-29 08:11:53',1,'ACTIVO'),(1298,2242,7,5,1,5,3.50,3.65,3.65,3.65,'7861031523110','7861031523110',0,'2020-02-29 08:12:53',1,'ACTIVO'),(1299,2240,5,3,1,3,1.80,0.00,0.00,2.00,'7861091199898','7861091199898',0,'2020-02-29 08:13:20',1,'ACTIVO'),(1300,2256,4,5,1,5,0.90,1.00,1.00,1.00,'7861025810264','7861025810264',0,'2020-02-29 08:24:40',1,'ACTIVO'),(1301,2245,7,14,14,14,0.50,0.60,0.60,0.60,'100001166','100001166',0,'2020-02-29 08:25:05',1,'ACTIVO'),(1302,2247,7,16,16,16,0.20,0.30,0.30,0.30,'100001167','100001167',0,'2020-02-29 08:26:00',1,'ACTIVO'),(1303,2252,7,4,1,1,0.50,0.60,0.60,0.60,'100001164','100001164',0,'2020-02-29 08:26:58',1,'ACTIVO'),(1304,2253,7,14,14,14,0.20,0.30,0.30,0.30,'100001165','100001165',0,'2020-02-29 08:27:58',1,'ACTIVO'),(1305,2257,7,7,7,7,0.20,0.30,0.30,0.30,'100001161','100001161',0,'2020-02-29 08:30:04',1,'ACTIVO'),(1306,2257,7,13,13,13,0.50,0.60,0.60,0.60,'100001160','100001160',0,'2020-02-29 08:31:16',1,'ACTIVO'),(1307,2255,7,20,20,20,0.50,0.60,0.60,0.60,'100001168','100001168',0,'2020-02-29 08:32:44',1,'ACTIVO'),(1308,2254,7,24,24,24,0.20,0.30,0.30,0.30,'100001169','100001169',0,'2020-02-29 08:33:19',1,'ACTIVO'),(1309,2250,7,20,20,20,0.50,0.60,0.60,0.60,'100001162','100001162',0,'2020-02-29 08:34:01',1,'ACTIVO'),(1310,2248,7,12,12,12,0.20,0.30,0.30,0.30,'100001163','100001163',0,'2020-02-29 08:34:52',1,'ACTIVO'),(1311,2263,7,12,1,12,0.25,0.00,0.00,0.25,'7702025103119','7702025103119',0,'2020-02-29 08:35:00',1,'ACTIVO'),(1312,2264,7,9,1,9,0.25,0.00,0.00,0.25,'7702025103133','7702025103133',0,'2020-02-29 08:35:44',1,'ACTIVO'),(1313,2262,7,30,1,30,0.25,0.00,0.00,0.25,'7702025142446','7702025142446',0,'2020-02-29 08:37:34',1,'ACTIVO'),(1314,2267,7,6,6,6,0.80,1.00,1.00,1.00,'7861092155107','7861092155107',0,'2020-02-29 08:39:50',1,'ACTIVO'),(1315,2266,4,7,1,7,0.85,1.05,1.05,1.05,'7861025805765','7861025805765',0,'2020-02-29 08:40:48',1,'ACTIVO'),(1316,2269,7,5,5,5,2.00,2.40,2.40,2.40,'7861092155114','7861092155114',0,'2020-02-29 08:40:52',1,'ACTIVO'),(1317,2272,7,1,1,1,5.00,5.70,5.70,5.70,'7702001120376','7702001120376',0,'2020-02-29 08:42:19',1,'ACTIVO'),(1318,2273,7,1,1,1,0.90,1.10,1.10,1.10,'7702001062225','7702001062225',0,'2020-02-29 08:45:06',1,'ACTIVO'),(1319,1083,7,2,2,2,2.00,2.50,2.50,2.50,'7861092182615','7861092182615',0,'2020-02-29 08:46:57',1,'ACTIVO'),(1320,1037,4,4,4,4,1.00,1.25,1.25,1.25,'7702001055050','7702001055050',0,'2020-02-29 08:47:59',1,'ACTIVO'),(1321,2265,4,2,1,2,0.40,0.50,0.50,0.50,'7861025804904','7861025804904',0,'2020-02-29 08:48:29',1,'ACTIVO'),(1322,1079,4,3,3,3,2.00,2.40,2.40,2.40,'7702001113217','7702001113217',0,'2020-02-29 08:49:45',1,'ACTIVO'),(1323,1059,4,2,2,2,0.40,0.50,0.50,0.50,'7702001113224','7702001113224',0,'2020-02-29 08:50:44',1,'ACTIVO'),(1324,2270,7,2,1,2,2.30,2.50,2.50,2.50,'7861091194961','7861091194961',0,'2020-02-29 08:52:48',1,'ACTIVO'),(1325,2278,7,4,4,4,4.80,5.10,5.10,5.10,'7861092157316','7861092157316',0,'2020-02-29 08:52:50',1,'ACTIVO'),(1326,2270,7,1,1,1,2.30,2.50,2.50,2.50,'7861091194961','7861091194961',1,'2020-02-29 08:53:06',1,'ACTIVO'),(1327,2268,7,22,1,22,1.30,1.40,1.40,1.40,'7861091195234','7861091195234',0,'2020-02-29 08:54:00',1,'ACTIVO'),(1328,2277,5,1,1,1,0.50,0.00,0.00,0.50,'7622210633842','7622210633842',0,'2020-02-29 08:54:09',1,'ACTIVO'),(1329,1073,7,5,5,5,0.90,1.15,1.15,1.15,'7702001106653','7702001106653',0,'2020-02-29 08:54:41',1,'ACTIVO'),(1330,1066,7,7,7,7,0.50,0.60,0.60,0.60,'7702001101276','7702001101276',0,'2020-02-29 08:55:34',1,'ACTIVO'),(1331,1081,7,3,3,3,3.50,3.90,3.90,3.90,'7861092158184','7861092158184',0,'2020-02-29 08:56:26',1,'ACTIVO'),(1332,2279,7,3,3,3,2.00,2.30,2.30,2.30,'7861092157293','7861092157293',0,'2020-02-29 08:58:43',1,'ACTIVO'),(1333,2280,7,48,1,48,2.25,0.00,0.00,2.25,'7702025142439','7702025142439',0,'2020-02-29 08:59:49',1,'ACTIVO'),(1334,1080,7,3,3,3,2.00,2.40,2.40,2.40,'7702001120352','7702001120352',0,'2020-02-29 09:00:16',1,'ACTIVO'),(1335,102,4,3,3,3,2.00,2.40,2.40,2.40,'7702001113231','7702001113231',0,'2020-02-29 09:01:59',1,'ACTIVO'),(1336,1078,4,6,6,6,0.40,0.50,0.50,0.50,'7702001113200','7702001113200',0,'2020-02-29 09:02:53',1,'ACTIVO'),(1337,1898,24,1,1,1,8.00,0.00,0.00,8.00,'7891000076699','7891000076699',0,'2020-02-29 09:11:13',1,'ACTIVO'),(1338,1068,7,1,1,1,3.50,3.75,3.75,3.75,'7861092157309','7861092157309',0,'2020-02-29 09:12:17',1,'ACTIVO'),(1339,1082,4,2,1,2,2.30,0.00,0.00,2.60,'7861092182608','7861092182608',0,'2020-02-29 09:21:30',1,'ACTIVO'),(1340,1086,5,1,1,1,1.15,0.00,0.00,1.30,'7702001106530','7702001106530',0,'2020-02-29 09:23:09',1,'ACTIVO'),(1341,1085,5,1,1,1,1.15,0.00,0.00,1.30,'7702001106547','7702001106547',0,'2020-02-29 09:24:36',1,'ACTIVO'),(1342,1084,5,3,1,3,1.15,0.00,0.00,1.30,'7702001109906','7702001109906',0,'2020-02-29 09:26:03',1,'ACTIVO'),(1343,212,4,12,1,12,1.10,0.00,0.00,1.30,'7750670000758','7750670000758',0,'2020-02-29 09:29:14',1,'ACTIVO'),(1344,2304,9,12,1,12,1.15,0.00,0.00,1.30,'7750670000758','7750670000758',0,'2020-02-29 09:48:28',1,'ACTIVO'),(1345,2302,9,6,1,6,1.15,0.00,0.00,1.30,'7862110540493','7862110540493',0,'2020-02-29 09:49:46',1,'ACTIVO'),(1346,2297,9,2,1,2,1.90,0.00,0.00,2.30,'7861001235814','7861001235814',0,'2020-02-29 09:51:03',1,'ACTIVO'),(1347,2296,9,2,1,2,1.90,0.00,0.00,2.30,'7861001235807','7861001235807',0,'2020-02-29 09:54:57',1,'ACTIVO'),(1348,2309,9,14,1,14,1.90,0.00,0.00,2.30,'7861001235791','7861001235791',0,'2020-02-29 10:00:55',1,'ACTIVO'),(1349,211,9,46,1,46,0.25,0.00,0.00,0.25,'7862110543173','7862110543173',0,'2020-02-29 10:21:21',1,'ACTIVO'),(1350,2285,2,2,1,2,2.85,2.95,2.95,2.95,'7861025804744','7861025804744',0,'2020-02-29 10:22:07',1,'ACTIVO'),(1351,2316,9,17,1,32,0.60,0.00,0.00,0.70,'7861001202212','7861001202212',0,'2020-02-29 10:23:07',1,'ACTIVO'),(1352,2316,9,7,1,7,0.60,0.00,0.00,0.70,'7861001202229','7861001202229',0,'2020-02-29 10:25:33',1,'ACTIVO'),(1353,2315,9,22,1,37,0.60,0.00,0.00,0.70,'7861001202205','7861001202205',0,'2020-02-29 10:26:47',1,'ACTIVO'),(1354,916,5,10,1,10,1.30,1.40,1.40,1.40,'7861031522007','7861031522007',0,'2020-02-29 10:27:04',1,'ACTIVO'),(1355,917,5,7,1,7,2.55,2.65,2.65,2.65,'7861031522106','7861031522106',0,'2020-02-29 10:29:32',1,'ACTIVO'),(1356,2318,9,36,1,36,0.30,0.00,0.00,0.40,'7750670001052','7750670001052',0,'2020-02-29 10:30:14',1,'ACTIVO'),(1357,1087,5,10,1,10,1.25,1.35,1.35,1.35,'7861092121263','7861092121263',0,'2020-02-29 10:32:36',1,'ACTIVO'),(1358,2274,4,2,1,2,0.80,1.00,1.00,1.00,'7861010905609','7861010905609',0,'2020-02-29 10:54:45',1,'ACTIVO'),(1359,2246,4,2,1,2,0.80,1.00,1.00,1.00,'7861010905579','7861010905579',0,'2020-02-29 10:57:05',1,'ACTIVO'),(1360,2288,2,1,1,1,4.80,5.05,5.05,5.05,'7861025805093','7861025805093',0,'2020-02-29 11:06:01',1,'ACTIVO'),(1361,2275,4,4,1,4,0.80,1.00,1.00,1.00,'7861012404322','7861012404322',0,'2020-02-29 11:06:41',1,'ACTIVO'),(1362,2276,4,1,1,1,0.80,1.25,1.25,1.25,'7861012404339','7861012404339',0,'2020-02-29 11:08:50',1,'ACTIVO'),(1363,2288,2,2,1,2,4.80,5.05,5.05,5.05,'7861025805062','7861025805062',0,'2020-02-29 11:10:01',1,'ACTIVO'),(1364,2293,5,4,1,4,1.10,1.25,1.25,1.25,'7861025806007','7861025806007',0,'2020-02-29 11:12:36',1,'ACTIVO'),(1365,2281,4,4,1,4,0.80,1.00,1.00,1.00,'7861136500047','7861136500047',0,'2020-02-29 11:13:44',1,'ACTIVO'),(1366,2295,5,4,1,4,1.10,1.25,1.25,1.25,'7861025801064','7861025801064',0,'2020-02-29 11:13:54',1,'ACTIVO'),(1367,2286,2,2,1,2,2.80,2.95,2.95,2.95,'7861025804584','7861025804584',0,'2020-02-29 11:15:51',1,'ACTIVO'),(1368,2260,4,15,1,15,0.60,0.80,0.80,0.80,'7861012420018','7861012420018',0,'2020-02-29 11:17:58',1,'ACTIVO'),(1369,49,16,2,1,2,0.50,0.60,0.60,0.60,'7861031540407','7861031540407',0,'2020-02-29 11:20:02',1,'ACTIVO'),(1370,2259,4,7,1,7,0.60,0.80,0.80,0.80,'7861136500023','7861136500023',0,'2020-02-29 11:29:29',1,'ACTIVO'),(1371,2322,9,12,1,12,0.65,0.00,0.00,0.65,'7861001240511','7861001240511',0,'2020-02-29 11:34:15',1,'ACTIVO'),(1372,2271,4,5,1,5,0.80,1.00,1.00,1.00,'7861158700135','7861158700135',0,'2020-02-29 11:38:33',1,'ACTIVO'),(1373,214,9,8,1,8,0.80,0.00,0.00,1.00,'7862109439937','7862109439937',0,'2020-02-29 11:41:25',1,'ACTIVO'),(1374,2324,9,8,1,8,0.45,0.00,0.00,0.55,'7861001211023','7861001211023',0,'2020-02-29 11:43:09',1,'ACTIVO'),(1375,2089,4,15,1,15,0.60,0.80,0.80,0.80,'7861158700647','7861158700647',0,'2020-02-29 11:47:20',1,'ACTIVO'),(1376,2251,4,21,1,21,0.80,1.00,1.00,1.00,'7861146800557','7861146800557',0,'2020-02-29 11:50:29',1,'ACTIVO'),(1377,2261,4,2,1,2,0.40,0.50,0.50,0.50,'7861158700302','7861158700302',0,'2020-02-29 11:52:24',1,'ACTIVO'),(1378,2323,9,11,1,11,0.50,0.00,0.00,0.60,'7862122701615','7862122701615',0,'2020-02-29 11:53:36',1,'ACTIVO'),(1379,2091,5,71,1,71,0.90,0.80,0.80,0.80,'7862123752371','7862123752371',0,'2020-02-29 11:56:26',1,'ACTIVO'),(1380,2334,4,29,1,29,0.80,0.90,0.90,0.90,'7862123752333','7862123752333',0,'2020-02-29 12:06:39',1,'ACTIVO'),(1381,2328,4,13,1,13,0.80,0.00,0.00,1.00,'7862106704137','7862106704137',0,'2020-02-29 12:10:19',1,'ACTIVO'),(1382,2329,4,22,1,22,0.80,0.00,0.00,1.00,'7862106704137','7862106704137',0,'2020-02-29 12:14:45',1,'ACTIVO'),(1383,2283,4,20,1,20,0.80,1.00,1.00,1.00,'7861010902752','7861010902752',0,'2020-02-29 12:17:14',1,'ACTIVO'),(1384,2291,4,20,1,20,0.80,0.90,0.90,0.90,'7861010908303','7861010908303',0,'2020-02-29 12:19:04',1,'ACTIVO'),(1385,2292,4,23,1,23,0.50,0.60,0.60,0.60,'7861010908273','7861010908273',0,'2020-02-29 12:21:05',1,'ACTIVO'),(1386,2310,4,25,1,25,0.30,0.40,0.40,0.40,'7861010902837','7861010902837',0,'2020-02-29 12:23:22',1,'ACTIVO'),(1387,2284,4,20,1,20,0.40,0.50,0.50,0.50,'7861010902776','7861010902776',0,'2020-02-29 12:27:54',1,'ACTIVO'),(1388,2336,2,5,1,5,0.65,0.75,0.75,0.75,'7702001119547','7702001119547',0,'2020-02-29 12:31:38',1,'ACTIVO'),(1389,2333,2,1,1,1,0.65,0.75,0.75,0.75,'7702001150113','7702001150113',0,'2020-02-29 12:33:16',1,'ACTIVO'),(1390,2294,4,10,10,10,0.70,0.80,0.80,0.80,'7861010909225','7861010909225',0,'2020-02-29 12:34:18',1,'ACTIVO'),(1391,1051,2,6,1,6,0.65,0.75,0.75,0.75,'7861092141629','7861092141629',0,'2020-02-29 12:35:39',1,'ACTIVO'),(1392,2341,24,29,1,29,0.40,0.00,0.00,0.50,'7862110540707','7862110540707',0,'2020-02-29 12:38:22',1,'ACTIVO'),(1393,2340,24,6,1,6,0.45,0.45,0.45,0.50,'7862110542718','7862110542718',0,'2020-02-29 12:39:31',1,'ACTIVO'),(1394,2339,24,11,1,11,0.40,0.00,0.00,0.50,'7862110540684','7862110540684',0,'2020-02-29 12:40:48',1,'ACTIVO'),(1395,2298,24,4,1,4,4.48,5.40,5.40,5.40,'80135463','80135463',0,'2020-02-29 12:48:37',1,'ACTIVO'),(1396,2306,24,5,1,5,2.40,2.90,2.90,2.90,'7898024395232','7898024395232',0,'2020-02-29 12:50:47',1,'ACTIVO'),(1397,2143,16,26,26,26,0.20,0.25,0.25,0.25,'7702354943028','7702354943028',0,'2020-02-29 12:51:42',1,'ACTIVO'),(1398,2132,16,40,40,40,0.20,0.25,0.25,0.25,'7500435107815','7500435107815',0,'2020-02-29 12:52:52',1,'ACTIVO'),(1399,2125,16,8,8,8,0.20,0.25,0.25,0.25,'7500435108294','7500435108294',0,'2020-02-29 12:53:54',1,'ACTIVO'),(1400,2139,16,6,6,6,0.20,0.25,0.25,0.25,'7702354943035','7702354943035',0,'2020-02-29 12:55:37',1,'ACTIVO'),(1401,2116,16,7,7,7,0.20,0.25,0.25,0.25,'7500435128124','7500435128124',0,'2020-02-29 12:58:13',1,'ACTIVO'),(1402,2300,4,86,1,86,0.50,0.60,0.60,0.60,'7861010908792','7861010908792',0,'2020-02-29 12:59:22',1,'ACTIVO'),(1403,2144,16,4,4,4,0.20,0.25,0.25,0.25,'7702006204491','7702006204491',0,'2020-02-29 12:59:28',1,'ACTIVO'),(1404,2145,16,54,54,54,0.20,0.25,0.25,0.25,'7500435108324','7500435108324',0,'2020-02-29 13:02:15',1,'ACTIVO'),(1405,2301,4,14,1,14,0.70,0.80,0.80,0.80,'7861010908785','7861010908785',0,'2020-02-29 13:02:36',1,'ACTIVO'),(1406,2144,16,49,49,49,0.20,0.25,0.25,0.25,'7702006204514','7702006204514',0,'2020-02-29 13:03:27',1,'ACTIVO'),(1407,2303,4,24,1,24,0.75,0.85,0.85,0.85,'7861010908778','7861010908778',0,'2020-02-29 13:04:34',1,'ACTIVO'),(1408,2146,16,3,3,3,0.20,0.25,0.25,0.25,'7702006000253','7702006000253',0,'2020-02-29 13:09:05',1,'ACTIVO'),(1409,2305,4,34,1,34,0.90,1.00,1.00,1.00,'7861010908761','7861010908761',0,'2020-02-29 13:09:37',1,'ACTIVO'),(1410,2112,16,6,6,6,0.20,0.25,0.25,0.25,'7702006400480','7702006400480',0,'2020-02-29 13:10:22',1,'ACTIVO'),(1411,2308,4,15,1,15,0.80,1.00,1.00,1.00,'7861010900925','7861010900925',0,'2020-02-29 13:11:29',1,'ACTIVO'),(1412,2129,16,24,24,24,0.20,0.25,0.25,0.25,'27500435128135','27500435128135',0,'2020-02-29 13:12:00',1,'ACTIVO'),(1413,2345,4,16,1,16,0.90,1.00,1.00,1.00,'78602731','78602731',0,'2020-02-29 13:14:32',1,'ACTIVO'),(1414,2140,16,16,16,16,0.20,0.25,0.25,0.25,'7702354943011','7702354943011',0,'2020-02-29 13:16:09',1,'ACTIVO'),(1415,2344,13,84,24,84,0.29,0.35,0.35,0.35,'80050315','8000500125038',0,'2020-02-29 13:18:49',1,'ACTIVO'),(1416,2137,16,64,64,64,0.20,0.25,0.25,0.25,'7702006204507','7702006204507',0,'2020-02-29 13:19:16',1,'ACTIVO'),(1417,2127,16,6,6,6,0.20,0.25,0.25,0.25,'7506339319033','7506339319033',0,'2020-02-29 13:20:08',1,'ACTIVO'),(1418,2148,16,14,14,14,0.20,0.20,0.20,0.20,'7861001300307','7861001300307',0,'2020-02-29 13:22:36',1,'ACTIVO'),(1419,2117,16,15,15,15,0.20,0.25,0.25,0.25,'7500435137324','7500435137324',0,'2020-02-29 13:23:27',1,'ACTIVO'),(1420,2346,4,39,12,39,0.32,0.40,0.40,0.40,'78600843','7861002942001',0,'2020-02-29 13:23:51',1,'ACTIVO'),(1421,2115,16,24,24,24,0.20,0.25,0.25,0.25,'7500435141543','7500435141543',0,'2020-02-29 13:24:27',1,'ACTIVO'),(1422,2347,4,4,4,4,0.60,0.80,0.80,0.80,'7861012411894','7861012411894',0,'2020-02-29 13:25:28',1,'ACTIVO'),(1423,2109,16,6,6,18,0.20,0.25,0.25,0.25,'7702354944933','7702354944933',0,'2020-02-29 13:26:26',1,'ACTIVO'),(1424,2108,16,15,15,15,0.20,0.25,0.25,0.25,'7702354943134','7702354943134',0,'2020-02-29 13:27:03',1,'ACTIVO'),(1425,2317,4,12,12,12,2.00,2.20,2.20,2.20,'7861010900284','7861010900284',0,'2020-02-29 13:28:09',1,'ACTIVO'),(1426,2107,16,19,19,19,0.40,0.50,0.50,0.50,'7702354946197','7702354946197',0,'2020-02-29 13:28:26',1,'ACTIVO'),(1427,2342,5,3,1,3,0.50,0.65,0.65,0.65,'7862119393182','7862119393182',0,'2020-02-29 13:29:03',1,'ACTIVO'),(1428,2111,16,42,42,42,0.40,0.50,0.50,0.50,'7702027436987','7702027436987',0,'2020-02-29 13:30:01',1,'ACTIVO'),(1429,2319,4,31,31,31,2.00,2.20,2.20,2.20,'7861010900314','7861010900314',0,'2020-02-29 13:32:47',1,'ACTIVO'),(1430,2313,4,32,32,32,1.00,1.20,1.20,1.20,'7861010909034','7861010909034',0,'2020-02-29 13:41:07',1,'ACTIVO'),(1431,2349,16,4,4,4,0.40,0.50,0.50,0.50,'7702027436986','7702027436986',0,'2020-02-29 13:42:09',1,'ACTIVO'),(1432,2348,16,13,13,13,0.40,0.50,0.50,0.50,'7702027436994','7702027436994',0,'2020-02-29 13:42:42',1,'ACTIVO'),(1433,2337,2,4,4,4,0.90,1.00,1.00,1.00,'7862110544989','7862110544989',0,'2020-02-29 13:44:01',1,'ACTIVO'),(1434,2320,4,40,40,40,1.40,1.60,1.60,1.60,'7861010902622','7861010902622',0,'2020-02-29 13:44:35',1,'ACTIVO'),(1435,2290,4,105,105,105,0.80,1.00,1.00,1.00,'7861010908860','7861010908860',0,'2020-02-29 13:48:33',1,'ACTIVO'),(1436,2350,2,10,10,10,0.40,0.50,0.50,0.50,'7862110544927','7862110544927',0,'2020-02-29 13:55:50',1,'ACTIVO'),(1437,2289,4,1,1,1,0.70,0.80,0.80,0.80,'7861010902233','7861010902233',0,'2020-02-29 13:55:59',1,'ACTIVO'),(1438,2351,2,11,11,11,0.40,0.55,0.50,0.50,'7862110544910','7862110544910',0,'2020-02-29 13:57:15',1,'ACTIVO'),(1439,2338,2,5,5,5,0.90,1.00,1.00,1.00,'7702354945992','7702354945992',0,'2020-02-29 13:58:09',1,'ACTIVO'),(1440,2282,4,38,38,38,1.00,1.10,1.10,1.10,'7861012401451','7861012401451',0,'2020-02-29 14:12:57',1,'ACTIVO'),(1441,2352,4,2,2,2,0.80,1.00,1.00,1.00,'7861012411979','7861012411979',0,'2020-02-29 14:15:05',1,'ACTIVO'),(1442,2358,2,3,3,3,0.80,1.00,1.00,1.00,'7868000901009','7868000901009',0,'2020-02-29 14:15:32',1,'ACTIVO'),(1443,2360,4,1,1,1,1.00,1.10,1.10,1.10,'7861136500191','7861136500191',0,'2020-02-29 14:23:24',1,'ACTIVO'),(1444,2353,5,40,1,40,19.00,0.23,0.23,0.23,'200001','200001',1,'2020-02-29 14:23:41',1,'ACTIVO'),(1445,2354,5,40,1,40,0.38,0.45,0.45,0.45,'200002','200002',1,'2020-02-29 14:27:19',1,'ACTIVO'),(1446,2312,4,7,7,7,1.50,1.75,1.75,1.75,'7861010904039','7861010904039',0,'2020-02-29 14:32:14',1,'ACTIVO'),(1447,2363,11,5,5,5,0.70,0.90,0.90,0.90,'7861007909665','7861007909665',0,'2020-02-29 14:32:58',1,'ACTIVO'),(1448,2311,4,34,36,34,1.50,1.75,1.75,1.75,'7861010904039','7861010904039',0,'2020-02-29 14:34:13',1,'ACTIVO'),(1449,2343,16,3,3,3,0.20,0.25,0.25,0.25,'7862109439944','7862109439944',0,'2020-02-29 14:36:47',1,'ACTIVO'),(1450,2355,5,41,1,41,0.76,0.90,0.90,0.90,'200008','200008',1,'2020-02-29 15:09:40',1,'ACTIVO'),(1451,2353,5,41,1,41,0.18,0.23,0.23,0.23,'200001','200001',0,'2020-02-29 15:24:10',1,'ACTIVO'),(1452,2354,5,43,1,43,0.35,0.45,0.45,0.45,'200002','200002',0,'2020-02-29 15:25:45',1,'ACTIVO'),(1453,2355,5,61,1,61,0.70,0.90,0.90,0.90,'200008','200008',0,'2020-02-29 15:30:41',1,'ACTIVO'),(1454,2356,5,28,1,28,1.05,1.35,1.35,1.35,'200003','200003',0,'2020-02-29 15:33:12',1,'ACTIVO'),(1455,2357,5,28,1,28,1.75,2.25,2.25,2.25,'200004','200004',0,'2020-02-29 15:36:09',1,'ACTIVO'),(1456,2359,5,11,1,11,3.50,4.50,4.50,4.50,'200005','200005',0,'2020-02-29 15:41:14',1,'ACTIVO'),(1457,2376,4,4,4,4,2.50,3.00,3.00,3.00,'7861158700425','7861158700425',0,'2020-02-29 15:42:25',1,'ACTIVO'),(1458,2389,7,1,1,1,0.10,0.15,0.15,0.15,'7703064447509','7703064447509',0,'2020-02-29 15:53:44',1,'ACTIVO'),(1459,2052,7,50,50,50,0.15,0.20,0.20,0.20,'100001143','100001143',0,'2020-02-29 15:58:31',1,'ACTIVO'),(1460,2394,7,1,1,1,1.10,1.30,1.30,1.30,'100001142','100001142',0,'2020-02-29 16:02:31',1,'ACTIVO'),(1461,2392,7,1,1,1,1.10,1.30,1.30,1.30,'100001141','100001141',0,'2020-02-29 16:03:25',1,'ACTIVO'),(1462,2391,4,29,29,29,0.08,0.10,0.10,0.10,'100001173','100001173',0,'2020-02-29 16:05:23',1,'ACTIVO'),(1463,2373,23,27,27,27,0.40,0.60,0.60,0.60,'7861073101154','7861073101154',0,'2020-02-29 16:06:09',1,'ACTIVO'),(1464,2386,4,8,8,8,0.40,0.50,0.50,0.50,'100001172','100001172',0,'2020-02-29 16:08:25',1,'ACTIVO'),(1465,2383,4,8,8,8,1.25,1.50,1.50,1.50,'100001171','100001171',0,'2020-02-29 16:10:24',1,'ACTIVO'),(1466,2093,4,5,5,5,1.50,1.75,1.75,1.75,'7761772002633','7761772002633',0,'2020-02-29 16:16:37',1,'ACTIVO'),(1467,2399,7,12,12,12,1.60,1.80,1.80,1.80,'041333431482','041333431482',0,'2020-02-29 16:16:51',1,'ACTIVO'),(1468,2402,7,13,13,13,1.60,1.80,1.80,1.80,'041333014630','041333014630',0,'2020-02-29 16:18:24',1,'ACTIVO'),(1469,2333,2,1,1,1,0.65,0.75,0.75,0.75,'7702001150113','7702001150113',0,'2020-02-29 16:20:57',1,'ACTIVO'),(1470,2401,7,11,11,11,0.70,0.80,0.80,0.80,'8999002604755','8999002604755',0,'2020-02-29 16:22:49',1,'ACTIVO'),(1471,2336,2,5,1,5,0.65,0.75,0.75,0.75,'7702001119547','7702001119547',0,'2020-02-29 16:23:10',1,'ACTIVO'),(1472,2375,7,7,1,7,0.40,0.50,0.50,0.50,'7466762939065','7466762939065',0,'2020-02-29 16:23:22',1,'ACTIVO'),(1473,2365,15,1,1,1,1.50,1.60,1.60,1.60,'7802225118309','7802225118309',0,'2020-02-29 16:24:21',1,'ACTIVO'),(1474,1051,2,6,1,6,0.65,0.75,0.75,0.75,'7861092141629','7861092141629',0,'2020-02-29 16:25:11',1,'ACTIVO'),(1475,2403,7,8,8,8,0.70,0.80,0.80,0.80,'100001174','100001174',0,'2020-02-29 16:25:45',1,'ACTIVO'),(1476,2370,16,5,1,5,0.20,0.25,0.25,0.25,'7861006720612','7861006720612',0,'2020-02-29 16:25:58',1,'ACTIVO'),(1477,2369,16,8,1,8,0.20,0.25,0.25,0.25,'7861006720216','7861006720216',0,'2020-02-29 16:26:55',1,'ACTIVO'),(1478,2407,24,11,11,11,0.80,1.25,1.25,1.25,'7862118391226','7862118391226',0,'2020-02-29 16:27:25',1,'ACTIVO'),(1479,2366,16,6,1,6,0.20,0.25,0.25,0.25,'7861006719012','7861006719012',0,'2020-02-29 16:28:42',1,'ACTIVO'),(1480,1028,2,2,1,2,0.65,0.75,0.75,0.75,'7861092141605','7861092141605',0,'2020-02-29 16:30:01',1,'ACTIVO'),(1481,2367,16,3,1,3,0.20,0.25,0.25,0.25,'7861006720414','7861006720414',0,'2020-02-29 16:30:07',1,'ACTIVO'),(1482,1981,8,17,17,17,0.40,0.60,0.60,0.60,'10000176','10000176',0,'2020-02-29 16:31:25',1,'ACTIVO'),(1483,2395,7,15,1,15,0.25,0.30,0.30,0.30,'7790580602000','7790580602000',0,'2020-02-29 16:31:47',1,'ACTIVO'),(1484,1980,8,6,6,6,0.80,1.00,1.00,1.00,'100001175','100001175',0,'2020-02-29 16:32:26',1,'ACTIVO'),(1485,2393,7,2,1,2,0.25,0.30,0.30,0.30,'7802225412193','7802225412193',0,'2020-02-29 16:32:39',1,'ACTIVO'),(1486,2398,7,24,1,24,0.10,0.15,0.15,0.15,'7702011104984','7702011104984',0,'2020-02-29 16:34:24',1,'ACTIVO'),(1487,95,2,5,1,5,0.65,0.75,0.75,0.75,'7861092121218','7861092121218',0,'2020-02-29 16:34:42',1,'ACTIVO'),(1488,2396,7,24,1,24,0.10,0.15,0.15,0.15,'7707282387531','7707282387531',0,'2020-02-29 16:35:17',1,'ACTIVO'),(1489,2335,2,7,1,7,0.65,0.75,0.75,0.75,'7702001111756','7702001111756',0,'2020-02-29 16:35:56',1,'ACTIVO'),(1490,2378,16,13,1,13,0.30,0.35,0.35,0.35,'7790580200114','7790580200114',0,'2020-02-29 16:36:16',1,'ACTIVO'),(1491,2411,7,2,2,2,1.00,1.50,1.50,1.50,'9999960948136','9999960948136',0,'2020-02-29 16:37:01',1,'ACTIVO'),(1492,2377,16,2,1,2,0.30,0.35,0.35,0.35,'7790580199913','7790580199913',0,'2020-02-29 16:37:26',1,'ACTIVO'),(1493,2379,16,2,1,2,0.30,0.35,0.35,0.35,'7790580616717','7790580616717',0,'2020-02-29 16:38:28',1,'ACTIVO'),(1494,2097,7,19,19,19,0.20,0.35,0.35,0.35,'7861191905344','7861191905344',0,'2020-02-29 16:40:34',1,'ACTIVO'),(1495,2397,4,20,1,20,0.20,0.25,0.25,0.25,'100001177','100001177',0,'2020-02-29 16:41:57',1,'ACTIVO'),(1496,2382,16,6,1,6,0.40,0.50,0.50,0.50,'7802225427197','7802225427197',0,'2020-02-29 16:43:03',1,'ACTIVO'),(1497,2381,16,7,1,7,0.20,0.25,0.25,0.25,'7802225427753','7802225427753',0,'2020-02-29 16:44:11',1,'ACTIVO'),(1498,2412,2,12,1,12,0.50,0.60,0.60,0.60,'7702001109845','7702001109845',0,'2020-02-29 16:45:56',1,'ACTIVO'),(1499,2384,16,15,1,25,0.10,0.15,0.15,0.15,'77942432','77942432',0,'2020-02-29 16:45:57',1,'ACTIVO'),(1500,2380,16,16,1,16,0.30,0.35,0.35,0.35,'7702011007322','7702011007322',0,'2020-02-29 16:47:18',1,'ACTIVO'),(1501,2414,7,47,47,47,0.10,0.15,0.15,0.15,'100001148','100001148',0,'2020-02-29 16:47:59',1,'ACTIVO'),(1502,2400,7,7,1,7,0.20,0.25,0.25,0.25,'7702007053371','7702007053371',0,'2020-02-29 16:49:29',1,'ACTIVO'),(1503,2371,7,5,1,5,0.40,0.50,0.50,0.50,'7861001237429','7861001237429',0,'2020-02-29 16:50:26',1,'ACTIVO'),(1504,2415,2,3,1,3,0.65,0.75,0.75,0.75,'7861092140103','7861092140103',0,'2020-02-29 16:51:52',1,'ACTIVO'),(1505,2372,7,4,1,4,0.40,0.45,0.45,0.45,'7861091132291','7861091132291',0,'2020-02-29 16:52:47',1,'ACTIVO'),(1506,2417,7,8,8,8,0.20,0.30,0.30,0.30,'100001149','100001149',0,'2020-02-29 16:53:07',1,'ACTIVO'),(1507,2385,7,16,1,16,0.40,0.45,0.45,0.45,'77037343','77037343',0,'2020-02-29 16:53:59',1,'ACTIVO'),(1508,2361,7,4,1,4,1.80,1.95,1.95,1.95,'7861001237405','7861001237405',0,'2020-02-29 16:55:24',1,'ACTIVO'),(1509,2419,7,25,25,25,0.90,1.20,1.20,1.20,'100001178','100001178',0,'2020-02-29 16:56:53',1,'ACTIVO'),(1510,2362,7,1,1,1,1.80,1.95,1.95,1.95,'7861091195098','7861091195098',0,'2020-02-29 16:57:24',1,'ACTIVO'),(1511,2374,7,20,1,20,0.25,0.30,0.30,0.30,'7802225538442','7802225538442',0,'2020-02-29 16:58:52',1,'ACTIVO'),(1512,2418,5,12,12,12,0.60,0.70,0.70,0.70,'7861010903629','7861010903629',0,'2020-02-29 17:00:58',1,'ACTIVO'),(1513,2420,7,15,15,15,0.15,0.25,0.25,0.25,'100001158','100001158',0,'2020-02-29 17:01:25',1,'ACTIVO'),(1514,2404,7,1,1,1,0.20,0.25,0.25,0.25,'78023994','78023994',0,'2020-02-29 17:02:21',1,'ACTIVO'),(1515,2421,7,19,19,19,0.25,0.30,0.30,0.30,'100001150','100001150',0,'2020-02-29 17:03:33',1,'ACTIVO'),(1516,2406,7,3,1,3,0.20,0.25,0.25,0.25,'78024106','78024106',0,'2020-02-29 17:03:52',1,'ACTIVO'),(1517,2088,5,8,8,8,0.90,1.00,1.00,1.00,'7861010900666','7861010900666',0,'2020-02-29 17:04:39',1,'ACTIVO'),(1518,2364,15,1,1,1,2.00,2.25,2.25,2.25,'7861002901275','7861002901275',0,'2020-02-29 17:05:27',1,'ACTIVO'),(1519,1019,2,1,1,1,0.60,0.70,0.70,0.70,'7702001145881','7702001145881',0,'2020-02-29 17:05:37',1,'ACTIVO'),(1520,2422,7,2,2,2,0.60,0.70,0.70,0.70,'100001156','100001156',0,'2020-02-29 17:06:01',1,'ACTIVO'),(1521,1014,4,6,1,6,0.80,1.00,1.00,1.00,'7702001044542','7702001044542',0,'2020-02-29 17:11:16',1,'ACTIVO'),(1522,2423,7,17,17,17,0.60,0.75,0.75,0.75,'100001152','100001152',0,'2020-02-29 17:11:45',1,'ACTIVO'),(1523,2424,7,9,9,9,0.85,1.00,1.00,1.00,'100001153','100001153',0,'2020-02-29 17:12:24',1,'ACTIVO'),(1524,1016,4,7,1,7,0.80,1.00,1.00,1.00,'7702001044504','7702001044504',0,'2020-02-29 17:13:49',1,'ACTIVO'),(1525,2426,7,3,3,3,0.50,0.65,0.65,0.65,'7703064495302','7703064495302',0,'2020-02-29 17:14:50',1,'ACTIVO'),(1526,2425,5,23,23,23,0.70,0.90,0.90,0.90,'7861010903179','7861010903179',1,'2020-02-29 17:15:29',1,'ACTIVO'),(1527,1015,4,3,1,3,0.80,1.00,1.00,1.00,'7702001084999','7702001084999',0,'2020-02-29 17:15:40',1,'ACTIVO'),(1528,1134,4,2,1,2,0.80,1.00,1.00,1.00,'7702001143993','7702001143993',0,'2020-02-29 17:17:27',1,'ACTIVO'),(1529,2425,5,23,23,23,0.70,0.90,0.90,0.90,'7861010903179','7861010903179',0,'2020-02-29 17:18:48',1,'ACTIVO'),(1530,2428,7,1,1,1,0.50,0.65,0.65,0.65,'100001179','100001179',0,'2020-02-29 17:18:49',1,'ACTIVO'),(1531,2431,7,1,1,1,1.00,1.25,1.25,1.25,'100001151','100001151',0,'2020-02-29 17:21:52',1,'ACTIVO'),(1532,2433,7,9,9,9,0.20,0.25,0.25,0.25,'100001155','100001155',0,'2020-02-29 17:25:24',1,'ACTIVO'),(1533,2416,5,19,19,19,0.70,0.90,0.90,0.90,'7861010908105','7861010908105',0,'2020-02-29 17:26:06',1,'ACTIVO'),(1534,2434,7,17,17,17,0.20,0.30,0.30,0.30,'100001157','100001157',0,'2020-02-29 17:29:34',1,'ACTIVO'),(1535,2432,7,37,1,37,0.40,0.50,0.50,0.50,'7862106451697','7862106451697',0,'2020-02-29 17:29:41',1,'ACTIVO'),(1536,2430,7,7,1,7,0.40,0.50,0.50,0.50,'7802225582551','7802225582551',0,'2020-02-29 17:30:40',1,'ACTIVO'),(1537,2429,7,4,1,4,0.40,0.50,0.50,0.50,'7861091130174','7861091130174',0,'2020-02-29 17:31:27',1,'ACTIVO'),(1538,2427,7,26,1,26,1.30,1.50,1.50,1.50,'7862106455572','7862106455572',0,'2020-02-29 17:32:39',1,'ACTIVO'),(1539,1030,4,3,1,3,0.70,0.80,0.80,0.80,'7861092186569','7861092186569',0,'2020-02-29 17:32:55',1,'ACTIVO'),(1540,2435,7,9,9,9,0.40,0.50,0.50,0.50,'100001181','100001181',0,'2020-02-29 17:44:20',1,'ACTIVO'),(1541,2090,5,2,2,2,0.70,0.90,0.90,0.90,'7861000280587','7861000280587',0,'2020-02-29 17:50:16',1,'ACTIVO'),(1542,2437,7,6,6,6,0.80,1.00,1.00,1.00,'070330913431','070330631328',0,'2020-02-29 17:51:38',1,'ACTIVO'),(1543,1029,4,1,1,1,0.70,0.80,0.80,0.80,'7861092186545','7861092186545',0,'2020-02-29 17:53:48',1,'ACTIVO'),(1544,2436,5,1,1,1,0.70,0.90,0.90,0.90,'7868000562125','7868000562125',0,'2020-02-29 17:55:23',1,'ACTIVO'),(1545,2441,4,2,1,2,0.70,0.80,0.80,0.80,'7861092186552','7861092186552',0,'2020-02-29 18:00:47',1,'ACTIVO'),(1546,2443,4,58,58,58,0.30,0.40,0.40,0.40,'100001182','100001182',0,'2020-02-29 18:01:04',1,'ACTIVO'),(1547,2439,7,43,43,43,0.40,0.50,0.50,0.50,'7862113780162','7862113780162',0,'2020-02-29 18:01:53',1,'ACTIVO'),(1548,2442,5,3,3,3,0.70,0.90,0.90,0.90,'7861000266772','7861000266772',0,'2020-02-29 18:02:49',1,'ACTIVO'),(1549,82,4,2,1,2,0.70,0.80,0.80,0.80,'7861092186538','7861092186538',0,'2020-02-29 18:02:50',1,'ACTIVO'),(1550,2440,4,47,47,47,0.85,1.00,1.00,1.00,'7862113780117','7862113780117',0,'2020-02-29 18:02:53',1,'ACTIVO'),(1551,1032,4,4,1,4,0.70,0.80,0.80,0.80,'7702001106639','7702001106639',0,'2020-02-29 18:04:10',1,'ACTIVO'),(1552,2446,7,12,12,12,0.80,1.00,1.00,1.00,'6994670810332','6994670810332',0,'2020-02-29 18:06:17',1,'ACTIVO'),(1553,2388,4,2,1,2,0.70,0.80,0.80,0.80,'7702001150137','7702001150137',0,'2020-02-29 18:08:00',1,'ACTIVO'),(1554,1036,4,3,1,3,0.40,0.50,0.50,0.50,'7702001145843','7702001145843',0,'2020-02-29 18:09:50',1,'ACTIVO'),(1555,2450,24,3,3,3,0.30,0.40,0.40,0.40,'7861135400393','7861135400393',0,'2020-02-29 18:10:02',1,'ACTIVO'),(1556,2454,4,10,10,10,0.15,0.25,0.25,0.25,'7861081701018','7861081701018',0,'2020-02-29 18:12:55',1,'ACTIVO'),(1557,2456,7,2,2,2,0.20,0.30,0.30,0.30,'100001183','100001183',0,'2020-02-29 18:15:15',1,'ACTIVO'),(1558,2459,4,4,1,4,0.60,0.70,0.70,0.70,'7702001136476','7702001136476',0,'2020-02-29 18:17:33',1,'ACTIVO'),(1559,2461,7,53,53,53,0.40,0.50,0.50,0.50,'7702027434112','7702027434112',0,'2020-02-29 18:17:42',1,'ACTIVO'),(1560,1035,4,2,1,2,0.40,0.50,0.50,0.50,'7702001121229','7702001121229',0,'2020-02-29 18:20:03',1,'ACTIVO'),(1561,2464,7,3,3,3,1.30,1.50,1.50,1.50,'7702018880409','7702018880409',0,'2020-02-29 18:22:38',1,'ACTIVO'),(1562,100,4,2,1,2,0.55,0.65,0.65,0.65,'7702001112197','7702001112197',0,'2020-02-29 18:23:10',1,'ACTIVO'),(1563,2466,7,20,20,20,0.80,1.00,1.00,1.00,'7501009222729','7501009222729',0,'2020-02-29 18:23:55',1,'ACTIVO'),(1564,2468,7,17,17,17,0.60,0.75,0.75,0.75,'7793100151224','7793100151224',0,'2020-02-29 18:26:35',1,'ACTIVO'),(1565,1053,2,2,1,2,2.60,2.80,2.80,2.80,'7702001111053','7702001111053',0,'2020-02-29 18:28:47',1,'ACTIVO'),(1566,2470,7,22,22,22,0.80,1.00,1.00,1.00,'6933298820019','6933298820019',0,'2020-02-29 18:29:04',1,'ACTIVO'),(1567,2476,7,25,25,25,0.80,1.00,1.00,1.00,'6933298820026','6933298820026',0,'2020-02-29 18:35:16',1,'ACTIVO'),(1568,2473,4,10,10,10,0.50,0.65,0.65,0.65,'78601918','78601918',0,'2020-02-29 18:36:01',1,'ACTIVO'),(1569,2475,4,7,7,7,0.50,0.60,0.60,0.60,'100001184','100001184',0,'2020-02-29 18:36:58',1,'ACTIVO'),(1570,2467,7,3,1,3,1.90,2.10,2.10,2.10,'7861013735050','7861013735050',0,'2020-02-29 18:41:02',1,'ACTIVO'),(1571,2477,2,1,1,1,3.00,3.25,3.25,3.25,'7702001119530','7702001119530',0,'2020-02-29 18:41:26',1,'ACTIVO'),(1572,2479,7,5,5,5,0.20,0.25,0.25,0.25,'6580901071063','6580901071063',0,'2020-02-29 18:42:20',1,'ACTIVO'),(1573,2478,2,1,1,1,3.00,3.25,3.25,3.25,'7702001119530','7702001119530',0,'2020-02-29 18:42:30',1,'ACTIVO'),(1574,2462,7,2,1,2,2.00,2.20,2.20,2.20,'7861013734169','7861013734169',0,'2020-02-29 18:44:46',1,'ACTIVO'),(1575,2387,4,2,1,2,0.80,1.00,1.00,1.00,'7702001125715','7702001125715',0,'2020-02-29 18:48:11',1,'ACTIVO'),(1576,674,7,4,1,4,3.10,3.30,3.30,3.30,'7861013734206','7861013734206',0,'2020-02-29 18:49:49',1,'ACTIVO'),(1577,2455,7,2,1,2,3.60,3.80,3.80,3.80,'7861013734053','7861013734053',0,'2020-02-29 18:51:41',1,'ACTIVO'),(1578,672,7,3,1,3,3.00,3.25,3.25,3.25,'7861013734152','7861013734152',0,'2020-02-29 18:53:05',1,'ACTIVO'),(1579,2485,7,12,12,12,0.25,0.35,0.35,0.35,'6935205300645','6935205300645',0,'2020-02-29 18:54:36',1,'ACTIVO'),(1580,2447,7,3,1,6,3.60,3.80,3.80,3.80,'7861013731601','7861013731601',0,'2020-02-29 18:55:07',1,'ACTIVO'),(1581,2487,7,9,9,9,0.40,0.50,0.50,0.50,'100001187','100001187',0,'2020-02-29 18:55:47',1,'ACTIVO'),(1582,2490,7,3,3,3,0.80,1.00,1.00,1.00,'100001185','100001185',0,'2020-02-29 18:56:50',1,'ACTIVO'),(1583,2463,7,3,1,6,1.40,1.50,1.50,1.50,'7861013731052','7861013731052',0,'2020-02-29 19:00:38',1,'ACTIVO'),(1584,1775,4,13,1,13,0.20,0.25,0.25,0.00,'7750168001687','7750168001687',0,'2020-02-29 19:00:51',1,'ACTIVO'),(1585,1824,5,6,1,6,0.40,0.50,0.50,0.50,'7750168001533','7750168001533',0,'2020-02-29 19:02:08',1,'ACTIVO'),(1586,2465,7,4,1,14,0.80,0.85,0.85,0.85,'7861013734022','7861013734022',0,'2020-02-29 19:02:28',1,'ACTIVO'),(1587,2448,7,3,1,1,1.20,1.40,1.40,1.40,'7861013752057','7861013752057',0,'2020-02-29 19:04:46',1,'ACTIVO'),(1588,2493,5,13,1,13,0.40,0.50,0.50,0.50,'7750168214292','7750168214292',0,'2020-02-29 19:05:57',1,'ACTIVO'),(1589,2472,7,5,1,9,1.50,1.65,1.65,1.65,'7861002823010','7861002823010',0,'2020-02-29 19:06:44',1,'ACTIVO'),(1590,2494,7,14,14,14,0.80,1.00,1.00,1.00,'7707181151516','7707181151516',0,'2020-02-29 19:07:22',1,'ACTIVO'),(1591,2492,7,10,10,10,0.80,1.00,1.00,1.00,'7707181151714','7707181151714',0,'2020-02-29 19:09:10',1,'ACTIVO'),(1592,2458,7,4,1,4,0.70,0.85,0.85,0.85,'7861002822259','7861002822259',0,'2020-02-29 19:09:15',1,'ACTIVO'),(1593,2460,16,92,92,92,0.15,0.25,0.25,0.25,'7702006202367','7702006202367',0,'2020-02-29 19:12:32',1,'ACTIVO'),(1594,2453,7,4,1,4,0.90,1.00,1.00,1.00,'7861002821726','7861002821726',0,'2020-02-29 19:13:38',1,'ACTIVO'),(1595,2449,16,17,17,17,0.15,0.25,0.25,0.25,'7862106702805','7862106702805',0,'2020-02-29 19:14:18',1,'ACTIVO'),(1596,2471,7,8,1,8,1.40,1.50,1.50,1.50,'7861013731625','7861013731625',0,'2020-02-29 19:15:11',1,'ACTIVO'),(1597,2452,16,68,68,68,0.15,0.25,0.25,0.25,'7861001300734','7861001300734',0,'2020-02-29 19:15:30',1,'ACTIVO'),(1598,2451,7,8,1,11,0.89,0.99,0.99,0.99,'7861013735180','7861013735180',0,'2020-02-29 19:16:44',1,'ACTIVO'),(1599,2469,7,1,1,7,0.70,0.80,0.80,0.80,'7861013731465','7861013731465',0,'2020-02-29 19:18:17',1,'ACTIVO'),(1600,2483,16,32,32,32,0.20,0.25,0.25,0.25,'7702045557879','7702045557879',0,'2020-02-29 19:19:16',1,'ACTIVO'),(1601,2445,7,4,1,4,2.00,2.20,2.20,2.20,'7861013735197','7861013735197',0,'2020-02-29 19:19:46',1,'ACTIVO'),(1602,2460,16,60,60,60,0.15,0.25,0.25,0.25,'7861001300727','7861001300727',0,'2020-02-29 19:20:00',1,'ACTIVO'),(1603,2444,7,6,1,6,4.20,4.40,4.40,4.40,'7861013790257','7861013790257',0,'2020-02-29 19:21:27',1,'ACTIVO'),(1604,1038,4,2,1,2,1.00,1.25,1.25,1.25,'7702001055067','7702001055067',0,'2020-02-29 19:22:55',1,'ACTIVO'),(1605,2457,16,13,13,13,0.15,0.25,0.25,0.25,'7862106702782','7862106702782',0,'2020-02-29 19:23:28',1,'ACTIVO'),(1606,2332,17,1,1,1,0.50,0.60,0.60,0.60,'7861031540421','7861031540421',0,'2020-02-29 19:24:03',1,'ACTIVO'),(1607,2474,5,3,1,3,0.85,0.90,0.90,0.90,'7861000279925','7861000279925',0,'2020-02-29 19:25:41',1,'ACTIVO'),(1608,943,5,2,1,2,0.90,1.00,1.00,1.00,'7861029404698','7861029404698',0,'2020-02-29 19:27:57',1,'ACTIVO'),(1609,2438,16,2,2,2,15.00,0.25,0.25,0.25,'7862106701716','7862106701716',0,'2020-02-29 19:30:57',1,'ACTIVO'),(1610,2495,16,42,42,42,0.15,0.25,0.25,0.25,'7862106703529','7862106703529',0,'2020-02-29 19:34:50',1,'ACTIVO'),(1611,2482,16,18,18,18,0.20,0.25,0.25,0.25,'7702045565140','7702045565140',0,'2020-02-29 19:35:57',1,'ACTIVO'),(1612,2496,16,4,4,4,0.15,0.25,0.25,0.25,'7862106701686','7862106701686',0,'2020-02-29 19:36:06',1,'ACTIVO'),(1613,2498,7,5,5,5,2.80,3.20,3.20,3.20,'100001188','100001188',0,'2020-02-29 19:45:48',1,'ACTIVO'),(1614,670,7,2,1,2,2.20,2.25,2.25,2.25,'7861013731571','7861013731571',0,'2020-02-29 19:47:49',1,'ACTIVO'),(1615,1704,7,5,1,9,0.90,1.00,1.00,1.00,'7861002820491','7861002820491',0,'2020-02-29 19:49:06',1,'ACTIVO'),(1616,1702,7,4,1,4,0.90,1.00,1.00,0.00,'7861043900190','7861043900190',0,'2020-02-29 19:50:38',1,'ACTIVO'),(1617,2502,7,5,5,5,1.89,1.99,1.99,1.99,'7861002804200','7861002804200',0,'2020-02-29 19:53:09',1,'ACTIVO'),(1618,2510,16,30,30,30,0.20,0.30,0.30,0.30,'7862103551161','7862103551161',0,'2020-02-29 19:59:49',1,'ACTIVO'),(1619,2501,16,2,2,2,0.15,0.25,0.25,0.25,'7862106703420','7862106703420',0,'2020-02-29 20:02:51',1,'ACTIVO'),(1620,2500,16,1,1,1,0.15,0.25,0.25,0.25,'7702354942847','7702354942847',0,'2020-02-29 20:03:29',1,'ACTIVO'),(1621,2504,16,1,1,1,0.15,0.25,0.25,0.25,'7702006203951','7702006203951',0,'2020-02-29 20:04:20',1,'ACTIVO'),(1622,2480,16,37,37,37,0.20,0.25,0.25,0.25,'7702045557909','7702045557909',0,'2020-02-29 20:06:11',1,'ACTIVO'),(1623,2497,7,1,1,1,3.42,3.42,3.42,3.42,'2803755004617','2803755004617',0,'2020-02-29 20:06:17',1,'ACTIVO'),(1624,1813,7,1,1,1,1.69,1.69,1.69,1.69,'2803807004497','2803807004497',0,'2020-02-29 20:07:09',1,'ACTIVO'),(1625,1809,7,1,1,1,1.77,1.77,1.77,1.77,'2803765003853','2803765003853',0,'2020-02-29 20:07:46',1,'ACTIVO'),(1626,2497,7,1,1,1,3.49,3.49,3.49,3.49,'2803755004716','2803755004716',0,'2020-02-29 20:08:22',1,'ACTIVO'),(1627,2513,5,15,1,15,1.30,1.50,1.50,1.50,'7861000163897','7861000163897',0,'2020-02-29 20:08:39',1,'ACTIVO'),(1628,1809,7,1,1,1,1.80,1.80,1.80,1.80,'2803765003907','2803765003907',0,'2020-02-29 20:08:53',1,'ACTIVO'),(1629,2481,16,18,18,18,0.20,0.25,0.25,0.25,'7702045557862','7702045557862',0,'2020-02-29 20:09:45',1,'ACTIVO'),(1630,2497,7,1,1,1,3.21,3.21,3.21,3.21,'2803755004327','2803755004327',0,'2020-02-29 20:10:40',1,'ACTIVO'),(1631,2497,7,1,1,1,3.79,3.79,3.79,3.79,'2803755005119','2803755005119',0,'2020-02-29 20:11:13',1,'ACTIVO'),(1632,2488,16,10,10,10,0.20,0.25,0.25,0.25,'7702045557855','7702045557855',0,'2020-02-29 20:11:37',1,'ACTIVO'),(1633,2497,7,1,1,1,3.39,3.39,3.39,3.39,'2803755004570','2803755004570',0,'2020-02-29 20:11:47',1,'ACTIVO'),(1634,1809,7,1,1,1,1.80,1.80,1.80,1.80,'2803765003907','2803765003907',0,'2020-02-29 20:12:32',1,'ACTIVO'),(1635,2486,16,18,18,18,0.20,0.25,0.25,0.25,'7702045792041','7702045792041',0,'2020-02-29 20:13:16',1,'ACTIVO'),(1636,1813,7,1,1,1,1.69,1.69,1.69,1.69,'2803807004497','2803807004497',0,'2020-02-29 20:13:17',1,'ACTIVO'),(1637,2512,5,8,1,8,0.60,0.70,0.70,0.70,'7861000278232','7861000278232',0,'2020-02-29 20:13:21',1,'ACTIVO'),(1638,1812,7,1,1,1,1.64,1.64,1.64,1.64,'2803764004097','2803764004097',0,'2020-02-29 20:13:49',1,'ACTIVO'),(1639,1812,7,1,1,1,1.94,1.94,1.94,1.94,'2803764004851','2803764004851',0,'2020-02-29 20:14:34',1,'ACTIVO'),(1640,2484,16,7,7,7,0.20,0.25,0.25,0.25,'7702045557893','7702045557893',0,'2020-02-29 20:14:48',1,'ACTIVO'),(1641,1812,7,1,1,1,1.67,1.67,1.67,1.67,'2803764004189','2803764004189',0,'2020-02-29 20:15:03',1,'ACTIVO'),(1642,1812,7,1,1,1,1.55,1.55,1.55,1.55,'2803764003878','2803764003878',0,'2020-02-29 20:15:42',1,'ACTIVO'),(1643,1809,7,1,1,1,2.48,2.48,2.48,2.48,'2803765005383','2803765005383',0,'2020-02-29 20:16:16',1,'ACTIVO'),(1644,2491,16,18,18,18,0.20,0.25,0.25,0.25,'7702045379679','7702045379679',0,'2020-02-29 20:16:18',1,'ACTIVO'),(1645,1809,7,1,1,1,2.43,2.43,2.43,2.43,'2803765005284','2803765005284',0,'2020-02-29 20:17:24',1,'ACTIVO'),(1646,2511,7,8,1,14,0.80,1.00,1.00,1.00,'7861002820323','7861002820323',0,'2020-02-29 20:17:29',1,'ACTIVO'),(1647,1809,7,1,1,1,2.47,2.47,2.47,2.47,'2803765005352','2803765005352',0,'2020-02-29 20:17:54',1,'ACTIVO'),(1648,1809,7,1,1,1,1.88,1.88,1.88,1.88,'2803765004072','2803765004072',0,'2020-02-29 20:18:23',1,'ACTIVO'),(1649,1809,7,1,1,1,1.78,1.78,1.78,1.78,'2803765003877','2803765003877',0,'2020-02-29 20:19:00',1,'ACTIVO'),(1650,2505,7,1,1,1,1.90,1.90,1.90,1.90,'2803765004126','2803765004126',0,'2020-02-29 20:19:34',1,'ACTIVO'),(1651,2505,7,1,1,1,2.31,2.31,2.31,2.31,'2803765005017','2803765005017',0,'2020-02-29 20:20:13',1,'ACTIVO'),(1652,2506,7,4,1,4,0.80,1.00,1.00,1.00,'7861002820781','7861002820781',0,'2020-02-29 20:21:11',1,'ACTIVO'),(1653,1809,7,1,1,1,1.99,1.99,1.99,1.99,'2803765004317','2803765004317',0,'2020-02-29 20:21:18',1,'ACTIVO'),(1654,2509,7,1,1,1,2.57,2.57,2.57,2.57,'2803756003749','2803756003749',0,'2020-02-29 20:21:56',1,'ACTIVO'),(1655,2509,7,1,1,1,3.08,3.08,3.08,3.08,'2803756004494','2803756004494',0,'2020-02-29 20:23:29',1,'ACTIVO'),(1656,2509,7,1,1,1,2.58,2.58,2.58,2.58,'2803756003763','2803756003763',0,'2020-02-29 20:24:04',1,'ACTIVO'),(1657,1809,7,1,1,1,2.07,2.07,2.07,2.07,'2803765004508','2803765004508',0,'2020-02-29 20:24:54',1,'ACTIVO'),(1658,2509,7,1,1,1,3.16,3.16,3.16,3.16,'2803756004609','2803756004609',0,'2020-02-29 20:25:44',1,'ACTIVO'),(1659,2509,7,1,1,1,3.50,3.50,3.50,3.50,'2803756005101','2803756005101',0,'2020-02-29 20:26:22',1,'ACTIVO'),(1660,2509,7,1,1,1,3.54,3.54,3.54,3.54,'2803756005163','2803756005163',0,'2020-02-29 20:26:47',1,'ACTIVO'),(1661,2503,7,1,1,1,0.70,0.80,0.80,0.80,'7861002823218','7861002823218',0,'2020-02-29 20:26:57',1,'ACTIVO'),(1662,2514,7,1,1,1,4.40,4.40,4.40,4.40,'2803754005509','2803754005509',0,'2020-02-29 20:29:26',1,'ACTIVO'),(1663,409,7,2,1,2,3.00,4.00,4.00,4.00,'7861018601411','7861018601411',0,'2020-02-29 20:29:49',1,'ACTIVO'),(1664,2514,7,1,1,1,3.45,3.45,3.45,3.45,'2803754004311','2803754004311',0,'2020-02-29 20:29:56',1,'ACTIVO'),(1665,2514,7,1,1,1,4.27,4.27,4.27,4.27,'2803754005349','2803754005349',0,'2020-02-29 20:30:21',1,'ACTIVO'),(1666,2514,7,1,1,1,3.58,3.58,3.58,3.58,'2803754004489','2803754004489',0,'2020-02-29 20:30:50',1,'ACTIVO'),(1667,2514,7,1,1,1,3.86,3.86,3.86,3.86,'2803754004830','2803754004830',0,'2020-02-29 20:31:25',1,'ACTIVO'),(1668,486,7,1,1,1,1.90,2.10,2.10,2.10,'7861018601558','7861018601558',0,'2020-02-29 20:31:30',1,'ACTIVO'),(1669,2499,7,1,1,1,2.55,2.55,2.55,2.55,'2803767009839','2803767009839',0,'2020-02-29 20:33:55',1,'ACTIVO'),(1670,463,7,1,1,1,2.10,2.30,2.30,2.30,'7861018601602','7861018601602',0,'2020-02-29 20:34:34',1,'ACTIVO'),(1671,493,7,1,1,1,1.00,1.15,1.15,1.15,'7861018601732','7861018601732',0,'2020-02-29 20:43:51',1,'ACTIVO'),(1672,501,7,3,1,3,0.50,0.60,0.60,0.60,'7861010409220','7861010409220',0,'2020-02-29 20:45:47',1,'ACTIVO'),(1673,457,7,3,1,3,1.50,1.65,1.65,1.65,'7861018601589','7861018601589',0,'2020-02-29 20:48:26',1,'ACTIVO'),(1674,486,7,2,1,2,1.90,2.10,2.10,2.10,'7861018601558','7861018601558',0,'2020-02-29 20:50:06',1,'ACTIVO'),(1675,616,7,2,1,2,1.55,1.65,1.65,1.65,'7861010405017','7861010405017',0,'2020-02-29 20:53:25',1,'ACTIVO'),(1676,449,7,10,1,10,0.55,0.65,0.65,0.65,'7861018601329','7861018601329',0,'2020-02-29 20:54:41',1,'ACTIVO'),(1677,2043,7,2,1,2,5.70,5.70,5.70,6.00,'7861002830780','7861002830780',0,'2020-03-01 10:03:33',1,'ACTIVO'),(1678,2042,7,2,1,2,5.00,5.25,5.25,5.25,'7861002830735','7861002830735',0,'2020-03-01 10:06:53',1,'ACTIVO'),(1679,2040,7,1,1,4,4.00,4.22,4.22,4.22,'7861002830049','7861002830049',0,'2020-03-01 10:13:13',1,'ACTIVO'),(1680,2041,7,2,1,2,5.00,5.30,5.30,5.30,'7861002830094','7861002830094',0,'2020-03-01 10:16:14',1,'ACTIVO'),(1681,2038,7,1,1,1,4.20,4.47,4.47,4.47,'7861002830346','7861002830346',0,'2020-03-01 10:18:39',1,'ACTIVO'),(1682,2515,7,1,1,1,4.20,4.45,4.45,4.45,'7861002830391','7861002830391',0,'2020-03-01 10:30:07',1,'ACTIVO'),(1683,1974,7,12,1,12,1.00,1.10,1.10,1.10,'7861002830148','7861002830148',0,'2020-03-01 10:35:21',1,'ACTIVO'),(1684,1974,7,6,1,6,1.10,1.20,1.20,1.20,'7861002830148','7861002830148',0,'2020-03-01 10:37:24',1,'ACTIVO'),(1685,1972,7,7,1,7,1.00,1.10,1.10,1.10,'7861002830650','7861002830650',0,'2020-03-01 10:41:03',1,'ACTIVO'),(1686,1969,7,14,1,14,0.90,1.03,1.03,1.03,'7861002830131','7861002830131',0,'2020-03-01 10:46:10',1,'ACTIVO'),(1687,2019,7,4,1,1,2.00,2.15,2.15,2.15,'7861002830858','7861002830858',0,'2020-03-01 10:51:32',1,'ACTIVO'),(1688,2017,7,4,1,4,2.00,2.15,2.15,2.15,'7861002830827','7861002830827',0,'2020-03-01 10:53:07',1,'ACTIVO'),(1689,2028,7,3,1,3,0.80,1.00,1.00,1.00,'7861032291094','7861032291094',0,'2020-03-01 10:54:09',1,'ACTIVO'),(1690,1971,7,9,1,9,1.20,1.38,1.38,1.38,'7861002830773','7861002830773',0,'2020-03-01 11:00:41',1,'ACTIVO'),(1691,2516,5,36,1,36,0.40,0.50,0.50,0.50,'500201','500201',0,'2020-03-01 11:02:57',1,'ACTIVO'),(1692,2517,5,17,1,17,0.15,0.25,0.25,0.25,'500202','500202',0,'2020-03-01 11:04:21',1,'ACTIVO'),(1693,833,5,43,1,43,0.40,0.50,0.50,0.50,'500603','500603',0,'2020-03-01 11:07:42',1,'ACTIVO'),(1694,832,5,41,1,41,0.15,0.25,0.25,0.25,'500602','500602',0,'2020-03-01 11:09:21',1,'ACTIVO'),(1695,846,5,12,1,12,1.00,1.25,1.25,1.25,'500601','500601',0,'2020-03-01 11:11:41',1,'ACTIVO'),(1696,2023,7,3,1,3,7.00,8.00,8.00,8.00,'7861032237528','7861032237528',0,'2020-03-01 11:16:14',1,'ACTIVO'),(1697,2521,5,15,1,15,0.15,0.25,0.25,0.25,'500402','500402',0,'2020-03-01 11:16:26',1,'ACTIVO'),(1698,2522,5,10,1,10,0.40,0.50,0.50,0.50,'500401','500401',0,'2020-03-01 11:17:25',1,'ACTIVO'),(1699,2531,7,1,1,1,5.50,5.85,5.85,5.85,'7861002830834','7861002830834',0,'2020-03-01 11:18:09',1,'ACTIVO'),(1700,2523,5,33,1,33,0.15,0.25,0.25,0.25,'500801','500801',0,'2020-03-01 11:19:43',1,'ACTIVO'),(1701,2530,7,4,1,4,5.60,5.85,5.85,5.85,'7861002830865','7861002830865',0,'2020-03-01 11:19:53',1,'ACTIVO'),(1702,2524,5,25,1,25,0.40,0.50,0.50,0.50,'500802','500802',0,'2020-03-01 11:21:14',1,'ACTIVO'),(1703,2529,7,4,1,4,2.50,2.60,2.60,2.60,'7861002831138','7861002831138',0,'2020-03-01 11:22:04',1,'ACTIVO'),(1704,2528,7,6,1,6,1.10,1.18,1.18,1.18,'7861002830728','7861002830728',0,'2020-03-01 11:23:59',1,'ACTIVO'),(1705,2525,5,37,1,37,0.40,0.50,0.50,0.50,'500102','500102',0,'2020-03-01 11:29:23',1,'ACTIVO'),(1706,2526,5,33,1,33,0.15,0.25,0.25,0.25,'500101','500101',0,'2020-03-01 11:30:25',1,'ACTIVO'),(1707,817,5,34,1,34,0.15,0.25,0.25,0.25,'500002','500002',0,'2020-03-01 11:31:41',1,'ACTIVO'),(1708,818,5,65,1,65,0.40,0.50,0.50,0.50,'500001','500001',0,'2020-03-01 11:32:42',1,'ACTIVO'),(1709,846,5,6,1,6,1.00,1.25,1.25,1.25,'500003','500003',0,'2020-03-01 11:33:53',1,'ACTIVO'),(1710,2534,5,4,1,4,0.80,1.00,1.00,1.00,'500303','500303',0,'2020-03-01 11:39:19',1,'ACTIVO'),(1711,2026,7,2,1,2,1.60,1.75,1.75,1.75,'7861032291551','7861032291551',0,'2020-03-01 11:39:20',1,'ACTIVO'),(1712,2533,5,25,1,25,0.50,0.60,0.60,0.60,'500302','500302',0,'2020-03-01 11:41:29',1,'ACTIVO'),(1713,2032,7,9,1,9,2.10,2.35,2.35,2.35,'7702521105969','7702521105969',0,'2020-03-01 11:42:24',1,'ACTIVO'),(1714,827,5,24,1,24,0.15,0.25,0.25,0.25,'500301','500301',0,'2020-03-01 11:43:12',1,'ACTIVO'),(1715,835,5,25,1,25,0.40,0.50,0.50,0.50,'500702','500702',0,'2020-03-01 11:45:51',1,'ACTIVO'),(1716,834,5,32,1,32,0.15,0.25,0.25,0.25,'500701','500701',0,'2020-03-01 11:47:02',1,'ACTIVO'),(1717,2035,7,9,1,9,2.20,2.35,2.35,2.35,'7702521106034','7702521106034',0,'2020-03-01 11:47:31',1,'ACTIVO'),(1718,829,5,30,1,30,0.15,0.25,0.25,0.25,'500501','500501',0,'2020-03-01 11:49:19',1,'ACTIVO'),(1719,2034,7,4,1,4,2.20,2.35,2.35,2.35,'7702521105860','7702521105860',0,'2020-03-01 11:50:56',1,'ACTIVO'),(1720,830,5,30,1,30,0.40,0.50,0.50,0.50,'500503','500503',0,'2020-03-01 11:51:38',1,'ACTIVO'),(1721,2037,7,3,1,1,2.20,2.35,2.35,2.35,'7702521105884','7702521105884',0,'2020-03-01 11:52:26',1,'ACTIVO'),(1722,2532,5,10,1,10,0.80,1.00,1.00,1.00,'500502','500502',0,'2020-03-01 11:52:53',1,'ACTIVO'),(1723,2030,7,4,1,4,2.90,3.00,3.10,3.10,'7861032237504','7861032237504',0,'2020-03-01 11:54:33',1,'ACTIVO'),(1724,838,5,7,1,7,0.80,1.00,1.00,1.00,'500903','500903',0,'2020-03-01 12:04:31',1,'ACTIVO'),(1725,839,5,32,1,32,0.40,0.50,0.50,0.50,'500902','500902',0,'2020-03-01 12:12:44',1,'ACTIVO'),(1726,840,5,50,1,50,0.15,0.25,0.25,0.25,'500901','500901',0,'2020-03-01 12:14:28',1,'ACTIVO'),(1727,848,5,8,1,8,2.25,2.50,2.50,2.50,'500904','500904',0,'2020-03-01 12:19:24',1,'ACTIVO'),(1728,673,7,3,1,9,1.60,1.70,1.70,1.70,'7861013736095','7861013736095',0,'2020-03-01 12:46:55',1,'ACTIVO'),(1729,627,13,2,1,2,1.60,1.75,1.75,1.75,'7861010401057','7861010401057',0,'2020-03-01 12:48:44',1,'ACTIVO'),(1730,643,7,1,1,1,1.60,1.75,1.75,1.75,'7861010400753','7861010400753',0,'2020-03-01 12:50:07',1,'ACTIVO'),(1731,501,7,3,1,3,0.50,0.60,0.60,0.60,'7861018601275','7861018601275',0,'2020-03-01 12:53:06',1,'ACTIVO'),(1732,2541,7,11,1,11,0.70,0.85,0.85,0.85,'7861010400906','7861010400906',0,'2020-03-01 12:55:40',1,'ACTIVO'),(1733,2536,7,5,1,5,1.40,1.50,1.50,1.50,'7861018601688','7861018601688',0,'2020-03-01 12:59:34',1,'ACTIVO'),(1734,2538,20,2,1,2,1.00,1.20,1.20,1.20,'7851007310761','7851007310761',0,'2020-03-01 13:00:03',1,'ACTIVO'),(1735,2539,20,11,1,11,1.80,2.00,2.00,2.00,'7861007312168','7861007312168',0,'2020-03-01 13:01:48',1,'ACTIVO'),(1736,597,7,6,1,6,1.25,1.50,1.50,1.50,'7861010403464','7861010403464',0,'2020-03-01 13:02:19',1,'ACTIVO'),(1737,2540,20,5,1,5,0.80,1.00,1.00,1.00,'7861007310157','7861007310157',0,'2020-03-01 13:04:30',1,'ACTIVO'),(1738,569,7,7,1,7,0.55,0.62,0.62,0.62,'7861010409213','7861010409213',0,'2020-03-01 13:05:28',1,'ACTIVO'),(1739,2542,20,7,1,7,1.00,1.25,1.25,1.25,'7861007312656','7861007312656',0,'2020-03-01 13:06:33',1,'ACTIVO'),(1740,2537,7,6,1,6,0.55,0.65,0.65,0.65,'7861018602555','7861018602555',0,'2020-03-01 13:06:39',1,'ACTIVO'),(1741,2543,20,4,1,4,0.80,1.00,1.00,1.00,'7861007312250','7861007312250',0,'2020-03-01 13:08:26',1,'ACTIVO'),(1742,441,7,17,1,17,0.70,0.80,0.80,0.80,'7861018601312','7861018601312',0,'2020-03-01 13:09:28',1,'ACTIVO'),(1743,2544,20,4,1,4,0.80,1.00,1.00,1.00,'7861007312151','7861007312151',1,'2020-03-01 13:09:55',1,'ACTIVO'),(1744,647,7,2,1,2,0.95,1.05,1.05,1.05,'7861010403839','7861010403839',0,'2020-03-01 13:12:40',1,'ACTIVO'),(1745,2545,20,4,1,4,1.30,1.50,1.50,1.50,'7861007312403','7861007312403',0,'2020-03-01 13:14:46',1,'ACTIVO'),(1746,2544,20,7,1,7,1.35,1.45,1.45,1.45,'7861007312151','7861007312151',0,'2020-03-01 13:16:16',1,'ACTIVO'),(1747,2546,13,4,1,4,4.00,4.50,4.50,4.50,'7501051101003','7501051101003',0,'2020-03-01 13:18:12',1,'ACTIVO'),(1748,2011,11,1,1,1,3.40,3.80,3.80,3.80,'7861032241969','7861032241969',0,'2020-03-01 13:21:28',1,'ACTIVO'),(1749,2025,4,4,1,4,2.00,2.40,2.40,2.40,'7861032240504','7861032240504',0,'2020-03-01 13:22:55',1,'ACTIVO'),(1750,2006,15,1,1,1,2.50,3.00,3.00,3.00,'7862102661007','7862102661007',0,'2020-03-01 13:24:19',1,'ACTIVO'),(1751,2009,11,3,1,3,1.10,1.40,1.40,1.40,'7861032241990','7861032241990',0,'2020-03-01 13:26:40',1,'ACTIVO'),(1752,789,10,2,1,2,2.00,2.25,2.25,2.25,'7861029404957','7861029404957',0,'2020-03-01 13:32:33',1,'ACTIVO'),(1753,2547,13,2,1,2,2.30,2.65,2.65,2.65,'7861010403204','7861010403204',0,'2020-03-01 13:33:57',1,'ACTIVO'),(1754,2552,7,6,1,6,0.60,0.70,0.70,0.70,'7861010409244','7861010409244',0,'2020-03-01 13:43:36',1,'ACTIVO'),(1755,2553,7,3,1,3,2.00,2.25,2.25,2.25,'7861010406878','7861010406878',0,'2020-03-01 13:45:08',1,'ACTIVO'),(1756,2550,7,2,1,2,0.85,0.95,0.95,0.95,'7861018602876','7861018602876',0,'2020-03-01 13:46:42',1,'ACTIVO'),(1757,2548,7,2,1,2,0.90,1.00,1.00,1.00,'7861033690568','7861033690568',0,'2020-03-01 13:49:12',1,'ACTIVO'),(1758,2556,9,3,1,3,3.50,3.90,3.90,3.90,'7861029405107','7861029405107',0,'2020-03-01 13:50:22',1,'ACTIVO'),(1759,2554,9,6,1,6,1.15,1.35,1.35,1.35,'7861029401642','7861029401642',0,'2020-03-01 13:51:30',1,'ACTIVO'),(1760,2559,11,7,1,7,1.20,1.40,1.40,1.40,'7861032242010','7861032242010',0,'2020-03-01 13:53:18',1,'ACTIVO'),(1761,2586,5,1,1,1,3.00,3.50,3.50,3.50,'7862122700731','7862122700731',0,'2020-03-01 14:52:37',1,'ACTIVO'),(1762,2584,5,1,1,1,2.00,2.50,2.50,2.50,'7862106457415','7862106457415',0,'2020-03-01 14:53:23',1,'ACTIVO'),(1763,2583,5,8,1,8,3.50,4.00,4.00,4.00,'7861091133144','7861091133144',0,'2020-03-01 14:54:13',1,'ACTIVO'),(1764,2581,7,1,1,1,1.80,2.00,2.00,2.00,'7622210872975','7622210872975',0,'2020-03-01 14:55:20',1,'ACTIVO'),(1765,2580,7,2,1,2,1.80,2.00,2.00,2.00,'7622210665362','7622210665362',0,'2020-03-01 14:56:08',1,'ACTIVO'),(1766,2578,7,5,1,5,1.80,2.00,2.00,2.00,'7590011105106','7590011105106',0,'2020-03-01 14:57:13',1,'ACTIVO'),(1767,2582,5,1,1,1,2.50,3.00,3.00,3.00,'7702011051851','7702011051851',0,'2020-03-01 14:58:03',1,'ACTIVO'),(1768,2579,7,2,1,2,1.80,2.00,2.00,2.00,'7750168001694','7750168001694',0,'2020-03-01 14:59:05',1,'ACTIVO'),(1769,2592,7,3,1,3,1.80,2.10,2.10,2.10,'7702025185344','7702025185344',0,'2020-03-01 15:01:18',1,'ACTIVO'),(1770,2594,16,19,1,19,0.20,0.25,0.25,0.25,'7862117320814','7862117320814',0,'2020-03-01 15:03:33',1,'ACTIVO'),(1771,2595,16,11,1,11,2.00,0.25,0.25,0.25,'7862117320821','7862117320821',0,'2020-03-01 15:04:24',1,'ACTIVO'),(1772,2599,7,1,1,1,2.00,2.20,2.20,2.20,'7861091131874','7861091131874',0,'2020-03-01 15:06:48',1,'ACTIVO'),(1773,2608,7,3,1,3,2.40,2.60,2.60,2.60,'7702025186136','7702025186136',0,'2020-03-01 15:43:08',1,'ACTIVO'),(1774,2607,7,12,1,12,1.80,2.00,2.00,2.00,'7702025113132','7702025113132',0,'2020-03-01 15:44:24',1,'ACTIVO'),(1775,2606,7,3,1,3,2.50,2.80,2.80,2.80,'7702025189243','7708085129243',0,'2020-03-01 15:46:26',1,'ACTIVO'),(1776,2591,5,2,1,2,1.80,2.20,2.20,2.20,'7862106455558','7862106455558',0,'2020-03-01 15:55:17',1,'ACTIVO'),(1777,2593,5,10,1,10,1.80,2.20,2.20,2.20,'7862106455541','7862106455541',0,'2020-03-01 15:56:36',1,'ACTIVO'),(1778,2604,5,1,1,1,4.00,5.00,5.00,5.00,'7861002900070','7861002900070',0,'2020-03-01 15:57:55',1,'ACTIVO'),(1779,2601,5,1,1,1,2.00,2.50,2.50,2.50,'7702011303417','7702011303417',0,'2020-03-01 15:59:31',1,'ACTIVO'),(1780,2602,5,1,1,1,1.80,2.00,2.00,2.00,'7862106458153','7862106458153',0,'2020-03-01 16:00:47',1,'ACTIVO'),(1781,2600,5,1,1,1,2.00,2.50,2.50,2.50,'7702011304087','7702011304087',0,'2020-03-01 16:02:20',1,'ACTIVO'),(1782,2596,5,1,1,1,1.80,2.25,2.25,2.25,'7757174009669','7757174009669',0,'2020-03-01 16:04:15',1,'ACTIVO'),(1783,2605,5,1,1,1,2.50,2.65,2.65,2.65,'7861091134356','7861091134356',0,'2020-03-01 16:05:30',1,'ACTIVO'),(1784,2598,5,1,1,1,1.80,2.25,2.25,2.25,'7862106456159','7862106456159',0,'2020-03-01 16:06:55',1,'ACTIVO'),(1785,2603,5,1,1,1,1.00,1.25,1.25,1.25,'7862122701554','7862122701554',0,'2020-03-01 16:08:38',1,'ACTIVO'),(1786,2613,20,71,1,71,0.30,0.40,0.40,0.40,'7861049510508','7861049510508',0,'2020-03-01 16:10:48',1,'ACTIVO'),(1787,2612,20,44,1,44,0.15,0.20,0.20,0.20,'7861049510201','7861049510201',0,'2020-03-01 16:12:20',1,'ACTIVO'),(1788,2614,16,5,1,5,0.25,0.30,0.30,0.30,'7790580415648','7790580415648',0,'2020-03-01 16:14:28',1,'ACTIVO'),(1789,2590,16,16,1,26,0.20,0.25,0.25,0.25,'7861015111661','7861015111661',0,'2020-03-01 16:16:58',1,'ACTIVO'),(1790,2574,13,13,1,13,0.40,0.50,0.50,0.50,'7622210626837','7622210626837',0,'2020-03-01 16:23:34',1,'ACTIVO'),(1791,1315,13,15,1,15,0.40,0.50,0.50,0.50,'7622210473554','7622210473554',0,'2020-03-01 16:26:11',1,'ACTIVO'),(1792,2590,16,60,1,88,0.25,0.30,0.30,0.30,'7861001238839','7861001238839',0,'2020-03-01 16:26:22',1,'ACTIVO'),(1793,1319,13,5,1,5,0.40,0.50,0.50,0.50,'7622210473479','7622210473479',0,'2020-03-01 16:27:08',1,'ACTIVO'),(1794,1309,13,3,1,3,0.40,0.50,0.50,0.50,'7622210473547','7622210473547',0,'2020-03-01 16:28:22',1,'ACTIVO'),(1795,2589,16,43,1,71,0.25,0.30,0.30,0.30,'7861001200416','7861001200416',0,'2020-03-01 16:29:05',1,'ACTIVO'),(1796,1288,13,12,1,12,0.40,0.50,0.50,0.50,'7702133862809','7702133862809',0,'2020-03-01 16:30:14',1,'ACTIVO'),(1797,2588,16,43,1,43,0.25,0.30,0.30,0.30,'7861001201611','7861001201611',0,'2020-03-01 16:30:42',1,'ACTIVO'),(1798,2577,13,11,1,11,0.40,0.50,0.50,0.50,'7702133862816','7702133862816',0,'2020-03-01 16:31:24',1,'ACTIVO'),(1799,2609,16,8,1,8,0.25,0.30,0.30,0.30,'7861001200393','7861001200393',0,'2020-03-01 16:32:54',1,'ACTIVO'),(1800,2611,16,15,1,15,0.20,0.25,0.25,0.25,'7861015111678','7861015111678',0,'2020-03-01 16:33:52',1,'ACTIVO'),(1801,2615,20,7,1,7,0.15,0.20,0.20,0.20,'7862104010346','7862104010346',0,'2020-03-01 16:36:59',1,'ACTIVO'),(1802,2616,7,30,1,30,0.40,0.50,0.50,0.50,'7862122701486','7862122701486',0,'2020-03-01 16:39:30',1,'ACTIVO'),(1803,1295,16,10,1,10,0.40,0.50,0.50,0.50,'7702133862793','7702133862793',0,'2020-03-01 16:39:51',1,'ACTIVO'),(1804,2576,16,6,1,6,0.40,0.50,0.50,0.50,'7702133867071','7702133867071',0,'2020-03-01 16:41:34',1,'ACTIVO'),(1805,2618,7,31,1,31,0.40,0.50,0.50,0.50,'7862182701419','7862122701479',0,'2020-03-01 16:43:53',1,'ACTIVO'),(1806,1285,16,32,1,32,0.20,0.25,0.25,0.25,'7702133862861','7702133862861',0,'2020-03-01 16:43:55',1,'ACTIVO'),(1807,1294,16,10,1,10,0.20,0.25,0.25,0.25,'7702133867101','7702133867101',0,'2020-03-01 16:45:04',1,'ACTIVO'),(1808,2619,16,20,1,20,0.30,0.40,0.40,0.40,'7861004911258','7861004911258',0,'2020-03-01 16:45:18',1,'ACTIVO'),(1809,1283,16,36,1,36,0.20,0.25,0.25,0.25,'7702133862854','7702133862854',0,'2020-03-01 16:46:21',1,'ACTIVO'),(1810,1293,16,15,1,15,0.20,0.25,0.25,0.25,'7702133863264','7702133863264',0,'2020-03-01 16:48:08',1,'ACTIVO'),(1811,2620,7,33,1,33,0.30,0.40,0.40,0.40,'7861004911937','7861004911937',0,'2020-03-01 16:48:44',1,'ACTIVO'),(1812,2622,5,3,1,3,1.80,2.00,2.00,2.00,'7861091140425','7861091140425',0,'2020-03-01 17:04:05',1,'ACTIVO'),(1813,2621,5,1,1,1,1.80,2.00,2.00,2.00,'7861091199881','7861091199881',0,'2020-03-01 17:05:46',1,'ACTIVO'),(1814,2623,5,3,1,3,1.80,2.00,2.00,2.00,'7861091199898','7861091199898',0,'2020-03-01 17:13:10',1,'ACTIVO'),(1815,2626,16,6,1,6,0.40,0.45,0.45,0.45,'7613031291441','7613031291441',0,'2020-03-01 17:28:21',1,'ACTIVO'),(1816,2629,16,8,1,8,0.35,0.00,0.40,0.40,'7861004830412','7861004830412',0,'2020-03-01 17:29:40',1,'ACTIVO'),(1817,2627,16,13,1,13,0.35,0.40,0.40,0.40,'7861004830399','7861004830399',0,'2020-03-01 17:33:20',1,'ACTIVO'),(1818,2624,7,5,1,5,0.30,0.40,0.40,0.40,'7702025182183','7702025182183',0,'2020-03-01 17:34:51',1,'ACTIVO'),(1819,2630,16,17,1,17,0.30,0.40,0.40,0.40,'7861004830405','7861004830405',0,'2020-03-01 17:36:06',1,'ACTIVO'),(1820,1986,16,35,35,35,0.30,0.30,0.35,0.35,'7622210539656','7622210539656',0,'2020-03-01 17:41:03',1,'ACTIVO'),(1821,2575,4,8,1,8,0.60,0.65,0.65,0.65,'78934696','78934696',0,'2020-03-01 17:42:59',1,'ACTIVO'),(1822,2565,4,6,1,6,0.50,0.65,0.65,0.65,'78600010','78600010',0,'2020-03-01 17:44:24',1,'ACTIVO'),(1823,2568,4,5,1,5,0.50,0.65,0.65,0.65,'77965363','77965363',0,'2020-03-01 17:45:30',1,'ACTIVO'),(1824,2566,4,2,1,2,0.50,0.65,0.65,0.65,'78600027','78600027',0,'2020-03-01 17:46:16',1,'ACTIVO'),(1825,2571,4,6,1,6,0.50,0.65,0.65,0.65,'78938533','78938533',0,'2020-03-01 17:47:21',1,'ACTIVO'),(1826,2631,7,8,1,8,0.25,0.30,0.30,0.30,'7702025103157','7702025103157',0,'2020-03-01 17:48:38',1,'ACTIVO'),(1827,2625,7,18,1,18,0.35,0.40,0.40,0.40,'7702025182206','7702025182206',0,'2020-03-01 17:50:45',1,'ACTIVO'),(1828,2632,15,48,3,48,6.65,7.50,7.50,7.50,'7861210700493','7861210700493',0,'2020-03-01 21:12:36',1,'ACTIVO'),(1829,2633,5,20,1,20,0.40,0.50,0.50,0.50,'100001197','100001197',0,'2020-03-01 21:16:22',1,'ACTIVO'),(1830,2634,16,46,1,46,0.15,0.20,0.20,0.20,'100001113','100001113',0,'2020-03-01 21:21:37',1,'ACTIVO'),(1831,1476,15,1,1,1,5.00,6.00,6.00,6.00,'7861001231991','7861001231991',0,'2020-03-01 21:31:48',1,'ACTIVO'),(1832,2636,20,48,1,48,0.10,0.15,0.15,0.15,'100001199','100001199',0,'2020-03-01 21:42:10',1,'ACTIVO'),(1833,2637,5,12,1,12,0.40,0.50,0.50,0.50,'100001200','100001200',0,'2020-03-01 21:44:09',1,'ACTIVO'),(1834,152,11,1,1,1,2.80,3.00,3.00,3.00,'070847009184','070847009184',0,'2020-03-01 21:49:09',1,'ACTIVO'),(1835,175,2,2,3,2,0.80,1.00,1.00,1.00,'759494000323','759494000323',0,'2020-03-01 21:50:38',1,'ACTIVO'),(1836,2638,2,4,1,4,1.60,1.75,1.75,1.75,'7862109432259','7862109432259',0,'2020-03-01 22:01:55',1,'ACTIVO'),(1837,2640,2,46,1,46,1.15,1.25,1.25,1.25,'7861075200169','7861075200169',0,'2020-03-01 22:38:43',1,'ACTIVO'),(1838,1670,5,17,1,17,0.40,0.50,0.50,0.50,'7861026004235','7861026004235',0,'2020-03-01 23:02:43',1,'ACTIVO'),(1839,731,6,43,1,43,0.23,0.40,0.40,0.40,'200101','200101',0,'2020-03-02 08:39:33',1,'ACTIVO'),(1840,2643,16,9,1,9,0.50,0.60,0.60,0.60,'7702010320279','7702010320279',0,'2020-03-02 09:20:34',1,'ACTIVO'),(1841,2648,4,6,1,6,1.30,1.40,1.40,1.40,'7861036713158','7861036713158',1,'2020-03-02 09:36:34',1,'ACTIVO'),(1842,2645,7,10,10,10,0.50,0.60,0.60,0.60,'100001202','100001202',0,'2020-03-02 09:37:15',1,'ACTIVO'),(1843,2647,4,6,1,6,1.50,1.60,1.60,1.60,'7861036713127','7861036713127',0,'2020-03-02 09:38:18',1,'ACTIVO'),(1844,2646,7,10,10,10,0.50,0.60,0.60,0.60,'100001203','100001203',0,'2020-03-02 09:40:48',1,'ACTIVO'),(1845,2644,7,10,10,10,0.50,0.60,0.60,0.60,'100001189','100001189',0,'2020-03-02 09:41:39',1,'ACTIVO'),(1846,903,5,24,24,24,0.90,0.95,0.95,0.95,'7861002002583','7861002002583',0,'2020-03-02 09:43:00',1,'ACTIVO'),(1847,2649,7,11,1,11,0.50,0.60,0.60,0.60,'7861064809205','7861064809205',0,'2020-03-02 09:46:41',1,'ACTIVO'),(1848,1796,16,14,1,14,0.30,0.35,0.35,0.35,'7590011251100','7590011251100',0,'2020-03-02 09:54:42',1,'ACTIVO'),(1849,2650,7,26,1,26,1.50,1.70,1.70,1.70,'7861010901434','7861010901434',0,'2020-03-02 09:58:18',1,'ACTIVO'),(1850,1794,7,7,1,7,0.30,0.35,0.35,3.50,'7702133006692','7702133006692',0,'2020-03-02 10:01:34',1,'ACTIVO'),(1851,1782,7,6,1,6,0.30,0.35,0.35,0.35,'7622210754547','7622210754547',0,'2020-03-02 10:02:50',1,'ACTIVO'),(1852,1783,7,10,1,10,0.30,0.35,0.35,0.35,'7622210110244','7622210110244',0,'2020-03-02 10:04:34',1,'ACTIVO'),(1853,1797,7,19,1,19,0.40,0.45,0.45,0.45,'7622300444884','7622300444884',0,'2020-03-02 10:06:42',1,'ACTIVO'),(1854,1781,7,9,1,9,0.40,0.45,0.45,0.45,'7702133006715','7702133006715',0,'2020-03-02 10:10:41',1,'ACTIVO'),(1855,2651,7,27,1,27,1.00,1.25,1.25,1.25,'100001191','100001191',0,'2020-03-02 10:27:12',1,'ACTIVO'),(1856,2652,7,32,1,32,0.60,0.70,0.70,0.70,'7868000654332','7868000654332',0,'2020-03-02 10:34:38',1,'ACTIVO'),(1857,2653,7,35,1,35,6.00,0.70,0.70,0.70,'7861000172592','7861000172509',0,'2020-03-02 10:38:47',1,'ACTIVO'),(1858,1161,11,252,1,252,1.00,1.20,1.20,1.20,'7862119505691','7862119505691',0,'2020-03-02 10:50:47',1,'ACTIVO'),(1859,2655,11,27,1,27,0.70,0.80,0.80,0.80,'100001193','100001193',0,'2020-03-02 11:01:21',1,'ACTIVO'),(1860,2654,7,1,1,1,2.80,3.00,3.00,3.00,'1000603','1000603',0,'2020-03-02 11:09:37',1,'ACTIVO'),(1861,2656,7,100,100,100,0.80,1.00,1.00,1.00,'1000602','1000602',0,'2020-03-02 11:10:23',1,'ACTIVO'),(1862,2657,7,100,100,100,0.40,0.50,0.50,0.50,'1000601','1000601',0,'2020-03-02 11:11:14',1,'ACTIVO'),(1863,2659,5,30,1,30,0.40,0.50,0.50,0.50,'1000002','1000002',0,'2020-03-02 11:15:59',1,'ACTIVO'),(1864,2660,5,24,1,24,0.70,0.80,0.80,0.80,'1000003','1000003',0,'2020-03-02 11:17:13',1,'ACTIVO'),(1865,2658,5,18,1,18,1.50,1.60,1.60,1.60,'1000006','1000006',0,'2020-03-02 11:18:35',1,'ACTIVO'),(1866,2661,5,6,1,6,2.25,2.40,2.40,2.40,'1000004','1000004',0,'2020-03-02 11:19:45',1,'ACTIVO'),(1867,2662,5,5,1,5,3.80,4.00,4.00,4.00,'1000005','1000005',0,'2020-03-02 11:20:51',1,'ACTIVO'),(1868,904,5,4,1,4,0.25,0.30,0.30,0.30,'7861002011462','7861002011462',0,'2020-03-02 13:26:36',1,'ACTIVO'),(1869,1959,16,4,1,4,0.20,0.25,0.25,0.25,'7861124400311','7861124400311',0,'2020-03-02 13:47:02',1,'ACTIVO'),(1870,2669,5,64,1,1,0.15,0.20,0.20,0.20,'300001','300001',0,'2020-03-02 13:49:08',1,'ACTIVO'),(1871,2670,5,33,1,33,0.35,0.40,0.40,0.40,'300002','300002',0,'2020-03-02 13:51:10',1,'ACTIVO'),(1872,2671,5,11,1,11,1.15,1.20,1.20,1.20,'300005','300005',0,'2020-03-02 13:53:02',1,'ACTIVO'),(1873,2672,5,9,1,9,1.80,2.00,2.00,2.00,'300003','300003',0,'2020-03-02 13:56:00',1,'ACTIVO'),(1874,2663,7,20,20,20,0.35,0.40,0.40,0.40,'7861023206144','7861023206144',0,'2020-03-02 14:11:18',1,'ACTIVO'),(1875,2675,24,5,1,5,2.15,2.25,2.25,2.25,'78923454','78923454',0,'2020-03-02 14:18:18',1,'ACTIVO'),(1876,2676,7,6,1,6,0.50,0.60,0.60,0.60,'7861009942905','7861009942905',0,'2020-03-02 14:57:19',1,'ACTIVO'),(1877,164,2,4,1,4,1.25,1.35,1.35,1.35,'7861024625418','7861024625418',0,'2020-03-02 15:12:48',1,'ACTIVO'),(1878,166,2,5,1,1,0.35,0.40,0.40,0.40,'7861024621076','7861024621076',0,'2020-03-02 15:20:47',1,'ACTIVO'),(1879,167,2,14,1,14,0.55,0.60,0.60,0.60,'7861024624725','7861024624725',0,'2020-03-02 15:22:14',1,'ACTIVO'),(1880,165,2,12,1,12,0.20,0.25,0.25,0.25,'7861024624091','7861024624091',0,'2020-03-02 15:23:26',1,'ACTIVO'),(1881,2677,7,26,1,26,0.40,0.50,0.50,0.50,'7862122701462','7862122701462',0,'2020-03-02 15:30:17',1,'ACTIVO'),(1882,721,5,18,1,18,0.90,1.00,1.00,1.00,'7861036715701','7861036715701',0,'2020-03-02 15:40:26',1,'ACTIVO'),(1883,1810,7,8,1,8,0.40,0.50,0.50,0.50,'7622210185112','7622210185112',0,'2020-03-02 15:56:39',1,'ACTIVO'),(1884,1811,7,4,1,4,0.40,0.50,0.50,0.50,'7622210185105','7622210185105',0,'2020-03-02 16:01:27',1,'ACTIVO'),(1885,2678,4,24,1,24,0.60,0.75,0.75,0.75,'7751851004916','7751851004916',0,'2020-03-02 16:35:50',1,'ACTIVO'),(1886,2679,7,24,1,24,0.60,0.75,0.75,0.75,'7751851004886','7751851004886',0,'2020-03-02 16:40:50',1,'ACTIVO'),(1887,1808,7,9,1,9,0.30,0.40,0.40,0.40,'7622210185143','7622210185143',0,'2020-03-02 16:42:57',1,'ACTIVO'),(1888,2680,2,90,1,90,0.15,0.25,0.25,0.25,'7751851028585','7751851028585',0,'2020-03-02 16:49:23',1,'ACTIVO'),(1889,224,2,3,1,3,2.70,3.00,3.00,3.00,'7861048610117','7861048610117',0,'2020-03-02 17:15:32',1,'ACTIVO'),(1890,2329,2,20,1,20,0.80,1.00,1.00,1.00,'7862106704304','7862106704304',0,'2020-03-02 17:18:13',1,'ACTIVO'),(1891,2683,10,2,1,2,0.90,1.00,1.00,1.00,'7861029401611','7861029401611',0,'2020-03-02 18:58:07',1,'ACTIVO'),(1892,2684,10,17,1,17,0.90,1.00,1.00,1.00,'7861029405848','7861029405848',0,'2020-03-02 19:07:33',1,'ACTIVO'),(1893,2681,7,20,20,20,0.30,0.35,0.35,0.35,'7861023206137','7861023206137',0,'2020-03-02 19:32:20',1,'ACTIVO'),(1894,1807,7,40,1,40,0.35,0.40,0.40,0.40,'7622210185150','7622210185150',0,'2020-03-02 19:33:13',1,'ACTIVO'),(1895,1329,7,19,1,19,0.15,0.20,0.20,0.20,'7501056900151','7501056900151',0,'2020-03-02 19:36:42',1,'ACTIVO'),(1896,2685,7,65,65,65,0.50,0.60,0.60,0.60,'7750243037563','7750243037563',0,'2020-03-02 19:42:13',1,'ACTIVO'),(1897,388,5,40,1,40,0.50,0.60,0.60,0.60,'7750243037556','7750243037556',0,'2020-03-02 19:43:02',1,'ACTIVO'),(1898,2686,2,4,4,4,1.40,1.50,1.50,1.50,'7861024607896','7861024607896',0,'2020-03-02 19:52:16',1,'ACTIVO'),(1899,2687,6,10,1,10,3.00,3.50,3.50,3.50,'100001001001','100001001001',0,'2020-03-03 00:45:07',1,'ACTIVO'),(1900,2688,6,10,1,10,3.00,3.50,3.50,3.50,'100001001002','100001001002',0,'2020-03-03 00:49:12',1,'ACTIVO'),(1901,2689,6,10,1,10,2.00,2.50,2.50,2.50,'100001001003','100001001003',0,'2020-03-03 00:54:00',1,'ACTIVO'),(1902,2690,6,10,1,10,3.00,3.50,3.50,3.50,'100001001004','100001001004',0,'2020-03-03 00:57:48',1,'ACTIVO'),(1903,2691,6,10,1,10,3.00,3.50,3.50,3.50,'100001001005','100001001005',0,'2020-03-03 01:06:25',1,'ACTIVO'),(1904,2692,6,10,1,10,2.80,3.30,3.30,3.30,'100001001006','100001001006',0,'2020-03-03 01:12:52',1,'ACTIVO'),(1905,2693,6,10,1,10,1.50,1.80,1.80,1.80,'100001001007','100001001007',0,'2020-03-03 01:18:38',1,'ACTIVO'),(1906,2694,6,10,1,10,3.00,3.30,3.30,3.30,'100001001008','100001001008',0,'2020-03-03 01:32:10',1,'ACTIVO'),(1907,2695,6,20,1,20,2.40,2.70,2.70,2.70,'100001001009','100001001009',0,'2020-03-03 01:37:16',1,'ACTIVO'),(1908,2696,6,20,1,20,2.40,2.80,2.80,2.80,'100001001010','100001001010',0,'2020-03-03 01:43:00',1,'ACTIVO'),(1909,2697,6,20,1,20,1.00,1.20,1.20,1.20,'100001001011','100001001011',0,'2020-03-03 01:54:17',1,'ACTIVO'),(1910,2698,6,20,1,20,1.30,1.50,1.50,1.50,'100001001012','100001001012',0,'2020-03-03 02:04:16',1,'ACTIVO'),(1911,2700,6,20,1,20,1.50,2.00,2.00,2.00,'100001001014','100001001014',0,'2020-03-03 02:15:43',1,'ACTIVO'),(1912,2701,6,20,1,20,1.70,2.00,2.00,2.00,'100001001015','100001001015',0,'2020-03-03 02:20:12',1,'ACTIVO'),(1913,2702,6,20,1,20,0.30,0.40,0.40,0.40,'100001001016','100001001016',0,'2020-03-03 02:31:08',1,'ACTIVO'),(1914,2703,6,20,1,20,2.20,2.50,2.50,2.50,'100001001017','100001001017',0,'2020-03-03 02:39:11',1,'ACTIVO'),(1915,2704,2,5,1,5,0.40,0.50,0.50,0.50,'095188995002','095188995002',0,'2020-03-03 07:11:48',1,'ACTIVO'),(1916,1,5,8,1,8,0.60,0.75,0.75,0.75,'7861002305561','7861002305561',0,'2020-03-03 07:30:22',1,'ACTIVO'),(1917,47,5,12,1,12,2.50,2.70,2.70,2.70,'100001192','100001192',0,'2020-03-03 08:15:33',1,'ACTIVO'),(1918,716,5,25,1,25,0.80,1.00,1.00,1.00,'7406171030342','7406171030342',0,'2020-03-03 08:19:08',1,'ACTIVO'),(1919,715,5,18,1,18,0.80,1.00,1.00,1.00,'7406171030359','7406171030359',0,'2020-03-03 08:23:10',1,'ACTIVO'),(1920,2699,6,20,1,20,1.35,1.60,1.60,1.60,'100001001013','100001001013',0,'2020-03-03 08:41:40',1,'ACTIVO'),(1921,2705,5,29,1,29,0.40,0.50,0.50,0.50,'1000301','1000301',0,'2020-03-03 08:43:39',1,'ACTIVO'),(1922,2706,5,13,1,13,0.90,1.00,1.00,1.00,'1000302','1000302',1,'2020-03-03 08:45:19',1,'ACTIVO'),(1923,2707,5,1,1,1,2.80,3.00,3.00,3.00,'1000303','1000303',0,'2020-03-03 08:49:50',1,'ACTIVO'),(1924,2708,5,5,1,5,4.80,5.00,5.00,5.00,'1000304','1000304',0,'2020-03-03 08:54:46',1,'ACTIVO'),(1925,2709,5,6,1,6,0.50,0.60,0.60,0.60,'7861009942912','7861009942912',0,'2020-03-03 10:01:56',1,'ACTIVO'),(1926,2711,4,21,1,21,0.50,0.75,0.75,0.75,'78607392','78607392',0,'2020-03-03 10:34:43',1,'ACTIVO'),(1927,2705,5,30,1,30,0.30,0.40,0.40,0.40,'1000401','1000401',1,'2020-03-03 11:49:25',1,'ACTIVO'),(1928,2706,5,20,1,20,0.70,0.80,0.80,0.80,'1000402','1000402',0,'2020-03-03 11:50:53',1,'ACTIVO'),(1929,2707,5,6,1,6,1.00,1.20,1.20,1.20,'1000403','1000403',1,'2020-03-03 11:52:08',1,'ACTIVO'),(1930,2708,5,12,1,12,3.80,4.00,4.00,4.00,'1000404','1000404',1,'2020-03-03 11:55:26',1,'ACTIVO'),(1931,1135,5,1,1,1,0.00,1.23,1.23,1.23,'2805922004062','2805922004062',0,'2020-03-03 12:19:37',1,'ACTIVO'),(1932,1135,5,1,1,1,0.00,1.21,1.21,1.21,'2805922003973','2805922003973',0,'2020-03-03 12:20:49',1,'ACTIVO'),(1933,1135,5,1,1,1,0.00,1.77,0.00,0.00,'2805921005329','2805921005329',0,'2020-03-03 12:21:37',1,'ACTIVO'),(1934,1135,5,1,1,1,1.23,1.23,1.23,1.23,'2805922004055','2805922004055',0,'2020-03-03 12:31:23',1,'ACTIVO'),(1935,1135,5,1,1,1,1.42,1.42,1.42,1.42,'2805922004666','2805922004666',0,'2020-03-03 12:32:15',1,'ACTIVO'),(1936,1135,5,1,1,1,0.00,1.02,1.02,1.02,'2805922003379','2805922003379',0,'2020-03-03 12:34:36',1,'ACTIVO'),(1937,1135,5,1,1,1,0.00,1.27,1.27,1.27,'2805922004192','2805922004192',0,'2020-03-03 12:35:36',1,'ACTIVO'),(1938,1136,5,1,1,1,0.00,1.88,1.88,1.88,'2805921005640','2805921005640',0,'2020-03-03 12:36:24',1,'ACTIVO'),(1939,1136,5,1,1,1,0.00,1.77,1.77,1.77,'2805921005336','2805921005336',0,'2020-03-03 12:37:19',1,'ACTIVO'),(1940,1136,5,1,1,1,0.00,1.98,1.98,1.98,'2805921005961','2805921005961',0,'2020-03-03 12:38:02',1,'ACTIVO'),(1941,1136,5,1,1,1,0.00,1.65,1.65,1.65,'2805921004940','2805921004940',0,'2020-03-03 12:38:56',1,'ACTIVO'),(1942,1136,5,1,1,1,0.00,1.96,1.96,1.96,'2805921005909','2805921005909',0,'2020-03-03 12:40:00',1,'ACTIVO'),(1943,1136,5,1,1,1,0.00,1.92,1.92,1.92,'2805921005763','2805921005763',0,'2020-03-03 12:40:50',1,'ACTIVO'),(1944,1136,5,1,1,1,0.00,1.83,1.83,1.83,'2805921005510','2805921005510',0,'2020-03-03 12:44:21',1,'ACTIVO'),(1945,1136,5,1,1,1,0.00,0.00,0.00,0.00,'2805922003812','2805922003812',1,'2020-03-03 12:45:28',1,'ACTIVO'),(1946,1135,5,1,1,1,0.00,1.16,1.16,1.16,'2805922003812','2805922003812',0,'2020-03-03 12:50:41',1,'ACTIVO'),(1947,1135,5,1,1,1,0.00,1.29,1.29,1.29,'2805922004239','2805922004239',0,'2020-03-03 12:51:33',1,'ACTIVO'),(1948,1135,5,1,1,1,0.00,1.19,1.19,1.19,'2805922003911','2805922003911',0,'2020-03-03 12:52:06',1,'ACTIVO'),(1949,1135,5,1,1,1,0.00,1.12,1.12,1.12,'2805922003706','2805922003706',0,'2020-03-03 12:52:44',1,'ACTIVO'),(1950,1135,5,1,1,1,0.00,1.29,1.29,1.29,'2805922004246','2805922004246',0,'2020-03-03 12:53:34',1,'ACTIVO'),(1951,1135,5,1,1,1,0.00,1.25,1.25,1.25,'2805922004123','2805922004123',0,'2020-03-03 12:54:18',1,'ACTIVO'),(1952,1135,5,1,1,1,0.00,1.13,1.13,1.13,'2805922003737','2805922003737',0,'2020-03-03 12:54:54',1,'ACTIVO'),(1953,1135,5,1,1,1,0.00,1.27,1.27,1.27,'2805922004185','2805922004185',0,'2020-03-03 12:55:40',1,'ACTIVO'),(1954,1135,5,1,1,1,0.00,1.21,1.21,1.21,'2805922003973','2805922003973',0,'2020-03-03 12:56:23',1,'ACTIVO'),(1955,1135,5,1,1,1,0.00,1.03,1.03,1.03,'2805922003386','2805922003386',0,'2020-03-03 12:57:04',1,'ACTIVO'),(1956,1135,5,1,1,1,0.00,1.26,1.26,1.26,'2805922004147','2805922004147',0,'2020-03-03 12:58:12',1,'ACTIVO'),(1957,1136,5,1,1,1,0.00,1.98,1.98,1.98,'2805921005947','2805921005947',0,'2020-03-03 12:59:57',1,'ACTIVO'),(1958,1136,5,1,1,1,0.00,1.82,1.82,1.82,'2805921005480','2805921005480',0,'2020-03-03 13:00:33',1,'ACTIVO'),(1959,1136,5,1,1,1,0.00,1.95,1.95,1.95,'2805921005862','2805921005862',0,'2020-03-03 13:01:13',1,'ACTIVO'),(1960,1136,5,1,1,1,0.00,1.96,1.96,1.96,'2805921005909','2805921005909',0,'2020-03-03 13:02:25',1,'ACTIVO'),(1961,1136,5,1,1,1,0.00,2.20,2.20,2.20,'2805921006623','2805921006623',0,'2020-03-03 13:03:18',1,'ACTIVO'),(1962,1136,5,1,1,1,0.00,1.99,1.99,1.99,'2805921005978','2805921005978',0,'2020-03-03 13:03:49',1,'ACTIVO'),(1963,1136,5,1,1,1,0.00,1.98,1.98,1.98,'2805921005954','2805921005954',0,'2020-03-03 13:04:26',1,'ACTIVO'),(1964,1136,5,1,1,1,0.00,2.16,2.16,2.16,'2805921006494','2805921006494',0,'2020-03-03 13:05:11',1,'ACTIVO'),(1965,1135,5,1,1,1,0.00,1.10,1.10,1.10,'2805922003621','2805922003621',0,'2020-03-03 13:06:27',1,'ACTIVO'),(1966,1136,5,1,1,1,0.00,2.01,2.01,2.01,'2805921006036','2805921006036',0,'2020-03-03 13:07:27',1,'ACTIVO'),(1967,1136,5,1,1,1,0.00,1.94,1.94,1.94,'2805921005831','2805921005831',0,'2020-03-03 13:08:40',1,'ACTIVO'),(1968,1135,5,1,1,1,0.00,1.22,1.22,1.22,'2805922004000','2805922004000',0,'2020-03-03 13:10:18',1,'ACTIVO'),(1969,2502,5,5,1,5,0.00,1.99,1.99,1.99,'7861002804200','7861002804200',0,'2020-03-03 13:30:14',1,'ACTIVO'),(1970,2509,7,1,1,1,0.00,2.61,2.61,2.61,'2803756003800','2803756003800',0,'2020-03-03 13:36:41',1,'ACTIVO'),(1971,2509,7,1,1,1,0.00,3.42,3.42,3.42,'2803756004982','2803756004982',0,'2020-03-03 13:38:04',1,'ACTIVO'),(1972,2509,7,1,1,1,0.00,3.36,3.36,3.36,'2803756004906','2803756004906',0,'2020-03-03 13:39:30',1,'ACTIVO'),(1973,2509,7,1,1,1,0.00,3.01,3.01,3.01,'2803756004395','2803756004395',0,'2020-03-03 13:40:18',1,'ACTIVO'),(1974,2509,7,1,1,1,0.00,2.91,2.91,2.91,'2803756004241','2803756004241',0,'2020-03-03 13:41:52',1,'ACTIVO'),(1975,2509,7,1,1,1,0.00,3.59,3.59,3.59,'2803756005231','2803756005231',0,'2020-03-03 13:43:03',1,'ACTIVO'),(1976,2716,5,30,1,30,0.30,0.40,0.40,0.40,'1000401','1000401',0,'2020-03-03 14:24:21',1,'ACTIVO'),(1977,2717,5,18,1,18,0.70,0.80,0.80,0.80,'1000402','1000402',0,'2020-03-03 14:25:37',1,'ACTIVO'),(1978,2718,5,17,1,17,2.20,2.40,2.40,2.40,'1000403','1000403',0,'2020-03-03 14:27:14',1,'ACTIVO'),(1979,2719,5,5,1,5,3.80,4.00,4.00,4.00,'1000404','1000404',0,'2020-03-03 14:29:51',1,'ACTIVO'),(1980,1604,5,6,1,6,0.40,0.50,0.50,0.50,'7861018515756','7861018515756',0,'2020-03-03 15:24:55',1,'ACTIVO'),(1981,2720,2,3,1,3,3.21,4.00,4.00,4.00,'7702035432117','7702035432117',0,'2020-03-03 16:20:09',1,'ACTIVO'),(1982,2721,2,3,1,3,3.21,4.00,4.00,4.00,'7702035431219','7702035431219',0,'2020-03-03 16:20:52',1,'ACTIVO'),(1983,2722,17,38,1,38,0.80,1.00,1.00,1.00,'070330717534','070330717534',0,'2020-03-03 16:33:33',1,'ACTIVO'),(1984,2723,16,12,1,12,0.50,0.65,0.65,0.65,'7861021202704','7861021202704',0,'2020-03-03 17:05:35',1,'ACTIVO'),(1985,2724,16,25,1,25,0.15,0.25,0.25,0.25,'7861021207211','7861021207211',0,'2020-03-03 17:06:44',1,'ACTIVO'),(1986,2725,2,6,1,6,0.80,1.00,1.00,1.00,'759494006776','759494006776',0,'2020-03-03 17:26:44',1,'ACTIVO'),(1987,2726,2,12,1,12,0.40,0.50,0.50,0.50,'759494998316','759494998316',0,'2020-03-03 17:30:47',1,'ACTIVO'),(1988,516,5,6,1,6,0.40,0.50,0.50,0.50,'7750168000697','7750168000697',1,'2020-03-03 17:37:46',1,'ACTIVO'),(1989,516,5,6,1,6,0.40,0.50,0.50,0.00,'7750168000697','7750168000697',1,'2020-03-03 17:43:06',1,'ACTIVO'),(1990,516,5,6,1,6,0.40,0.50,0.50,0.50,'7750168000697','7750168000697',0,'2020-03-03 17:51:41',1,'ACTIVO'),(1991,2129,16,22,1,22,0.20,0.25,0.25,0.25,'7500435128131','7500435128131',0,'2020-03-03 17:56:37',1,'ACTIVO'),(1992,2727,5,5,1,5,0.50,0.60,0.60,0.60,'7861009943605','7861009943605',0,'2020-03-03 18:00:43',1,'ACTIVO'),(1993,2728,7,16,1,16,0.65,0.75,0.75,0.75,'7702425801387','7702425801387',0,'2020-03-03 18:08:09',1,'ACTIVO'),(1994,2729,7,10,10,10,0.60,0.85,0.85,0.85,'7861016401587','7861016401587',0,'2020-03-03 18:13:54',1,'ACTIVO'),(1995,2730,16,160,1,160,0.07,0.15,0.15,0.15,'7861021203657','7861021203657',0,'2020-03-03 18:16:44',1,'ACTIVO'),(1996,2732,2,3,3,3,2.50,3.00,3.00,3.00,'7861024604277','7861024604277',0,'2020-03-03 18:23:05',1,'ACTIVO'),(1997,2733,3,9,1,9,0.25,0.30,0.30,0.30,'7861004810605','7861004810605',0,'2020-03-03 18:27:00',1,'ACTIVO'),(1998,2734,3,8,1,8,0.25,0.30,0.30,0.30,'7861004810209','7861004810209',0,'2020-03-03 18:31:25',1,'ACTIVO'),(1999,2735,3,34,1,34,0.25,0.30,0.30,0.30,'7861004810506','7861004810506',0,'2020-03-03 18:33:46',1,'ACTIVO'),(2000,2736,7,3,3,3,3.46,4.50,4.50,4.50,'6952054901397','6952054901397',0,'2020-03-03 18:33:57',1,'ACTIVO'),(2001,2731,7,10,10,10,0.45,0.65,0.65,0.65,'7861016401570','7861016401570',0,'2020-03-03 18:36:25',1,'ACTIVO'),(2002,2739,7,1,1,1,0.45,0.75,0.75,0.75,'7861016401594','7861016401594',1,'2020-03-03 18:38:17',1,'ACTIVO'),(2003,2739,7,10,10,10,0.45,0.75,0.75,0.75,'7861016401600','7861016401600',0,'2020-03-03 18:38:51',1,'ACTIVO'),(2004,2740,7,10,10,10,0.45,0.75,0.75,0.75,'7861016401594','7861016401594',0,'2020-03-03 18:41:35',1,'ACTIVO'),(2005,2741,7,7,7,7,0.10,0.15,0.15,0.15,'7759826005753','7759826005753',0,'2020-03-03 18:47:51',1,'ACTIVO'),(2006,2742,7,18,18,18,0.10,0.15,0.15,0.15,'7759826006231','7759826006231',0,'2020-03-03 18:51:54',1,'ACTIVO'),(2007,2737,3,14,1,14,0.25,0.30,0.30,0.30,'7861004810803','7861004810803',0,'2020-03-03 19:16:17',1,'ACTIVO'),(2008,766,9,7,1,7,1.40,1.50,1.50,1.50,'7861029404841','7861029404841',0,'2020-03-04 08:17:49',1,'ACTIVO'),(2009,2076,16,20,1,20,0.20,0.25,0.25,0.25,'7861038061967','7861038061967',0,'2020-03-04 08:23:44',1,'ACTIVO'),(2010,2072,16,6,1,6,0.20,0.25,0.25,0.25,'7861038061950','7861038061950',0,'2020-03-04 08:25:00',1,'ACTIVO'),(2011,2743,16,7,1,7,0.20,0.25,0.25,0.25,'7861038061936','7861038061936',0,'2020-03-04 08:30:24',1,'ACTIVO'),(2012,2684,10,10,1,10,1.10,1.20,1.20,1.20,'7861029403714','7861029403714',0,'2020-03-04 08:35:30',1,'ACTIVO'),(2013,1515,5,48,1,48,1.17,1.30,1.50,1.50,'7861002561158','7861002561158',0,'2020-03-04 08:49:10',1,'ACTIVO'),(2014,2744,7,14,1,14,2.20,2.60,2.60,2.60,'7862123490815','7862123490815',0,'2020-03-04 09:27:05',1,'ACTIVO'),(2015,1536,7,4,1,4,1.60,1.80,1.80,1.80,'7861023202146','7861023202146',0,'2020-03-04 10:43:30',1,'ACTIVO'),(2016,2745,9,1,1,1,1.80,1.90,1.90,1.90,'7861001234916','7861001234916',0,'2020-03-04 11:05:38',1,'ACTIVO'),(2017,2747,10,16,16,16,0.50,0.60,0.60,0.60,'7861029404919','7861029404919',0,'2020-03-04 11:13:55',1,'ACTIVO'),(2018,2748,10,28,28,28,0.50,0.60,0.60,0.60,'7861029400393','7861029400393',0,'2020-03-04 11:33:26',1,'ACTIVO'),(2019,2749,5,2,1,2,2.92,3.50,3.50,3.50,'7861009940499','7861009940499',0,'2020-03-04 12:37:58',1,'ACTIVO'),(2020,2750,5,6,1,6,0.43,0.50,0.50,0.50,'7861065507544','7861065507544',0,'2020-03-04 12:51:50',1,'ACTIVO'),(2021,299,5,4,1,4,0.43,0.50,0.50,0.50,'7861065504178','7861065504178',0,'2020-03-04 13:01:06',1,'ACTIVO'),(2022,2752,7,4,1,4,1.90,2.80,2.80,2.80,'7702011086266','7702011086266',0,'2020-03-04 13:14:42',1,'ACTIVO'),(2023,2753,13,4,1,4,2.25,2.60,2.60,2.60,'7702993031865','7702993031865',0,'2020-03-04 13:25:15',1,'ACTIVO'),(2024,2754,7,24,1,24,0.15,0.25,0.25,0.25,'7862113730167','7862113730167',0,'2020-03-04 13:41:08',1,'ACTIVO'),(2025,2755,7,4,1,4,2.00,2.50,2.50,2.50,'7702011304063','7702011304063',0,'2020-03-04 13:51:52',1,'ACTIVO'),(2026,2756,2,1,1,1,0.90,1.00,1.00,1.00,'7861024607971','7861024607971',0,'2020-03-04 14:06:51',1,'ACTIVO'),(2027,2757,8,1,1,1,3.50,4.00,4.00,4.00,'7613036051453','7613036051453',0,'2020-03-04 14:16:33',1,'ACTIVO'),(2028,2758,16,2,1,2,1.30,1.50,1.50,1.50,'7702006202855','7702006202855',0,'2020-03-04 14:57:01',1,'ACTIVO'),(2029,2759,16,5,1,5,1.30,1.50,1.50,1.50,'7702006299664','7702006299664',0,'2020-03-04 15:04:11',1,'ACTIVO'),(2030,2760,24,1,1,1,4.50,5.00,5.00,5.00,'7861001361933','7861001361933',0,'2020-03-04 15:18:04',1,'ACTIVO'),(2031,2761,24,2,1,2,4.50,4.50,4.50,5.00,'7702006203708','7702006203708',0,'2020-03-04 15:25:27',1,'ACTIVO'),(2032,1583,4,12,1,12,0.80,1.00,1.00,1.00,'7861001362152','7861001362152',0,'2020-03-04 15:28:50',1,'ACTIVO'),(2033,1582,24,6,1,6,0.80,1.00,1.00,1.00,'7861001301465','7861001301465',0,'2020-03-04 15:30:32',1,'ACTIVO'),(2034,201,2,12,1,12,0.40,0.50,0.50,0.50,'7862106704175','7862106704175',0,'2020-03-04 15:33:23',1,'ACTIVO'),(2035,2762,2,3,1,3,0.90,1.00,1.00,1.00,'7861024621489','7861024621489',0,'2020-03-04 17:48:44',1,'ACTIVO'),(2036,2763,16,119,1,119,0.20,0.25,0.25,0.25,'6939507900725','6939507900725',0,'2020-03-04 18:12:50',1,'ACTIVO'),(2037,2764,11,4,1,4,1.20,1.40,1.40,1.40,'7861032242003','7861032242003',0,'2020-03-04 20:00:31',1,'ACTIVO'),(2038,2765,11,4,1,4,1.20,1.40,1.40,1.40,'7861032241990','7861032241990',0,'2020-03-04 20:02:57',1,'ACTIVO'),(2039,2767,11,3,1,3,3.45,3.60,3.60,3.60,'7861032241976','7861032241976',0,'2020-03-04 20:04:16',1,'ACTIVO'),(2040,2766,11,3,1,3,3.45,3.60,3.60,3.60,'7861032241983','7861032241983',0,'2020-03-04 20:05:03',1,'ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`modulo`,`descripcion`,`observacion`,`codigo`,`usuariocreacion`,`fechacreacion`,`estatus`) values (26,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:21:32','ACTIVO'),(27,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:22:06','ACTIVO'),(28,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:29:56','ACTIVO'),(29,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:30:02','ACTIVO'),(30,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:30:13','ACTIVO'),(31,'DOCTORES ','{\"cedula\":[\"Cedula cannot be blank.\"],\"correo\":[\"Correo cannot be blank.\"]}','ID: ','0',10014,'2022-04-29 09:31:50','ACTIVO'),(32,'DOCTORES ','{\"cedula\":[\"Cedula cannot be blank.\"]}','ID: ','0',10014,'2022-04-29 09:35:20','ACTIVO'),(33,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:44:12','ACTIVO'),(34,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:47:07','ACTIVO'),(35,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:47:16','ACTIVO'),(36,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:50:30','ACTIVO'),(37,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 09:59:28','ACTIVO'),(38,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 10:06:04','ACTIVO'),(39,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10014,'2022-04-29 14:58:10','ACTIVO'),(40,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:06','ACTIVO'),(41,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:11','ACTIVO'),(42,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:15:29','ACTIVO'),(43,'USUARIO ','{\"visionlcod\":[\"Visionlcod should contain at most 30 characters.\"],\"visionlcoi\":[\"Visionlcoi should contain at most 30 characters.\"]}','ID: 0','0',10022,'2022-05-03 11:16:07','ACTIVO'),(44,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10021,'2022-05-04 10:10:53','ACTIVO'),(45,'CITAS','{\"observacion\":[\"Observacion cannot be blank.\"]}','ID: 0','0',10021,'2022-05-04 10:10:59','ACTIVO'),(46,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10015,'2022-05-05 10:25:06','ACTIVO'),(47,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10015,'2022-05-05 10:34:39','ACTIVO'),(48,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 09:54:21','ACTIVO'),(49,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 10:33:11','ACTIVO'),(50,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"],\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10018,'2022-05-06 10:47:04','ACTIVO'),(51,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:45:22','ACTIVO'),(52,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:45:28','ACTIVO'),(53,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:46:05','ACTIVO'),(54,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:46:19','ACTIVO'),(55,'USUARIO ','{\"impdiag1\":[\"Impdiag1 should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 10:48:53','ACTIVO'),(56,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 11:47:21','ACTIVO'),(57,'USUARIO ','{\"fondoojood\":[\"Fondoojood should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-11 12:35:03','ACTIVO'),(58,'USUARIO ','{\"fondoojooi\":[\"Fondoojooi should contain at most 30 characters.\"]}','ID: 0','0',10019,'2022-05-18 10:19:18','ACTIVO');

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











