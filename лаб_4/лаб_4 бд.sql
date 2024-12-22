-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 22 2024 г., 23:06
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
-- База данных: `uhuidt`
--

-- --------------------------------------------------------

--
-- Структура таблицы `болезнь`
--

CREATE TABLE `болезнь` (
  `id` int(11) NOT NULL,
  `название` varchar(100) NOT NULL,
  `описание` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `болезнь`
--

INSERT INTO `болезнь` (`id`, `название`, `описание`) VALUES
(1, 'Инфекция дыхательных путей', 'Заболевание, характеризующееся затруднением дыхания и кашлем.'),
(2, 'Гельминтоз', 'Паразитарное заболевание, вызванное глистами.'),
(3, 'Дерматит', 'Воспаление кожи, вызванное аллергией или инфекцией.'),
(4, 'Отит', 'Воспаление уха, часто встречается у собак с длинными ушами.'),
(5, 'Панлейкопения', 'Вирусное заболевание кошек с высокой смертностью.'),
(6, 'Бешенство', 'Вирусное заболевание, опасное для животных и человека.'),
(7, 'Гастрит', 'Воспаление слизистой желудка у животных.'),
(8, 'Конъюнктивит', 'Воспаление слизистой оболочки глаз, может быть вызвано инфекцией.'),
(9, 'Пироплазмоз', 'Паразитарное заболевание, передающееся через укусы клещей.'),
(10, 'Цистит', 'Воспаление мочевого пузыря, сопровождается болезненным мочеиспусканием.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `болезнь`
--
ALTER TABLE `болезнь`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `болезнь`
--
ALTER TABLE `болезнь`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
