-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para proyectofinaldw
CREATE DATABASE IF NOT EXISTS `proyectofinaldw` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proyectofinaldw`;

-- Volcando estructura para tabla proyectofinaldw.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_permission: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add estudiante', 7, 'add_estudiante'),
	(26, 'Can change estudiante', 7, 'change_estudiante'),
	(27, 'Can delete estudiante', 7, 'delete_estudiante'),
	(28, 'Can view estudiante', 7, 'view_estudiante'),
	(29, 'Can add materia', 8, 'add_materia'),
	(30, 'Can change materia', 8, 'change_materia'),
	(31, 'Can delete materia', 8, 'delete_materia'),
	(32, 'Can view materia', 8, 'view_materia'),
	(33, 'Can add nota', 9, 'add_nota'),
	(34, 'Can change nota', 9, 'change_nota'),
	(35, 'Can delete nota', 9, 'delete_nota'),
	(36, 'Can view nota', 9, 'view_nota'),
	(37, 'Can add materia estudiante', 10, 'add_materiaestudiante'),
	(38, 'Can change materia estudiante', 10, 'change_materiaestudiante'),
	(39, 'Can delete materia estudiante', 10, 'delete_materiaestudiante'),
	(40, 'Can view materia estudiante', 10, 'view_materiaestudiante');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.django_content_type: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'modelo', 'estudiante'),
	(8, 'modelo', 'materia'),
	(10, 'modelo', 'materiaestudiante'),
	(9, 'modelo', 'nota'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.django_migrations: ~32 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-02-24 07:56:00.557861'),
	(2, 'auth', '0001_initial', '2021-02-24 07:56:02.250395'),
	(3, 'admin', '0001_initial', '2021-02-24 07:56:08.953265'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-24 07:56:10.894106'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-24 07:56:10.930398'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-24 07:56:11.531438'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-24 07:56:11.703556'),
	(8, 'auth', '0003_alter_user_email_max_length', '2021-02-24 07:56:11.904682'),
	(9, 'auth', '0004_alter_user_username_opts', '2021-02-24 07:56:11.955686'),
	(10, 'auth', '0005_alter_user_last_login_null', '2021-02-24 07:56:12.620819'),
	(11, 'auth', '0006_require_contenttypes_0002', '2021-02-24 07:56:12.662515'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-24 07:56:12.773683'),
	(13, 'auth', '0008_alter_user_username_max_length', '2021-02-24 07:56:12.877459'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-24 07:56:12.996145'),
	(15, 'auth', '0010_alter_group_name_max_length', '2021-02-24 07:56:13.127181'),
	(16, 'auth', '0011_update_proxy_permissions', '2021-02-24 07:56:13.180326'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-24 07:56:13.328378'),
	(18, 'modelo', '0001_initial', '2021-02-24 07:56:13.878317'),
	(19, 'modelo', '0002_auto_20210219_1420', '2021-02-24 07:56:15.561408'),
	(20, 'modelo', '0003_auto_20210219_1436', '2021-02-24 07:56:16.305796'),
	(21, 'modelo', '0004_auto_20210223_1621', '2021-02-24 07:56:17.249945'),
	(22, 'modelo', '0005_auto_20210223_1626', '2021-02-24 07:56:18.730926'),
	(23, 'modelo', '0006_auto_20210223_1636', '2021-02-24 07:56:19.451050'),
	(24, 'modelo', '0007_auto_20210223_2016', '2021-02-24 07:56:19.879203'),
	(25, 'modelo', '0008_auto_20210223_2018', '2021-02-24 07:56:23.662285'),
	(26, 'modelo', '0009_auto_20210223_2101', '2021-02-24 07:56:23.704831'),
	(27, 'modelo', '0010_auto_20210223_2117', '2021-02-24 07:56:26.540325'),
	(28, 'modelo', '0011_auto_20210223_2132', '2021-02-24 07:56:26.991089'),
	(29, 'modelo', '0012_auto_20210224_0255', '2021-02-24 07:56:28.231012'),
	(30, 'sessions', '0001_initial', '2021-02-24 07:56:31.408755'),
	(31, 'modelo', '0013_auto_20210224_0408', '2021-02-24 09:08:34.634753'),
	(32, 'modelo', '0014_auto_20210301_0030', '2021-03-01 05:30:16.977691');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.django_session: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.modelo_estudiante
CREATE TABLE IF NOT EXISTS `modelo_estudiante` (
  `estudiante_id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `estadoCivil` varchar(20) NOT NULL,
  `correo` varchar(105) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.modelo_estudiante: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_estudiante` DISABLE KEYS */;
INSERT INTO `modelo_estudiante` (`estudiante_id`, `cedula`, `nombres`, `apellidos`, `genero`, `estadoCivil`, `correo`, `celular`, `direccion`, `date_created`, `date_updated`) VALUES
	(1, '1111', 'Maura', 'Cuenca', 'femenino', 'casado', 'maura@gmail.com', '0987765431', 'Loja', '2021-02-24 08:00:10.597225', '2021-02-24 08:00:10.597225'),
	(4, '3333', 'Luis Alberto', 'Sarmiento Cuenca', 'masculino', 'soltero', 'luis@gmail.com', '0989023836', 'Loja EC', '2021-02-25 04:37:28.736008', '2021-02-25 04:37:28.736008'),
	(5, '2222', 'Juan', 'Marcos', 'masculino', 'soltero', 'juanito@gmail.com', '0987765431', 'Loja', '2021-02-25 04:38:54.658288', '2021-02-25 04:38:54.658288'),
	(8, '5678', 'prueba', 'ultima', 'femenino', 'casado', 'ultima@gmail.com', '213123', 'loja', '2021-03-01 05:17:52.375213', '2021-03-01 05:17:52.375213');
/*!40000 ALTER TABLE `modelo_estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.modelo_estudiante_materia
CREATE TABLE IF NOT EXISTS `modelo_estudiante_materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modelo_estudiante_estudi_estudiante_id_materia_id_21c7eb22_uniq` (`estudiante_id`,`materia_id`),
  KEY `modelo_estudiante_ma_materia_id_5ac5efca_fk_modelo_ma` (`materia_id`),
  CONSTRAINT `modelo_estudiante_ma_estudiante_id_afaeb6fa_fk_modelo_es` FOREIGN KEY (`estudiante_id`) REFERENCES `modelo_estudiante` (`Estudiante_id`),
  CONSTRAINT `modelo_estudiante_ma_materia_id_5ac5efca_fk_modelo_ma` FOREIGN KEY (`materia_id`) REFERENCES `modelo_materia` (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.modelo_estudiante_materia: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_estudiante_materia` DISABLE KEYS */;
INSERT INTO `modelo_estudiante_materia` (`id`, `estudiante_id`, `materia_id`) VALUES
	(31, 1, 7),
	(28, 1, 8),
	(29, 1, 9),
	(40, 1, 11),
	(30, 1, 12),
	(33, 4, 7),
	(32, 4, 8),
	(41, 4, 9),
	(39, 5, 7),
	(37, 5, 8),
	(38, 5, 9),
	(34, 5, 10),
	(35, 5, 11),
	(36, 5, 12),
	(45, 8, 8),
	(46, 8, 9),
	(47, 8, 16);
/*!40000 ALTER TABLE `modelo_estudiante_materia` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.modelo_materia
CREATE TABLE IF NOT EXISTS `modelo_materia` (
  `materia_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`materia_id`),
  UNIQUE KEY `modelo_materia_nombre_d086111b_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.modelo_materia: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_materia` DISABLE KEYS */;
