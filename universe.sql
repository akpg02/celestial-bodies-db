--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars_in_billions integer,
    description text,
    year_discovered numeric,
    is_spherical boolean
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    year_discovered integer,
    diameter_km numeric,
    planet_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    distance_from_earth integer,
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    astronomical_name text,
    meaning text,
    apparent_magnitude numeric,
    absolute_magnitude numeric,
    distance_light_year integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', 200, 'The Milky Way is the galaxy that includes the Solar System', 1610, true);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 100, 'The Whirlpool Galaxy is an interacting grand-design spiral with Seyfert 2 active galactic nucleus', 1773, true);
INSERT INTO public.galaxy VALUES (3, 'Tadpole', 0, 'The Tadpole, also is a disrupted barred spiral galaxy', 1982, true);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 1000, 'The Andromeda is a barred spiral galaxy is the nearest major galaxy to the Milky Way.', 964, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 49', 200, 'Messier 49 is a giant elliptical galaxy about 56 million light-years away in the equatorial constellation Virgo', 1777, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 100, 'It is a spiral galaxy located in the constellation Virgo', 1781, true);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 3, 'Small Magellanic Cloud is a dwarf galaxy near teh Milky Way', 1519, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 1);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 5);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Ganymede', 1610, 5268.2, 3);
INSERT INTO public.moon VALUES (9, 'Titan', 1655, 5151.0, 7);
INSERT INTO public.moon VALUES (10, 'Callisto', 1610, 4816.8, 4);
INSERT INTO public.moon VALUES (11, 'Io', 1610, 3636.2, 3);
INSERT INTO public.moon VALUES (12, 'The Moon', NULL, 3474.2, 1);
INSERT INTO public.moon VALUES (13, 'Europa', 1610, 3121.4, 3);
INSERT INTO public.moon VALUES (14, 'Triton', 1846, 2706.8, 8);
INSERT INTO public.moon VALUES (15, 'Titania', 1787, 1577.8, 4);
INSERT INTO public.moon VALUES (16, 'Rhea', 1672, 1529.0, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1787, 1522.8, 4);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1671, 1469.0, 7);
INSERT INTO public.moon VALUES (19, 'Charon', 1978, 1207.2, 9);
INSERT INTO public.moon VALUES (20, 'Umbriel', 1851, 1169.4, 4);
INSERT INTO public.moon VALUES (21, 'Ariel', 1851, 1157.8, 4);
INSERT INTO public.moon VALUES (22, 'Dione', 1684, 1125.0, 7);
INSERT INTO public.moon VALUES (23, 'Tethys', 1684, 1062.6, 7);
INSERT INTO public.moon VALUES (24, 'Dysnomia', 2005, 700, 10);
INSERT INTO public.moon VALUES (25, 'Enceladus', 1789, 504.6, 7);
INSERT INTO public.moon VALUES (26, 'Miranda', 1948, 471.6, 4);
INSERT INTO public.moon VALUES (27, 'Proteus', 1989, 420, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 114, 'The smallest planet in our solar system and closest to the Sun--is only slightly larger than Earths Moon', false, 3);
INSERT INTO public.planet VALUES (2, 'Earth', 0, 'Earth--our home planet--is the only place we know of so far thats inhabited by living things', true, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 480, 'Jupiter is more than twice as massive than the other planets of our solar system combined.', false, 4);
INSERT INTO public.planet VALUES (4, 'Uranus', 1867, 'Uranus--seventh planet from the Sun--rotates at nearly 90-degree angle from the plane of its orbit', false, 7);
INSERT INTO public.planet VALUES (5, 'Venus', 36, 'Venus spins slowly in the opposite direction from most planets', false, 8);
INSERT INTO public.planet VALUES (6, 'Mars', 215, 'Mars is a dusty, cold, desert world with a very thin atmosphere.', false, 5);
INSERT INTO public.planet VALUES (7, 'Saturn', 836, 'Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system.', false, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 2736, 'Neptune--the eighth and most distant major planet orbiting our Sun--is dark, cold and whipped by supersonic winds.', false, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 3142, 'Pluto is a dwarf planet in the Kuiper Belt, a ring of bodies beyond the orbit Neptune.', false, 6);
INSERT INTO public.planet VALUES (10, 'Eris', 10122854, 'Eris is the most massive and second-largest known dwarf planet in the Solar System', false, 7);
INSERT INTO public.planet VALUES (11, 'Haumea', 4644261, 'Haumea is a dwarf planet located beyond Neptunes orbit', false, 4);
INSERT INTO public.planet VALUES (12, 'Ceres', 2541702, 'Ceres is a dwarf planet in the asteroid belt between the orbits of Mars and Jupiter', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 'Alpha Canis Majoris', 'scorching', -1.44, 1.45, 9, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'Alpha Carinae', 'Pilot of the ship', -0.62, -5.53, 313, 1);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Alpha Bootis', 'Guardian of the bear', -0.05, -0.31, 37, 1);
INSERT INTO public.star VALUES (5, 'Rigel Kentaurus', 'Alpha Centauri', 'Foot of the centaur', -0.01, 4.34, 4, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Alpha Lyrae', 'Eagle or vulture', 0.03, 0.58, 25, 1);
INSERT INTO public.star VALUES (7, 'Capella', 'Alpha Aurigae', 'Little she-goat', 0.08, -0.48, 42, 1);
INSERT INTO public.star VALUES (8, 'Rigel', 'Beta Orionis', 'Foot', 0.18, -6.69, 773, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
