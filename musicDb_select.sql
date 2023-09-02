-- Название и продолжительность самого длительного трека
SELECT name, track_duration FROM track
ORDER BY track_duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name, track_duration FROM track
WHERE track_duration > 210

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM compilation
WHERE yarse BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name FROM artist
WHERE name NOT LIKE '% %'
ORDER BY name;

-- Название треков, которые содержат слово «and»
SELECT name FROM track
WHERE name LIKE '%and%';

-- Количество исполнителей в каждом жанре
SELECT name, COUNT (artist_id) FROM genre_artist a
JOIN genre g ON a.genre_id = g.id
GROUP BY name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT years, COUNT(fk_album_id) FROM track t
JOIN album a ON t.fk_album_id = a.id
WHERE years BETWEEN 2019 AND 2020
GROUP BY years;

-- Средняя продолжительность треков по каждому альбому
SELECT years, round(AVG(track_duration)) FROM track t
JOIN album a ON t.fk_album_id = a.id
GROUP BY years;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT years, t.name FROM artist t
JOIN album a ON t.id = a.id
WHERE a.years != 2020
GROUP BY years, t.name;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.name, ar.name FROM compilation c
JOIN compilation_track a ON c.id = a.track_id
JOIN track t ON a.track_id = t.fk_album_id
JOIN album_artist al ON t.fk_album_id = al.artist_id
JOIN artist ar ON al.artist_id = ar.id
WHERE ar.name = 'AC/DC'
GROUP BY c.name, ar.name;


