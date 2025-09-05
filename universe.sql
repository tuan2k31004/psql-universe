--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_billion_of_km integer NOT NULL,
    description text,
    is_charge boolean NOT NULL,
    age_millions_of_years integer NOT NULL,
    is_active boolean,
    spin_parameter numeric(3,2),
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_star_in_billion integer,
    age_in_millions_of_years integer,
    galaxy_types character varying(30) NOT NULL,
    distance_from_earth_in_lightyears numeric,
    description text,
    is_merge boolean,
    has_supermassive_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean,
    description text,
    is_spherical boolean,
    suface_temperature_in_c numeric(3,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
    orbit_duration_in_earthday numeric(3,1),
    planet_types character varying(50),
    day_length_in_earthhours numeric(3,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_millions_km numeric,
    age_in_millions_of_years integer NOT NULL,
    description text,
    surface_temperature_in_c integer NOT NULL,
    is_spherical boolean,
    is_dwarf_star boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 44, 'Supermassive black hole at the center of the Milky Way.', false, 4000, true, 0.90, 1);
INSERT INTO public.black_hole VALUES (2, 'M87*', 100, 'Supermassive black hole in the galaxy Messier 87.', false, 6500, true, 0.75, 2);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 0, 'First discovered stellar-mass black hole.', false, 600, true, 0.50, 1);
INSERT INTO public.black_hole VALUES (4, 'TON 618', 390, 'One of the largest known black holes.', false, 10000, true, 0.95, 3);
INSERT INTO public.black_hole VALUES (5, 'NGC 1277 BH', 100, 'A black hole taking up most of its host galaxy.', false, 8000, true, 0.80, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 13600, 'Spiral', 0, 'Our home galaxy containing the Solar System.', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 10000, 'Spiral', 2537000, 'Nearest major galaxy, on a collision course with Milky Way.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 12000, 'Spiral', 3000000, 'A member of the Local Group, smaller than Andromeda and Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 1500, 13000, 'Elliptical', 53000000, 'A giant elliptical galaxy with a famous supermassive black hole.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 100, 400, 'Spiral', 23000000, 'A classic spiral galaxy interacting with a smaller neighbor.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 30, 11000, 'Irregular', 163000, 'A satellite galaxy of the Milky Way.', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 4500, false, 'Earth''s only natural satellite.', true, -0.27, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 4500, false, 'Innermost moon of Mars.', false, -0.40, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4500, false, 'Outermost moon of Mars.', false, -0.35, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 3121, 4500, false, 'Icy moon of Jupiter.', true, -1.20, 6);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5268, 4500, false, 'Largest moon of Jupiter.', true, -1.50, 6);
INSERT INTO public.moon VALUES (6, 'Callisto', 4820, 4500, false, 'Heavily cratered moon of Jupiter.', true, -2.20, 6);
INSERT INTO public.moon VALUES (7, 'Io', 3643, 4500, false, 'Volcanically active moon of Jupiter.', true, -2.10, 6);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 4500, false, 'Largest moon of Saturn.', true, -1.80, 7);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 4500, false, 'Icy moon with geysers.', true, -1.60, 7);
INSERT INTO public.moon VALUES (10, 'Rhea', 1527, 4500, false, 'Second-largest moon of Saturn.', true, -1.70, 7);
INSERT INTO public.moon VALUES (11, 'Mimas', 396, 4500, false, 'Small cratered moon of Saturn.', true, -1.55, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 1523, 4500, false, 'Moon of Uranus.', true, -2.30, 8);
INSERT INTO public.moon VALUES (13, 'Titania', 1577, 4500, false, 'Largest moon of Uranus.', true, -2.40, 8);
INSERT INTO public.moon VALUES (14, 'Triton', 2706, 4500, false, 'Largest moon of Neptune.', true, -2.60, 9);
INSERT INTO public.moon VALUES (15, 'Nereid', 340, 4500, false, 'Outer irregular moon of Neptune.', true, -2.50, 9);
INSERT INTO public.moon VALUES (16, 'Charon', 1212, 4500, false, 'Largest moon of Pluto.', true, -1.90, 10);
INSERT INTO public.moon VALUES (17, 'Styx', 16, 4500, false, 'Small outer moon of Pluto.', true, -1.70, 10);
INSERT INTO public.moon VALUES (18, 'Kerberos', 19, 4500, false, 'Small double-lobed moon of Pluto.', true, -1.75, 10);
INSERT INTO public.moon VALUES (19, 'Hydra', 51, 4500, false, 'Small irregular moon of Pluto.', true, -1.65, 10);
INSERT INTO public.moon VALUES (20, 'Nix', 49, 4500, false, 'Moon of Pluto with bright surface.', true, -1.68, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 4500, false, true, 'Closest planet to the Sun.', 88.0, 'Terrestrial', 58.6, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 4500, false, true, 'Second planet from the Sun with thick atmosphere.', 22.5, 'Terrestrial', 24.0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 4540, true, true, 'Our home planet with diverse life forms.', 36.5, 'Terrestrial', 24.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 4500, false, true, 'The Red Planet with potential for past life.', 68.7, 'Terrestrial', 24.6, 1);
INSERT INTO public.planet VALUES (5, 'Proxima b', 12000, 4500, false, true, 'Exoplanet in habitable zone of Proxima Centauri.', 11.2, 'Exoplanet', 24.0, 2);
INSERT INTO public.planet VALUES (6, 'Proxima c', 15000, 4000, false, true, 'Cold super-Earth orbiting Proxima Centauri.', 19.2, 'Exoplanet', 24.0, 2);
INSERT INTO public.planet VALUES (7, 'Rigel I', 30000, 200, false, true, 'Gas giant close to Rigel.', 50.0, 'Gas Giant', 15.0, 3);
INSERT INTO public.planet VALUES (8, 'Rigel II', 50000, 300, false, true, 'Massive planet orbiting Rigel.', 12.0, 'Gas Giant', 30.0, 3);
INSERT INTO public.planet VALUES (9, 'Sirius Ab', 14000, 500, false, true, 'Hot rocky planet near Sirius A.', 20.0, 'Terrestrial', 10.0, 4);
INSERT INTO public.planet VALUES (10, 'Sirius Ac', 30000, 800, false, true, 'Gas giant orbiting Sirius A.', 40.0, 'Gas Giant', 18.0, 4);
INSERT INTO public.planet VALUES (11, 'Andromeda Prime', 16000, 6000, false, true, 'Representative planet in Andromeda galaxy.', 60.0, 'Exoplanet', 30.0, 5);
INSERT INTO public.planet VALUES (12, 'Triangulum-1', 10000, 5000, false, true, 'Rocky planet orbiting a star in Triangulum galaxy.', 35.0, 'Exoplanet', 22.0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.39, 4600, 'The star at the center of our Solar System.', 5778, true, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.2, 4500, 'The closest known star to the Sun.', 3042, true, true, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 97, 800, 'A blue supergiant in Orion constellation.', 12100, true, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 2.4, 242, 'The brightest star in the night sky.', 9940, true, false, 1);
INSERT INTO public.star VALUES (5, 'Andromeda Star A', 1.5, 6000, 'Representative bright star in the Andromeda galaxy.', 8500, true, false, 2);
INSERT INTO public.star VALUES (6, 'Triangulum Star X', 0.9, 5000, 'Representative star in Triangulum galaxy.', 6200, true, false, 3);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

