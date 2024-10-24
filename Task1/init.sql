CREATE TABLE authors(
	author_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL
);

CREATE TABLE books(
	book_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price DECIMAL,
	author_id INT REFERENCES authors(author_id)
);

CREATE TABLE notes(
	note_id SERIAL PRIMARY KEY,
	note_text TEXT,
	book_id INT REFERENCES books(book_id)
);

INSERT INTO authors (first_name, last_name) VALUES
('Лев', 'Толстой'),
('Фёдор', 'Достоевский'),
('Антон', 'Чехов'),
('Джейн', 'Остин'),
('Марк', 'Твен');


INSERT INTO books (name, price, author_id) VALUES
('Война и мир', 19.99, 1), 
('Преступление и наказание', 14.99, 2),  
('Вишнёвый сад', 9.99, 3),  
('Гордость и предубеждение', 12.99, 4),  
('Приключения Гекльберри Финна', 10.99, 5),  
('Анна Каренина', 15.99, 1), 
('Идиот', 13.99, 2);  

INSERT INTO notes (note_text, book_id) VALUES
('Глубокое исследование морали и искупления.', 2), 
('Подробное изображение российского общества.', 1),  
('Прекрасное изображение человеческих эмоций.', 3),  
('Классическая история о любви и социальном статусе.', 4),  
('Приключенческое путешествие по реке Миссисипи.', 5),  
('Трагическая история любви и утраты.', 6),  
('Глубокое психологическое исследование дворянина.', 7), 
('Влияние войны на общество и отдельных людей.', 1), 
('Анализ персонажа Пьера Безухова.', 1), 
('Темы судьбы и свободной воли в романе.', 1), 
('Анализ темы любви в романе.', 1);  


