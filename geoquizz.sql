-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `geoquizz`;
CREATE DATABASE `geoquizz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `geoquizz`;

DROP TABLE IF EXISTS `partie`;
CREATE TABLE `partie` (
  `id` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `nb_photos` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `joueur` varchar(30) NOT NULL,
  `id_serie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_serie` (`id_serie`),
  CONSTRAINT `partie_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `partie` (`id`, `token`, `nb_photos`, `status`, `score`, `joueur`, `id_serie`) VALUES
('b3b0bed1-0561-4e42-a760-3ecd54fa2070',	'716bd18ea3dd516e33cefbdb3749b554372ef07fdb6e1b5779eeb9c156636b5d',	10,	'creee',	0,	'lukaku',	1);

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(120) NOT NULL,
  `long` double NOT NULL,
  `lat` double NOT NULL,
  `url` varchar(250) NOT NULL,
  `id_serie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_serie` (`id_serie`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `photo` (`id`, `description`, `long`, `lat`, `url`, `id_serie`) VALUES
(1,	'Place Stanislas',	292673.93,	5397251.79,	'https://upload.wikimedia.org/wikipedia/commons/3/3b/Nancy%2C_Place_Stanislas%2C_E.H%C3%A9r%C3%A9%2C_1752-60.jpg',	1),
(2,	'Place de la carriere',	6.18238,	48.69536,	'https://i2.wp.com/frenchmoments.eu/wp-content/uploads/2018/09/Nancy-Place-de-la-Carri%C3%A8re-from-Arc-de-Triomphe-%C2%A9-French-Moments.jpg?fit=1200%2C801&ssl=1',	1),
(3,	'Palais des Ducs',	48.1815151,	5.15751,	'https://www.planetware.com/photos-large/F/france-nancy-palais-ducal.jpg',	1),
(4,	'Musee de l\'ecole',	6.16928,	48.67309,	'https://www.planetware.com/photos-large/F/france-nancy-ecole-de-nancy-museum.jpg',	1);

DROP TABLE IF EXISTS `serie`;
CREATE TABLE `serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(40) NOT NULL,
  `map_refs` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `serie` (`id`, `ville`, `map_refs`) VALUES
(1,	'Nancy',	'C\'est la ville complete de Nancy');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(128) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2020-03-19 21:55:34
