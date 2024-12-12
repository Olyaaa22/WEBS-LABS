-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 03 2024 г., 19:05
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
-- База данных: `lab_4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `animals`
--

CREATE TABLE `animals` (
  `AnimalID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Species_` varchar(50) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `animals`
--

INSERT INTO `animals` (`AnimalID`, `Name`, `Species_`, `Breed`, `Age`, `Gender`, `OwnerID`) VALUES
(1, 'Барсик', 'Кот', 'Сиамский', 4, 'Мужской', 1),
(2, 'Бобик', 'Собака', 'Лабрадор', 3, 'Мужской', 2),
(3, 'Мурка', 'Кошка', 'Персидская', 2, 'Женский', 3),
(4, 'Рекс', 'Собака', 'Немецкая овчарка', 5, 'Мужской', 4),
(5, 'Снежок', 'Кот', 'Мейн-кун', 3, 'Мужской', 5),
(6, 'Тиша', 'Кошка', 'Русская голубая', 1, 'Женский', 6),
(7, 'Шарик', 'Собака', 'Пудель', 4, 'Мужской', 7),
(8, 'Белка', 'Хомяк', 'Джунгарский', 1, 'Женский', 8),
(9, 'Гера', 'Попугай', 'Какаду', 6, 'Женский', 9),
(10, 'Жучка', 'Собака', 'Такса', 7, 'Женский', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `diseases`
--

CREATE TABLE `diseases` (
  `DiseaseID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `diseases`
--

INSERT INTO `diseases` (`DiseaseID`, `Name`, `Description`) VALUES
(1, 'Бешенство', 'Смертельное вирусное заболевание, передающееся через укусы.'),
(2, 'Чумка', 'Опасное вирусное заболевание у собак.'),
(3, 'Лейкемия кошек', 'Вирусное заболевание у кошек.'),
(4, 'Гельминтоз', 'Заражение паразитическими червями.'),
(5, 'Отодектоз', 'Ушной клещ у животных.'),
(6, 'Дерматофитоз', 'Грибковое заболевание кожи.'),
(7, 'Конъюнктивит', 'Воспаление слизистой оболочки глаз.'),
(8, 'Отит', 'Воспаление уха.'),
(9, 'Блохи', 'Эктопаразиты у животных.'),
(10, 'Анемия', 'Снижение уровня гемоглобина и эритроцитов.');

-- --------------------------------------------------------

--
-- Структура таблицы `owners`
--

CREATE TABLE `owners` (
  `OwnerID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `owners`
--

INSERT INTO `owners` (`OwnerID`, `Name`, `Phone`, `Address`) VALUES
(1, 'Иван Иванов', '89001234567', 'ул. Ленина, д. 1'),
(2, 'Ольга Смирнова', '89109876543', 'пр. Мира, д. 25'),
(3, 'Сергей Петров', '89234567890', 'ул. Победы, д. 10'),
(4, 'Анна Соколова', '89051239876', 'ул. Горького, д. 17'),
(5, 'Алексей Морозов', '89345678901', 'ул. Лесная, д. 3'),
(6, 'Мария Васильева', '89062347891', 'ул. Чехова, д. 8'),
(7, 'Дмитрий Кузнецов', '89175643210', 'ул. Советская, д. 14'),
(8, 'Елена Козлова', '89084561234', 'пр. Ломоносова, д. 2'),
(9, 'Виктор Павлов', '89237654567', 'ул. Московская, д. 45'),
(10, 'Наталья Орлова', '89099871234', 'ул. Тверская, д. 6');

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE `visits` (
  `VisitID` int(11) NOT NULL,
  `AnimalID` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `Diagnosis` varchar(100) DEFAULT NULL,
  `Treatment` text DEFAULT NULL,
  `DoctorName` varchar(100) DEFAULT NULL,
  `DiseaseID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`VisitID`, `AnimalID`, `Date`, `Diagnosis`, `Treatment`, `DoctorName`, `DiseaseID`) VALUES
(1, 1, '2024-10-10', 'Бешенство', 'Вакцинация', 'Доктор Ильин', 1),
(2, 2, '2024-10-15', 'Чумка', 'Противовирусное лечение', 'Доктор Сидоров', 2),
(3, 3, '2024-10-20', 'Лейкемия кошек', 'Поддерживающая терапия', 'Доктор Смирнова', 3),
(4, 4, '2024-11-01', 'Гельминтоз', 'Антигельминтные препараты', 'Доктор Петров', 4),
(5, 5, '2024-11-05', 'Отодектоз', 'Лечение каплями', 'Доктор Кузнецов', 5),
(6, 6, '2024-11-10', 'Дерматофитоз', 'Противогрибковое лечение', 'Доктор Орлова', 6),
(7, 7, '2024-11-15', 'Конъюнктивит', 'Глазные капли', 'Доктор Иванов', 7),
(8, 8, '2024-11-20', 'Отит', 'Антибиотики и капли', 'Доктор Морозова', 8),
(9, 9, '2024-11-25', 'Блохи', 'Противопаразитарное лечение', 'Доктор Соколова', 9),
(10, 10, '2024-12-01', 'Анемия', 'Препараты железа', 'Доктор Павлова', 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`AnimalID`),
  ADD UNIQUE KEY `OwnerID` (`OwnerID`);

--
-- Индексы таблицы `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`DiseaseID`);

--
-- Индексы таблицы `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`OwnerID`);

--
-- Индексы таблицы `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`VisitID`),
  ADD KEY `AnimalID` (`AnimalID`),
  ADD KEY `DiseaseID` (`DiseaseID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `animals`
--
ALTER TABLE `animals`
  MODIFY `AnimalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `diseases`
--
ALTER TABLE `diseases`
  MODIFY `DiseaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `owners`
--
ALTER TABLE `owners`
  MODIFY `OwnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `VisitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owners` (`OwnerID`);

--
-- Ограничения внешнего ключа таблицы `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `animals` (`AnimalID`),
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`DiseaseID`) REFERENCES `diseases` (`DiseaseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
