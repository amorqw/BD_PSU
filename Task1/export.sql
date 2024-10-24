--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);


ALTER TABLE public.authors OWNER TO root;

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_author_id_seq OWNER TO root;

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric,
    author_id integer
);


ALTER TABLE public.books OWNER TO root;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_id_seq OWNER TO root;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.notes (
    note_id integer NOT NULL,
    note_text text,
    book_id integer
);


ALTER TABLE public.notes OWNER TO root;

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.notes_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_note_id_seq OWNER TO root;

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- Name: notes note_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authors (author_id, first_name, last_name) FROM stdin;
1	Лев	Толстой
2	Фёдор	Достоевский
3	Антон	Чехов
4	Джейн	Остин
5	Марк	Твен
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.books (book_id, name, price, author_id) FROM stdin;
1	Война и мир	19.99	1
2	Преступление и наказание	14.99	2
3	Вишнёвый сад	9.99	3
4	Гордость и предубеждение	12.99	4
5	Приключения Гекльберри Финна	10.99	5
6	Анна Каренина	15.99	1
7	Идиот	13.99	2
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.notes (note_id, note_text, book_id) FROM stdin;
1	Глубокое исследование морали и искупления.	2
2	Подробное изображение российского общества.	1
3	Прекрасное изображение человеческих эмоций.	3
4	Классическая история о любви и социальном статусе.	4
5	Приключенческое путешествие по реке Миссисипи.	5
6	Трагическая история любви и утраты.	6
7	Глубокое психологическое исследование дворянина.	7
8	Влияние войны на общество и отдельных людей.	1
9	Анализ персонажа Пьера Безухова.	1
10	Темы судьбы и свободной воли в романе.	1
11	Анализ темы любви в романе.	1
\.


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 5, true);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.books_book_id_seq', 7, true);


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 11, true);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- Name: notes notes_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- PostgreSQL database dump complete
--

