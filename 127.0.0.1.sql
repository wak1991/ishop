-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 03 2017 г., 22:06
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ishop`
--
CREATE DATABASE `ishop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ishop`;

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `parent_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `parent_id`) VALUES
(1, 'Alcatel', 0),
(2, 'Ericsson', 0),
(3, 'LG', 0),
(4, 'Слайдеры', 3),
(5, 'Сенсоры', 3),
(6, 'Раскладушки', 1),
(7, 'Моноблок', 3),
(8, 'Mitsubish', 0),
(9, 'Motorola', 0),
(10, 'NEC', 0),
(11, 'Nokia', 0),
(12, 'Panasonic', 0),
(13, 'Слайдеры', 11),
(14, 'Моноблок', 11),
(18, 'Тест', 8),
(19, 'Моноблок', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `id_role` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `address`, `login`, `password`, `id_role`) VALUES
(1, 'Иванов Иван Иванович', '1@1.com', '111-111', 'city', 'user1', '202cb962ac59075b964b07152d234b70', 1),
(2, 'Петров Пётр Петрович', '2@2.com', '222-222', 'city 2', 'User1', '202cb962ac59075b964b07152d234b70', 1),
(3, 'Николаенко Николай Николаевич', '3@3.com', '333-333', 'city 3', 'user3', '202cb962ac59075b964b07152d234b70', 1),
(4, 'Пупкин Вася', '5@5.ru', '555-555', 'city5', 'user4', '202cb962ac59075b964b07152d234b70', 1),
(18, 'Пупкин Вася', 'kopitnik_artyom@mail.ru', '555-555', 'city5', NULL, NULL, 1),
(17, 'Гость 2', '111', '222', '333', NULL, NULL, 1),
(19, 'Петечкин Петя', '6@6.ru', '666-666', 'city6', 'user5', '202cb962ac59075b964b07152d234b70', 1),
(20, 'demo', '1@mail.ru', '+375(11)-111-11-11', 'рррр', NULL, NULL, 1),
(21, 'demo', '1@mail.ru', '+375(11)-111-11-11', 'рррр', NULL, NULL, 1),
(22, 'd''Art', '5@5.ru', '\\555\\55', 'city5', 'O"Railly', '202cb962ac59075b964b07152d234b70', 1),
(23, 'd''Art', 'kopitnik_artyom@mail.ru', '\\555\\55', '333', NULL, NULL, 1),
(24, 'Администратор', 'admin@ishop', '', '', 'admin', '202cb962ac59075b964b07152d234b70', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `dostavka`
--

CREATE TABLE IF NOT EXISTS `dostavka` (
  `dostavka_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`dostavka_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `dostavka`
--

INSERT INTO `dostavka` (`dostavka_id`, `name`) VALUES
(1, 'Пересылка по почте'),
(2, 'Самовывоз'),
(3, 'Другое, по согласованию с менеджером');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `goods_brandid` tinyint(4) unsigned NOT NULL,
  `anons` text NOT NULL,
  `content` text NOT NULL,
  `visible` enum('0','1') NOT NULL DEFAULT '1',
  `hits` enum('0','1') NOT NULL DEFAULT '0',
  `new` enum('0','1') NOT NULL DEFAULT '0',
  `sale` enum('0','1') NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  `date` date NOT NULL,
  `img_slide` varchar(255) NOT NULL,
  PRIMARY KEY (`goods_id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`goods_id`, `name`, `keywords`, `description`, `img`, `goods_brandid`, `anons`, `content`, `visible`, `hits`, `new`, `sale`, `price`, `date`, `img_slide`) VALUES
(1, 'Sony Xperia S 32Gb (черный)', 'Ключевики', 'Описание', 'no_image.jpg', 2, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '1', '1', 2490.61, '2017-05-16', ''),
(2, 'LG-1', 'Ключевики', 'Описание', 'phone-index.jpg', 5, '<p>Футуристичный смартфон Sony Xperia S под управлением ОС Android 2.3 Gingerbread с возможностью обновления до версии 4.0 Ice Cream Sandwich – первый из серии Xperia NXT, линейки смартфонов нового поколения. В нем объединились новейшие технологии и лучшие разработки Sony, достойный функционал и минималистичный дизайн.</p>', '<p>Футуристичный смартфон Sony Xperia S под управлением ОС Android 2.3 Gingerbread с возможностью обновления до версии 4.0 Ice Cream Sandwich – первый из серии Xperia NXT, линейки смартфонов нового поколения. В нем объединились новейшие технологии и лучшие разработки Sony, достойный функционал и минималистичный дизайн.</p>\r\n\r\n<div class="tech-harakt">\r\n					<h3>Технические характеристики</h3>\r\n\r\n<h4>Связь</h4>\r\n<ul>\r\n<li> - 3G  : Есть </li>\r\n<li> - EDGE  : Есть </li>\r\n<li> - Wi-Fi  : Есть (802.11 b/g/n)</li> \r\n</ul>\r\n\r\n<h4>Дисплей</h4>\r\n<ul>\r\n<li> - Тип дисплея  : TFT с LED подсветкой</li> \r\n<li> - Разрешение дисплея (пикс)  : 1280x720</li> \r\n<li> - Диагональ дисплея (дюйм)  : 4.3 </li>\r\n<li> - Сенсорный экран  : Есть </li>\r\n</ul>\r\n\r\n<h4>Система</h4>\r\n<ul>\r\n<li> - GPS-навигация  : Есть </li>\r\n<li> - Операционная система  : Android v2.3 </li>\r\n<li> - Частота проц. (МГц) : 1500 (Dual-core Qualcomm MSM8260 Snapdragon) </li>\r\n</ul>\r\n\r\n<h4>Мультимедиа</h4>\r\n<ul>\r\n<li> - Фотокамера : 12,1 Mпикс </li>\r\n<li> - Аудиоплеер : да </li>\r\n<li> - FM - радио : да </li>\r\n</ul>\r\n\r\n<h4>Корпус</h4>\r\n<ul>\r\n<li> - Тип корпуса : Классический </li>\r\n</ul>\r\n\r\n<h4>Память</h4>\r\n<ul>\r\n<li> - Встроенная память (Мб) : 32000</li>\r\n</ul>\r\n\r\n				</div>     \r\n', '1', '1', '0', '1', 14990, '2017-05-16', '2_1.jpg|2_2.jpg|2_3.jpg|2_4.jpg|2_5.jpg|2_6.jpg|2_7.jpg|2_8.jpg'),
(3, 'LG-2', 'Ключевики', 'Описание', 'phone-index.jpg', 7, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '0', 27777, '2017-05-16', ''),
(4, 'Sony Xperia S 32Gb (черный)', 'Ключевики', 'Описание', 'phone-index.jpg', 3, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '0', '0', '0', '0', 24990, '2017-05-16', ''),
(5, 'LG-3', 'Ключевики', 'Описание', 'phone-index.jpg', 4, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '0', 84990, '2017-05-16', ''),
(6, 'LG-4', 'Ключевики', 'Описание', 'phone-index.jpg', 4, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '1', 28870, '2017-05-16', ''),
(7, 'Sony Xperia S 32Gb (белый)', 'Ключевики', 'Описание', 'phone-index.jpg', 2, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 12300, '2017-05-16', ''),
(8, 'Nokia-1', 'Ключевики', 'Описание', 'no_image.jpg', 14, '<p>\r\n	Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>\r\n	Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '1', '0', 17890, '2017-05-16', ''),
(9, 'Nokia-2', 'Ключевики', 'Описание', 'phone-index.jpg', 14, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '0', 11100, '2017-05-16', ''),
(10, 'Nokia-3', 'Ключевики', 'Описание', 'phone-index.jpg', 14, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '1', '0', 35777, '2017-05-16', ''),
(11, 'Nokia-4', 'Ключевики', 'Описание', 'phone-index.jpg', 14, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '1', '0', 44990, '2017-05-16', ''),
(12, 'Sony Xperia S 16Gb (черный)', 'Ключевики', 'Описание', 'phone-index.jpg', 2, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '0', '0', '0', '0', 10000, '2017-05-16', ''),
(13, 'Sony Xperia Z (черный)', 'Ключевики', 'Описание', 'phone-index.jpg', 2, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '0', 54990, '2017-05-16', ''),
(14, 'Sony Xperia Z (белый)', 'Ключевики', 'Описание', 'phone-index.jpg', 2, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '0', '0', '0', 21990, '2017-05-16', ''),
(15, 'Nokia-5', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(16, 'Nokia-6', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(17, 'Nokia-7', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(18, 'Nokia-8', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(19, 'Nokia-9', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(20, 'Nokia-10', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(21, 'Nokia-11', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(22, 'Nokia-12', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(23, 'Nokia-13', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(24, 'Nokia-14', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(25, 'Nokia-15', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(26, 'Nokia-16', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(27, 'Nokia-17', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(28, 'Nokia-18', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(29, 'Nokia-19', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(30, 'Nokia-20', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-31', ''),
(31, 'Nokia-21', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(32, 'Nokia-22', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(33, 'Nokia-23', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(34, 'Nokia-24', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(35, 'Nokia-25', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(36, 'Nokia-26', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(37, 'Nokia-27', 'Ключевики', 'Описание', 'phone-index.jpg', 13, '<p>Анонс футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '<p>Самое полное описание футуристического смартфона Sony Xperia S 32Gb (черный)</p>', '1', '1', '0', '0', 20990, '2017-05-16', ''),
(45, 'Новый тестовый товар', 'ключи', 'Описание новость', 'no_image.jpg', 19, '<p>\r\n	фывввввввввввв</p>', '<p>\r\n	фпыпфыфпвпфвывфпы</p>', '1', '1', '1', '1', 250.14, '2017-07-20', ''),
(46, 'Новый сони', '', '', 'no_image.jpg', 2, '', '', '0', '0', '0', '1', 3242, '2017-07-20', ''),
(47, 'Nikia lumia', '', '', 'no_image.jpg', 14, '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: wf_segoe-ui_normal, wf_segoe-ui_semilight, wf_segoe-ui_light, Arial, sans-serif; font-size: 15px;">With robust built-in security features and one-click Office 365 set up, the Lumia 650 Dual SIM with Windows 10 and a Qualcomm&reg; Snapdragon&trade;</span></p>', '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: wf_segoe-ui_normal, wf_segoe-ui_semilight, wf_segoe-ui_light, Arial, sans-serif; font-size: 15px;">With robust built-in security features and one-click Office 365 set up, the Lumia 650 Dual SIM with Windows 10 and a Qualcomm&reg; Snapdragon&trade; processor works seamlessly with your company&rsquo;s Microsoft IT platforms. So whether you&rsquo;re choosing a phone for work or managing an IT department, you get full integration with the Microsoft apps and services that keep you productive, connected and ready for anything</span></p>', '1', '0', '0', '0', 1234, '2017-07-21', ''),
(48, 'Nikia lumia', '', '', '48.jpg', 14, '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: wf_segoe-ui_normal, wf_segoe-ui_semilight, wf_segoe-ui_light, Arial, sans-serif; font-size: 15px;">With robust built-in security features and one-click Office 365 set up, the Lumia 650 Dual SIM with Windows 10 and a Qualcomm&reg; Snapdragon&trade;</span></p>', '<p>\r\n	<span style="color: rgb(0, 0, 0); font-family: wf_segoe-ui_normal, wf_segoe-ui_semilight, wf_segoe-ui_light, Arial, sans-serif; font-size: 15px;">With robust built-in security features and one-click Office 365 set up, the Lumia 650 Dual SIM with Windows 10 and a Qualcomm&reg; Snapdragon&trade; processor works seamlessly with your company&rsquo;s Microsoft IT platforms. So whether you&rsquo;re choosing a phone for work or managing an IT department, you get full integration with the Microsoft apps and services that keep you productive, connected and ready for anything</span></p>', '1', '0', '0', '0', 1234, '2017-07-21', ''),
(49, 'Nokia Lumia 800', '', '', 'no_image.jpg', 14, '', '', '1', '0', '0', '0', 213, '2017-07-21', ''),
(55, 'MOTOROLLA 2', 'ключи', 'Описание новость', '55.jpg', 10, '', '', '1', '1', '1', '1', 8070.45, '2017-07-22', '55_0.jpg'),
(51, 'Гость 1', '', '', '51.png', 14, '', '', '1', '0', '0', '0', 0, '2017-07-21', ''),
(52, 'Гость 1', '', '', '52.png', 14, '', '', '1', '0', '0', '0', 0, '2017-07-21', ''),
(53, 'Гость 1', '', '', '53.png', 14, '', '', '1', '0', '0', '0', 0, '2017-07-21', ''),
(54, 'MOTOROLLA', '', '', 'no_image.jpg', 9, '', '', '1', '1', '1', '1', 0, '2017-07-22', ''),
(56, 'MOTOROLLA 3', '', '', 'no_image.jpg', 9, '', '', '1', '0', '0', '0', 0, '2017-07-22', '56_1.jpg'),
(57, 'MOTOROLLA 5', '', '', 'no_image.jpg', 9, '', '', '1', '0', '0', '0', 0, '2017-07-22', '57_0.jpg|57_2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `informers`
--

CREATE TABLE IF NOT EXISTS `informers` (
  `informer_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `informer_name` varchar(255) NOT NULL,
  `informer_position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`informer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `informers`
--

INSERT INTO `informers` (`informer_id`, `informer_name`, `informer_position`) VALUES
(1, 'Способы оплаты', 2),
(2, 'Доставка', 1),
(3, 'Информация для Вас', 3),
(8, 'Тестовый информер', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL,
  `parent_informer` tinyint(3) unsigned NOT NULL,
  `links_position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `links`
--

INSERT INTO `links` (`link_id`, `link_name`, `parent_informer`, `links_position`, `keywords`, `description`, `text`) VALUES
(1, 'Наличный расчёт', 1, 1, 'Ключевики статьи наличный расчёт', 'Описание статьи наличный расчёт', 'Текст статьи наличный расчёт'),
(2, 'Пластиковой картой', 1, 2, 'Ключи Пластиковой картой', 'Описание Пластиковой картой', 'Текст Пластиковой картой'),
(3, 'Кредит', 1, 5, 'Ключи Кредит', 'Описание Кредит', 'Текст Кредит'),
(4, 'Рассчитать кредит', 1, 4, 'Ключ Рассчитать кредит', 'Описание Рассчитать кредит', 'Текст Рассчитать кредит'),
(5, 'Безналичный расчёт', 1, 3, 'Ключи Безналичный расчёт', 'Описание Безналичный расчёт', 'Текст Безналичный расчёт'),
(6, 'Почта России', 2, 1, 'Ключи Почта России', 'Описание Почта России', 'Текст Почта России'),
(7, 'Курьерская служба', 2, 2, 'Ключи Курьерская служба', 'Описание Курьерская служба', 'Текст'),
(8, 'Гарантия', 3, 1, 'Ключи Гарантия', 'Описание Гарантия', 'Текст Гарантия'),
(9, 'Как выбрать телефон', 3, 2, 'Ключи Как выбрать телефон', 'Описание Как выбрать телефон', 'Текст Как выбрать телефон'),
(10, 'Ремонт и обслуживание', 3, 3, 'Ключи Ремонт и обслуживание', 'Описание Ремонт и обслуживание', 'Текст Ремонт и обслуживание'),
(11, 'Акции и новинки', 3, 4, 'Ключи Акции и новинки', 'Описание Акции и новинки', 'Текст Акции и новинки'),
(12, 'Условия доставки', 3, 5, 'Ключи Условия доставки', 'Описание Условия доставки', 'Текст Условия доставки'),
(16, 'Тестовая страница', 8, 1, 'Тестовая страница ключи', 'Тестовая страница описание', '<p>\r\n	Тестовая страница текст</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `anons` text NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_id`, `title`, `keywords`, `description`, `anons`, `text`, `date`) VALUES
(6, 'Новость', 'ключи', 'Описание новость', '<p>\r\n	Анонс в</p>', '<p>\r\n	Текст новости</p>', '2017-07-12');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `dostavka_id` tinyint(3) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `prim` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pages_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`pages_id`, `title`, `keywords`, `description`, `position`, `text`) VALUES
(1, 'О магазине', '', 'Описание страницы "о магазине"', 122, '<p>\r\n	text text text</p>'),
(2, 'Оплата и доставка', '', '', 100, '<p>\r\n	<img alt="" src="http://ishop/userfiles/upload/images/18017.JPG" style="width: 739px; height: 499px;" />text text text</p>'),
(3, 'Покупка в кредит', 'авава', 'ывае', 1, '<p>\r\n	text text text</p>'),
(4, 'Контакты', '', '', 4, '<p>text text text</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name_role` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id_role`, `name_role`) VALUES
(1, 'Пользователь'),
(2, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz_tovar`
--

CREATE TABLE IF NOT EXISTS `zakaz_tovar` (
  `zakaz_tovar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL,
  `qantity` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`zakaz_tovar_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