INSERT INTO `modelo_materia` (`materia_id`, `nombre`, `date_created`, `date_updated`) VALUES
	(7, 'Programacion', '2021-02-25 05:54:12.794804', '2021-02-25 05:54:12.794804'),
	(8, 'Desarrollo Web', '2021-02-25 05:54:18.636511', '2021-02-25 05:54:18.636511'),
	(9, 'Base de Datos', '2021-02-25 05:54:23.998598', '2021-02-25 05:54:23.998598'),
	(10, 'Calculo Integral', '2021-02-25 05:54:33.540687', '2021-02-25 05:54:33.540687'),
	(11, 'Simulacion', '2021-02-25 05:54:46.262824', '2021-02-25 05:54:46.262824'),
	(12, 'Redes y Telecomunicaciones', '2021-02-25 05:55:00.706466', '2021-02-25 05:55:00.706466'),
	(16, 'ultima1', '2021-03-01 05:22:20.759416', '2021-03-01 05:22:20.759416');
/*!40000 ALTER TABLE `modelo_materia` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.modelo_materiaestudiante
CREATE TABLE IF NOT EXISTS `modelo_materiaestudiante` (
  `matEst_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`matEst_id`),
  KEY `modelo_materiaestudi_estudiante_id_23fb4473_fk_modelo_es` (`estudiante_id`),
  KEY `modelo_materiaestudi_materia_id_4d2d6bec_fk_modelo_ma` (`materia_id`),
  CONSTRAINT `modelo_materiaestudi_estudiante_id_23fb4473_fk_modelo_es` FOREIGN KEY (`estudiante_id`) REFERENCES `modelo_estudiante` (`Estudiante_id`),
  CONSTRAINT `modelo_materiaestudi_materia_id_4d2d6bec_fk_modelo_ma` FOREIGN KEY (`materia_id`) REFERENCES `modelo_materia` (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.modelo_materiaestudiante: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_materiaestudiante` DISABLE KEYS */;
