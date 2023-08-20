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
    name character varying(30) NOT NULL,
    number_of_planets integer,
    stelar_density integer,
    average_star_mass numeric(10,5),
    description text NOT NULL
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
    name character varying(30) NOT NULL,
    distance_from_planet_surface integer,
    number_of_craters integer,
    surface_gravity numeric(10,5),
    description text NOT NULL,
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
    name character varying(30) NOT NULL,
    number_of_moons integer,
    surface_temperature integer,
    orbital_eccentricity numeric(10,5),
    description text NOT NULL,
    has_life boolean,
    has_ocean boolean,
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    galaxy_id integer NOT NULL,
    number_of_planets integer,
    number_of_stars integer,
    solar_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solary_sistem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solary_sistem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solary_sistem_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solary_sistem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solary_sistem_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets_orbiting integer,
    luminosity integer,
    solar_radius numeric(10,5),
    description text NOT NULL,
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solary_sistem_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 10000, 1101, 1000.00000, 'Where we at');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5000, 1200, 900.00000, 'A spiral galaxy that is the closest neighbor to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1500, 800, 500.00000, 'A small spiral galaxy that is a member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 2000, 1500, 800.00000, 'An elliptical galaxy with a prominent dust lane across its center.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 1000, 600, 300.00000, 'A classic spiral galaxy known for its interaction with a smaller galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 700, 400, 200.00000, 'An edge-on spiral galaxy with a bright central bulge resembling a sombrero hat.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 5000, 1.62000, 'Earth natural satellite.', 5);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377, 100, 0.00570, 'Larger moon of Mars.', 6);
INSERT INTO public.moon VALUES (3, 'Deimos', 23459, 50, 0.00300, 'Smaller moon of Mars.', 6);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070412, 1950, 1.42800, 'Largest moon in the solar system.', 7);
INSERT INTO public.moon VALUES (5, 'Europa', 671034, 1512, 1.31400, 'Smoothest surface of any moon.', 7);
INSERT INTO public.moon VALUES (6, 'Io', 421700, 425, 1.79600, 'Most geologically active moon.', 7);
INSERT INTO public.moon VALUES (7, 'Titan', 1221865, 300, 1.35200, 'Largest moon of Saturn, has a thick atmosphere.', 8);
INSERT INTO public.moon VALUES (8, 'Triton', 354800, 75, 0.78000, 'Largest moon of Neptune, retrograde orbit.', 9);
INSERT INTO public.moon VALUES (17, 'Moon', 384400, 5000, 1.62000, 'Earths natural satellite.', 5);
INSERT INTO public.moon VALUES (23, 'Callisto', 1882709, 1696, 1.23500, 'Outermost of the Galilean moons.', 7);
INSERT INTO public.moon VALUES (25, 'Enceladus', 237948, 121, 0.11300, 'Active geysers at its south pole.', 8);
INSERT INTO public.moon VALUES (26, 'Mimas', 185539, 40, 0.06400, 'Prominent impact crater Herschel.', 8);
INSERT INTO public.moon VALUES (28, 'Proxima Moon 1', 10000, 50, 0.10000, 'Moon of Proxima Centauri b.', 9);
INSERT INTO public.moon VALUES (29, 'TRAPPIST-1 Moon 1', 8000, 30, 0.08000, 'Moon of TRAPPIST-1 d.', 10);
INSERT INTO public.moon VALUES (30, 'Kepler Moon 1', 15000, 70, 0.15000, 'Moon of Kepler-452b.', 11);
INSERT INTO public.moon VALUES (31, 'HD 209458 Moon 1', 5000, 10, 0.05000, 'Moon of HD 209458 b.', 12);
INSERT INTO public.moon VALUES (32, 'WASP-39 Moon 1', 8000, 15, 0.06000, 'Moon of WASP-39b.', 13);
INSERT INTO public.moon VALUES (33, 'Gliese 581 Moon 1', 12000, 40, 0.10000, 'Moon of Gliese 581 d.', 14);
INSERT INTO public.moon VALUES (34, 'K2-18 Moon 1', 10000, 25, 0.08000, 'Moon of K2-18 b.', 15);
INSERT INTO public.moon VALUES (35, 'LHS 1140 Moon 1', 6000, 20, 0.07000, 'Moon of LHS 1140 b.', 16);
INSERT INTO public.moon VALUES (36, 'HD 189733 Moon 1', 8000, 30, 0.09000, 'Moon of HD 189733 b.', 17);
INSERT INTO public.moon VALUES (37, 'OGLE-2005 Moon 1', 11000, 40, 0.11000, 'Moon of OGLE-2005-BLG-390Lb.', 18);
INSERT INTO public.moon VALUES (38, '55 Cancri Moon 1', 9000, 35, 0.10000, 'Moon of 55 Cancri e.', 19);
INSERT INTO public.moon VALUES (39, 'Tau Ceti Moon 1', 8000, 30, 0.09000, 'Moon of Tau Ceti e.', 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Mercury', 0, 700, 0.20560, 'Innermost planet with extreme temperature variations.', false, false, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 0, 467, 0.00670, 'Hot and rocky planet with thick, toxic atmosphere.', false, false, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 1, 15, 0.01670, 'Our home planet, teeming with life and diverse ecosystems.', true, true, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 2, -80, 0.09350, 'Known as the "Red Planet," with potential evidence of past water flows.', false, false, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 79, -145, 0.04840, 'Largest planet with a massive gas atmosphere and a strong magnetic field.', false, false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 83, -178, 0.05650, 'Recognizable by its spectacular ring system.', false, false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 27, -224, 0.04640, 'Tilted planet with an icy composition.', false, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 14, -218, 0.00900, 'Blue-hued gas giant with strong winds and a mysterious dark spot.', false, false, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 0, 234, 0.03000, 'Exoplanet orbiting Proxima Centauri, the closest known star to the Sun.', false, false, 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 d', 0, -40, 0.02800, 'Exoplanet orbiting the ultra-cool dwarf star TRAPPIST-1.', false, false, 1);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 0, 25, 0.03000, 'Exoplanet with similarities to Earth, orbiting a star similar to the Sun.', false, false, 1);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 1, 1000, 0.02000, 'Exoplanet known as "Osiris" due to its proximity to its parent star.', false, false, 1);
INSERT INTO public.planet VALUES (15, 'WASP-39b', 0, 1300, 0.10000, 'Exoplanet with a relatively low density and high temperature.', false, false, 1);
INSERT INTO public.planet VALUES (16, 'Gliese 581 d', 2, -22, 0.23000, 'Exoplanet in the habitable zone of the red dwarf star Gliese 581.', false, false, 1);
INSERT INTO public.planet VALUES (17, 'K2-18 b', 1, 150, 0.05000, 'Exoplanet with potentially habitable conditions in the habitable zone of K2-18.', false, true, 1);
INSERT INTO public.planet VALUES (18, 'LHS 1140 b', 0, 260, 0.09000, 'Exoplanet located in the habitable zone of the red dwarf star LHS 1140.', false, false, 1);
INSERT INTO public.planet VALUES (19, 'HD 189733 b', 0, 1200, 0.02000, 'Exoplanet known for its blue color and extreme atmospheric conditions.', false, false, 1);
INSERT INTO public.planet VALUES (20, 'OGLE-2005-BLG-390Lb', 0, -220, 0.05000, 'Exoplanet discovered through gravitational microlensing.', false, false, 1);
INSERT INTO public.planet VALUES (21, '55 Cancri e', 0, 2000, 0.04000, 'Exoplanet with a high density and extreme temperatures.', false, false, 1);
INSERT INTO public.planet VALUES (22, 'Tau Ceti e', 0, -70, 0.10000, 'Exoplanet orbiting the Sun-like star Tau Ceti.', false, false, 1);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 8, 1, 1, 'Solar System 2', 'Another solar system within the Milky Way galaxy.');
INSERT INTO public.solar_system VALUES (1, 6, 1, 2, 'Solar System 3', 'Yet another solar system within the Milky Way galaxy.');
INSERT INTO public.solar_system VALUES (1, 10, 1, 3, 'Solar System 4', 'A diverse solar system within the Milky Way galaxy.');
INSERT INTO public.solar_system VALUES (1, 4, 1, 4, 'Solar System 5', 'A compact solar system within the Milky Way galaxy.');
INSERT INTO public.solar_system VALUES (1, 9, 1, 5, 'Solar System 6', 'A unique solar system within the Milky Way galaxy.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, 1.00000, 'The Star of the show', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 25, 2.06300, 'Brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 2, 1.22700, 'Closest star system to our solar system.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0, 105000, 887.00000, 'Red supergiant in the Orion constellation.', 1);
INSERT INTO public.star VALUES (5, 'Vega', 1, 37, 2.36200, 'Bright star in the Summer Triangle.', 1);
INSERT INTO public.star VALUES (6, 'Pollux', 1, 32, 9.06000, 'Giant star in the constellation Gemini.', 1);
INSERT INTO public.star VALUES (7, 'Antares', 1, 60, 883.00000, 'Red supergiant in the constellation Scorpius.', 1);
INSERT INTO public.star VALUES (8, 'Altair', 1, 11, 1.63000, 'One of the vertices of the Summer Triangle.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: solar_system_solary_sistem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solary_sistem_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: star description_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT description_unique_constraint UNIQUE (description);


--
-- Name: galaxy galaxy_description_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_unique_constraint UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_unique_constraint UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_unique_constraint UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_description_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_description_unique_constraint UNIQUE (description);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

