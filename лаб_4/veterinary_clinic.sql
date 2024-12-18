-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 19 2024 г., 09:49
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `veterinary_clinic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `посещение`
--

CREATE TABLE `посещение` (
  `id` int(11) NOT NULL,
  `дата` date NOT NULL,
  `животное_id` int(11) NOT NULL,
  `человек_id` int(11) NOT NULL,
  `болезнь_id` int(11) DEFAULT NULL,
  `заметки` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `болезнь`
--

CREATE TABLE `болезнь` (
  `id` int(11) NOT NULL,
  `название` varchar(100) NOT NULL,
  `описание` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `животное`
--

CREATE TABLE `животное` (
  `id` int(11) NOT NULL,
  `кличка` varchar(50) NOT NULL,
  `вид` varchar(50) NOT NULL,
  `порода` varchar(50) DEFAULT NULL,
  `год_рождения` year(4) NOT NULL,
  `пол` enum('М','Ж') NOT NULL,
  `владелец_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `сотрудник`
--

CREATE TABLE `сотрудник` (
  `id` int(11) NOT NULL,
  `человек_id` int(11) NOT NULL,
  `должность` varchar(100) NOT NULL,
  `специальность` varchar(100) DEFAULT NULL,
  `дата_приема` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `человек`
--

CREATE TABLE `человек` (
  `id` int(11) NOT NULL,
  `имя` varchar(50) NOT NULL,
  `фамилия` varchar(50) NOT NULL,
  `год_рождения` year(4) NOT NULL,
  `адрес` varchar(255) DEFAULT NULL,
  `телефон` varchar(20) DEFAULT NULL,
  `почта` varchar(100) DEFAULT NULL,
  `роль` enum('владелец','ветеринар') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `посещение`
--
ALTER TABLE `посещение`
  ADD PRIMARY KEY (`id`),
  ADD KEY `животное_id` (`животное_id`),
  ADD KEY `человек_id` (`человек_id`),
  ADD KEY `болезнь_id` (`болезнь_id`);

--
-- Индексы таблицы `болезнь`
--
ALTER TABLE `болезнь`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `животное`
--
ALTER TABLE `животное`
  ADD PRIMARY KEY (`id`),
  ADD KEY `владелец_id` (`владелец_id`);

--
-- Индексы таблицы `сотрудник`
--
ALTER TABLE `сотрудник`
  ADD PRIMARY KEY (`id`),
  ADD KEY `человек_id` (`человек_id`);

--
-- Индексы таблицы `человек`
--
ALTER TABLE `человек`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `посещение`
--
ALTER TABLE `посещение`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `болезнь`
--
ALTER TABLE `болезнь`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `животное`
--
ALTER TABLE `животное`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `сотрудник`
--
ALTER TABLE `сотрудник`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `человек`
--
ALTER TABLE `человек`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `посещение`
--
ALTER TABLE `посещение`
  ADD CONSTRAINT `посещение_ibfk_1` FOREIGN KEY (`животное_id`) REFERENCES `животное` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `посещение_ibfk_2` FOREIGN KEY (`человек_id`) REFERENCES `человек` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `посещение_ibfk_3` FOREIGN KEY (`болезнь_id`) REFERENCES `болезнь` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `животное`
--
ALTER TABLE `животное`
  ADD CONSTRAINT `животное_ibfk_1` FOREIGN KEY (`владелец_id`) REFERENCES `человек` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `сотрудник`
--
ALTER TABLE `сотрудник`
  ADD CONSTRAINT `сотрудник_ibfk_1` FOREIGN KEY (`человек_id`) REFERENCES `человек` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