INSERT INTO `modelo_materiaestudiante` (`matEst_id`, `date_created`, `date_updated`, `estudiante_id`, `materia_id`, `estado`) VALUES
	(10, '2021-02-25 05:55:32.353073', '2021-02-25 05:55:32.353073', 1, 7, 'Aprobada'),
	(11, '2021-02-25 05:56:37.119278', '2021-02-25 05:56:37.119278', 1, 8, 'Aprobada'),
	(12, '2021-02-25 05:57:01.699395', '2021-02-25 05:57:01.699395', 1, 9, 'Reprobada'),
	(13, '2021-02-25 05:57:14.906887', '2021-02-25 05:57:14.906887', 1, 12, 'Aprobada'),
	(14, '2021-02-25 05:57:50.475596', '2021-02-25 05:57:50.475596', 4, 7, 'Aprobada'),
	(15, '2021-02-25 05:57:57.067690', '2021-02-25 05:57:57.067690', 4, 8, 'Aprobada'),
	(16, '2021-02-25 05:58:25.919395', '2021-02-25 05:58:25.919395', 5, 7, 'Aprobada'),
	(17, '2021-02-25 05:58:31.148852', '2021-02-25 05:58:31.148852', 5, 8, 'Aprobada'),
	(18, '2021-02-25 05:58:40.160905', '2021-02-25 05:58:40.160905', 5, 9, 'Aprobada'),
	(19, '2021-02-25 05:58:49.877453', '2021-02-25 05:58:49.877453', 5, 10, 'Aprobada'),
	(20, '2021-02-25 05:59:02.544790', '2021-02-25 05:59:02.544790', 5, 11, 'Reprobada'),
	(21, '2021-02-25 05:59:18.897699', '2021-02-25 05:59:18.897699', 5, 12, 'Aprobada'),
	(22, '2021-02-27 21:00:32.745517', '2021-02-27 21:00:32.745517', 1, 11, 'Aprobada'),
	(23, '2021-03-01 04:53:10.973186', '2021-03-01 04:53:10.973186', 4, 9, 'Reprobada'),
	(25, '2021-03-01 05:22:58.531125', '2021-03-01 05:22:58.531125', 8, 16, 'Reprobada');
/*!40000 ALTER TABLE `modelo_materiaestudiante` ENABLE KEYS */;

-- Volcando estructura para tabla proyectofinaldw.modelo_nota
CREATE TABLE IF NOT EXISTS `modelo_nota` (
  `nota_id` int(11) NOT NULL AUTO_INCREMENT,
  `nota1` decimal(10,2) DEFAULT NULL,
  `nota2` decimal(10,2) DEFAULT NULL,
  `nota3` decimal(10,2) DEFAULT NULL,
  `promedio` decimal(10,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL,
  PRIMARY KEY (`nota_id`),
  KEY `modelo_nota_estudiante_id_c4dbf561_fk_modelo_es` (`estudiante_id`),
  KEY `modelo_nota_materia_id_2c6dff33_fk_modelo_materia_materia_id` (`materia_id`),
  CONSTRAINT `modelo_nota_estudiante_id_c4dbf561_fk_modelo_es` FOREIGN KEY (`estudiante_id`) REFERENCES `modelo_estudiante` (`Estudiante_id`),
  CONSTRAINT `modelo_nota_materia_id_2c6dff33_fk_modelo_materia_materia_id` FOREIGN KEY (`materia_id`) REFERENCES `modelo_materia` (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectofinaldw.modelo_nota: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_nota` DISABLE KEYS */;
INSERT INTO `modelo_nota` (`nota_id`, `nota1`, `nota2`, `nota3`, `promedio`, `date_created`, `date_updated`, `estudiante_id`, `materia_id`) VALUES
	(10, 8.00, 5.00, 8.00, 7.00, '2021-02-25 05:55:32.280066', '2021-02-25 05:55:32.280066', 1, 7),
	(11, 7.00, 8.50, 9.20, 8.23, '2021-02-25 05:56:37.042266', '2021-02-25 05:56:37.042266', 1, 8),
	(12, 6.00, 8.00, 4.00, 6.00, '2021-02-25 05:57:01.613400', '2021-02-25 05:57:01.613400', 1, 9),
	(13, 7.00, 8.00, 10.00, 8.33, '2021-02-25 05:57:14.852334', '2021-02-25 05:57:14.852334', 1, 12),
	(14, 8.00, 9.00, 7.00, 8.00, '2021-02-25 05:57:50.390564', '2021-02-25 05:57:50.390564', 4, 7),
	(15, 7.00, 9.00, 9.20, 8.40, '2021-02-25 05:57:56.942397', '2021-02-25 05:57:56.942397', 4, 8),
	(16, 8.00, 7.00, 6.00, 7.00, '2021-02-25 05:58:25.862407', '2021-02-25 05:58:25.862407', 5, 7),
	(17, 9.00, 8.00, 7.00, 8.00, '2021-02-25 05:58:31.084823', '2021-02-25 05:58:31.084823', 5, 8),
	(18, 10.00, 10.00, 10.00, 10.00, '2021-02-25 05:58:40.076909', '2021-02-25 05:58:40.076909', 5, 9),
	(19, 7.20, 5.80, 8.50, 7.17, '2021-02-25 05:58:49.806104', '2021-02-25 05:58:49.806104', 5, 10),
	(20, 7.87, 8.23, 4.67, 6.92, '2021-02-25 05:59:02.434824', '2021-02-25 05:59:02.434824', 5, 11),
	(21, 7.45, 8.60, 8.00, 8.02, '2021-02-25 05:59:18.798713', '2021-02-25 05:59:18.798713', 5, 12),
	(22, 6.00, 8.60, 7.90, 7.50, '2021-02-27 21:00:32.499607', '2021-02-27 21:00:32.499607', 1, 11),
	(23, 1.00, 1.00, 1.00, 1.00, '2021-03-01 04:53:10.923445', '2021-03-01 04:53:10.923445', 4, 9),
	(25, 0.00, 0.00, 0.00, 0.00, '2021-03-01 05:22:58.477124', '2021-03-01 05:22:58.477124', 8, 16);
/*!40000 ALTER TABLE `modelo_nota` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
