--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6 (Ubuntu 13.6-1.pgdg18.04+1)
-- Dumped by pg_dump version 13.6 (Ubuntu 13.6-1.pgdg18.04+1)

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
-- Name: activity; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    destination_id integer,
    name character varying(100) NOT NULL,
    person_cost smallint,
    guide_cost smallint,
    car_cost smallint,
    person_per_car smallint,
    type character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.activity OWNER TO locallysourcedcuba;

--
-- Name: activity_combo; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.activity_combo (
    id integer NOT NULL,
    activity_id integer NOT NULL,
    parent_id integer NOT NULL,
    priority smallint
);


ALTER TABLE public.activity_combo OWNER TO locallysourcedcuba;

--
-- Name: activity_combo_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.activity_combo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_combo_id_seq OWNER TO locallysourcedcuba;

--
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq OWNER TO locallysourcedcuba;

--
-- Name: booking; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    sleeping_requirement_id integer,
    tour_id integer,
    name character varying(255) DEFAULT NULL::character varying,
    pax smallint,
    lp smallint,
    note text
);


ALTER TABLE public.booking OWNER TO locallysourcedcuba;

--
-- Name: booking_accommodation; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking_accommodation (
    id integer NOT NULL,
    booking_id integer NOT NULL,
    itinerary_id integer,
    date_in date,
    date_out date,
    canceled boolean
);


ALTER TABLE public.booking_accommodation OWNER TO locallysourcedcuba;

--
-- Name: booking_accommodation_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.booking_accommodation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_accommodation_id_seq OWNER TO locallysourcedcuba;

--
-- Name: booking_house; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking_house (
    id integer NOT NULL,
    house_id integer,
    booking_accommodation_id integer
);


ALTER TABLE public.booking_house OWNER TO locallysourcedcuba;

--
-- Name: booking_house_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.booking_house_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_house_id_seq OWNER TO locallysourcedcuba;

--
-- Name: booking_house_room; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking_house_room (
    id integer NOT NULL,
    house_room_id integer NOT NULL,
    booking_house_id integer NOT NULL,
    price smallint,
    cant smallint
);


ALTER TABLE public.booking_house_room OWNER TO locallysourcedcuba;

--
-- Name: booking_house_room_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.booking_house_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_house_room_id_seq OWNER TO locallysourcedcuba;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO locallysourcedcuba;

--
-- Name: booking_transfer; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking_transfer (
    id integer NOT NULL,
    destination_id integer,
    driver_id integer,
    booking_in_id integer,
    booking_out_id integer,
    tour_id integer,
    contact character varying(255) DEFAULT NULL::character varying,
    persons smallint,
    date date,
    hour time(0) without time zone DEFAULT NULL::time without time zone,
    flight_data character varying(255) DEFAULT NULL::character varying,
    price smallint,
    from_hour time(0) without time zone DEFAULT NULL::time without time zone,
    to_hour time(0) without time zone DEFAULT NULL::time without time zone,
    charge smallint,
    sent boolean,
    canceled boolean,
    note text,
    type character varying(3) DEFAULT NULL::character varying
);


ALTER TABLE public.booking_transfer OWNER TO locallysourcedcuba;

--
-- Name: booking_transfer_house; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.booking_transfer_house (
    booking_transfer_id integer NOT NULL,
    house_id integer NOT NULL
);


ALTER TABLE public.booking_transfer_house OWNER TO locallysourcedcuba;

--
-- Name: booking_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.booking_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_transfer_id_seq OWNER TO locallysourcedcuba;

--
-- Name: destination; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.destination (
    id integer NOT NULL,
    province_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.destination OWNER TO locallysourcedcuba;

--
-- Name: destination_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.destination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destination_id_seq OWNER TO locallysourcedcuba;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO locallysourcedcuba;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.driver (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(50) DEFAULT NULL::character varying,
    pax smallint
);


ALTER TABLE public.driver OWNER TO locallysourcedcuba;

--
-- Name: driver_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_id_seq OWNER TO locallysourcedcuba;

--
-- Name: guide; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.guide (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    last_name character varying(30) DEFAULT NULL::character varying,
    email character varying(100) DEFAULT NULL::character varying,
    phone character varying(50) DEFAULT NULL::character varying,
    bonus smallint
);


ALTER TABLE public.guide OWNER TO locallysourcedcuba;

--
-- Name: guide_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.guide_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guide_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house (
    id integer NOT NULL,
    type_id integer,
    destination_id integer,
    name character varying(255) NOT NULL,
    address character varying(255) DEFAULT NULL::character varying,
    phone character varying(50) DEFAULT NULL::character varying,
    email character varying(100) DEFAULT NULL::character varying,
    description text
);


ALTER TABLE public.house OWNER TO locallysourcedcuba;

--
-- Name: house_feature; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_feature (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.house_feature OWNER TO locallysourcedcuba;

--
-- Name: house_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_feature_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_house_feature; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_house_feature (
    house_id integer NOT NULL,
    house_feature_id integer NOT NULL
);


ALTER TABLE public.house_house_feature OWNER TO locallysourcedcuba;

--
-- Name: house_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_room; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_room (
    id integer NOT NULL,
    room_type_id integer NOT NULL,
    house_id integer,
    price smallint,
    cant smallint
);


ALTER TABLE public.house_room OWNER TO locallysourcedcuba;

--
-- Name: house_room_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_room_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_room_type; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_room_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.house_room_type OWNER TO locallysourcedcuba;

--
-- Name: house_room_type_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_room_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_room_type_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_season; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_season (
    id integer NOT NULL,
    house_id integer NOT NULL,
    start_date timestamp(0) without time zone NOT NULL,
    end_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.house_season OWNER TO locallysourcedcuba;

--
-- Name: house_season_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_season_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_season_room; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_season_room (
    id integer NOT NULL,
    room_id integer NOT NULL,
    house_season_id integer NOT NULL,
    price smallint
);


ALTER TABLE public.house_season_room OWNER TO locallysourcedcuba;

--
-- Name: house_season_room_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_season_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_season_room_id_seq OWNER TO locallysourcedcuba;

--
-- Name: house_type; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.house_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.house_type OWNER TO locallysourcedcuba;

--
-- Name: house_type_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.house_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_type_id_seq OWNER TO locallysourcedcuba;

--
-- Name: itinerary; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary (
    id integer NOT NULL,
    destination_id integer,
    house_id integer,
    tour_id integer NOT NULL,
    days smallint NOT NULL
);


ALTER TABLE public.itinerary OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary_day (
    id integer NOT NULL,
    itinerary_id integer NOT NULL,
    no_guide boolean,
    day smallint,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.itinerary_day OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day_activity; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary_day_activity (
    itinerary_day_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.itinerary_day_activity OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.itinerary_day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_day_id_seq OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day_template; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary_day_template (
    id integer NOT NULL,
    itinerary_id integer NOT NULL,
    no_guide boolean,
    day smallint
);


ALTER TABLE public.itinerary_day_template OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day_template_activity; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary_day_template_activity (
    itinerary_day_template_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.itinerary_day_template_activity OWNER TO locallysourcedcuba;

--
-- Name: itinerary_day_template_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.itinerary_day_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_day_template_id_seq OWNER TO locallysourcedcuba;

--
-- Name: itinerary_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.itinerary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_id_seq OWNER TO locallysourcedcuba;

--
-- Name: itinerary_template; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.itinerary_template (
    id integer NOT NULL,
    destination_id integer,
    house_id integer,
    tour_template_id integer NOT NULL,
    days smallint NOT NULL
);


ALTER TABLE public.itinerary_template OWNER TO locallysourcedcuba;

--
-- Name: itinerary_template_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.itinerary_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_template_id_seq OWNER TO locallysourcedcuba;

--
-- Name: location; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.location OWNER TO locallysourcedcuba;

--
-- Name: location_distance; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.location_distance (
    id integer NOT NULL,
    location1_id integer NOT NULL,
    location2_id integer NOT NULL,
    kms smallint NOT NULL
);


ALTER TABLE public.location_distance OWNER TO locallysourcedcuba;

--
-- Name: location_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.location_distance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_distance_id_seq OWNER TO locallysourcedcuba;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO locallysourcedcuba;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(50) DEFAULT NULL::character varying,
    days smallint,
    priority smallint DEFAULT 0,
    slug character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.notification OWNER TO locallysourcedcuba;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO locallysourcedcuba;

--
-- Name: notification_service; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.notification_service (
    notification_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.notification_service OWNER TO locallysourcedcuba;

--
-- Name: notification_tour; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.notification_tour (
    id integer NOT NULL,
    tour_id integer NOT NULL,
    notification_id integer NOT NULL,
    days smallint NOT NULL,
    complete boolean
);


ALTER TABLE public.notification_tour OWNER TO locallysourcedcuba;

--
-- Name: notification_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.notification_tour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_tour_id_seq OWNER TO locallysourcedcuba;

--
-- Name: notification_tour_template; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.notification_tour_template (
    id integer NOT NULL,
    tour_template_id integer NOT NULL,
    notification_id integer NOT NULL,
    days smallint NOT NULL
);


ALTER TABLE public.notification_tour_template OWNER TO locallysourcedcuba;

--
-- Name: notification_tour_template_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.notification_tour_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_tour_template_id_seq OWNER TO locallysourcedcuba;

--
-- Name: province; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.province (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.province OWNER TO locallysourcedcuba;

--
-- Name: province_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.province_id_seq OWNER TO locallysourcedcuba;

--
-- Name: service; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.service (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10) DEFAULT NULL::character varying,
    days_to_show integer
);


ALTER TABLE public.service OWNER TO locallysourcedcuba;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO locallysourcedcuba;

--
-- Name: sleeping_requirement; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.sleeping_requirement (
    id integer NOT NULL,
    accommodation_type_id integer,
    description text
);


ALTER TABLE public.sleeping_requirement OWNER TO locallysourcedcuba;

--
-- Name: sleeping_requirement_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.sleeping_requirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sleeping_requirement_id_seq OWNER TO locallysourcedcuba;

--
-- Name: srroom_type; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.srroom_type (
    id integer NOT NULL,
    room_type_id integer,
    sleeping_requirement_id integer NOT NULL,
    cant smallint
);


ALTER TABLE public.srroom_type OWNER TO locallysourcedcuba;

--
-- Name: srroom_type_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.srroom_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.srroom_type_id_seq OWNER TO locallysourcedcuba;

--
-- Name: tour; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.tour (
    id integer NOT NULL,
    guide_id integer,
    transfer_in_id integer,
    transfer_out_id integer,
    transportation_id integer,
    house_type_id integer,
    template_id integer,
    service_id integer,
    code character varying(30) DEFAULT NULL::character varying,
    guide_wage double precision,
    color character varying(10) DEFAULT NULL::character varying,
    start_place character varying(255) DEFAULT NULL::character varying,
    finish_place character varying(255) DEFAULT NULL::character varying,
    description text,
    bonus smallint,
    days smallint,
    start_day smallint,
    agent boolean,
    start_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    canceled boolean,
    name character varying(255) NOT NULL,
    end_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.tour OWNER TO locallysourcedcuba;

--
-- Name: tour_activity; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.tour_activity (
    tour_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.tour_activity OWNER TO locallysourcedcuba;

--
-- Name: tour_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.tour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tour_id_seq OWNER TO locallysourcedcuba;

--
-- Name: tour_template; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.tour_template (
    id integer NOT NULL,
    template1_id integer,
    template2_id integer,
    transfer_in_id integer,
    transfer_out_id integer,
    transportation_id integer,
    house_type_id integer,
    name character varying(255) NOT NULL,
    code character varying(30) DEFAULT NULL::character varying,
    type character varying(50) DEFAULT NULL::character varying,
    tour_type character varying(5) DEFAULT NULL::character varying,
    guide_wage double precision,
    color character varying(10) DEFAULT NULL::character varying,
    start_place character varying(255) DEFAULT NULL::character varying,
    finish_place character varying(255) DEFAULT NULL::character varying,
    description text,
    bonus smallint,
    days smallint,
    start_day smallint
);


ALTER TABLE public.tour_template OWNER TO locallysourcedcuba;

--
-- Name: tour_template_activity; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.tour_template_activity (
    tour_template_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.tour_template_activity OWNER TO locallysourcedcuba;

--
-- Name: tour_template_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.tour_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tour_template_id_seq OWNER TO locallysourcedcuba;

--
-- Name: transportation; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.transportation (
    id integer NOT NULL,
    driver_id integer,
    name character varying(100) NOT NULL
);


ALTER TABLE public.transportation OWNER TO locallysourcedcuba;

--
-- Name: transportation_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.transportation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportation_id_seq OWNER TO locallysourcedcuba;

--
-- Name: transportation_price; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.transportation_price (
    id integer NOT NULL,
    transportation_id integer,
    min smallint NOT NULL,
    max smallint NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.transportation_price OWNER TO locallysourcedcuba;

--
-- Name: transportation_price_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.transportation_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportation_price_id_seq OWNER TO locallysourcedcuba;

--
-- Name: transportation_route; Type: TABLE; Schema: public; Owner: locallysourcedcuba
--

CREATE TABLE public.transportation_route (
    id integer NOT NULL,
    location_from_id integer,
    location_to_id integer NOT NULL,
    transportation_id integer,
    kms smallint
);


ALTER TABLE public.transportation_route OWNER TO locallysourcedcuba;

--
-- Name: transportation_route_id_seq; Type: SEQUENCE; Schema: public; Owner: locallysourcedcuba
--

CREATE SEQUENCE public.transportation_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportation_route_id_seq OWNER TO locallysourcedcuba;

--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.activity (id, destination_id, name, person_cost, guide_cost, car_cost, person_per_car, type) FROM stdin;
1	39	Estnihilteneturquae.	8	20	\N	\N	normal
2	39	Autetet.	3	10	\N	\N	normal
3	39	Sedremhic.	16	20	\N	\N	normal
4	39	Enimsitexplicaboad.	\N	\N	9	13	transport
5	39	Sequieosquiodio.	\N	\N	6	5	transport
6	40	Debitisdebitismodiimpeditquibusdam.	20	10	\N	\N	normal
7	40	Etofficiis.	3	2	\N	\N	normal
8	40	Odioquasrem.	\N	\N	7	9	transport
9	40	Aspernaturvoluptascum.	\N	\N	9	18	transport
10	40	Nullaullamconsequaturdoloribusconsecteturpossimusfugiat.	\N	\N	3	20	transport
11	40	Utquiquamoccaecati.	\N	\N	14	8	transport
12	41	Quinecessitatibusmolestiaeoptio.	2	19	\N	\N	normal
13	41	Inciduntitaqueomnisquiharumquiet.	2	20	\N	\N	normal
14	41	Laboriosamquisquam.	3	8	\N	\N	normal
15	41	Quassaepevoluptatum.	9	5	\N	\N	normal
16	41	Autemfacerepossimuslaborumfugitea.	\N	\N	6	15	transport
17	41	Corruptinihilquaequodvelitet.	\N	\N	18	10	transport
18	41	Quiconsequaturvoluptatesquis.	\N	\N	12	20	transport
19	41	Remidminimaplaceatillum.	\N	\N	3	2	transport
20	42	Voluptatemconsequaturexercitationem.	14	6	\N	\N	normal
21	42	Omnisvoluptatibus.	16	15	\N	\N	normal
22	42	Velitutnatus.	12	1	\N	\N	normal
23	42	Quasiassumendarerumveroalias.	\N	\N	2	19	transport
24	42	Dolorrerumfugiatnumquamin.	\N	\N	3	4	transport
25	42	Possimussintnihil.	\N	\N	2	13	transport
26	43	Nonrerum.	17	8	\N	\N	normal
27	43	Molestiaeeaque.	8	4	\N	\N	normal
28	43	Consequaturquasmolestias.	3	9	\N	\N	normal
29	43	Quoetenimexpedita.	15	15	\N	\N	normal
30	43	Providentsedmaximeexercitationem.	\N	\N	18	6	transport
31	43	Abquiaearum.	\N	\N	1	10	transport
32	43	Itaqueestreiciendis.	\N	\N	13	20	transport
33	43	Voluptatibuseosquamvoluptatibusatque.	\N	\N	16	16	transport
34	44	Asperioreseteabeataeomnis.	14	8	\N	\N	normal
35	44	Praesentiumexercitationem.	18	20	\N	\N	normal
36	44	Autliberoomnisvoluptas.	6	2	\N	\N	normal
37	44	Sedsintcumquaeratvelet.	\N	\N	4	6	transport
38	44	Necessitatibuscum.	\N	\N	14	7	transport
39	44	Estdolor.	\N	\N	18	11	transport
40	44	Fugaet.	\N	\N	19	14	transport
41	44	Necessitatibusabomnis.	\N	\N	8	16	transport
42	45	Voluptasestnullavoluptatibus.	14	17	\N	\N	normal
43	45	Cumdoloresaddeserunt.	11	2	\N	\N	normal
44	45	Saepeutsuscipitfugiatmodi.	16	10	\N	\N	normal
45	45	Adipiscidictaquiautem.	\N	\N	12	2	transport
46	45	Explicabonobisqui.	\N	\N	12	5	transport
47	45	Eligendietassumenda.	\N	\N	15	3	transport
48	46	Adipisciin.	12	20	\N	\N	normal
49	46	Distinctiosintdolore.	15	20	\N	\N	normal
50	46	Inautautautarchitecto.	8	7	\N	\N	normal
51	46	Dolorevoluptatemasperiores.	\N	\N	20	8	transport
52	46	Culpaomnis.	\N	\N	3	19	transport
53	46	Nihildoloremqueculpautlaboresuscipitaccusantium.	\N	\N	2	20	transport
54	46	Voluptatemmodi.	\N	\N	1	12	transport
55	47	Perspiciatisillosequivelliberomolestiae.	8	19	\N	\N	normal
56	47	Sequidictaexplicabo.	16	3	\N	\N	normal
57	47	Velminussedaperiammagnisitquae.	12	17	\N	\N	normal
58	47	Etearumasperiores.	\N	\N	14	1	transport
59	47	Minusvoluptatemsuntomnisetquasiquidem.	\N	\N	15	4	transport
60	47	Voluptatemvoluptatemquameaetquisquam.	\N	\N	7	9	transport
61	47	Sitquiconsequatur.	\N	\N	6	5	transport
62	47	Possimusminusquiasuntnonqui.	\N	\N	10	20	transport
63	48	Esteabeataeut.	14	8	\N	\N	normal
64	48	Consequunturfacerecupiditaterepellatsed.	11	5	\N	\N	normal
65	48	Nobisinventore.	10	19	\N	\N	normal
66	48	Aliquidexplicabooditvitaemaioreserror.	15	16	\N	\N	normal
67	48	Eumrepudiandaeveniamsoluta.	\N	\N	14	1	transport
68	48	Maximedolorumautautconsequatureos.	\N	\N	1	2	transport
69	48	Sedaututexercitationemeosut.	\N	\N	3	18	transport
70	49	Animimaioresmolestiaecorporisidminima.	3	15	\N	\N	normal
71	49	Architectoaut.	20	20	\N	\N	normal
72	49	Consecteturofficiis.	15	5	\N	\N	normal
73	49	Molestiaedoloremveroodiovoluptatemminimaaut.	9	6	\N	\N	normal
74	49	Nihildolorumvoluptatemlaborummolestiae.	17	5	\N	\N	normal
75	49	Consequaturremdolor.	\N	\N	9	11	transport
76	49	Laboriosameosenim.	\N	\N	14	14	transport
77	49	Autemullamcorrupti.	\N	\N	18	1	transport
78	50	Temporaquiea.	9	17	\N	\N	normal
79	50	Nihilquiabmodi.	6	4	\N	\N	normal
80	50	Reprehenderitsunttenetur.	16	1	\N	\N	normal
81	50	Doloremqueofficiavelnonsaepe.	13	5	\N	\N	normal
82	50	Consequaturconsectetur.	\N	\N	7	2	transport
83	50	Nostrumestmolestiaeautullam.	\N	\N	16	2	transport
84	51	Assumendaundesaepenisi.	18	11	\N	\N	normal
85	51	Distinctiovoluptasveldictamagnidistinctio.	15	11	\N	\N	normal
86	51	Asperioresnesciunt.	2	19	\N	\N	normal
87	51	Nondelectus.	9	1	\N	\N	normal
88	51	Providentcumqueimpedit.	\N	\N	14	12	transport
89	51	Facilisnamvelit.	\N	\N	13	10	transport
90	52	Expeditaestea.	10	19	\N	\N	normal
91	52	Molestiaeadut.	14	14	\N	\N	normal
92	52	Doloribusmaioresmolestiaeeligendiarem.	1	19	\N	\N	normal
93	52	Solutavoluptatumminusaut.	\N	\N	8	13	transport
94	52	Dolorumofficiisdeseruntetetdolorem.	\N	\N	2	12	transport
95	52	Autitaquecorporisdolorevoluptatum.	\N	\N	14	6	transport
96	53	Voluptasaliquideiuseoscommodisunt.	19	20	\N	\N	normal
97	53	Fugiatsolutafacilissuntabvoluptatem.	3	11	\N	\N	normal
98	53	Avelqui.	2	12	\N	\N	normal
99	53	Repudiandaereminventoreeumbeatae.	3	8	\N	\N	normal
100	53	Aperiamfuganon.	\N	\N	5	19	transport
101	53	Similiqueverononetporro.	\N	\N	8	12	transport
102	53	Itaqueoccaecatifuganobisodioerroret.	\N	\N	16	1	transport
103	53	Sitsedeosmodicommodiipsumveniam.	\N	\N	4	12	transport
104	54	Aperiamquis.	5	13	\N	\N	normal
105	54	Quiaututpossimuscorporis.	12	20	\N	\N	normal
106	54	Quimagnivoluptas.	11	17	\N	\N	normal
107	54	Adipiscinonquisblanditiis.	16	7	\N	\N	normal
108	54	Doloremqueconsequuntur.	\N	\N	20	15	transport
109	54	Consequaturestodio.	\N	\N	13	2	transport
110	54	Nonassumendaautemrerumharumvitaevitae.	\N	\N	17	6	transport
111	54	Aliquiddoloremquianihileos.	\N	\N	7	8	transport
112	55	Repudiandaeillofugitsed.	9	12	\N	\N	normal
113	55	Estdolorumlaborumofficiisnon.	11	16	\N	\N	normal
114	55	Aliquamiustoodio.	19	9	\N	\N	normal
115	55	Illumplaceateum.	\N	\N	9	4	transport
116	55	Enimoccaecatinostrumerroretesseomnis.	\N	\N	13	15	transport
117	55	Harumdebitisetpossimusquo.	\N	\N	20	14	transport
118	56	Autemperspiciatispraesentiumlaboremollitiaetnatus.	8	12	\N	\N	normal
119	56	Quitemporibusdeserunt.	7	11	\N	\N	normal
120	56	Voluptasinvoluptas.	4	19	\N	\N	normal
121	56	Sapienteremvoluptatibuspraesentium.	7	2	\N	\N	normal
122	56	Dolorumetsedvitae.	\N	\N	7	5	transport
123	56	Voluptasnihil.	\N	\N	18	5	transport
124	56	Etautilloporrocorporistemporasit.	\N	\N	13	5	transport
125	57	Atetquis.	14	12	\N	\N	normal
126	57	Etdolorummolestiaeomnis.	6	19	\N	\N	normal
127	57	Laboremolestiassedlaudantiumnobisquo.	\N	\N	11	6	transport
128	57	Saepequia.	\N	\N	5	4	transport
129	57	Expeditamodiipsam.	\N	\N	6	13	transport
130	45	Sitincorruptiet.	\N	\N	\N	\N	combo
131	51	Namlibero.	\N	\N	\N	\N	combo
132	41	Assumendaquamestautemofficiis.	\N	\N	\N	\N	combo
133	47	Voluptatesquoddelenitivoluptate.	\N	\N	\N	\N	combo
134	44	Quaetenetur.	\N	\N	\N	\N	combo
135	52	Sunteteius.	\N	\N	\N	\N	combo
136	40	Nesciuntnumquam.	\N	\N	\N	\N	combo
137	41	Animiilloodit.	\N	\N	\N	\N	combo
138	41	Quiaeosnemo.	\N	\N	\N	\N	combo
139	42	Possimusutest.	\N	\N	\N	\N	combo
\.


--
-- Data for Name: activity_combo; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.activity_combo (id, activity_id, parent_id, priority) FROM stdin;
1	44	130	1
2	44	130	2
3	89	131	1
4	17	132	1
5	6	136	1
6	7	136	2
7	7	136	3
8	9	136	4
9	16	137	1
10	18	137	2
11	17	137	3
12	12	138	1
13	23	139	1
14	23	139	2
15	20	139	3
16	23	139	4
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking (id, sleeping_requirement_id, tour_id, name, pax, lp, note) FROM stdin;
1	\N	1	Elody White III	1	9	\N
2	\N	1	Dylan Okuneva	3	0	\N
3	\N	1	Dr. Eloisa Fahey V	7	7	\N
4	\N	1	Hester Abbott	6	2	\N
5	\N	1	Mrs. Graciela Stracke DDS	1	9	\N
6	\N	1	Frieda Kutch	2	1	\N
7	\N	1	Buck Fadel	7	3	\N
8	\N	2	Manuela Heidenreich II	5	0	\N
9	\N	2	Wiley Koss	7	4	\N
10	\N	3	Mr. Harry Ortiz II	5	2	\N
11	\N	4	Elyse Cassin	4	9	\N
12	\N	4	Alvera Bogan	5	4	\N
13	\N	4	Esmeralda Cummings PhD	4	7	\N
14	\N	4	Dr. Breana Jacobs II	1	8	\N
15	\N	5	Katrina Jaskolski	8	1	\N
16	\N	5	Breana Glover I	3	1	\N
17	\N	5	Sophia Murphy	3	7	\N
18	\N	5	Brandi Nitzsche DVM	2	6	\N
19	\N	6	Demetrius Collins	3	0	\N
20	\N	7	Dr. Willis Hamill V	4	8	\N
21	\N	8	Camilla Schroeder	1	3	\N
22	\N	8	Kathlyn Wuckert	7	7	\N
23	\N	9	Theo Herzog	7	5	\N
24	\N	9	Prof. Zoe Quigley	6	3	\N
25	\N	10	Miss Georgiana Konopelski	4	7	\N
26	\N	10	Dr. Kenyon Mertz V	3	6	\N
27	\N	10	Andre Jerde	1	6	\N
28	\N	10	Charles Swift Sr.	5	2	\N
29	\N	10	Mr. Alek Daniel IV	6	3	\N
30	\N	10	Vance Hoeger	6	4	\N
31	\N	11	Wava Funk	3	4	\N
32	\N	11	Natalia Shields	7	7	\N
33	\N	11	Elaina Torp	4	1	\N
34	\N	11	Granville Blick Sr.	8	0	\N
35	\N	11	Anibal Johnson	7	1	\N
36	\N	13	Gussie Oberbrunner	5	0	\N
37	\N	14	Betsy Rutherford II	4	10	\N
38	\N	15	Anabel Considine	1	4	\N
39	\N	16	Bertha Feil DVM	2	3	\N
40	\N	16	Felton O'Connell Jr.	6	6	\N
41	\N	17	Jordon Greenfelder IV	7	3	\N
42	\N	18	Mrs. Elisa Treutel PhD	8	2	\N
43	\N	19	Bennie Batz	5	0	\N
44	\N	20	Ambrose O'Conner	1	8	\N
45	\N	20	Winona Bernier	1	1	\N
46	\N	21	Dr. Isabelle Senger DVM	5	6	\N
47	\N	21	Mrs. Alia Rath	2	10	\N
48	\N	21	Dr. Hershel Smitham	6	10	\N
49	\N	22	Clementina Monahan	5	6	\N
50	\N	23	Mr. Vicente Conn Sr.	4	10	\N
51	\N	23	Lily Hauck Sr.	2	1	\N
52	\N	24	Maurine Reichert	3	5	\N
53	\N	24	Kristofer Pagac	2	0	\N
54	\N	25	Rogelio Huels V	8	2	\N
55	\N	26	Dr. Noah Jenkins	3	3	\N
56	\N	27	Zachariah Goodwin	1	0	\N
57	\N	27	Quinton O'Conner	5	6	\N
58	\N	27	Wilmer Nikolaus	6	8	\N
59	\N	27	Ms. Caroline Monahan Jr.	1	7	\N
60	\N	27	Adeline Armstrong	3	3	\N
61	\N	28	Myron Anderson V	2	4	\N
62	\N	28	Hazle Pagac	7	2	\N
63	\N	28	Miss Wilma Hills Jr.	5	4	\N
64	\N	28	Mrs. Shania Towne	3	2	\N
65	\N	28	Miss Christiana Wyman IV	6	8	\N
66	\N	28	Kieran Mohr Jr.	4	2	\N
67	\N	29	Chaz Herman	7	4	\N
68	\N	29	Holly Rosenbaum	5	7	\N
69	\N	29	Mr. Cristopher O'Conner DDS	1	3	\N
70	\N	30	Dr. Kian Berge PhD	1	6	\N
71	\N	30	Colin Kunde Sr.	8	6	\N
72	\N	31	Mrs. Christy Streich	2	4	\N
73	\N	31	Domenic Kautzer	5	9	\N
74	\N	31	Gunnar Wisoky	1	2	\N
75	\N	31	Kaelyn Jones PhD	3	0	\N
76	\N	31	Adah Hane	1	2	\N
77	\N	32	Mariela Stroman	2	8	\N
78	\N	33	Dr. Robbie Gutkowski	8	6	\N
79	\N	34	Mr. Dane Hirthe V	5	3	\N
80	\N	36	Lamont Beier II	8	8	\N
81	\N	36	Prof. Khalil Kohler MD	3	1	\N
82	\N	36	Twila Rempel	1	5	\N
83	\N	37	Fanny Morissette	1	2	\N
84	\N	37	Eden Bashirian	2	7	\N
85	\N	38	Fritz Fadel	3	10	\N
86	\N	39	Prof. Natasha Bartoletti Jr.	5	4	\N
87	\N	39	Ally West	8	7	\N
88	\N	39	Nia Smith	1	1	\N
89	\N	40	Prof. Kenny Lockman Sr.	5	9	\N
90	\N	40	Collin Wehner	5	2	\N
91	\N	40	Wayne Mayer	7	4	\N
92	\N	40	Amalia Legros	7	8	\N
93	\N	40	Dr. Cesar Quigley	8	5	\N
94	\N	41	Josue Rodriguez	7	4	\N
95	\N	41	Hipolito Cormier	1	5	\N
96	\N	41	Cordelia Waelchi	3	5	\N
97	\N	41	Monserrat Schaefer	4	4	\N
98	\N	41	Dr. Cade Spinka MD	2	10	\N
99	\N	41	Taurean Quigley	6	8	\N
100	\N	42	Elena Russel IV	5	8	\N
101	\N	42	Keaton Fadel	2	3	\N
102	\N	43	Sheila Skiles DDS	7	5	\N
103	\N	43	Terrence Olson	7	5	\N
104	\N	45	Lynn Fadel	3	7	\N
105	\N	45	Garth Christiansen	5	4	\N
106	\N	46	Hubert Cremin	6	5	\N
107	\N	46	Mr. Rodrigo Williamson DDS	6	6	\N
108	\N	47	Oran Ernser	3	8	\N
109	\N	48	Vallie Morar	1	5	\N
110	\N	48	Brando Hilll	5	10	\N
111	\N	48	Josefa Jakubowski	2	10	\N
112	\N	48	Camilla Rogahn	8	10	\N
113	\N	49	Mrs. Kaylie Lehner V	2	8	\N
114	\N	49	Talia Emard	7	9	\N
115	\N	49	Roman Mitchell DDS	4	2	\N
116	\N	50	Dean Collier	5	9	\N
117	\N	51	Otto King	6	5	\N
118	\N	52	Rhiannon D'Amore Sr.	7	9	\N
119	\N	52	Mr. Easter Nienow	8	6	\N
120	\N	53	Samir Kiehn	2	8	\N
121	\N	54	Prof. Jairo Treutel DDS	3	10	\N
122	\N	55	Nolan Kuphal	2	5	\N
123	\N	56	Carlo Wuckert	4	5	\N
124	\N	57	Ross Wintheiser	4	8	\N
125	\N	57	Branson Shanahan	5	3	\N
126	\N	57	Lisette Mraz	4	1	\N
127	\N	57	Austin Runolfsdottir	3	1	\N
128	\N	57	Brandon Treutel III	3	4	\N
129	\N	58	Abraham Miller	5	0	\N
130	\N	59	Jody Stoltenberg	6	4	\N
131	\N	59	Sonya McClure Sr.	2	0	\N
132	\N	59	Loren Langworth	1	3	\N
133	\N	59	Merritt Botsford	7	8	\N
134	\N	59	Prof. Marlon Daniel	2	0	\N
135	\N	60	Jenifer Cartwright	5	6	\N
\.


--
-- Data for Name: booking_accommodation; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking_accommodation (id, booking_id, itinerary_id, date_in, date_out, canceled) FROM stdin;
1	1	1	2022-08-14	2022-08-17	\N
2	1	2	2022-08-17	2022-08-23	\N
3	2	1	2022-08-14	2022-08-17	\N
4	2	2	2022-08-17	2022-08-23	\N
5	3	1	2022-08-14	2022-08-17	\N
6	3	2	2022-08-17	2022-08-23	\N
7	4	1	2022-08-14	2022-08-17	\N
8	4	2	2022-08-17	2022-08-23	\N
9	5	1	2022-08-14	2022-08-17	\N
10	5	2	2022-08-17	2022-08-23	\N
11	6	1	2022-08-14	2022-08-17	\N
12	6	2	2022-08-17	2022-08-23	\N
13	7	1	2022-08-14	2022-08-17	\N
14	7	2	2022-08-17	2022-08-23	\N
15	8	3	2022-08-02	2022-08-07	\N
16	8	4	2022-08-07	2022-08-11	\N
17	9	3	2022-08-02	2022-08-07	\N
18	9	4	2022-08-07	2022-08-11	\N
19	10	5	2022-07-23	2022-07-30	\N
20	10	6	2022-07-30	2022-07-31	\N
21	15	7	2022-08-15	2022-08-20	\N
22	15	8	2022-08-20	2022-08-22	\N
23	16	7	2022-08-15	2022-08-20	\N
24	16	8	2022-08-20	2022-08-22	\N
25	17	7	2022-08-15	2022-08-20	\N
26	17	8	2022-08-20	2022-08-22	\N
27	18	7	2022-08-15	2022-08-20	\N
28	18	8	2022-08-20	2022-08-22	\N
29	19	9	2022-08-13	2022-08-23	\N
30	21	10	2022-08-13	2022-08-21	\N
31	21	11	2022-08-21	2022-08-28	\N
32	22	10	2022-08-13	2022-08-21	\N
33	22	11	2022-08-21	2022-08-28	\N
34	36	12	2022-08-10	2022-08-12	\N
35	36	13	2022-08-12	2022-08-15	\N
36	36	14	2022-08-15	2022-08-16	\N
37	37	15	2022-08-04	2022-08-16	\N
38	37	16	2022-08-16	2022-08-18	\N
39	37	17	2022-08-18	2022-08-20	\N
40	38	18	2022-08-07	2022-08-20	\N
41	38	19	2022-08-20	2022-08-28	\N
42	41	20	2022-08-02	2022-08-09	\N
43	41	21	2022-08-09	2022-08-11	\N
44	42	22	2022-08-13	2022-08-22	\N
45	42	23	2022-08-22	2022-08-24	\N
46	43	24	2022-07-30	2022-08-15	\N
47	43	25	2022-08-15	2022-08-20	\N
48	46	26	2022-07-30	2022-08-05	\N
49	47	26	2022-07-30	2022-08-05	\N
50	48	26	2022-07-30	2022-08-05	\N
51	50	27	2022-08-03	2022-08-14	\N
52	50	28	2022-08-14	2022-08-15	\N
53	50	29	2022-08-15	2022-08-21	\N
54	50	30	2022-08-21	2022-08-25	\N
55	51	27	2022-08-03	2022-08-14	\N
56	51	28	2022-08-14	2022-08-15	\N
57	51	29	2022-08-15	2022-08-21	\N
58	51	30	2022-08-21	2022-08-25	\N
59	52	31	2022-08-03	2022-08-04	\N
60	52	32	2022-08-04	2022-08-09	\N
61	53	31	2022-08-03	2022-08-04	\N
62	53	32	2022-08-04	2022-08-09	\N
63	55	33	2022-08-11	2022-08-15	\N
64	55	34	2022-08-15	2022-08-17	\N
65	55	35	2022-08-17	2022-08-20	\N
66	67	36	2022-08-09	2022-08-17	\N
67	68	36	2022-08-09	2022-08-17	\N
68	69	36	2022-08-09	2022-08-17	\N
69	79	37	2022-07-22	2022-07-24	\N
70	79	38	2022-07-24	2022-07-29	\N
71	83	39	2022-08-02	2022-08-11	\N
72	83	40	2022-08-11	2022-08-19	\N
73	83	41	2022-08-19	2022-08-24	\N
74	84	39	2022-08-02	2022-08-11	\N
75	84	40	2022-08-11	2022-08-19	\N
76	84	41	2022-08-19	2022-08-24	\N
77	85	42	2022-07-24	2022-07-26	\N
78	85	43	2022-07-26	2022-08-01	\N
79	85	44	2022-08-01	2022-08-05	\N
80	86	45	2022-08-15	2022-08-20	\N
81	86	46	2022-08-20	2022-08-26	\N
82	87	45	2022-08-15	2022-08-20	\N
83	87	46	2022-08-20	2022-08-26	\N
84	88	45	2022-08-15	2022-08-20	\N
85	88	46	2022-08-20	2022-08-26	\N
86	94	47	2022-07-27	2022-07-30	\N
87	94	48	2022-07-30	2022-07-31	\N
88	94	49	2022-07-31	2022-08-04	\N
89	94	50	2022-08-04	2022-08-08	\N
90	95	47	2022-07-27	2022-07-30	\N
91	95	48	2022-07-30	2022-07-31	\N
92	95	49	2022-07-31	2022-08-04	\N
93	95	50	2022-08-04	2022-08-08	\N
94	96	47	2022-07-27	2022-07-30	\N
95	96	48	2022-07-30	2022-07-31	\N
96	96	49	2022-07-31	2022-08-04	\N
97	96	50	2022-08-04	2022-08-08	\N
98	97	47	2022-07-27	2022-07-30	\N
99	97	48	2022-07-30	2022-07-31	\N
100	97	49	2022-07-31	2022-08-04	\N
101	97	50	2022-08-04	2022-08-08	\N
102	98	47	2022-07-27	2022-07-30	\N
103	98	48	2022-07-30	2022-07-31	\N
104	98	49	2022-07-31	2022-08-04	\N
105	98	50	2022-08-04	2022-08-08	\N
106	99	47	2022-07-27	2022-07-30	\N
107	99	48	2022-07-30	2022-07-31	\N
108	99	49	2022-07-31	2022-08-04	\N
109	99	50	2022-08-04	2022-08-08	\N
110	106	55	2022-08-03	2022-08-07	\N
111	106	56	2022-08-07	2022-08-08	\N
112	106	57	2022-08-08	2022-08-11	\N
113	106	58	2022-08-11	2022-08-16	\N
114	107	55	2022-08-03	2022-08-07	\N
115	107	56	2022-08-07	2022-08-08	\N
116	107	57	2022-08-08	2022-08-11	\N
117	107	58	2022-08-11	2022-08-16	\N
118	113	59	2022-07-21	2022-07-26	\N
119	113	60	2022-07-26	2022-07-27	\N
120	114	59	2022-07-21	2022-07-26	\N
121	114	60	2022-07-26	2022-07-27	\N
122	115	59	2022-07-21	2022-07-26	\N
123	115	60	2022-07-26	2022-07-27	\N
124	116	61	2022-08-19	2022-08-24	\N
125	116	62	2022-08-24	2022-08-25	\N
126	116	63	2022-08-25	2022-08-29	\N
127	117	64	2022-08-01	2022-08-08	\N
128	117	65	2022-08-08	2022-08-09	\N
129	118	66	2022-08-17	2022-08-21	\N
130	118	67	2022-08-21	2022-08-26	\N
131	119	66	2022-08-17	2022-08-21	\N
132	119	67	2022-08-21	2022-08-26	\N
133	122	68	2022-08-04	2022-08-05	\N
134	122	69	2022-08-05	2022-08-15	\N
\.


--
-- Data for Name: booking_house; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking_house (id, house_id, booking_accommodation_id) FROM stdin;
\.


--
-- Data for Name: booking_house_room; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking_house_room (id, house_room_id, booking_house_id, price, cant) FROM stdin;
\.


--
-- Data for Name: booking_transfer; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking_transfer (id, destination_id, driver_id, booking_in_id, booking_out_id, tour_id, contact, persons, date, hour, flight_data, price, from_hour, to_hour, charge, sent, canceled, note, type) FROM stdin;
1	42	84	1	\N	1	Flossie Bernier	1	2022-08-14	12:04:43	Excepturiquaecumetomnisnobismolestiasvel.	3	12:04:43	12:04:43	5	\N	\N	Illosolutavoluptatemvoluptateat.Enimsintvoluptasperferendishicsimilique.Asperioreseiusatetestconsequunturvoluptas.Utasperioresquodreiciendisfacere.	In
2	43	88	\N	1	1	Marlon Bayer	1	2022-08-22	12:04:43	Ameteosdolorenecessitatibusautvelitconsequaturvoluptatessunt.	1	12:04:43	12:04:43	2	\N	\N	Etrerumvoluptatemcupiditateetnamcumque.Inteneturlaborumdoloremquequiaspernaturvoluptatemasperiores.Repellendusexercitationemnonaccusamusautut.Doloremolestiaevelitexearumanimiavoluptas.	Out
3	41	101	2	\N	1	Malachi Luettgen	3	2022-08-14	12:04:43	Possimusnemoquaeratvelidcorrupticulparepellendus.	4	12:04:43	12:04:43	2	\N	\N	Recusandaeaccusantiumteneturlaborumrecusandaerem.Veroquoinciduntealabore.Distinctioeligendimolestiasquisporrototamfugadolores.Quiexercitationemestdictaofficiavoluptatumquiaautvoluptatem.	In
4	50	94	\N	2	1	Dessie Gleason	3	2022-08-22	12:04:43	Nonaliquamestutfugit.	2	12:04:43	12:04:43	3	\N	\N	Officiisutlaudantiumipsamaut.Evenietexpeditaautnamadipisciharumporro.Nesciunttemporibuseumminusvoluptatemadet.	Out
5	55	118	3	\N	1	Gretchen Spinka	7	2022-08-14	12:04:43	Sitquiamollitiaprovidentfacilissedquia.	2	12:04:43	12:04:43	3	\N	\N	Atquequiaipsumodioetquia.Namprovidentillovoluptastemporibusremimpedit.Evenietcumqueatqueautemblanditiissitrepellendusomnisqui.	In
6	55	87	\N	3	1	Prof. Ramon Ebert	7	2022-08-22	12:04:43	Etquiaabquamsequi.	2	12:04:43	12:04:43	2	\N	\N	Consequaturrepellendusatquiliberoab.Autinitaqueaccusamus.Laboretemporibusquaeratautquosvoluptatemtemporeodio.	Out
7	57	103	4	\N	1	Nigel Keebler	6	2022-08-14	12:04:43	Quidemvelmolestiaetemporibusnamfugadolorminimanemo.	5	12:04:43	12:04:43	4	\N	\N	Corruptiatfacereutaliasofficiaquae.Nonautexmollitiamaioreseligendidoloremque.Reiciendissedinblanditiisrecusandae.	In
8	42	113	\N	4	1	Diana Douglas	6	2022-08-22	12:04:43	Laborumconsequaturearumvoluptatesporrocumin.	3	12:04:43	12:04:43	2	\N	\N	Exipsaconsequaturblanditiisnecessitatibus.Optioestblanditiisoptioinciduntconsequuntursuscipitrerumdignissimos.Officiismolestiaeminushic.Consequaturestquisquamvoluptatumquisquamaliaspossimus.	Out
9	51	105	5	\N	1	Megane Ankunding	1	2022-08-14	12:04:43	Nihiletsuscipitenimquivoluptatibus.	3	12:04:43	12:04:43	1	\N	\N	Quiaquibusdamenimautem.Delectusestutdoloreeumoptio.Nobisfugitaspernatureligendisitvel.	In
10	57	109	\N	5	1	Talon Donnelly	1	2022-08-22	12:04:43	Inquisquamblanditiissuscipiteiusin.	5	12:04:43	12:04:43	4	\N	\N	Temporibusautveniamautemrecusandaeaspernaturipsameveniet.Sedquibusdamsedaperiamquisquieos.Praesentiumnullainconsequatureosasperiores.Iuresintpossimusetvoluptatemperferendissitreiciendis.	Out
11	47	94	6	\N	1	Dr. Darien Bayer	2	2022-08-14	12:04:43	Recusandaevoluptastotamvitaeearumerrorrepudiandaetempore.	5	12:04:43	12:04:43	3	\N	\N	Nihilistedoloreoditaliquamabdoloremassumenda.Praesentiumquiaquamquiquianostrumnonqui.Aspernaturvoluptasillumcorruptiexcepturiutmaxime.	In
12	52	104	\N	6	1	Milford Tromp	2	2022-08-22	12:04:43	Providenteosquiset.	2	12:04:43	12:04:43	1	\N	\N	Consequunturcumquedignissimosoptiovoluptatemillominima.Quaeratetfacilisquaerat.Etnequequodsitsitporro.Idnequevoluptatemsintquidem.	Out
13	50	115	7	\N	1	Brendan Stokes MD	7	2022-08-14	12:04:43	Aliquamsintbeataedeseruntalias.	4	12:04:43	12:04:43	5	\N	\N	Itaqueculpaexpeditaquisquam.Utnumquamassumendadolorumdelenitivoluptasaut.Eumdistinctiomolestiaeestut.	In
14	55	103	\N	7	1	Aurelia Rolfson	7	2022-08-22	12:04:43	Adoccaecatinemosolutaquidemnecessitatibusaut.	5	12:04:43	12:04:43	3	\N	\N	Velitetestetvoluptasaut.Facereisteprovidentdoloresofficiaquamquia.Minusteneturlaborumvelitaspernaturdignissimospraesentium.	Out
15	45	117	8	\N	2	Mr. Christopher Haag	5	2022-08-02	12:04:43	Quidemametpariaturrepellenduspossimus.	2	12:04:43	12:04:43	1	\N	\N	Adipiscidoloribusaliquamanamvoluptateconsecteturvoluptas.Undelaudantiumdoloremexplicaboremvoluptasutrerum.Impeditaccusamusprovidenthicautsimilique.	In
16	46	87	\N	8	2	Adelle Simonis	5	2022-08-10	12:04:43	Voluptatemsuntlaboriosametsoluta.	3	12:04:43	12:04:43	5	\N	\N	Aeligenditemporadoloreeligendiporroarchitecto.Undeveritatisillumdignissimossunt.Quiaerrorrerumetsuntaut.Deseruntillumpraesentiumoccaecatinisietaccusantium.	Out
17	41	117	9	\N	2	Rashawn Bernhard	7	2022-08-02	12:04:43	Etlaudantiumverooditprovident.	3	12:04:43	12:04:43	3	\N	\N	Voluptaslaudantiumnesciuntrationeitaque.Illodelenitisimiliqueearumestdoloremid.Quiquodenimnatusvel.Voluptatemsedrationequirepudiandaeculpa.	In
18	56	105	\N	9	2	Timmy Roob	7	2022-08-10	12:04:43	Autautisteexplicaboatveldolornam.	1	12:04:43	12:04:43	2	\N	\N	Errorsimiliquehicvoluptasrecusandaeenimeum.Totamautmolestiaesequiinventorererumarchitecto.Istequamassumendaidnumquamalias.	Out
19	55	98	10	\N	3	Misty Pagac	5	2022-07-23	12:04:43	Estodioetoccaecatiinet.	4	12:04:43	12:04:43	4	\N	\N	Autemautdoloresvelquia.Assumendacumquequimolestiasasperiores.Quoscupiditatequiisteexsimiliquemagnamdoloressimilique.Rerumetliberoveniam.	In
20	57	103	\N	10	3	Giovani Gusikowski	5	2022-07-31	12:04:43	Quisquameosaliasimpeditsuscipit.	1	12:04:43	12:04:43	3	\N	\N	Natusvoluptatemnequenihilquasibeatae.Nonaliquamdistinctioetquisnisirerum.Blanditiisveniamdolorecorporisquiasimilique.Ututnumquamvoluptatemnecessitatibus.Iurerepudiandaedoloremeiusblanditiis.	Out
21	44	97	15	\N	5	Adolphus Romaguera III	8	2022-08-15	12:04:44	Nequeutsaepeillonobisvelsolutadolorem.	3	12:04:44	12:04:44	3	\N	\N	Omnisconsecteturdoloradconsequaturrepellendus.Nesciuntfaciliseteaquasadipisci.Quossiteumestmollitiaex.Magnicommodicumquequaeratharumvoluptasfacilis.	In
22	51	108	\N	15	5	Sage Gleichner	8	2022-08-21	12:04:44	Veritatisautassumendavoluptatibusdeseruntaliaset.	2	12:04:44	12:04:44	5	\N	\N	Etvoluptatemconsecteturerroroptioaccusamus.Quipossimusrerumullametabnisiquosquia.	Out
23	44	114	16	\N	5	Miss Noelia Littel DVM	3	2022-08-15	12:04:44	Autsuntutquosmagni.	3	12:04:44	12:04:44	3	\N	\N	Quosvellaboriosamullamaliquamat.Architectototamdoloreminventoreutet.Dignissimosexcepturietquiavelmaiores.	In
24	46	87	\N	16	5	Prof. Reina Schamberger	3	2022-08-21	12:04:44	Doloremquecommodiiustobeataealiquameum.	2	12:04:44	12:04:44	5	\N	\N	Liberoaliquametlaborumlaboriosamitaquedelenitiexcepturidebitis.Necessitatibusvelnulladoloribusautemtemporibusiustomaiores.Velitatbeataeofficiisut.	Out
25	47	82	17	\N	5	Prof. Lillie Connelly Jr.	3	2022-08-15	12:04:44	Voluptasquisconsecteturestconsequaturetid.	2	12:04:44	12:04:44	3	\N	\N	Doloribusetpariatureumquivitaevoluptateomnis.Providentiureinventoredoloreligendi.Quidemtemporibusquiadautem.Nesciuntetblanditiisvoluptateminquomolestiaequas.	In
26	44	109	\N	17	5	Jamarcus Prohaska	3	2022-08-21	12:04:44	Suscipitestexofficiisnumquamlaboriosam.	3	12:04:44	12:04:44	5	\N	\N	Laborumaliasullamisteveritatis.Corruptiinutteneturinciduntadipisciutanimisaepe.Namveroinassumendafugiat.Atveletsolutavoluptasestipsam.	Out
27	53	118	18	\N	5	Nia Turcotte	2	2022-08-15	12:04:44	Magnamfugamaximemodi.	5	12:04:44	12:04:44	2	\N	\N	Consequatursuscipitestsequiperferendis.Doloresdoloremdictaoccaecativoluptate.Porrodebitiseossedveritatisquodid.Corruptialiquidetoditidquibusdam.	In
28	56	93	\N	18	5	Edd Harris	2	2022-08-21	12:04:44	Eumcommodiexpeditainenimadipisci.	3	12:04:44	12:04:44	3	\N	\N	Temporaabodioidhicautem.Magniquisimiliquedoloreseiuslaborumdolorem.Sintetinomnisasperiorestempore.Maioreshicsuntodioipsamut.	Out
29	41	106	19	\N	6	Lera Johnson	3	2022-08-13	12:04:44	Itaqueametquidemetutautmolestiae.	5	12:04:44	12:04:44	5	\N	\N	Laboreillositeosatquemaximeharumetdoloremque.Voluptatemetipsumperspiciatisexercitationem.Sintautlaboriosamaliquidestquiaquiaet.Quieaquesuntnecessitatibusmaximeerror.	In
30	54	82	\N	19	6	Theron Walsh	3	2022-08-23	12:04:44	Ututautdolorumveritatisaliquid.	4	12:04:44	12:04:44	5	\N	\N	Excepturiexercitationemeaquidemliberominimaperspiciatisid.Etcupiditateillumdebitisetquoblanditiis.Quiquodutmollitiaetanimi.Deseruntipsamquassequiverodolordolores.	Out
31	50	86	21	\N	8	Dr. Anthony Von MD	1	2022-08-13	12:04:44	Ethicautquiexpedita.	4	12:04:44	12:04:44	2	\N	\N	Sintlaudantiumdoloremquevoluptasquasiullamcorrupti.Corporiseiusquiiureeosadipiscioccaecatilaudantium.Aliquamautquiaratione.Commodilaboriosamevenietodioreprehenderitsintincidunt.	In
32	46	103	\N	21	8	Mr. Jeffrey Lang	1	2022-08-28	12:04:44	Quaearchitectoveromollitiavitae.	3	12:04:44	12:04:44	5	\N	\N	Voluptatemhicconsequaturtemporamollitiaipsalaboreenim.Maioresdoloribusetet.Nobiseosfacerevitaeasperioresaccusantiumearumomnis.Ipsumenimnecessitatibusfaceresaepeullam.	Out
33	39	117	22	\N	8	Prof. Walton Bernhard	7	2022-08-13	12:04:44	Inciduntesseeumlabore.	4	12:04:44	12:04:44	1	\N	\N	Nisiconsecteturtemporibusautatque.Impeditcumvelitnonlaborevoluptatibusrepellat.Voluptatematqueuttemporibuscorruptivoluptateasperiores.Ullamassumendanullavoluptatemquamnatus.	In
34	53	99	\N	22	8	Prof. Jarrell Ziemann V	7	2022-08-28	12:04:44	Quasprovidentdelenitiet.	3	12:04:44	12:04:44	2	\N	\N	Placeatmolestiaevoluptatemrepellendus.Totamnihiladautmodi.Ipsamrepellendusnumquamquasdoloreminventore.Iureoptiosedprovidentaspernaturdoloremquedoloremquequasnihil.Sedquoessequod.	Out
35	56	95	36	\N	13	Nickolas Nienow	5	2022-08-10	12:04:44	Idaccusamusrecusandaeomnissedmollitiaatquesoluta.	1	12:04:44	12:04:44	4	\N	\N	Enimeaquequasietsolutaquosautconsequuntursint.Cupiditatemodiplaceatillomagni.Explicabononametquasi.	In
36	57	97	\N	36	13	Prof. Cristopher Hamill	5	2022-08-16	12:04:44	Ducimusanimiquaedolor.	1	12:04:44	12:04:44	4	\N	\N	Omnissimiliqueliberoaccusantiuminvelitsolutavoluptatibusest.Occaecatiducimusnisivoluptatemdistinctio.Esseconsequunturconsequaturdoloremdolornecessitatibus.	Out
37	42	100	37	\N	14	Kennedi Goyette	4	2022-08-04	12:04:44	Reprehenderitexercitationemlaboriosamtemporaquisquam.	4	12:04:44	12:04:44	1	\N	\N	Voluptasautminusnonquibusdamenimtotamdolorem.Exercitationemdoloremenimvoluptatemoptioharum.Voluptatemmolestiaesapienteetlaudantiumvoluptas.Utimpeditundemagnimolestiaeexcepturi.Facilisundeconsequaturcorruptivoluptatequiomniset.	In
38	55	108	\N	37	14	Moises Carter Sr.	4	2022-08-19	12:04:44	Etfugiatsintautasperioresetquo.	1	12:04:44	12:04:44	4	\N	\N	Utexercitationemdistinctiobeataepossimuspraesentiumullamsintrepudiandae.Laboresedvoluptatesautdolorumdoloremcommodiasperiores.	Out
39	56	104	38	\N	15	Brisa McClure	1	2022-08-07	12:04:44	Quodexcepturirationequasquiaquiadolorprovident.	5	12:04:44	12:04:44	2	\N	\N	Utlaboreblanditiisomnisvoluptatecommodi.Quiquiaetvelitvoluptatumasperioresut.Quiadignissimoseligenditemporibuslaboriosam.	In
40	45	104	\N	38	15	Tito Stanton	1	2022-08-27	12:04:44	Voluptatemcumqueaspernaturquossequivoluptatenesciuntsunt.	2	12:04:44	12:04:44	4	\N	\N	Odioquominusautfacereaccusantiuma.Remexearumlabore.Nisiveloptiopariaturminimaautnostrum.Voluptatemenimplaceatvoluptatem.	Out
41	49	110	41	\N	17	Elouise Deckow	7	2022-08-02	12:04:45	Nostrumeligendioptioearumtemporibusquisquamevenietnatusrecusandae.	1	12:04:45	12:04:45	2	\N	\N	Possimusaccusamusfacilisodiorerumetfacereearum.Molestiasetconsequaturpossimusvitae.Velassumendaeosaliquammaxime.Aliquamnostrumvoluptasaspernaturtempora.	In
42	50	92	\N	41	17	Prof. Howard Harvey Jr.	7	2022-08-10	12:04:45	Aliquidveroquianihilesse.	2	12:04:45	12:04:45	3	\N	\N	Ametveroofficiasednisiperferendisminima.Laudantiumdolormollitiaquiaexercitationemsinttotam.Aliastotamquifugiat.	Out
43	40	83	42	\N	18	Jaunita Jacobson	8	2022-08-13	12:04:45	Debitisfaceremodirepellat.	1	12:04:45	12:04:45	2	\N	\N	Magnammaximeaddolor.Autquifacilishicoptioetnesciunt.Corruptiistereprehenderitquiexplicaboerror.	In
44	49	88	\N	42	18	Adelia Langworth I	8	2022-08-23	12:04:45	Fugavoluptassaepeestundemolestias.	4	12:04:45	12:04:45	3	\N	\N	Quidemautaccusamusmagnivero.Utquiatqueexpeditaipsumcorporisaperiamipsam.Nullamaioresetarchitectoporroistequia.	Out
45	41	99	43	\N	19	Dr. Nathanael Schuster MD	5	2022-07-30	12:04:45	Evenietsuntexplicabonecessitatibusin.	3	12:04:45	12:04:45	1	\N	\N	Voluptatummaximevoluptasidrerumvoluptasharum.Sedestinventoreducimussimiliqueillumautquidemreiciendis.Providentquaenumquamdolorepariaturatofficiadistinctio.Etnamquodquaedelectus.	In
46	44	90	\N	43	19	Mr. Jasper Osinski	5	2022-08-19	12:04:45	Consequatursedharumquamvoluptasoccaecatidicta.	5	12:04:45	12:04:45	1	\N	\N	Consequaturculpaetutea.Minusnonquaeratdolorsapiente.Distinctioculpaenimdeseruntenimquirerumest.Quiautquibusdamutsitautemest.	Out
47	42	109	46	\N	21	Dr. Max Kemmer	5	2022-07-30	12:04:45	Evenietdoloremaioresexplicabodictaetdolore.	3	12:04:45	12:04:45	1	\N	\N	Nonvoluptatumquidemaspernatur.Autquopariaturomnismollitiafacilis.Cumquenostrumimpeditnumquamvelitquodamet.Temporibusvoluptatumassumendaremanimireiciendisetsed.	In
48	40	110	\N	46	21	Katrine Nolan	5	2022-08-05	12:04:45	Innostrumsaepeut.	3	12:04:45	12:04:45	4	\N	\N	Delenitimaximeitaquevoluptasetmaxime.Suscipitexcepturiidabet.Velitestaliquidperspiciatiscumqueetlaboriosamiure.	Out
49	46	116	47	\N	21	Prof. Norval Schmidt IV	2	2022-07-30	12:04:45	Asperiorescorporisfaceretemporasitoditmagnamcupiditate.	5	12:04:45	12:04:45	1	\N	\N	Quietullamaccusantiumperferendisinminus.Officiisarchitectoipsumeligendiquaeratconsequunturquis.Quodbeataeevenietutnullavoluptatesnobiset.	In
50	50	99	\N	47	21	Alexa Nicolas	2	2022-08-05	12:04:45	Minimarationeetiddoloresseiureaspernaturdelectus.	2	12:04:45	12:04:45	5	\N	\N	Quidemoccaecatietquibusdametminimaautemvoluptatibus.Eteosfacilisdoloribuseoseos.Assumendaideumillohicearum.	Out
51	57	86	48	\N	21	Dr. Michale Halvorson II	6	2022-07-30	12:04:45	Consequaturetnihilsaepequam.	5	12:04:45	12:04:45	4	\N	\N	Perferendisipsaquialaudantium.Nonassumendaquisquamdoloreremquasplaceat.Nisietreprehenderitutomnisvoluptas.Quidemquidoloresmaximecorporis.Beataeexconsequaturalias.	In
52	50	110	\N	48	21	Hailey Jacobs	6	2022-08-05	12:04:45	Autinetporroerror.	2	12:04:45	12:04:45	5	\N	\N	Veroutsimiliquesapientefacerepariaturvoluptatem.Nullasintetquifacerenecessitatibuseiusat.Aperiamautmaximedelectusaliquam.	Out
53	48	117	50	\N	23	Ms. Madonna Gerlach	4	2022-08-03	12:04:45	Excepturifugiatdelenitirepellatvelitvelit.	5	12:04:45	12:04:45	4	\N	\N	Molestiasteneturquisfugaeligendidictacommodiquia.Veldolorliberofugitsitearumetullam.Maximererumautemcorporiscommodimolestiaequia.	In
54	57	113	\N	50	23	Noelia Turcotte III	4	2022-08-23	12:04:45	Sapientemolestiasetrationequae.	1	12:04:45	12:04:45	2	\N	\N	Deseruntomnisminusexcepturiautem.Adaliasdictautfugitrerumid.Dignissimosmagnisuntnondelenitiid.Sitnonvitaeoptioasperioresutquae.	Out
55	54	118	51	\N	23	Anderson Wehner	2	2022-08-03	12:04:45	Utautexsolutaquicumet.	3	12:04:45	12:04:45	3	\N	\N	Veroquoplaceatvoluptasquisnobisvelfuga.Maioresutrepudiandaelaboriosameummolestiaequi.Distinctioutlaborumenim.Aperiamvoluptatemetvelpariatur.	In
56	42	91	\N	51	23	Kolby Deckow	2	2022-08-23	12:04:45	Autemmodipariaturest.	3	12:04:45	12:04:45	1	\N	\N	Ametmagnisequiipsaconsequaturdolorumet.Nisiofficiaquosveniamreiciendis.Velsuscipitrepellatsunthic.Ipsamquaeautiureid.Oditquisquameiusconsequaturvoluptatenequesequi.	Out
57	45	99	52	\N	24	Korey Padberg	3	2022-08-03	12:04:45	Consequaturetsitreprehenderitetvero.	1	12:04:45	12:04:45	3	\N	\N	Possimusmagnamvelodit.Animiquiaculpaillummagniquos.	In
58	47	83	\N	52	24	Bryce Bednar	3	2022-08-09	12:04:45	Sedistecommoditemporeoccaecatieumsuscipitreprehenderitiste.	3	12:04:45	12:04:45	3	\N	\N	Etexquisdeserunt.Estquisdolorealiassaepeeos.Dolorquiquietilloanimi.Providentmolestiaesitquamvelitcumautquiareiciendis.	Out
59	45	119	53	\N	24	Salvador Borer	2	2022-08-03	12:04:45	Quiutexcepturinatusratione.	5	12:04:45	12:04:45	3	\N	\N	Pariaturetetaliquamenimquosnihilquasi.Utdoloresutquirepudiandae.	In
60	57	112	\N	53	24	Griffin Brekke	2	2022-08-09	12:04:45	Voluptatumfaceresitodiodoloraliquidquosametrem.	4	12:04:45	12:04:45	4	\N	\N	Eosquivitaeitaquemaioresoccaecati.Voluptasquietdolorepossimusqui.Etnatusculpafugitmaxime.Iditaqueetiustoliberoesse.	Out
61	45	117	55	\N	26	Stefanie Zieme	3	2022-08-11	12:04:45	Tenetursequimollitiaconsequaturminima.	2	12:04:45	12:04:45	5	\N	\N	Commodiexmaximereprehenderitvoluptasaccusamusautsuscipit.Idrecusandaedolorepraesentiumsit.Ducimusdoloresautestrepudiandaemollitiafacilis.Itaqueeteosmolestiaspraesentiumiusto.	In
62	48	99	\N	55	26	Dr. Lourdes Nader II	3	2022-08-19	12:04:45	Quisquamofficiaquiaculpasedvelitaperiamsaepevoluptates.	2	12:04:45	12:04:45	2	\N	\N	Fugiatmodisimiliqueautemdelectustemporibusrecusandae.Necessitatibusfugitvoluptatemlaborumcorruptianiminesciunteius.Esseutinetutdoloremomnisdolorem.	Out
63	52	103	67	\N	29	Mrs. Jacinthe Gottlieb	7	2022-08-09	12:04:46	Sitetoditnobis.	3	12:04:46	12:04:46	3	\N	\N	Inciduntreiciendisnontemporeassumendatemporeessesunt.Doloreseaoccaecatimolestiaedebitisfacereperspiciatis.Illoautemaccusantiumnonfacilismolestiasenimeumquibusdam.	In
64	53	99	\N	67	29	Olga Kling	7	2022-08-17	12:04:46	Possimusnecessitatibusetblanditiisquaelaborumdignissimosliberoassumenda.	4	12:04:46	12:04:46	1	\N	\N	Culpaquireiciendisvoluptatumimpedit.Etvelitnecessitatibusaspernaturrerumullamcorruptilaboriosam.Estquosesseearumautincidunt.	Out
65	45	117	68	\N	29	Freeda Grant	5	2022-08-09	12:04:46	Esseiurevelitvoluptatumautimpedittempore.	3	12:04:46	12:04:46	5	\N	\N	Sinttemporibusanimivoluptatesnequeseddebitis.Harumomniseligendiidsimilique.Ametcommodiquiexcepturicupiditaterepellendusid.Suscipitoptioestautemconsequaturat.	In
66	45	101	\N	68	29	Gabriella Ondricka	5	2022-08-17	12:04:46	Ametquianecessitatibusetvoluptatumquaeratvoluptate.	2	12:04:46	12:04:46	4	\N	\N	Nostrumenimetinnihilautem.Inventorevoluptasquasautexcepturidolores.Consequaturdistinctioarchitectoutcumquefugiteossed.Eamaioresaccusantiuminciduntdebitisimpeditest.	Out
67	56	116	69	\N	29	Charley Olson	1	2022-08-09	12:04:46	Veritatisblanditiisculpaetautetdolor.	4	12:04:46	12:04:46	2	\N	\N	Laboriosamenimnostrumvoluptatemdoloremqueipsumculparerum.Consequaturipsamaximeeterrorquisapienteeosiste.	In
68	46	113	\N	69	29	Elijah Erdman	1	2022-08-17	12:04:46	Etaperiamquiquomaximeaccusantiumquicumque.	3	12:04:46	12:04:46	1	\N	\N	Deseruntnonetaliquidasperioresea.Nobisdolorrecusandaeaspernatureaqueestest.Nonvoluptatemassumendaquisnonetasperiores.Nostrumvoluptasquidemexercitationemexcepturi.Etimpeditrepellatsedin.	Out
69	55	82	79	\N	34	Roslyn Ebert	5	2022-07-22	12:04:46	Inciduntvoluptatemautnihilsuscipitrationereprehenderit.	4	12:04:46	12:04:46	3	\N	\N	Commodiperferendisimpeditquiadelectuseos.Ametinquodteneturpariaturvoluptatemdoloremqueex.	In
70	54	106	\N	79	34	Orpha Bartoletti	5	2022-07-28	12:04:46	Doloremquissequievenietexcepturiblanditiisaut.	1	12:04:46	12:04:46	3	\N	\N	Atquedoloremhicaccusamusdistinctioestut.Autaliasinharumnamnonsapienteullamquidem.Abvoluptaslaboriosamrerumhic.	Out
71	52	96	83	\N	37	Santiago Hyatt	1	2022-08-02	12:04:47	Quiullamomnisilloquibusdam.	2	12:04:47	12:04:47	1	\N	\N	Aliquidquiaitaquerepudiandaein.Voluptasilloetetqui.Deseruntbeataequidemnecessitatibusipsam.Veritatisnonaccusamusvoluptasconsequunturnecessitatibusaut.	In
72	39	89	\N	83	37	Ms. Flo Leuschke II	1	2022-08-22	12:04:47	Dolorundedolorumnobis.	4	12:04:47	12:04:47	4	\N	\N	Autquisitaqueillumquilaborumremrepellendustempora.Utblanditiisplaceatutautemetsunt.Culpaquiomnisconsequaturveroinharumunde.Reprehenderitassumendaautqui.	Out
73	56	107	84	\N	37	Prof. Buster Schmitt MD	2	2022-08-02	12:04:47	Quidemestharumitaque.	5	12:04:47	12:04:47	1	\N	\N	Suscipitcupiditateinventoreperspiciatisnostrum.Deseruntutquiaatquemaiorescorruptiinminima.Quieaundeetlaudantiumnatuscorruptiharum.	In
74	52	109	\N	84	37	Dr. Zelda Pagac I	2	2022-08-22	12:04:47	Enimcumerrornonatqueporrooditcupiditate.	4	12:04:47	12:04:47	3	\N	\N	Utquiacumfugitearumet.Accusantiumomnislaudantiumsaepepraesentiumitaqueadipiscinemoid.Architectoutomnisdoloresquia.	Out
75	52	113	85	\N	38	Dimitri Gibson	3	2022-07-24	12:04:47	Fugaaccusamussintimpedit.	4	12:04:47	12:04:47	3	\N	\N	Minimafacilisrecusandaevoluptatibuseumnullacorporis.Fugitipsumestvoluptatem.Quiconsequaturasperioresmagnamtemporenecessitatibussed.Quossolutatemporateneturitaquequamvoluptatem.	In
76	39	83	\N	85	38	Walter Johnson DVM	3	2022-08-03	12:04:47	Asperioresmolestiasdoloremsitnihiladdoloret.	2	12:04:47	12:04:47	4	\N	\N	Officiaculpanostrumpossimusaccusamusveritatisipsam.Quietmaximequisrepellatcumdoloremque.Dolorumdelenitiutteneturidsequirepellatqui.Exercitationemetvoluptatemdelenitivoluptatemet.	Out
77	47	105	86	\N	39	Mrs. Margarette White	5	2022-08-15	12:04:47	Iustosuntnisiquidem.	5	12:04:47	12:04:47	1	\N	\N	Velquamtotamaccusamuslaudantiumeum.Namculparepudiandaeatquedolorquae.Quaeratdictanemoetconsequaturrerumexcepturisequimaiores.	In
78	44	91	\N	86	39	Mr. Hadley Collier DVM	5	2022-08-25	12:04:47	Natusomnisinvoluptatibuset.	4	12:04:47	12:04:47	4	\N	\N	Impeditnostrumtemporibusnatus.Corporisdoloreinventoredolor.Idvoluptatemquaeofficiisquisquama.	Out
79	51	84	87	\N	39	Shaniya Goldner	8	2022-08-15	12:04:47	Eligendipraesentiumsintperspiciatisitaquererum.	2	12:04:47	12:04:47	3	\N	\N	Utperspiciatisdistinctioesseenimaliquam.Dictavelitmollitiarepudiandaerecusandaeeaquecumquefacere.Excepturiinvoluptatemsed.	In
80	46	92	\N	87	39	Enos Brown	8	2022-08-25	12:04:47	Voluptatumdoloresatqueautmaioresexpedita.	3	12:04:47	12:04:47	4	\N	\N	Dolorsedatexercitationemsimiliquecumquesed.Remestetaspernaturpossimus.Ipsumsuntlaboreessefugitevenietcorruptidignissimos.	Out
81	55	108	88	\N	39	Clementine Veum	1	2022-08-15	12:04:47	Rerumautsintinventoreconsequaturodit.	4	12:04:47	12:04:47	4	\N	\N	Velitpraesentiumatdolordoloremquevoluptasexercitationemconsequuntur.Iurerecusandaeporrolaborummoditemporibusipsamolestiae.Blanditiisullamlaborefugaut.Utmaioresaperiamdebitis.Nequedeseruntautrerumnatus.	In
82	48	90	\N	88	39	Henry Moore	1	2022-08-25	12:04:47	Autdictaadnostrum.	1	12:04:47	12:04:47	2	\N	\N	Eaetculpaetvoluptasautem.Remdoloruminquiaat.Abdolorquiarecusandaeerror.Nonlaboriosamminimaid.	Out
83	45	84	94	\N	41	Alf Stamm	7	2022-07-27	12:04:47	Inimpeditestconsequaturminus.	5	12:04:47	12:04:47	1	\N	\N	Quidemomnisdolorumsolutafugautevenietlaborum.Quibusdamataccusamuseumetfuganihilfugitfacere.Autipsumvoluptatemmollitiatemporaetlaboriosamillum.Eafacilisquisquamminusofficiis.	In
84	54	106	\N	94	41	Ryley Ryan V	7	2022-08-06	12:04:47	Odionihilperspiciatismaximeillumremtotam.	3	12:04:47	12:04:47	4	\N	\N	Doloremomnisestperferendisomnis.Occaecatiomnisrerumutblanditiisvoluptas.Voluptateeumdictaquodaut.Voluptatemadipiscieumveniamprovidentest.	Out
85	55	100	95	\N	41	Mrs. Edwina Kshlerin DVM	1	2022-07-27	12:04:47	Quienimvoluptasvoluptatesetnatus.	5	12:04:47	12:04:47	5	\N	\N	Laborumdoloremisteexpeditasedautaperiam.Asperioresquiaidsuntmodi.Oditeiusvoluptatemquisquametidquis.	In
86	49	91	\N	95	41	Viva Mitchell	1	2022-08-06	12:04:47	Blanditiisdelenitiineaodioeum.	4	12:04:47	12:04:47	5	\N	\N	Temporesolutarerumetauthic.Abnondoloresnemoeosasperioresesttempore.Expeditaututsintautautquo.Fuganammolestiaelaboreexullamaut.	Out
87	43	99	96	\N	41	Aisha Barton	3	2022-07-27	12:04:47	Aperiamcorporisatquesaepesolutafugit.	4	12:04:47	12:04:47	3	\N	\N	Voluptasquialiasfacereetsuscipitdelectus.Recusandaefacerecupiditatesinttemporeautemdoloremaliquid.Molestiasquiquiaex.Etisteremetquiautdoloressapienteofficia.Repudiandaeautquamnumquamaccusamus.	In
88	42	97	\N	96	41	Vanessa Botsford	3	2022-08-06	12:04:47	Quiaprovidentpraesentiumeiusplaceat.	3	12:04:47	12:04:47	2	\N	\N	Quoetsedrerum.Inlaborevoluptatemitaquesolutanon.	Out
89	50	99	97	\N	41	Jameson Zemlak	4	2022-07-27	12:04:47	Praesentiumessemolestiaemaioresillumducimus.	5	12:04:47	12:04:47	3	\N	\N	Illodebitisutpraesentiumculpadoloresnam.Minimaauteveniettotamsunt.Nequequibusdamdoloribustotamperferendis.Eossolutaquassedassumendaeum.	In
90	47	82	\N	97	41	Esther Hirthe V	4	2022-08-06	12:04:47	Nihilreiciendisvoluptatemquaedignissimosnonsaepe.	2	12:04:47	12:04:47	5	\N	\N	Doloreumbeataecorporisiure.Iustoquisquametveroquaemagni.Temporeteneturreiciendisdebitisessevoluptatem.Optioquisquamdelectuseos.	Out
91	39	92	98	\N	41	Llewellyn Ferry	2	2022-07-27	12:04:47	Rerumadipiscimagnicumqueautet.	3	12:04:47	12:04:47	4	\N	\N	Voluptateexplicaboarchitectoexpeditavoluptateconsequaturquasi.Porroquofugitsedutremex.Consecteturquioditquis.	In
92	49	102	\N	98	41	Mr. Donnell Reichel PhD	2	2022-08-06	12:04:47	Debitisnonrerumipsaesseeosofficia.	4	12:04:47	12:04:47	3	\N	\N	Beataeveltemporibusrecusandaeminimanemodelenitiest.Eaeumanimivoluptatesvoluptasnihilquisaut.	Out
93	41	97	99	\N	41	Elisa Zieme	6	2022-07-27	12:04:47	Facereetmodidoloribusinventorecorporis.	3	12:04:47	12:04:47	4	\N	\N	Sapientelaborenihilquaeratundeperferendis.Doloremquerepudiandaeinciduntatautsit.Officiishicsimiliquequaeratquisquamplaceat.Quianobiseumtemporibusidenimeoslaborum.	In
94	43	89	\N	99	41	Prof. Rashad Rowe IV	6	2022-08-06	12:04:47	Quiaperferendisfacilisvoluptatibussapienteeveniet.	1	12:04:47	12:04:47	2	\N	\N	Delenitisintquiaconsequaturdoloremquequae.Suscipitmodimagnieligendiadinventore.Explicaboconsecteturrepudiandaelaborumnulladucimus.	Out
95	41	120	106	\N	46	Hannah Anderson	6	2022-08-03	12:04:48	Etcupiditateearumeosevenietatrepellendusvoluptatum.	1	12:04:48	12:04:48	3	\N	\N	Exnequeasperioresdolorat.Delectuseumdelenitivoluptatefuga.Enimutinciduntadipiscinumquamametqui.Sitquidemeterroreos.	In
96	48	83	\N	106	46	Leann Grimes III	6	2022-08-13	12:04:48	Nihiltemporesapientedoloreslaborum.	1	12:04:48	12:04:48	3	\N	\N	Etmagnidolorveritatisexplicaboaspernaturet.Quireiciendisillummolestiasarchitecto.Quonostrumettotamsuntestquiaut.	Out
97	57	112	107	\N	46	Monty Oberbrunner	6	2022-08-03	12:04:48	Etnemoofficiaofficiaconsequaturet.	5	12:04:48	12:04:48	2	\N	\N	Quodteneturettemporibusveromaximeofficiaerrornon.Remautetsimiliqueinundehicvoluptas.Blanditiisofficianesciuntvelitestquaerat.Iustolaborumquaeametomnisculpa.	In
98	53	109	\N	107	46	Adan Roberts IV	6	2022-08-13	12:04:48	Idplaceatrepellatutilloeteaquesuscipit.	5	12:04:48	12:04:48	4	\N	\N	Officianatusiustodolore.Evenietquamdolorumcorporisrerumrepellendusnatuspraesentium.Temporetotamtemporibusnonaccusantiumconsequaturullam.	Out
99	42	112	113	\N	49	Dr. Alexandrea Heathcote	2	2022-07-21	12:04:48	Harumearumquamvoluptatesplaceataccusamusea.	2	12:04:48	12:04:48	5	\N	\N	Siteteligendiillohicquiaculpaplaceatdeserunt.Idutvoluptatesutquivoluptatem.Teneturomnisestest.	In
100	47	90	\N	113	49	Dr. Ilene Jacobson	2	2022-07-27	12:04:48	Fugaconsequaturnonauttemporaquidemdoloresreiciendis.	4	12:04:48	12:04:48	1	\N	\N	Dolorevoluptasquistotamvoluptatem.Voluptatemomnisvoluptatesexpedita.Asperioreslaboriosamcumqueetcorruptimollitiatenetur.	Out
101	39	120	114	\N	49	Miss Ella Shields V	7	2022-07-21	12:04:48	Estveliterroriste.	5	12:04:48	12:04:48	5	\N	\N	Dolorumundeharumdistinctioipsumomnis.Saepeeaetexsintrepudiandaevoluptatemquia.Utetverovoluptatibussedrempariaturet.	In
102	40	85	\N	114	49	Roxanne Ankunding	7	2022-07-27	12:04:48	Esseomnisetsitcumquevoluptatibuset.	5	12:04:48	12:04:48	4	\N	\N	Solutadelenitiabasperiorescommodidoloreetomnis.Utvoluptatemvelitsoluta.Sitvoluptatemveleumdebitisaut.	Out
103	40	105	115	\N	49	Mr. Dedrick Reichert Jr.	4	2022-07-21	12:04:48	Quasducimusnaminventorevoluptatibusmolestiasenimaperiamconsequuntur.	5	12:04:48	12:04:48	1	\N	\N	Voluptatumisteconsequaturaccusantiumveniaminciduntin.Atqueatundefugiatesse.Cumquedoloresquiaperiam.	In
104	44	111	\N	115	49	Prof. Jaron Leffler	4	2022-07-27	12:04:48	Optioeaconsequaturvoluptatemcorporis.	5	12:04:48	12:04:48	3	\N	\N	Omnisvoluptateautemautfugaomnis.Voluptateblanditiisdoloribusrationeaperiamqui.Consequatursolutaconsequaturquasiquo.Nostrumtemporibusnobisetvoluptatemquodidconsequuntur.	Out
105	44	84	116	\N	50	Jannie Gorczany	5	2022-08-19	12:04:49	Delectusabnatusetsunttemporaeum.	1	12:04:49	12:04:49	4	\N	\N	Nostrumassumendaadipisciatquevelitsedfacere.Aperiamnullaestoccaecatilaboriosam.Quaeautdolorumestcupiditatevoluptasatquisquam.	In
106	53	81	\N	116	50	Mr. Jerrold Lind DDS	5	2022-08-27	12:04:49	Solutaidlaudantiumaliquam.	2	12:04:49	12:04:49	4	\N	\N	Quasrationetotamquinihilvoluptasaliquamexpedita.Voluptatemquoettemporadoloriureofficiafugiat.Iureetsolutaautnihil.Doloremtemporaquoistefacereiuredistinctio.Autquisestquiset.	Out
107	48	98	117	\N	51	Jacky Mohr	6	2022-08-01	12:04:49	Iustoeavitaerepellatnumquamenimdoloribusquasiquis.	4	12:04:49	12:04:49	2	\N	\N	Quodquinequequod.Suscipitadipisciutipsumearumconsequatur.Quassuntautemutasit.	In
108	54	89	\N	117	51	Ms. Elvie Conroy V	6	2022-08-09	12:04:49	Etveromagniundequidemmolestiae.	1	12:04:49	12:04:49	1	\N	\N	Maioresautemsintoptioeautdelectus.Estestsimiliqueetquamsuntmagni.Errorfugiatexplicaboomnisdoloresequi.Magnamsequietaut.	Out
109	55	98	118	\N	52	Velma Schoen	7	2022-08-17	12:04:49	Utnonofficiaeaneque.	1	12:04:49	12:04:49	5	\N	\N	Magniitaqueminimaomnissintnostrum.Voluptatibusearumliberofacerenam.Utautemetaliquidsapienteetetqui.	In
110	55	83	\N	118	52	Prof. Gunner Walsh PhD	7	2022-08-25	12:04:49	Voluptatumquidemquidistinctioquosdoloremvoluptasid.	2	12:04:49	12:04:49	4	\N	\N	Molestiaenihilquidemtemporibusipsum.Utpossimussimiliqueiustooptio.Cumofficiadoloremquenihilsunt.	Out
111	52	99	119	\N	52	Dr. Caleb Hahn	8	2022-08-17	12:04:49	Estdoloremblanditiisdoloresmagnam.	2	12:04:49	12:04:49	3	\N	\N	Idaspernaturomnisrecusandaeveldoloribusomnismolestiaeasperiores.Expeditareiciendisquiid.Corporissuntfugiatoccaecatiadipisciestassumenda.	In
112	57	113	\N	119	52	Jeanne Carter	8	2022-08-25	12:04:49	Expeditaquiaametliberooptio.	1	12:04:49	12:04:49	4	\N	\N	Ipsumcumqueutaccusamusautarchitectofugiat.Quoquosquiarerumquae.Voluptatevitaequotemporemolestiasearumtemporibus.Enimquinemodelectusbeataesequiperspiciatissimiliqueat.	Out
113	52	107	122	\N	55	Vanessa Blick	2	2022-08-04	12:04:49	Utquidemetdolorevoluptatemveniam.	5	12:04:49	12:04:49	1	\N	\N	Porroaccusamuspraesentiumatquedictanostrumteneturvoluptates.Eaatquasvelitaliquametreprehenderitomnis.Maximepossimusnesciuntdoloremitaque.	In
114	48	86	\N	122	55	Mrs. Michele Schaden	2	2022-08-14	12:04:49	Eosinnequeenim.	5	12:04:49	12:04:49	3	\N	\N	Earumquisquamdoloremminimaofficiisquisdolorem.Quodictaestnamdoloreiusquia.Consequaturassumendaillumvitaeeosmolestiaecorrupti.Sedconsequaturdolorumanonnihil.	Out
\.


--
-- Data for Name: booking_transfer_house; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.booking_transfer_house (booking_transfer_id, house_id) FROM stdin;
1	16
1	17
2	18
2	17
2	16
3	20
3	19
3	16
4	20
4	16
5	17
5	20
6	19
6	17
7	19
7	17
8	18
8	17
9	20
9	18
10	20
10	18
11	17
12	19
12	18
12	17
13	20
13	18
13	16
14	19
14	20
14	16
15	4
15	3
15	5
16	4
16	5
17	1
18	4
18	5
18	1
19	58
19	59
19	60
20	57
21	73
21	75
21	72
22	75
22	72
23	72
23	73
23	75
23	71
24	71
24	72
25	72
25	74
26	75
26	71
27	75
27	73
28	75
28	72
28	74
28	73
29	54
29	51
29	55
30	53
30	51
31	42
31	43
32	43
32	42
33	44
33	42
33	45
34	44
34	45
35	44
35	42
36	42
36	43
36	45
37	6
37	10
38	10
38	9
38	6
39	23
39	24
40	25
40	21
40	24
41	86
41	89
41	87
42	90
42	87
43	68
43	67
43	69
43	66
44	69
44	70
44	68
45	22
45	25
46	25
47	3
47	5
48	3
48	2
48	5
49	2
49	4
49	1
50	1
50	4
50	3
50	2
51	3
51	5
52	2
52	1
53	4
53	3
54	2
54	5
55	2
55	5
55	1
56	1
56	5
56	2
57	15
57	13
57	11
57	14
58	14
58	15
59	11
59	15
59	13
59	12
60	11
60	13
60	15
61	56
61	58
62	59
62	56
62	57
63	13
63	12
63	11
64	13
64	11
64	15
65	14
65	13
66	12
66	14
67	14
67	13
67	11
68	14
68	12
69	73
69	75
70	71
70	73
71	40
71	36
71	37
72	39
72	38
73	39
73	38
73	37
74	38
74	39
74	36
75	76
75	80
76	76
76	79
76	78
77	60
77	59
78	58
78	57
78	60
79	58
79	59
80	59
80	56
81	58
81	60
81	59
82	57
82	56
82	60
83	36
83	37
84	36
84	39
85	36
86	36
86	38
86	40
87	37
87	36
87	40
87	39
88	37
88	36
89	40
89	39
89	38
90	37
90	36
90	39
91	40
91	37
91	36
91	39
92	38
92	37
93	36
93	40
93	38
94	40
94	38
94	39
94	37
95	30
95	28
96	26
96	27
96	28
97	26
97	29
98	28
99	24
99	22
99	23
100	25
100	23
101	22
101	24
102	23
102	21
102	22
103	21
103	25
103	24
104	25
104	22
105	12
105	13
106	14
106	15
106	12
107	80
108	77
108	80
108	78
109	14
109	13
110	11
110	14
110	13
111	11
112	15
112	14
112	12
113	20
113	17
113	18
114	17
114	16
\.


--
-- Data for Name: destination; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.destination (id, province_id, name) FROM stdin;
39	35	Havana
40	47	Baracoa
41	42	Camagüey
42	40	Trinidad
43	37	Varadero
44	46	Santiago de Cuba
45	38	Cienfuegos
46	34	Las Terrazas
47	33	Vinales
48	42	Santa Lucia
49	41	Cayo Coco
50	33	Cayo Levisa
51	46	Comandancia de la Plata
52	39	Santa Clara
53	42	Playa Santa Lucia
54	37	Bay of Pigs
55	44	Bayamo
56	37	Zapata/ Playa Larga
57	44	Santo Domingo
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20220720170224	2022-07-20 12:02:59	401
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.driver (id, name, phone, pax) FROM stdin;
81	Mrs. Tania Kirlin Sr.	206-636-9745x51	5
82	Alfonso Halvorson	(108)054-8976	10
83	Lauren Ratke	(151)605-4077	3
84	Makenzie Swift	08555982185	9
85	Prof. Delphia Padberg	06776336089	2
86	Mr. Reese Hudson III	670.864.6118	7
87	Hallie Johnson	1-649-915-4694	4
88	Agnes Blanda III	471.129.4389	1
89	Dr. Kaelyn Sanford DVM	1-230-079-4156x	1
90	Antonio Emmerich DVM	296-578-9896	14
91	Mr. Claude Stokes DVM	(922)469-7983	14
92	Erika D'Amore	(463)596-8896	13
93	Barney Hessel	1-369-356-3442x	3
94	Dr. Ian Cormier	448.102.9567x49	3
95	Daren Lesch	1-815-870-0874x	11
96	Miss Mafalda McLaughlin DVM	1-190-738-7450x	8
97	Eliane Ward	270.525.4421x66	3
98	Elliott McDermott IV	(006)859-0175	10
99	Mrs. Scarlett Hagenes Sr.	153.187.1551x18	11
100	Evans Grimes DDS	1-842-695-7677	3
101	Prof. Markus Erdman	650-056-1272x57	12
102	Micaela Padberg	(341)268-4641x9	13
103	Avis Roob	634.515.6404	10
104	Prof. Angelica D'Amore	(921)755-8822	4
105	Luisa Towne MD	576-804-1973	4
106	Fredrick Marquardt	1-845-114-4619	2
107	Marisa Muller Jr.	733-224-4928x56	5
108	Ursula Collins	+85(6)419437165	8
109	Prof. Reyes Paucek	(675)879-9984x5	13
110	Elsie Cole	(823)691-5450	3
111	Joy Jones	601.450.9364	14
112	Merl Hamill	651-138-0159x17	2
113	Dr. Arnoldo Koss MD	462-897-3584x62	6
114	Dr. Myles Ullrich IV	190.770.7667x01	2
115	Ms. Zelda Klein I	1-654-332-2072	6
116	Keon Harris	1-093-317-4784x	13
117	Alexzander Lynch	1-649-411-8314x	2
118	Antonia Ortiz I	973.907.8080x68	3
119	Ms. Rubye McDermott	311-232-3970	2
120	Angelita Wehner	1-355-240-6196x	9
\.


--
-- Data for Name: guide; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.guide (id, name, last_name, email, phone, bonus) FROM stdin;
81	Marquis Hoppe	Braun	eLeffler@hotmail.com	(752)139-8492x60737	3
82	Albina Schaefer	Dibbert	Hegmann.Toni@Johns.net	(003)027-6934x4191	14
83	Kennedy Medhurst DDS	Runolfsdottir	Skye49@yahoo.com	+87(7)4160294048	12
84	Dion Cruickshank	Roob	McCullough.Judah@gmail.com	1-277-080-8948x38253	7
85	Mr. Salvador Satterfield	Lakin	Walter.Kendall@Gusikowski.org	330.776.5991	9
86	Stephania Kerluke V	Skiles	nHayes@Feil.net	255.221.6370	7
87	Prof. Sharon Reichel DDS	Rath	Jettie85@Stoltenberg.com	259.356.1666	9
88	Collin Dickinson DVM	Wuckert	Isaiah85@hotmail.com	686-651-7802x2323	1
89	Kelli Gottlieb	Waelchi	fSchmitt@Johnson.com	568-102-7397	12
90	Granville Hegmann	Schulist	Ziemann.Jalyn@hotmail.com	05827782085	14
91	Jenifer Lakin PhD	Marquardt	Amalia68@gmail.com	+49(3)6454707658	2
92	Ms. Hilda Mosciski	Schoen	Buck69@Zemlak.biz	895.925.2111	12
93	Ms. Mazie Miller V	Lehner	Ferry.Madison@yahoo.com	817-239-4617	6
94	Nolan Corkery	Lueilwitz	Edwina82@yahoo.com	+59(4)4779209981	15
95	Mr. Samir Hintz	Steuber	Cruickshank.Ladarius@Jaskolski.info	(827)727-0470x66403	15
96	Retha Cummerata	Bergnaum	mPollich@hotmail.com	08283273159	6
97	Maybelle Pagac	Luettgen	Dallin.Corkery@Halvorson.info	328.433.2009x07501	7
98	Bryana McKenzie	Rolfson	Candace15@Schamberger.info	326-269-5026	15
99	Dr. Derek Runolfsdottir	Wolf	Alejandra35@Balistreri.com	(085)130-4024x04139	12
100	Hubert Dach	Brown	Klocko.Novella@yahoo.com	(686)634-9921	15
101	Dr. Terrence Walter	Hagenes	Ashly.Barrows@Kassulke.net	1-451-202-4544	15
102	Prof. Alfredo Kozey II	Rogahn	xJones@Feil.net	313-715-1707x793	11
103	Prof. Winston Daniel PhD	Dickens	Wilkinson.Hellen@gmail.com	(488)657-1647x9074	12
104	Glennie Farrell	Schinner	cHyatt@gmail.com	488.221.5337	14
105	Lee Runolfsdottir	Bartell	cWisoky@Schuster.net	1-202-257-7893x207	8
106	Mrs. Fatima White MD	Ward	Katrina30@gmail.com	1-580-415-4070x043	3
107	Dr. Zackary Herzog	Lesch	vBartoletti@Grady.com	(968)506-5636	11
108	Albertha Ledner III	Spinka	fJohnson@yahoo.com	704.698.5578x945	12
109	Mr. Junior Cormier IV	Wolff	Erdman.Beverly@Pollich.com	612.343.6977	15
110	Marisol Schowalter	Steuber	cRice@yahoo.com	(925)928-4327x10267	9
111	Haley Greenfelder	Kiehn	Michaela95@Harris.com	01923874415	9
112	Devan Ullrich	Cartwright	Halvorson.Carmela@Tillman.net	1-246-440-9660	3
113	Maybell Corwin	Ondricka	Lyla.Cormier@Lakin.com	846.859.9926x48814	1
114	Cristian Becker	Romaguera	Leopoldo11@Bosco.com	+57(8)0279661328	10
115	Precious Morissette	Sanford	Major.McClure@Beahan.com	(768)593-8484	7
116	Mr. Jake Kilback DDS	White	Rosalyn81@yahoo.com	928-720-9393x271	13
117	Prof. Annabel Barton PhD	Kemmer	Shields.Brandi@gmail.com	(088)150-6562x7909	12
118	Dr. Ed Ritchie MD	Wilkinson	Predovic.Courtney@Barton.org	392-572-9064x60696	5
119	Miss Savanah Reilly DVM	Beatty	Schaden.Alberto@Crooks.com	1-385-941-2656	4
120	Daniella Kilback II	Torp	Eileen26@hotmail.com	09362291530	11
\.


--
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house (id, type_id, destination_id, name, address, phone, email, description) FROM stdin;
1	12	39	Laboreasperioresnon.	727 Johns Shoal\nStehrmouth, HI 16469-3263	+32(4)7655447678	yMraz@hotmail.com	Dolorumetsolutalaborumquasautaperiamdolore.Ullamrerumutsintexercitationemeteligendiqui.Doloremqueipsamnobisratione.Quaeratquodeaqueculpaanimiearummollitia.
2	9	39	Nonvoluptatemamet.	860 Keon Dam\nNew Donald, OH 73291-6032	303-592-0771x2765	Bertha90@gmail.com	Fugaliberoestatlaboriosamquiaautbeatae.Velitautabmolestiasetautvoluptas.Sapienteseddolorquaeratdoloribusdolorenemoexercitationemnihil.
3	12	39	Repudiandaeiustoipsumquis.	0117 Friesen Orchard\nFlorenciofort, MI 57362-1962	06285628323	Maximillian67@hotmail.com	Minusblanditiisexplicaborationeatnon.Sitsintvoluptatemvelitdolorfacereanimiprovident.Hicquidoloresutnemononreprehenderittemporecum.
4	12	39	Rationevoluptatemea.	814 Thompson Via Suite 464\nPort Ameliechester, WV 72198-9934	533-647-8415	Blick.Marjolaine@Witting.net	Estsitveniamsuscipitet.Quodundedolorabquianullavoluptatumexplicabo.
5	9	39	Totamipsamnequeearum.	447 Dwight Ville Suite 962\nCrooksfurt, IN 57057	980-618-7950	Jasmin.Rice@Sauer.net	Repellendusrepudiandaesedlaboriosamrerumomnisvoluptate.Omnisperferendisesseinoptio.Reiciendisquidemsimiliquemaiorestemporibus.Similiqueeiusaconsecteturinvelit.
6	9	40	Molestiaedebitisveniam.	119 Xavier Court Apt. 812\nPort Jayce, MD 87422	03346228670	Auer.Terrill@Bashirian.net	Delectusminuspossimusipsamquiaquiincidunt.Minimaoccaecatiofficiaatque.Sitvoluptatespariaturaet.Eumquisquamexplicabodoloreautem.
7	9	40	Nonrepudiandaealiquam.	22833 Collier Mills\nLake Zelmahaven, IA 58620	(864)233-0593x5357	dGulgowski@yahoo.com	Sitdoloraliquidsiteumrerum.Pariaturautisteconsequaturautemtotamconsecteturet.Estmagniiureteneturquia.
8	11	40	Sedomnisveniamnullavelit.	50195 Volkman Cliff\nNew Haleystad, OH 18448	+26(8)0344928294	dFriesen@Green.net	Quamcumnequeeumetautemiureipsumvoluptate.Nonaspernaturmaximecommodiveritatisvoluptas.Quiomnisverodoloresutcupiditatenostrum.Quaeratvoluptatumvoluptatesrepellat.
9	11	40	Autquod.	7500 Kilback Summit Apt. 982\nEast David, GA 69129	664-392-8769x991	Ali.Olson@yahoo.com	Consequunturetvelquiutautlaudantium.Doloremquidolorinciduntquasetut.Nonvoluptateslaboreaculpa.Etrecusandaeullamautemmolestias.
10	9	40	Abaperiamnulla.	3494 Abshire Manor Apt. 924\nAllyland, SD 16239-6541	465.272.9949x9369	Keely.Osinski@Heidenreich.com	Quaeratnatuscumconsecteturtemporerationeofficiisqui.Solutavoluptatequovoluptasilloinaliquameveniet.Molestiaeillodictaidquasitenetur.Utrecusandaeessemollitiaperferendisvoluptatemeaque.
11	10	41	Fugaquiexpeditadolore.	3668 Helene Shores\nPort Barney, MT 26412-3366	02437031194	zWyman@hotmail.com	Estmollitiaitaqueconsequatur.Aspernaturtemporeprovidentlaboreminus.Quiullamnequehicsed.
12	10	41	Inciduntabeosnonoptio.	66348 Orn Glen\nBednarburgh, TN 91456-9080	05801940423	aMorar@yahoo.com	Blanditiisnonetvelitesse.Eosvoluptateeacorporisquivoluptatemaut.Ipsaquidemsintaliquidfugitdoloresse.Reprehenderitducimusessearchitectoipsam.
13	9	41	Ducimusevenietsint.	958 Purdy Brooks\nNoemymouth, MI 93495	779.111.8086	gKuhic@hotmail.com	Dignissimosanimiutexcepturi.Adipiscidolormagnioditquifugit.Etquiatemporibuseosnumquam.
14	9	41	Accusantiumautvoluptas.	6503 Kaylie Ridges Apt. 676\nPort Evans, AZ 03550-1032	842-578-7346	Rebekah98@yahoo.com	Molestiaefacilisautrecusandaevel.Aliquamofficiisetsapientequamvero.
15	12	41	Vitaedolorevenietrerum.	97191 Kohler Summit\nCummingshaven, NV 67841-1412	062.861.2227	Hettinger.Tyrel@gmail.com	Architectonondoloremrepudiandaeharumconsecteturmolestiasquasi.Undeconsecteturaperiamametcum.Voluptatumdolorsitat.Quisnecessitatibusatrepellatsedquibusdamnonmaxime.Molestiaeerrorrepellatdeseruntipsaquoullamsaepelibero.
16	12	42	Nullaoptiodelectus.	03324 Schimmel Wall\nDietrichfort, KS 81517	07598515293	qConsidine@Dickinson.net	Blanditiisquiquiprovidentblanditiissit.Iuresuntvoluptatemducimus.Nihileosestfugaaccusamusfugiatfacilisconsequaturqui.Sedaperiamvelitestet.
17	10	42	Minimaaut.	48366 Darrin Motorway\nNorth Terrillfurt, AK 09185-1590	(877)752-6358	Sophia72@Feeney.com	Blanditiisvoluptatesteneturrerumassumenda.Doloremquametvoluptatemnesciuntsolutanatusetex.Istesuntipsaquoquas.Inciduntnonasperioressedquiaetdoloremqueipsaaut.
18	11	42	Ipsamfugit.	011 Hoppe Plains\nEast Aurelio, IN 37275-8974	1-638-505-0529	Williamson.Rosetta@Abernathy.net	Animilaboriosamquissintipsama.Atoptiofaceresuscipitrerumquibusdam.Aspernaturcorporiscorporisdicta.Blanditiisnonnostrumex.
19	10	42	Velquinumquamatqueet.	39738 Renner Bypass Suite 509\nAllanstad, IN 78701	1-544-416-5346	Letha82@Schmidt.com	Inventoreautperspiciatisetquidebitiset.Iustoharumfugitetconsequunturaccusamusreiciendisid.Eaqueporronatusconsequatureius.Quiquiprovidentullamest.
20	9	42	Beataenullavoluptatem.	93457 Cydney Lakes Suite 385\nLake Jaidastad, WA 61960	567-819-3084x8597	Willms.Ciara@Watsica.info	Etnonquosuntanimiutest.Quiteneturnecessitatibussuntutnullaenimperspiciatisqui.Utfugitquosquasexercitationem.Adsimiliquequosatquepossimusomnis.
21	12	43	Autemut.	1153 Idella Highway\nWest Maida, OH 34091	150-006-8915x005	Talon77@gmail.com	Reminciduntutdelectussint.Placeatrerumutquiaquia.Doloruteiusreprehenderithicquasirepudiandaeomnis.Exautteneturquoautemet.
22	12	43	Officiaullamnemoexercitationem.	5333 Schiller Islands\nElsieton, MN 99627-4898	518.559.2393x359	wBradtke@Kshlerin.com	Illumdelenitirecusandaemolestias.Optioinventoreabminimaplaceatquasiaccusantium.Quasiillumatmaximeetnequeautemetquas.Saepeestmagnamconsequaturnihil.
23	9	43	Quisapiente.	010 Larkin Cliff Suite 488\nMarquardtland, ME 62831	(941)527-4534x40022	qMedhurst@Stiedemann.org	Eacupiditatequodconsecteturcorruptisit.Corruptieosprovidentoccaecaticonsequatureaillum.Quiaenimnullaimpeditenimcorporisseddolorum.Rationemagnamhicfugittemporibusblanditiis.
24	9	43	Mollitiaanimibeatae.	00822 Hodkiewicz Pine\nLayneburgh, ID 88321-7288	989.105.6301x633	Marley65@yahoo.com	Repellatiurerepellatconsequaturrerumodioutdolorea.Anemolaboremolestiaeestmodinullaaut.Nostrumdolorepariaturillum.
25	10	43	Fugaexercitationemconsequatur.	56109 Tia Hills\nSouth Garnett, MO 18441	(627)060-6388x103	qThompson@yahoo.com	Asperioresquiquaeratautemcupiditatein.Voluptasenimdoloresutcorporisfugiteaquosvoluptatem.Velitdelectusvelitexplicaboatnumquamasperiorestemporeeveniet.Eligendidistinctiodictaquibusdamtempore.
26	10	44	Vitaedignissimosblanditiis.	5201 Brakus Crest Apt. 684\nLake Valentinborough, NH 41390	(456)158-4671	yJacobs@yahoo.com	Harumveniamsintiustoetdolorumtotamconsequatur.Errorsedautestoptioadipisciutaspernatur.
27	9	44	Necessitatibusqui.	72569 Fleta Plain Suite 295\nEast Judy, WA 97023	(155)997-8741x158	Marco.Wyman@Kiehn.org	Aliquidvoluptatemnullareprehenderit.Optioetrepellendusetaspernatur.Sequiearumnullaadillopariaturimpeditest.
28	11	44	Praesentiumatqueanimioptio.	7475 Bogan Highway Suite 657\nLake Erika, MN 29728	(113)962-6528	uLang@Kunde.com	Delenitialiquidsitminussaepequasaccusantium.Ducimusquibusdamoccaecatioptiocumestsed.Nonquiailloeumautnonoccaecati.
29	12	44	Temporibussedtemporeeius.	93988 Kiehn Tunnel Suite 780\nLuettgenview, ID 77337-8467	1-861-089-0348	tStamm@yahoo.com	Corporisquaeratconsecteturtenetur.Quisquamnihilassumendaeaqueharum.Nonautdoloremquenostrumetvelitipsum.Repellatidvoluptasquiexpeditaquasiitaque.Esseestrepellenduseaconsecteturet.
30	12	44	Voluptatemmagnieum.	57085 Lemke Union\nChadrickburgh, KS 50520	226-724-1865	Candida.Erdman@hotmail.com	Magnamrepudiandaeutinventore.Maioreseaquemolestiasenimvel.
31	11	45	Quiafacilisquisquam.	3616 Geoffrey River Apt. 493\nRevaport, NY 98409-2395	1-166-960-3455	Jazmyne.Kassulke@Gaylord.net	Perspiciatisutetexplicabolaudantiumoditautrerumquo.Utdoloribusremetnonharum.Facilisevenietquivoluptatemaspernaturitaque.Utfaceremagnammolestiashic.
32	10	45	Molestiaedoloresculpaperspiciatis.	4138 Emery Underpass Suite 103\nNorth Tremayne, TN 85614	452.792.0572x49170	Travon.Bednar@yahoo.com	Sitvitaequoeostotamrationeremquis.Quiaidvelinexercitationemsedtemporibusnisi.Porroeaquedolorillout.Repudiandaevoluptatemrepudiandaeofficiispossimusutsuscipitidet.
33	12	45	Voluptatemmaxime.	4728 Shanel Curve Apt. 403\nWest Nayelimouth, MN 47634-2381	941-015-1859x1808	Augustus.Block@Swift.com	Impedittemporibusconsequaturabsit.Doloribusilloaliquidperferendisnihil.Autaliquamarchitectototamsintrepellendusetreprehenderitperferendis.Quiaculpacorporiseiusautaperiamsedcommodi.Quiperferendisquisquod.
34	11	45	Iuresaepepariatur.	1836 Barrows Estates\nJastport, ND 67060	078-643-9194x8945	mJaskolski@West.com	Velexercitationemplaceatipsammolestiaefacereea.Veniamfugiatsedreprehenderitinveroreprehenderitrerum.Quiareiciendisfacilisullamnonnumquam.
35	12	45	Remlaboreofficiisharum.	97800 Chesley Pine Apt. 191\nNew Ned, MS 36748	(617)650-1295x2713	Itzel.Connelly@gmail.com	Enimvoluptateoccaecatiquo.Oditeiusvelsedaab.Nesciuntetnullaexcepturia.Consequaturetimpeditquianesciuntqui.
36	11	46	Exercitationemfugiat.	9665 Cassidy Stream\nAufderharburgh, SC 95199-7501	916-085-3781	Brandy16@Wunsch.com	Autnullacorporisteneturnonsitporromolestiasreprehenderit.Veritatisvoluptatedolorumquisetnesciunt.Maioresmolestiaeconsequunturdignissimosrepellendusnihilexcepturiut.Voluptatumnequedolornihilconsequaturomnissintvoluptatem.
37	11	46	Culpaquiaodio.	27105 Barton Mountains\nWizabury, IL 69467-9826	09190620452	Laurie93@Hane.com	Deseruntomnisdistinctiovitaedebitiseos.Temporibusmollitianullaeaateligendietconsectetur.Nobisvoluptatesaspernaturdolorrerum.
38	11	46	Idautemperspiciatis.	03616 Reynolds Place Apt. 302\nSouth Pattie, NY 11315-0986	880-994-7683x775	Bailey.Fern@hotmail.com	Repudiandaequierrorautvoluptaseosquiased.Suscipitutsitmagnamexpedita.Officiisquiaaliquamveniam.Utquisestdoloribus.
39	11	46	Voluptasrerum.	4551 Stephany Tunnel Suite 088\nSydniehaven, WI 71238-5989	1-487-794-6923x123	yKling@Dibbert.com	Delectusrecusandaeminimautidipsam.Beataequodetdoloribusveroquisquamex.Accusantiumquilaborumearumvoluptatequia.
40	10	46	Expeditavoluptates.	730 Dickinson Roads Apt. 219\nPort Jessica, MI 74141	(651)917-1160	Barrows.Ceasar@Leannon.biz	Maximenonvitaequiaetodioidrecusandaeexcepturi.Etdoloremaperiamreiciendisdistinctio.
41	11	47	Debitisaperiamautemdoloremque.	554 Jose Prairie Suite 632\nMaryport, NE 17686	1-668-963-7340	Tamia43@gmail.com	Utmaximelaudantiumomnismolestiaeveroex.Dignissimosnesciuntenimetet.Quamperspiciatismolestiaeinmodi.Commodimolestiasestnihileaeumaut.
42	9	47	Nullacommodiratione.	8826 Littel Ports\nJohannaville, ID 03910	778-363-4173x9155	Chance79@yahoo.com	Etatdolorfacilisinaliasnon.Aututquirepellatutautqui.Placeatquirerumuttemporasitevenietut.Delectusetpraesentiumtotammolestiasqui.
43	9	47	Evenietquaequod.	6804 Bins Station\nNew Elsaside, NC 76630	1-938-211-1222x1046	Swaniawski.Verla@hotmail.com	Assumendasimiliquenisihicquiaquaeoditipsaqui.Quiaeosnullaautsedidsapientecorporisvoluptatem.Commodisuscipitexercitationemautmolestiae.Veronatusininteneturtemporibusaliquamodio.
44	9	47	Sintperspiciatisautemcommodi.	297 Reynolds Skyway\nEast Savion, TN 82558	+22(5)3470450606	Adrien87@gmail.com	Quascumdelectusaccusamusoptioculpadignissimos.Mollitiadolorestemporibusquaeratvoluptatemvelit.Rationemaioresasperioresnesciuntsuntquoslibero.
45	10	47	Praesentiumutofficia.	661 Ondricka View\nEast Hilariochester, MT 52995	800-726-8278	hBrekke@Durgan.net	Asperioresreiciendissaepelaborequiaut.Deseruntquiaenimhicaliquidimpedit.Nesciunteavoluptatemipsumlaborumquasiipsa.Necessitatibuslaboriosamvoluptatemutautvelvel.Nihilquiamagnamasintacum.
46	12	48	Etsolutanam.	29680 Johnston Rapids Apt. 931\nAlfredomouth, HI 10941	04675045531	Hane.June@Balistreri.info	Odiocumvoluptatumquia.Etsedrepellendusearumsuntquamconsequuntur.Quoautautematculpasedlaboriosam.Quiateneturoccaecatiomnisvoluptatemnondignissimos.
47	12	48	Dolorumestnostrumamet.	6028 Verda Spring Apt. 491\nNorth Fridaland, NH 80721	+96(8)1312436797	Talia61@yahoo.com	Corruptieiusinventoremodi.Istecumquequosnecessitatibusfacilis.Rationeetautnemoperferendissitidblanditiis.
48	9	48	Teneturquiseos.	126 Rempel Fords\nJuniusville, WA 42667-6940	324-535-3080x36167	Jaydon32@gmail.com	Auttotamsintetqui.Voluptatemodiovelipsamquieumtotamquaevoluptate.Suntpariaturpariaturvelaccusamusquosquia.
49	12	48	Quisitrerum.	84781 Runte Expressway Apt. 831\nSouth Cruz, AL 78592	443-467-5104x13038	Schaden.Tiara@gmail.com	Animinullarerumblanditiisdolorum.Quianemoquianisiqui.Evenietremsitsaepenon.
50	9	48	Eaquo.	71069 Naomi Courts Apt. 778\nSouth Laura, IN 82847	01346676116	Scottie27@Sanford.com	Corruptiutdelectusiureeaadipiscimolestiaealias.Ullamfugasitdoloreindelenitiqui.
51	12	49	Repellatenim.	6941 Pansy Course\nLake Deangeloton, NJ 43938-6722	(758)300-4708	kBlock@yahoo.com	Easequiquolaboriosamsoluta.Quisquasimolestiaeutomnisrerumautvoluptatemillum.
52	11	49	Sitreprehenderit.	28952 Wiza Ferry\nNorth Jacky, MI 72651	1-615-223-1244	fConroy@gmail.com	Vitaequiquidemvelitmagnam.Minusquisquamdoloresmolestiaslaborevoluptatumea.Mollitiarepellendusvoluptasautaratione.Etnisiestlaboreblanditiisdoloremquesedliberoassumenda.
53	12	49	Sintestquo.	9308 Karley Islands Apt. 215\nGunnarview, SD 27590-7561	1-601-424-8421x0947	Ortiz.Melany@hotmail.com	Autemdoloromnisetdolor.Ducimusquidemeiusnonpariaturculpacorruptiqui.Sedquamsuscipitetharum.Utliberoreprehenderitnullaexcepturiquaeveronecessitatibus.
54	12	49	Voluptatesomnismagnam.	9491 Botsford Junctions Apt. 596\nNew Eliane, WA 23098	234.700.4996	Brandt30@Frami.biz	Exmaximenisilaborevoluptatibus.Repudiandaeidnonmaioresquasiporrosedrerum.Utdoloribusquiadistinctioesteosaut.Saepedelectusprovidentestvoluptatem.
55	12	49	Explicaboassumendamolestias.	94653 Karlie Manor\nLake Lylabury, CT 21739-6724	822-257-8200	Carey.Quitzon@hotmail.com	Similiquefugiatquaeratexcepturiquiaexnecessitatibus.Doloremrerumvelquodsed.Perferendissedsunteteiusexcepturi.
56	12	50	Adculpasapiente.	1324 Bettie Gateway Suite 067\nMaximillianport, SD 35400-5952	889-593-3795x7444	Bednar.Dudley@Gorczany.com	Etdoloribusveritatisquiautperferendislaudantiumvoluptatem.Asperioresautemvoluptassaepesunt.Quaevoluptatemoditiniusto.
57	11	50	Doloresautemet.	1080 Crona Forges\nNorth Wanda, VT 59164	+69(5)8403909697	Brooke.Green@Hoppe.com	Nihilautquiquiomnis.Veniamestplaceatillumnobisautpariatur.Autsintfaceresintarchitecto.
58	12	50	Exercitationemaspernaturet.	3602 Cartwright Square Apt. 752\nPort Dallas, MI 93916	+76(4)2203566360	Andreanne.Schiller@Wilkinson.com	Magnamiustovoluptatemvoluptatemsoluta.Omniscorruptidoloribusmaioresperferendis.Voluptatemvelautconsequatursequiid.Quidemilloillumdoloresapiente.
59	12	50	Quisrecusandae.	89208 Natalia Track\nCatharinemouth, NM 68856-7933	718.098.2591	xKirlin@Stracke.com	Quisquamutquiaaccusantiumevenietperferendiseligendiaperiamconsequatur.Quidemiustonullaidnamlaudantiumquia.Nesciuntpraesentiumomnisat.
60	9	50	Solutaeaperferendishic.	981 Nikolaus Courts Apt. 187\nWest Georgiannaside, VT 17036	189.815.9138	Trey.McClure@yahoo.com	Voluptassuscipitsintetlabore.Etquivoluptatemid.Harumestasperioreserror.
61	11	51	Excepturimaioresadrerum.	980 Abshire Courts Suite 407\nWest Beverlymouth, MS 49737-8239	580.807.9414x061	Erika05@Hills.com	Adodiodelectuseamaximenemoaccusantiumexdebitis.Aliquamevenietiureetat.Autemofficianostrumomnisdoloremearumesse.Minusdoloremaccusamusquisquametautfugiat.
62	11	51	Etsapientecorporisquiaitaque.	21745 Hermiston Crossroad\nSanfordstad, IL 67460-4645	159.821.5882x3586	Elta.Graham@Sauer.com	Doloribusoditvoluptatemdolorrationeminusveniam.Quiaetomnisetvelitetsintvelitofficiis.Mollitiaerrornumquamquaeratperferendisearepellat.Possimuseaquedolorquasiconsequaturveniamaccusantiumsunt.
63	9	51	Etfacerevoluptates.	2749 Jaskolski Crest Apt. 061\nVolkmanview, RI 93925	660-830-7357	Christa.Waters@Morar.com	Doloribusblanditiisinsitipsumvelconsequaturearum.Placeatvoluptatequibusdametnon.Atnemominusquisaliasquodremenim.
64	12	51	Sedatarchitectoeum.	1130 Marisa Shores\nConnellyborough, PA 72732	576.662.9278	Emile33@Vandervort.info	Omnisutadquisoditillotemporibus.Odioessedoloresesttemporasitrationenullaerror.Dignissimosveritatisbeataeerrorataliquamquis.
65	10	51	Similiquevoluptastenetur.	72580 Francisco Springs\nLake Agustina, VA 27815	1-976-574-6285	Mikel43@hotmail.com	Autemquilaboreistesaepequiatemporibuserror.Distinctiovoluptateautpraesentiumnemosimiliquenisireiciendis.Dictaipsaipsumutat.
66	9	52	Etet.	143 Jones Trail\nSouth Dino, CO 87316-5292	1-702-214-2007	Pagac.Delilah@gmail.com	Isteadipisciilloipsamtemporelaudantiumatquetemporevoluptatum.Saepeautdolorsuscipittemporibusfacere.Undelaudantiumenimfugiatdolorestmodisimilique.Nonenimrerumipsamut.
67	11	52	Nobisestsedquasi.	8899 Haley Loop Suite 527\nNorth Cordiemouth, KS 58641	+75(9)9312972597	Vandervort.Bridie@hotmail.com	Magnifacilisomnisconsequaturvelveritatisdolornihil.Magniexdeseruntvoluptasofficiasedminus.Consequaturevenietaliquamsolutaplaceatnampariaturrepellendus.Rerumfugitvoluptasconsequunturquo.
68	10	52	Aliquamrepellendus.	3188 Bernier Pike Apt. 466\nWest Torreyborough, NV 01977	357-890-5204x5958	kLowe@yahoo.com	Pariatureumanimiofficianatusexpedita.Doloresintametautoditmollitiapariaturanimi.Natusquiutoccaecatineque.Eximpeditquinullaaperiametfuga.
69	12	52	Hiceaquisquameos.	03231 Osvaldo Tunnel\nPort Alisonport, MO 17182-6642	716.446.2942	Oran.Wehner@yahoo.com	Eaeiusrecusandaeaut.Porroautenimdoloremque.
70	9	52	Ipsameumofficiaodit.	375 Beer Shores\nLake Libbybury, MS 92081	+20(1)7101313038	Molly50@Aufderhar.biz	Possimusblanditiisvoluptaseosreprehenderitmolestiaesapiente.Estquiautdolorautem.Quidoloremutdeseruntquis.Quisolutautquaenam.
71	10	53	Iuresequipraesentium.	25946 Smith Plains\nAmaramouth, HI 29782-3969	(071)374-5953x990	zFranecki@Schmitt.org	Essequaeratomnisquiabfugiatducimusremeaque.Assumendatemporacumquodrerumeligendimolestiaedistinctio.Eaqueofficianamametdolorestetin.
72	11	53	Omniscorruptiexporro.	20158 Herzog Meadows\nAssuntashire, GA 81322-7765	1-328-036-0811x211	Zachary.Keeling@yahoo.com	Maioreshiceaquenatusquosoccaecati.Numquamculpaestporrodistinctioenimut.Uteosoccaecatiarchitectononperspiciatiseaquemaiores.Optioassumendaofficiaetinventoreanimirepellendusnumquameligendi.Quidemautundeullamsintrerum.
73	12	53	Utnisi.	940 Aliza Trail Suite 404\nEast Samantaville, AL 56450-7895	835-487-7639x369	Wilson73@gmail.com	Porroeligendideseruntetestnam.Quiaperferendismaioresconsequaturcumquesit.Quisquamconsequaturnequetemporaanimi.Rerumeumidetquianihil.
74	11	53	Excepturiquoquiaestvel.	262 Schaefer Route\nNicholemouth, WI 88022	(529)783-5229x12935	West.Yoshiko@hotmail.com	Eiusoditvelitremautvelitanimiconsequuntur.Etfugiatdolorumconsequaturomnis.Delectusconsequaturcorruptiblanditiistemporequidemvoluptatemquo.
75	10	53	Dictanecessitatibuscommodiquia.	3433 Gutkowski Crossing\nGabriellafort, ME 45494-5385	1-141-323-4806x1193	Koby13@Mann.org	Quoeosveritatisvitaeaccusamus.Aadrepudiandaedolorum.Molestiaeautdignissimosutconsequunturrerum.
76	10	54	Ullambeatae.	041 Lavada Course Suite 605\nAdelinehaven, NM 46673-6420	728.442.4353x57537	dRutherford@gmail.com	Expeditasitsaepevelrepellat.Easuntsitautnostrumsit.Autquiestvoluptatemfugiatetautquis.Quisquamcumconsequunturestducimusfacilisnondolor.
77	12	54	Veniamiustoiure.	2731 Sincere Mount Suite 326\nEast Gwen, MI 82494-2730	326.359.9468	Susan.Konopelski@gmail.com	Optiosapientesaepeeoset.Etoditestvelit.Expeditaeaexquiaaliquid.
78	11	54	Voluptatemipsamveritatis.	02451 Heathcote Cliffs Suite 526\nNew Lilymouth, OK 27575	(486)542-9639x66870	Deborah.Tillman@yahoo.com	Voluptatemestquiquisquamet.Omnisvelestetreiciendisoptioutevenietaut.Necessitatibusmolestiaeetnemofugiatrepellendusquiharum.Remautperferendisofficiaenimnequeenimsitofficia.Mollitiaaccusamusrationequae.
79	10	54	Velperferendisvoluptas.	841 Wyman Key Suite 132\nMandybury, PA 20160	190.393.7210x304	Grayce.Gusikowski@Schultz.net	Consequaturquiaharumnemoquisequirepudiandaetotam.Exercitationemsaepesimiliquedistinctiodistinctio.
80	11	54	Sitvoluptatemest.	463 Weimann Square Apt. 691\nPowlowskichester, GA 00536-9517	718-061-8000	pRomaguera@Goyette.biz	Rerumodiositsuntcuminventoreremmaiores.Quisevenietnullautrepudiandaeut.Utculpaaaliquidsuscipitutdelectus.Similiquenonlaboreestquodatque.Mollitiavelutmagninemomolestias.
81	9	55	Utsuntiure.	00226 Stroman Cliffs\nNew Duaneland, IA 53714-5658	381-119-9711x37643	Zboncak.Lisandro@Wolf.com	Dolorsequisuntofficiisestillumeosharum.Numquametquivoluptaseligendi.Utrepellendusbeataevoluptassitvoluptatemquia.Delectusinfugitimpeditaccusamusiusto.
82	10	55	Fugiateiusamet.	883 Bechtelar Prairie Apt. 153\nPort Nolaton, AZ 34745	865.829.3020x359	Bayer.Elton@gmail.com	Inciduntetrepellatvoluptatemvelitfacereestet.Eumututeligendiomnisdictacumqueiure.Consequaturnesciuntautautemaccusantium.Estquiaspernaturquianequenon.Laborumbeataemaximeetesseetesse.
83	12	55	Veniamipsa.	08324 Camylle Spurs Apt. 482\nIsabellemouth, AZ 77301-0041	07943412502	Moen.Bertrand@Howell.com	Repellendussedaperiammollitiaautdolorreprehenderitet.Quodeteligendieligendiexercitationem.Expeditacorporisdolorumconsecteturautdoloremrepellendus.Solutaiustoenimsinttemporasint.
84	12	55	Harumconsectetur.	9971 Gabriella Tunnel Apt. 992\nNew Irvingport, MA 82061-1869	+59(7)0074328823	Benedict69@gmail.com	Recusandaedolorofficiaexcepturicumquenatus.Autmolestiaeoditatexplicabovoluptatesearum.Eosesseullamasperioresquisarchitectoetid.Consequaturetnonquianisiestlibero.
85	11	55	Inciduntatque.	960 Yundt Village\nNorth Audrafort, MN 57689-1241	(796)194-8860x1501	Ondricka.Johan@Streich.org	Etmolestiaebeataeutquasiitaquererum.Eligendibeataeminussequidolores.Etabreiciendissitnequevoluptates.
86	12	56	Inventoreautmaiores.	2522 King Heights Suite 163\nWeimanntown, IA 85262	(500)614-1274x1313	Daisy.Langosh@yahoo.com	Evenietlaboreuteligendisitsedsolutaquasi.Aliasaspernaturnisiperferendisconsequaturtemporibusasperioresab.Eaquemolestiaealiaslaborum.Doloreetvoluptatesvoluptatemcorporisvelautem.
87	11	56	Quiavoluptatemnesciunt.	7277 Rodriguez Loaf\nLake Delphineshire, MT 36824	1-304-800-8769	ySkiles@yahoo.com	Repudiandaedoloresdistinctiononvelit.Consecteturnatusautassumendadoloreminventore.Magnammolestiassintetetquisquia.Etpraesentiumnondoloret.Odioprovidentexcepturialiasquihic.
88	12	56	Architectoducimus.	20595 Friesen Parks\nCelestinetown, IL 20761	642-742-1953x24465	Gust41@gmail.com	Aututmaximedistinctioaut.Quiatotamtemporeassumendatemporaveritatisexplicaboatque.Dolorumexquiculpaiustopossimusetcupiditate.Veletvoluptatemeiusoccaecatiimpeditaccusantiumconsequatureum.
89	10	56	Sitrerumaperiam.	11602 Haven Walk Suite 995\nSouth Dixietown, LA 69172	1-305-003-1093x8814	Noelia.Brekke@Hirthe.net	Fugititaqueenimculpacorruptibeataeut.Autsintsolutablanditiismodinequesit.Etcorruptitotammaximeporrocupiditateexplicabo.Quisitimpeditrerumetlaudantiumautquia.Veniamaliaseadistinctioiusto.
90	10	56	Quisut.	91949 Aliya Camp Apt. 140\nEast Emil, VA 19970	+50(5)4613149355	Patricia33@Mraz.org	Fugaharumtotaminciduntquos.Etvelitlaborumdistinctioaliasutisteat.
91	11	57	Molestiaeadquibusdamqui.	7055 Nolan Springs Apt. 303\nLake Aron, TX 73721-2480	400-820-3582	Linnie.Schowalter@Douglas.info	Quibusdamarchitectosintvoluptasautfugiat.Reprehenderittemporecupiditateiustonesciuntcumqueharum.Debitisrepudiandaesolutamagnamliberonequevoluptatem.Suntnihilsitaperiamsitcorrupti.
92	12	57	Autemdebitiset.	0819 Lambert Dam\nMarcoton, CO 14108-3532	08674763453	Libby21@yahoo.com	Adipisciametrepudiandaeerrorsitlaborumquinihildoloribus.Nequedoloresprovidentvoluptatem.Nemoestcorporisquiadignissimosvoluptatem.
93	12	57	Enimdoloribusautem.	3215 Miller Point Apt. 014\nLake Briana, NH 78915-2339	(397)166-5563x660	Larry45@Anderson.org	Dolorblanditiisvoluptatemdignissimoseosquiarchitecto.Nisiminuslaborequaeratetmolestiae.Adipiscietfugitaliquidutlaboriosammollitia.
94	12	57	Modinoninea.	3153 Rath Course Apt. 616\nPort Emmittborough, KY 37014-0912	1-254-778-5967x9988	wMacejkovic@gmail.com	Asperioresetsuscipitnonut.Commoditeneturiderrorlaudantiumassumenda.Estculpadoloremqueatquenumquamestdolorem.
95	10	57	Ducimuscorporismagnam.	55934 Arielle Groves\nPort Aliza, VA 76148	(745)963-7451	Demetris.Bednar@yahoo.com	Quimollitiaquiavoluptatibusexplicaboveritatisasoluta.Sedetperferendissitadoloribusofficia.Distinctioiustoreprehenderitmaximevelitblanditiis.
\.


--
-- Data for Name: house_feature; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_feature (id, name) FROM stdin;
11	Internet
12	Pool
13	Stairs
14	Elevator
15	Ground Floor
\.


--
-- Data for Name: house_house_feature; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_house_feature (house_id, house_feature_id) FROM stdin;
1	12
1	13
2	14
3	15
4	15
4	13
9	11
9	13
9	15
9	12
10	14
10	15
10	11
11	14
13	14
14	12
14	15
14	14
15	13
15	12
16	11
16	13
16	14
19	15
19	14
21	13
21	12
22	13
23	12
23	13
24	14
24	11
24	13
26	12
26	13
27	12
28	13
28	12
28	15
29	11
30	12
31	14
31	11
32	14
32	15
32	13
33	14
34	13
35	14
35	15
36	13
36	14
36	15
37	13
37	14
37	11
38	14
38	13
38	11
39	15
39	13
40	14
41	13
41	12
43	12
43	15
44	12
45	11
45	15
46	14
46	13
46	11
47	11
47	15
48	15
49	12
50	11
50	13
51	14
52	15
53	11
53	15
53	12
53	14
54	14
55	11
55	14
55	13
56	12
56	13
57	14
58	15
59	12
60	13
61	13
61	14
61	12
61	11
62	11
63	12
63	13
65	15
66	15
68	11
68	14
69	15
69	12
70	13
70	12
71	15
71	12
72	15
72	13
73	11
73	12
74	15
74	13
74	14
75	14
75	13
76	12
77	14
78	14
79	14
80	12
81	14
81	15
82	11
83	12
83	11
84	13
84	15
85	12
85	15
86	14
86	12
86	13
87	14
87	15
88	14
88	13
88	11
90	13
90	11
92	13
92	11
92	15
93	11
93	13
93	12
94	12
94	11
94	14
94	13
95	15
\.


--
-- Data for Name: house_room; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_room (id, room_type_id, house_id, price, cant) FROM stdin;
1	15	2	17	\N
2	14	2	13	\N
3	12	2	7	\N
4	15	3	22	\N
5	13	4	29	\N
6	11	4	18	\N
7	11	4	22	\N
8	11	6	27	\N
9	13	6	27	\N
10	13	7	15	\N
11	14	8	24	\N
12	14	10	25	\N
13	11	10	27	\N
14	13	12	20	\N
15	11	12	29	\N
16	12	13	9	\N
17	15	13	17	\N
18	12	14	14	\N
19	11	15	26	\N
20	12	15	15	\N
21	13	16	21	\N
22	14	16	7	\N
23	14	17	16	\N
24	14	17	21	\N
25	15	18	13	\N
26	13	18	13	\N
27	15	19	13	\N
28	15	19	22	\N
29	14	19	27	\N
30	15	21	7	\N
31	14	21	19	\N
32	11	21	6	\N
33	13	22	14	\N
34	15	22	12	\N
35	12	23	30	\N
36	11	23	8	\N
37	12	25	14	\N
38	15	26	11	\N
39	12	26	14	\N
40	11	26	7	\N
41	14	26	30	\N
42	12	27	14	\N
43	13	27	6	\N
44	14	28	19	\N
45	11	28	21	\N
46	15	28	24	\N
47	13	29	20	\N
48	13	29	8	\N
49	11	30	24	\N
50	15	30	5	\N
51	12	31	17	\N
52	15	31	25	\N
53	13	32	27	\N
54	13	32	28	\N
55	11	32	20	\N
56	13	33	8	\N
57	14	36	10	\N
58	12	36	22	\N
59	12	36	20	\N
60	15	36	6	\N
61	11	38	9	\N
62	15	38	29	\N
63	12	38	26	\N
64	13	39	29	\N
65	13	39	21	\N
66	14	39	13	\N
67	13	40	18	\N
68	13	40	15	\N
69	14	41	27	\N
70	15	44	11	\N
71	14	44	28	\N
72	11	46	28	\N
73	11	46	13	\N
74	13	46	9	\N
75	14	47	26	\N
76	12	48	22	\N
77	14	48	14	\N
78	14	49	30	\N
79	11	49	8	\N
80	15	49	12	\N
81	13	50	6	\N
82	12	50	30	\N
83	12	50	7	\N
84	12	50	22	\N
85	11	51	14	\N
86	14	51	7	\N
87	13	53	14	\N
88	13	53	16	\N
89	12	54	30	\N
90	11	54	15	\N
91	14	54	6	\N
92	11	54	25	\N
93	13	54	13	\N
94	13	55	25	\N
95	13	55	11	\N
96	14	56	14	\N
97	12	56	16	\N
98	11	57	5	\N
99	12	58	9	\N
100	13	58	29	\N
101	14	58	23	\N
102	15	59	16	\N
103	15	59	27	\N
104	12	60	16	\N
105	15	63	19	\N
106	13	63	11	\N
107	13	63	6	\N
108	13	64	17	\N
109	14	64	27	\N
110	12	65	25	\N
111	11	66	13	\N
112	14	66	18	\N
113	12	67	17	\N
114	14	67	23	\N
115	12	68	5	\N
116	13	68	27	\N
117	13	69	24	\N
118	14	70	8	\N
119	11	70	22	\N
120	12	70	29	\N
121	12	70	7	\N
122	11	71	22	\N
123	14	71	23	\N
124	12	72	13	\N
125	12	72	12	\N
126	14	73	12	\N
127	11	73	10	\N
128	15	73	11	\N
129	13	74	29	\N
130	12	74	18	\N
131	13	74	8	\N
132	14	74	16	\N
133	13	75	23	\N
134	15	75	6	\N
135	13	75	28	\N
136	14	76	7	\N
137	12	77	27	\N
138	15	77	5	\N
139	14	78	30	\N
140	15	78	25	\N
141	11	82	29	\N
142	14	82	15	\N
143	13	82	20	\N
144	15	84	20	\N
145	15	85	20	\N
146	14	85	8	\N
147	12	85	10	\N
148	14	85	7	\N
149	11	85	21	\N
150	14	86	19	\N
151	13	86	26	\N
152	11	86	22	\N
153	11	86	23	\N
154	11	88	25	\N
155	14	89	9	\N
156	14	89	20	\N
157	11	89	23	\N
158	13	90	20	\N
159	14	91	11	\N
160	14	91	17	\N
161	13	91	7	\N
162	15	91	13	\N
163	12	92	10	\N
164	13	92	28	\N
165	13	93	10	\N
166	12	94	19	\N
167	14	94	22	\N
168	15	95	22	\N
169	12	95	6	\N
170	12	95	25	\N
\.


--
-- Data for Name: house_room_type; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_room_type (id, name) FROM stdin;
11	Single
12	Twing
13	Double
14	Triple
15	Family
\.


--
-- Data for Name: house_season; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_season (id, house_id, start_date, end_date) FROM stdin;
1	2	2022-10-20 12:04:41	2023-01-20 12:04:41
2	2	2022-11-20 12:04:41	2023-02-20 12:04:41
3	2	2022-12-20 12:04:41	2023-03-20 12:04:41
4	3	2022-10-20 12:04:41	2023-01-20 12:04:41
5	4	2022-10-20 12:04:41	2023-01-20 12:04:41
6	4	2022-11-20 12:04:41	2023-02-20 12:04:41
7	4	2022-12-20 12:04:41	2023-03-20 12:04:41
8	6	2022-10-20 12:04:41	2023-01-20 12:04:41
9	6	2022-11-20 12:04:41	2023-02-20 12:04:41
10	7	2022-10-20 12:04:41	2023-01-20 12:04:41
11	8	2022-10-20 12:04:41	2023-01-20 12:04:41
12	10	2022-10-20 12:04:41	2023-01-20 12:04:41
13	10	2022-11-20 12:04:41	2023-02-20 12:04:41
14	12	2022-10-20 12:04:41	2023-01-20 12:04:41
15	12	2022-11-20 12:04:41	2023-02-20 12:04:41
16	13	2022-10-20 12:04:41	2023-01-20 12:04:41
17	13	2022-11-20 12:04:41	2023-02-20 12:04:41
18	14	2022-10-20 12:04:41	2023-01-20 12:04:41
19	15	2022-10-20 12:04:41	2023-01-20 12:04:41
20	15	2022-11-20 12:04:41	2023-02-20 12:04:41
21	16	2022-10-20 12:04:41	2023-01-20 12:04:41
22	16	2022-11-20 12:04:41	2023-02-20 12:04:41
23	17	2022-10-20 12:04:41	2023-01-20 12:04:41
24	17	2022-11-20 12:04:41	2023-02-20 12:04:41
25	18	2022-10-20 12:04:41	2023-01-20 12:04:41
26	18	2022-11-20 12:04:41	2023-02-20 12:04:41
27	19	2022-10-20 12:04:41	2023-01-20 12:04:41
28	19	2022-11-20 12:04:41	2023-02-20 12:04:41
29	19	2022-12-20 12:04:41	2023-03-20 12:04:41
30	21	2022-10-20 12:04:41	2023-01-20 12:04:41
31	21	2022-11-20 12:04:41	2023-02-20 12:04:41
32	21	2022-12-20 12:04:41	2023-03-20 12:04:41
33	22	2022-10-20 12:04:41	2023-01-20 12:04:41
34	22	2022-11-20 12:04:41	2023-02-20 12:04:41
35	23	2022-10-20 12:04:41	2023-01-20 12:04:41
36	23	2022-11-20 12:04:41	2023-02-20 12:04:41
37	25	2022-10-20 12:04:41	2023-01-20 12:04:41
38	26	2022-10-20 12:04:41	2023-01-20 12:04:41
39	26	2022-11-20 12:04:41	2023-02-20 12:04:41
40	26	2022-12-20 12:04:41	2023-03-20 12:04:41
41	26	2023-01-20 12:04:41	2023-04-20 12:04:41
42	27	2022-10-20 12:04:41	2023-01-20 12:04:41
43	27	2022-11-20 12:04:41	2023-02-20 12:04:41
44	28	2022-10-20 12:04:41	2023-01-20 12:04:41
45	28	2022-11-20 12:04:41	2023-02-20 12:04:41
46	28	2022-12-20 12:04:41	2023-03-20 12:04:41
47	29	2022-10-20 12:04:41	2023-01-20 12:04:41
48	29	2022-11-20 12:04:41	2023-02-20 12:04:41
49	30	2022-10-20 12:04:41	2023-01-20 12:04:41
50	30	2022-11-20 12:04:41	2023-02-20 12:04:41
51	31	2022-10-20 12:04:41	2023-01-20 12:04:41
52	31	2022-11-20 12:04:41	2023-02-20 12:04:41
53	32	2022-10-20 12:04:41	2023-01-20 12:04:41
54	32	2022-11-20 12:04:41	2023-02-20 12:04:41
55	32	2022-12-20 12:04:41	2023-03-20 12:04:41
56	33	2022-10-20 12:04:41	2023-01-20 12:04:41
57	36	2022-10-20 12:04:41	2023-01-20 12:04:41
58	36	2022-11-20 12:04:41	2023-02-20 12:04:41
59	36	2022-12-20 12:04:41	2023-03-20 12:04:41
60	36	2023-01-20 12:04:41	2023-04-20 12:04:41
61	38	2022-10-20 12:04:41	2023-01-20 12:04:41
62	38	2022-11-20 12:04:41	2023-02-20 12:04:41
63	38	2022-12-20 12:04:41	2023-03-20 12:04:41
64	39	2022-10-20 12:04:41	2023-01-20 12:04:41
65	39	2022-11-20 12:04:41	2023-02-20 12:04:41
66	39	2022-12-20 12:04:41	2023-03-20 12:04:41
67	40	2022-10-20 12:04:41	2023-01-20 12:04:41
68	40	2022-11-20 12:04:41	2023-02-20 12:04:41
69	41	2022-10-20 12:04:41	2023-01-20 12:04:41
70	44	2022-10-20 12:04:41	2023-01-20 12:04:41
71	44	2022-11-20 12:04:41	2023-02-20 12:04:41
72	46	2022-10-20 12:04:41	2023-01-20 12:04:41
73	46	2022-11-20 12:04:41	2023-02-20 12:04:41
74	46	2022-12-20 12:04:41	2023-03-20 12:04:41
75	47	2022-10-20 12:04:41	2023-01-20 12:04:41
76	48	2022-10-20 12:04:41	2023-01-20 12:04:41
77	48	2022-11-20 12:04:41	2023-02-20 12:04:41
78	49	2022-10-20 12:04:41	2023-01-20 12:04:41
79	49	2022-11-20 12:04:41	2023-02-20 12:04:41
80	49	2022-12-20 12:04:41	2023-03-20 12:04:41
81	50	2022-10-20 12:04:41	2023-01-20 12:04:41
82	50	2022-11-20 12:04:41	2023-02-20 12:04:41
83	50	2022-12-20 12:04:41	2023-03-20 12:04:41
84	50	2023-01-20 12:04:41	2023-04-20 12:04:41
85	51	2022-10-20 12:04:41	2023-01-20 12:04:41
86	51	2022-11-20 12:04:41	2023-02-20 12:04:41
87	53	2022-10-20 12:04:41	2023-01-20 12:04:41
88	53	2022-11-20 12:04:41	2023-02-20 12:04:41
89	54	2022-10-20 12:04:41	2023-01-20 12:04:41
90	54	2022-11-20 12:04:41	2023-02-20 12:04:41
91	54	2022-12-20 12:04:41	2023-03-20 12:04:41
92	54	2023-01-20 12:04:41	2023-04-20 12:04:41
93	54	2023-02-20 12:04:41	2023-05-20 12:04:41
94	55	2022-10-20 12:04:41	2023-01-20 12:04:41
95	55	2022-11-20 12:04:41	2023-02-20 12:04:41
96	56	2022-10-20 12:04:41	2023-01-20 12:04:41
97	56	2022-11-20 12:04:41	2023-02-20 12:04:41
98	57	2022-10-20 12:04:41	2023-01-20 12:04:41
99	58	2022-10-20 12:04:41	2023-01-20 12:04:41
100	58	2022-11-20 12:04:41	2023-02-20 12:04:41
101	58	2022-12-20 12:04:41	2023-03-20 12:04:41
102	59	2022-10-20 12:04:41	2023-01-20 12:04:41
103	59	2022-11-20 12:04:41	2023-02-20 12:04:41
104	60	2022-10-20 12:04:41	2023-01-20 12:04:41
105	63	2022-10-20 12:04:41	2023-01-20 12:04:41
106	63	2022-11-20 12:04:41	2023-02-20 12:04:41
107	63	2022-12-20 12:04:41	2023-03-20 12:04:41
108	64	2022-10-20 12:04:41	2023-01-20 12:04:41
109	64	2022-11-20 12:04:41	2023-02-20 12:04:41
110	65	2022-10-20 12:04:41	2023-01-20 12:04:41
111	66	2022-10-20 12:04:41	2023-01-20 12:04:41
112	66	2022-11-20 12:04:41	2023-02-20 12:04:41
113	67	2022-10-20 12:04:41	2023-01-20 12:04:41
114	67	2022-11-20 12:04:41	2023-02-20 12:04:41
115	68	2022-10-20 12:04:41	2023-01-20 12:04:41
116	68	2022-11-20 12:04:41	2023-02-20 12:04:41
117	69	2022-10-20 12:04:41	2023-01-20 12:04:41
118	70	2022-10-20 12:04:41	2023-01-20 12:04:41
119	70	2022-11-20 12:04:41	2023-02-20 12:04:41
120	70	2022-12-20 12:04:41	2023-03-20 12:04:41
121	70	2023-01-20 12:04:41	2023-04-20 12:04:41
122	71	2022-10-20 12:04:41	2023-01-20 12:04:41
123	71	2022-11-20 12:04:41	2023-02-20 12:04:41
124	72	2022-10-20 12:04:41	2023-01-20 12:04:41
125	72	2022-11-20 12:04:41	2023-02-20 12:04:41
126	73	2022-10-20 12:04:41	2023-01-20 12:04:41
127	73	2022-11-20 12:04:41	2023-02-20 12:04:41
128	73	2022-12-20 12:04:41	2023-03-20 12:04:41
129	74	2022-10-20 12:04:41	2023-01-20 12:04:41
130	74	2022-11-20 12:04:41	2023-02-20 12:04:41
131	74	2022-12-20 12:04:41	2023-03-20 12:04:41
132	74	2023-01-20 12:04:41	2023-04-20 12:04:41
133	75	2022-10-20 12:04:41	2023-01-20 12:04:41
134	75	2022-11-20 12:04:41	2023-02-20 12:04:41
135	75	2022-12-20 12:04:41	2023-03-20 12:04:41
136	76	2022-10-20 12:04:41	2023-01-20 12:04:41
137	77	2022-10-20 12:04:41	2023-01-20 12:04:41
138	77	2022-11-20 12:04:41	2023-02-20 12:04:41
139	78	2022-10-20 12:04:41	2023-01-20 12:04:41
140	78	2022-11-20 12:04:41	2023-02-20 12:04:41
141	82	2022-10-20 12:04:41	2023-01-20 12:04:41
142	82	2022-11-20 12:04:41	2023-02-20 12:04:41
143	82	2022-12-20 12:04:41	2023-03-20 12:04:41
144	84	2022-10-20 12:04:41	2023-01-20 12:04:41
145	85	2022-10-20 12:04:41	2023-01-20 12:04:41
146	85	2022-11-20 12:04:41	2023-02-20 12:04:41
147	85	2022-12-20 12:04:41	2023-03-20 12:04:41
148	85	2023-01-20 12:04:41	2023-04-20 12:04:41
149	85	2023-02-20 12:04:41	2023-05-20 12:04:41
150	86	2022-10-20 12:04:41	2023-01-20 12:04:41
151	86	2022-11-20 12:04:41	2023-02-20 12:04:41
152	86	2022-12-20 12:04:41	2023-03-20 12:04:41
153	86	2023-01-20 12:04:41	2023-04-20 12:04:41
154	88	2022-10-20 12:04:41	2023-01-20 12:04:41
155	89	2022-10-20 12:04:41	2023-01-20 12:04:41
156	89	2022-11-20 12:04:41	2023-02-20 12:04:41
157	89	2022-12-20 12:04:41	2023-03-20 12:04:41
158	90	2022-10-20 12:04:41	2023-01-20 12:04:41
159	91	2022-10-20 12:04:41	2023-01-20 12:04:41
160	91	2022-11-20 12:04:41	2023-02-20 12:04:41
161	91	2022-12-20 12:04:41	2023-03-20 12:04:41
162	91	2023-01-20 12:04:41	2023-04-20 12:04:41
163	92	2022-10-20 12:04:41	2023-01-20 12:04:41
164	92	2022-11-20 12:04:41	2023-02-20 12:04:41
165	93	2022-10-20 12:04:41	2023-01-20 12:04:41
166	94	2022-10-20 12:04:41	2023-01-20 12:04:41
167	94	2022-11-20 12:04:41	2023-02-20 12:04:41
168	95	2022-10-20 12:04:41	2023-01-20 12:04:41
169	95	2022-11-20 12:04:41	2023-02-20 12:04:41
170	95	2022-12-20 12:04:41	2023-03-20 12:04:41
\.


--
-- Data for Name: house_season_room; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_season_room (id, room_id, house_season_id, price) FROM stdin;
1	1	1	15
2	2	2	13
3	3	3	23
4	4	4	7
5	5	5	12
6	6	6	25
7	7	7	7
8	8	8	15
9	9	9	19
10	10	10	29
11	11	11	30
12	12	12	5
13	13	13	12
14	14	14	22
15	15	15	28
16	16	16	22
17	17	17	28
18	18	18	30
19	19	19	24
20	20	20	14
21	21	21	30
22	22	22	5
23	23	23	24
24	24	24	24
25	25	25	8
26	26	26	19
27	27	27	12
28	28	28	19
29	29	29	26
30	30	30	21
31	31	31	30
32	32	32	12
33	33	33	24
34	34	34	14
35	35	35	25
36	36	36	15
37	37	37	9
38	38	38	30
39	39	39	15
40	40	40	20
41	41	41	23
42	42	42	24
43	43	43	21
44	44	44	24
45	45	45	22
46	46	46	29
47	47	47	15
48	48	48	7
49	49	49	15
50	50	50	27
51	51	51	6
52	52	52	5
53	53	53	20
54	54	54	28
55	55	55	19
56	56	56	19
57	57	57	23
58	58	58	19
59	59	59	21
60	60	60	26
61	61	61	9
62	62	62	15
63	63	63	15
64	64	64	9
65	65	65	9
66	66	66	23
67	67	67	7
68	68	68	19
69	69	69	15
70	70	70	23
71	71	71	22
72	72	72	20
73	73	73	24
74	74	74	13
75	75	75	24
76	76	76	29
77	77	77	15
78	78	78	19
79	79	79	6
80	80	80	27
81	81	81	21
82	82	82	15
83	83	83	24
84	84	84	28
85	85	85	6
86	86	86	20
87	87	87	27
88	88	88	11
89	89	89	29
90	90	90	16
91	91	91	7
92	92	92	23
93	93	93	22
94	94	94	27
95	95	95	11
96	96	96	16
97	97	97	14
98	98	98	18
99	99	99	25
100	100	100	20
101	101	101	27
102	102	102	26
103	103	103	28
104	104	104	30
105	105	105	17
106	106	106	26
107	107	107	28
108	108	108	13
109	109	109	28
110	110	110	17
111	111	111	6
112	112	112	22
113	113	113	25
114	114	114	12
115	115	115	21
116	116	116	30
117	117	117	12
118	118	118	7
119	119	119	13
120	120	120	27
121	121	121	18
122	122	122	18
123	123	123	20
124	124	124	6
125	125	125	12
126	126	126	21
127	127	127	29
128	128	128	5
129	129	129	20
130	130	130	15
131	131	131	9
132	132	132	12
133	133	133	25
134	134	134	19
135	135	135	17
136	136	136	8
137	137	137	28
138	138	138	28
139	139	139	18
140	140	140	21
141	141	141	30
142	142	142	16
143	143	143	25
144	144	144	10
145	145	145	28
146	146	146	11
147	147	147	7
148	148	148	14
149	149	149	13
150	150	150	30
151	151	151	26
152	152	152	26
153	153	153	27
154	154	154	9
155	155	155	23
156	156	156	8
157	157	157	23
158	158	158	6
159	159	159	11
160	160	160	14
161	161	161	16
162	162	162	19
163	163	163	25
164	164	164	20
165	165	165	6
166	166	166	6
167	167	167	28
168	168	168	7
169	169	169	14
170	170	170	15
\.


--
-- Data for Name: house_type; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.house_type (id, name) FROM stdin;
9	Standar
10	Updraded
11	Premiun
12	Hotel
\.


--
-- Data for Name: itinerary; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary (id, destination_id, house_id, tour_id, days) FROM stdin;
1	42	16	1	3
2	42	16	1	6
3	57	94	2	5
4	39	3	2	4
5	44	28	3	7
6	50	59	3	1
7	54	77	5	5
8	53	71	5	2
9	49	54	6	10
10	40	8	8	8
11	47	41	8	7
12	55	83	13	2
13	45	31	13	3
14	47	41	13	1
15	54	79	14	12
16	56	88	14	2
17	40	8	14	2
18	51	63	15	13
19	43	24	15	8
20	45	31	17	7
21	56	89	17	2
22	45	32	18	9
23	52	67	18	2
24	47	45	19	16
25	43	21	19	5
26	39	2	21	6
27	52	70	23	11
28	51	64	23	1
29	49	55	23	6
30	39	2	23	4
31	49	54	24	1
32	41	14	24	5
33	55	84	26	4
34	53	75	26	2
35	50	60	26	3
36	41	12	29	8
37	43	21	34	2
38	53	71	34	5
39	39	3	37	9
40	56	89	37	8
41	46	39	37	5
42	39	2	38	2
43	43	25	38	6
44	54	76	38	4
45	43	22	39	5
46	50	59	39	6
47	49	51	41	3
48	48	47	41	1
49	41	12	41	4
50	46	39	41	4
51	54	78	44	15
52	52	68	44	2
53	55	82	44	1
54	51	65	44	5
55	54	77	46	4
56	53	71	46	1
57	43	25	46	3
58	44	27	46	5
59	39	4	49	5
60	43	24	49	1
61	46	40	50	5
62	55	85	50	1
63	41	14	50	4
64	46	40	51	7
65	54	78	51	1
66	55	82	52	4
67	41	12	52	5
68	54	78	55	1
69	42	18	55	10
\.


--
-- Data for Name: itinerary_day; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary_day (id, itinerary_id, no_guide, day, date) FROM stdin;
1	1	t	1	2022-08-14 12:04:43
2	1	t	2	2022-08-15 12:04:43
3	1	f	3	2022-08-16 12:04:43
4	2	f	4	2022-08-17 12:04:43
5	2	t	5	2022-08-18 12:04:43
6	2	f	6	2022-08-19 12:04:43
7	2	t	7	2022-08-20 12:04:43
8	2	t	8	2022-08-21 12:04:43
9	2	f	9	2022-08-22 12:04:43
10	3	f	1	2022-08-02 12:04:43
11	3	f	2	2022-08-03 12:04:43
12	3	f	3	2022-08-04 12:04:43
13	3	t	4	2022-08-05 12:04:43
14	3	t	5	2022-08-06 12:04:43
15	4	t	6	2022-08-07 12:04:43
16	4	t	7	2022-08-08 12:04:43
17	4	t	8	2022-08-09 12:04:43
18	4	t	9	2022-08-10 12:04:43
19	5	t	1	2022-07-23 12:04:43
20	5	f	2	2022-07-24 12:04:43
21	5	f	3	2022-07-25 12:04:43
22	5	t	4	2022-07-26 12:04:43
23	5	t	5	2022-07-27 12:04:43
24	5	f	6	2022-07-28 12:04:43
25	5	t	7	2022-07-29 12:04:43
26	6	t	8	2022-07-30 12:04:43
27	7	f	1	2022-08-15 12:04:44
28	7	t	2	2022-08-16 12:04:44
29	7	t	3	2022-08-17 12:04:44
30	7	f	4	2022-08-18 12:04:44
31	7	f	5	2022-08-19 12:04:44
32	8	t	6	2022-08-20 12:04:44
33	8	f	7	2022-08-21 12:04:44
34	9	t	1	2022-08-13 12:04:44
35	9	f	2	2022-08-14 12:04:44
36	9	t	3	2022-08-15 12:04:44
37	9	f	4	2022-08-16 12:04:44
38	9	f	5	2022-08-17 12:04:44
39	9	t	6	2022-08-18 12:04:44
40	9	f	7	2022-08-19 12:04:44
41	9	t	8	2022-08-20 12:04:44
42	9	t	9	2022-08-21 12:04:44
43	9	f	10	2022-08-22 12:04:44
44	10	t	1	2022-08-13 12:04:44
45	10	t	2	2022-08-14 12:04:44
46	10	t	3	2022-08-15 12:04:44
47	10	f	4	2022-08-16 12:04:44
48	10	f	5	2022-08-17 12:04:44
49	10	t	6	2022-08-18 12:04:44
50	10	f	7	2022-08-19 12:04:44
51	10	f	8	2022-08-20 12:04:44
52	11	t	9	2022-08-21 12:04:44
53	11	t	10	2022-08-22 12:04:44
54	11	f	11	2022-08-23 12:04:44
55	11	f	12	2022-08-24 12:04:44
56	11	t	13	2022-08-25 12:04:44
57	11	f	14	2022-08-26 12:04:44
58	11	f	15	2022-08-27 12:04:44
59	12	f	1	2022-08-10 12:04:44
60	12	t	2	2022-08-11 12:04:44
61	13	f	3	2022-08-12 12:04:44
62	13	f	4	2022-08-13 12:04:44
63	13	t	5	2022-08-14 12:04:44
64	14	t	6	2022-08-15 12:04:44
65	15	f	1	2022-08-04 12:04:44
66	15	f	2	2022-08-05 12:04:44
67	15	f	3	2022-08-06 12:04:44
68	15	t	4	2022-08-07 12:04:44
69	15	f	5	2022-08-08 12:04:44
70	15	t	6	2022-08-09 12:04:44
71	15	t	7	2022-08-10 12:04:44
72	15	f	8	2022-08-11 12:04:44
73	15	t	9	2022-08-12 12:04:44
74	15	t	10	2022-08-13 12:04:44
75	15	f	11	2022-08-14 12:04:44
76	15	f	12	2022-08-15 12:04:44
77	16	t	13	2022-08-16 12:04:44
78	16	f	14	2022-08-17 12:04:44
79	17	t	15	2022-08-18 12:04:44
80	17	t	16	2022-08-19 12:04:44
81	18	t	1	2022-08-07 12:04:44
82	18	t	2	2022-08-08 12:04:44
83	18	f	3	2022-08-09 12:04:44
84	18	t	4	2022-08-10 12:04:44
85	18	f	5	2022-08-11 12:04:44
86	18	t	6	2022-08-12 12:04:44
87	18	t	7	2022-08-13 12:04:44
88	18	t	8	2022-08-14 12:04:44
89	18	t	9	2022-08-15 12:04:44
90	18	f	10	2022-08-16 12:04:44
91	18	f	11	2022-08-17 12:04:44
92	18	t	12	2022-08-18 12:04:44
93	18	t	13	2022-08-19 12:04:44
94	19	f	14	2022-08-20 12:04:44
95	19	t	15	2022-08-21 12:04:44
96	19	f	16	2022-08-22 12:04:44
97	19	f	17	2022-08-23 12:04:44
98	19	f	18	2022-08-24 12:04:44
99	19	f	19	2022-08-25 12:04:44
100	19	t	20	2022-08-26 12:04:44
101	19	f	21	2022-08-27 12:04:44
102	20	t	1	2022-08-02 12:04:45
103	20	t	2	2022-08-03 12:04:45
104	20	t	3	2022-08-04 12:04:45
105	20	f	4	2022-08-05 12:04:45
106	20	t	5	2022-08-06 12:04:45
107	20	f	6	2022-08-07 12:04:45
108	20	f	7	2022-08-08 12:04:45
109	21	f	8	2022-08-09 12:04:45
110	21	t	9	2022-08-10 12:04:45
111	22	t	1	2022-08-13 12:04:45
112	22	t	2	2022-08-14 12:04:45
113	22	f	3	2022-08-15 12:04:45
114	22	f	4	2022-08-16 12:04:45
115	22	f	5	2022-08-17 12:04:45
116	22	f	6	2022-08-18 12:04:45
117	22	t	7	2022-08-19 12:04:45
118	22	f	8	2022-08-20 12:04:45
119	22	f	9	2022-08-21 12:04:45
120	23	f	10	2022-08-22 12:04:45
121	23	f	11	2022-08-23 12:04:45
122	24	t	1	2022-07-30 12:04:45
123	24	t	2	2022-07-31 12:04:45
124	24	t	3	2022-08-01 12:04:45
125	24	t	4	2022-08-02 12:04:45
126	24	f	5	2022-08-03 12:04:45
127	24	t	6	2022-08-04 12:04:45
128	24	t	7	2022-08-05 12:04:45
129	24	f	8	2022-08-06 12:04:45
130	24	f	9	2022-08-07 12:04:45
131	24	t	10	2022-08-08 12:04:45
132	24	f	11	2022-08-09 12:04:45
133	24	f	12	2022-08-10 12:04:45
134	24	f	13	2022-08-11 12:04:45
135	24	f	14	2022-08-12 12:04:45
136	24	f	15	2022-08-13 12:04:45
137	24	t	16	2022-08-14 12:04:45
138	25	f	17	2022-08-15 12:04:45
139	25	t	18	2022-08-16 12:04:45
140	25	f	19	2022-08-17 12:04:45
141	25	t	20	2022-08-18 12:04:45
142	25	f	21	2022-08-19 12:04:45
143	26	t	1	2022-07-30 12:04:45
144	26	f	2	2022-07-31 12:04:45
145	26	f	3	2022-08-01 12:04:45
146	26	t	4	2022-08-02 12:04:45
147	26	t	5	2022-08-03 12:04:45
148	26	f	6	2022-08-04 12:04:45
149	27	f	1	2022-08-03 12:04:45
150	27	f	2	2022-08-04 12:04:45
151	27	t	3	2022-08-05 12:04:45
152	27	f	4	2022-08-06 12:04:45
153	27	f	5	2022-08-07 12:04:45
154	27	t	6	2022-08-08 12:04:45
155	27	f	7	2022-08-09 12:04:45
156	27	f	8	2022-08-10 12:04:45
157	27	f	9	2022-08-11 12:04:45
158	27	f	10	2022-08-12 12:04:45
159	27	t	11	2022-08-13 12:04:45
160	28	f	12	2022-08-14 12:04:45
161	29	t	13	2022-08-15 12:04:45
162	29	t	14	2022-08-16 12:04:45
163	29	f	15	2022-08-17 12:04:45
164	29	f	16	2022-08-18 12:04:45
165	29	t	17	2022-08-19 12:04:45
166	29	f	18	2022-08-20 12:04:45
167	30	t	19	2022-08-21 12:04:45
168	30	t	20	2022-08-22 12:04:45
169	30	f	21	2022-08-23 12:04:45
170	30	t	22	2022-08-24 12:04:45
171	31	t	1	2022-08-03 12:04:45
172	32	f	2	2022-08-04 12:04:45
173	32	t	3	2022-08-05 12:04:45
174	32	f	4	2022-08-06 12:04:45
175	32	t	5	2022-08-07 12:04:45
176	32	t	6	2022-08-08 12:04:45
177	33	t	1	2022-08-11 12:04:45
178	33	f	2	2022-08-12 12:04:45
179	33	t	3	2022-08-13 12:04:45
180	33	t	4	2022-08-14 12:04:45
181	34	f	5	2022-08-15 12:04:45
182	34	f	6	2022-08-16 12:04:45
183	35	f	7	2022-08-17 12:04:45
184	35	t	8	2022-08-18 12:04:45
185	35	t	9	2022-08-19 12:04:45
186	36	f	1	2022-08-09 12:04:46
187	36	t	2	2022-08-10 12:04:46
188	36	f	3	2022-08-11 12:04:46
189	36	f	4	2022-08-12 12:04:46
190	36	f	5	2022-08-13 12:04:46
191	36	f	6	2022-08-14 12:04:46
192	36	t	7	2022-08-15 12:04:46
193	36	t	8	2022-08-16 12:04:46
194	37	f	1	2022-07-22 12:04:46
195	37	t	2	2022-07-23 12:04:46
196	38	f	3	2022-07-24 12:04:46
197	38	t	4	2022-07-25 12:04:46
198	38	t	5	2022-07-26 12:04:46
199	38	f	6	2022-07-27 12:04:46
200	38	f	7	2022-07-28 12:04:46
201	39	t	1	2022-08-02 12:04:47
202	39	f	2	2022-08-03 12:04:47
203	39	t	3	2022-08-04 12:04:47
204	39	t	4	2022-08-05 12:04:47
205	39	f	5	2022-08-06 12:04:47
206	39	t	6	2022-08-07 12:04:47
207	39	f	7	2022-08-08 12:04:47
208	39	t	8	2022-08-09 12:04:47
209	39	t	9	2022-08-10 12:04:47
210	40	t	10	2022-08-11 12:04:47
211	40	t	11	2022-08-12 12:04:47
212	40	t	12	2022-08-13 12:04:47
213	40	t	13	2022-08-14 12:04:47
214	40	t	14	2022-08-15 12:04:47
215	40	f	15	2022-08-16 12:04:47
216	40	t	16	2022-08-17 12:04:47
217	40	f	17	2022-08-18 12:04:47
218	41	f	18	2022-08-19 12:04:47
219	41	f	19	2022-08-20 12:04:47
220	41	t	20	2022-08-21 12:04:47
221	41	t	21	2022-08-22 12:04:47
222	41	t	22	2022-08-23 12:04:47
223	42	f	1	2022-07-24 12:04:47
224	42	f	2	2022-07-25 12:04:47
225	43	t	3	2022-07-26 12:04:47
226	43	t	4	2022-07-27 12:04:47
227	43	t	5	2022-07-28 12:04:47
228	43	t	6	2022-07-29 12:04:47
229	43	t	7	2022-07-30 12:04:47
230	43	f	8	2022-07-31 12:04:47
231	44	f	9	2022-08-01 12:04:47
232	44	f	10	2022-08-02 12:04:47
233	44	f	11	2022-08-03 12:04:47
234	44	t	12	2022-08-04 12:04:47
235	45	f	1	2022-08-15 12:04:47
236	45	t	2	2022-08-16 12:04:47
237	45	t	3	2022-08-17 12:04:47
238	45	f	4	2022-08-18 12:04:47
239	45	f	5	2022-08-19 12:04:47
240	46	t	6	2022-08-20 12:04:47
241	46	f	7	2022-08-21 12:04:47
242	46	f	8	2022-08-22 12:04:47
243	46	f	9	2022-08-23 12:04:47
244	46	t	10	2022-08-24 12:04:47
245	46	t	11	2022-08-25 12:04:47
246	47	t	1	2022-07-27 12:04:47
247	47	t	2	2022-07-28 12:04:47
248	47	f	3	2022-07-29 12:04:47
249	48	t	4	2022-07-30 12:04:47
250	49	t	5	2022-07-31 12:04:47
251	49	t	6	2022-08-01 12:04:47
252	49	t	7	2022-08-02 12:04:47
253	49	f	8	2022-08-03 12:04:47
254	50	f	9	2022-08-04 12:04:47
255	50	f	10	2022-08-05 12:04:47
256	50	f	11	2022-08-06 12:04:47
257	50	t	12	2022-08-07 12:04:47
258	51	f	1	2022-07-24 12:04:48
259	51	t	2	2022-07-25 12:04:48
260	51	t	3	2022-07-26 12:04:48
261	51	t	4	2022-07-27 12:04:48
262	51	f	5	2022-07-28 12:04:48
263	51	f	6	2022-07-29 12:04:48
264	51	f	7	2022-07-30 12:04:48
265	51	f	8	2022-07-31 12:04:48
266	51	f	9	2022-08-01 12:04:48
267	51	t	10	2022-08-02 12:04:48
268	51	f	11	2022-08-03 12:04:48
269	51	t	12	2022-08-04 12:04:48
270	51	t	13	2022-08-05 12:04:48
271	51	f	14	2022-08-06 12:04:48
272	51	f	15	2022-08-07 12:04:48
273	52	t	16	2022-08-08 12:04:48
274	52	t	17	2022-08-09 12:04:48
275	53	t	18	2022-08-10 12:04:48
276	54	f	19	2022-08-11 12:04:48
277	54	t	20	2022-08-12 12:04:48
278	54	f	21	2022-08-13 12:04:48
279	54	f	22	2022-08-14 12:04:48
280	54	t	23	2022-08-15 12:04:48
281	55	t	1	2022-08-03 12:04:48
282	55	t	2	2022-08-04 12:04:48
283	55	f	3	2022-08-05 12:04:48
284	55	f	4	2022-08-06 12:04:48
285	56	t	5	2022-08-07 12:04:48
286	57	f	6	2022-08-08 12:04:48
287	57	t	7	2022-08-09 12:04:48
288	57	t	8	2022-08-10 12:04:48
289	58	f	9	2022-08-11 12:04:48
290	58	t	10	2022-08-12 12:04:48
291	58	f	11	2022-08-13 12:04:48
292	58	f	12	2022-08-14 12:04:48
293	58	t	13	2022-08-15 12:04:48
294	59	f	1	2022-07-21 12:04:48
295	59	f	2	2022-07-22 12:04:48
296	59	t	3	2022-07-23 12:04:48
297	59	f	4	2022-07-24 12:04:48
298	59	t	5	2022-07-25 12:04:48
299	60	t	6	2022-07-26 12:04:48
300	61	t	1	2022-08-19 12:04:49
301	61	t	2	2022-08-20 12:04:49
302	61	f	3	2022-08-21 12:04:49
303	61	t	4	2022-08-22 12:04:49
304	61	t	5	2022-08-23 12:04:49
305	62	t	6	2022-08-24 12:04:49
306	63	t	7	2022-08-25 12:04:49
307	63	t	8	2022-08-26 12:04:49
308	63	t	9	2022-08-27 12:04:49
309	63	f	10	2022-08-28 12:04:49
310	64	f	1	2022-08-01 12:04:49
311	64	t	2	2022-08-02 12:04:49
312	64	f	3	2022-08-03 12:04:49
313	64	f	4	2022-08-04 12:04:49
314	64	f	5	2022-08-05 12:04:49
315	64	f	6	2022-08-06 12:04:49
316	64	f	7	2022-08-07 12:04:49
317	65	f	8	2022-08-08 12:04:49
318	66	f	1	2022-08-17 12:04:49
319	66	f	2	2022-08-18 12:04:49
320	66	t	3	2022-08-19 12:04:49
321	66	f	4	2022-08-20 12:04:49
322	67	f	5	2022-08-21 12:04:49
323	67	t	6	2022-08-22 12:04:49
324	67	f	7	2022-08-23 12:04:49
325	67	t	8	2022-08-24 12:04:49
326	67	t	9	2022-08-25 12:04:49
327	68	t	1	2022-08-04 12:04:49
328	69	t	2	2022-08-05 12:04:49
329	69	t	3	2022-08-06 12:04:49
330	69	f	4	2022-08-07 12:04:49
331	69	f	5	2022-08-08 12:04:49
332	69	f	6	2022-08-09 12:04:49
333	69	f	7	2022-08-10 12:04:49
334	69	f	8	2022-08-11 12:04:49
335	69	f	9	2022-08-12 12:04:49
336	69	f	10	2022-08-13 12:04:49
337	69	f	11	2022-08-14 12:04:49
\.


--
-- Data for Name: itinerary_day_activity; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary_day_activity (itinerary_day_id, activity_id) FROM stdin;
2	22
3	25
3	21
3	22
5	25
5	22
5	20
6	22
6	20
7	139
7	23
7	21
8	21
9	25
10	128
10	129
12	128
12	127
13	125
13	129
14	128
17	1
18	2
19	41
19	36
19	38
20	37
21	41
23	35
23	41
25	38
27	108
27	105
28	110
28	106
28	104
28	108
29	109
29	111
30	110
30	104
30	109
31	107
32	101
33	97
33	101
33	103
34	73
35	76
35	72
36	76
36	73
36	71
37	71
37	73
37	70
38	70
40	73
41	73
41	76
41	75
42	73
42	71
44	11
44	7
44	8
46	8
46	11
48	6
48	7
50	7
51	9
51	10
51	11
52	55
52	61
52	60
54	57
55	133
56	56
57	61
57	56
57	133
57	55
58	60
59	116
60	112
60	115
61	47
62	47
63	46
63	130
63	45
64	62
65	106
65	109
66	104
67	111
67	107
68	111
68	106
69	106
69	105
69	111
69	109
70	107
70	104
70	110
70	111
71	105
72	105
72	109
72	111
73	105
73	106
74	106
75	106
76	104
76	106
76	111
77	124
77	122
77	120
78	124
78	122
78	121
79	7
79	136
80	7
81	86
82	88
83	89
83	86
83	131
83	88
84	88
84	85
84	131
85	88
85	87
86	86
86	131
86	85
87	84
87	131
87	85
88	131
88	87
89	131
89	89
90	89
90	84
91	88
91	85
91	84
92	85
92	86
93	88
93	131
93	89
94	28
94	27
94	32
95	31
96	28
96	27
97	28
97	33
98	27
98	28
98	32
100	26
100	30
100	31
103	46
103	47
103	42
104	43
105	47
106	46
106	43
107	45
107	42
109	119
110	119
110	120
111	45
111	44
111	42
112	42
112	44
112	46
112	130
113	44
114	44
115	43
115	130
115	46
116	45
116	44
118	47
118	130
119	44
119	45
120	95
120	91
121	93
121	91
122	62
122	56
123	59
123	55
123	60
124	55
124	62
125	61
126	62
126	60
127	55
127	61
127	133
128	57
129	60
130	58
130	62
130	59
131	56
131	62
132	62
132	59
133	61
133	57
133	62
133	58
133	55
134	60
135	58
135	61
135	62
137	57
137	62
138	32
138	26
138	33
139	28
140	31
140	32
141	32
141	30
142	28
142	33
142	31
144	4
144	1
145	1
146	1
147	2
148	5
148	2
149	135
150	135
152	135
152	91
152	93
153	135
154	92
154	90
154	94
155	90
155	94
156	91
156	92
156	135
157	92
158	93
158	94
159	94
159	93
160	84
161	72
161	73
161	76
162	73
162	71
162	74
162	77
165	71
165	72
165	73
165	70
166	76
166	72
166	77
168	1
168	2
170	1
170	2
171	70
172	18
172	17
173	15
173	137
174	19
174	17
174	138
175	13
175	132
175	17
177	116
177	114
178	115
178	116
179	115
179	117
179	116
180	114
181	100
183	78
183	79
185	82
186	18
186	16
186	137
186	12
187	137
187	18
187	132
188	15
188	14
188	138
188	137
188	17
188	13
189	12
189	132
189	13
189	15
189	19
190	12
191	137
191	132
191	13
191	15
192	15
192	132
192	12
192	138
193	16
193	13
193	17
193	18
193	19
194	33
194	30
195	30
196	96
196	103
196	100
197	101
197	97
197	102
198	98
199	99
199	96
199	102
200	102
200	100
200	101
201	3
202	1
205	2
206	5
206	3
206	2
207	5
207	2
209	5
210	121
211	118
212	123
214	121
214	119
214	120
214	124
215	120
215	119
216	118
216	124
216	119
216	121
217	123
217	119
218	48
218	49
219	51
219	49
219	54
220	52
220	49
220	50
221	49
222	53
222	52
223	3
223	1
225	29
226	32
226	30
227	26
227	33
227	30
228	26
228	27
229	31
230	30
230	31
231	107
231	105
231	108
231	106
232	109
235	27
237	29
237	26
238	27
239	26
239	28
239	33
240	78
240	80
241	82
241	81
242	83
242	80
242	81
242	82
243	80
243	79
244	79
245	80
246	73
246	77
247	75
247	76
248	76
248	77
248	71
249	68
249	67
249	65
250	15
251	18
252	16
252	13
252	12
253	18
253	13
253	132
253	17
253	15
254	54
255	50
256	49
256	52
256	53
257	50
257	48
258	110
258	108
258	104
259	111
260	106
260	107
261	110
261	107
261	106
262	109
262	104
262	107
262	106
263	107
263	104
264	106
264	107
266	106
267	105
267	109
268	105
268	107
268	104
268	111
269	108
269	106
269	111
269	104
269	110
270	109
272	110
272	109
272	111
273	90
274	92
274	91
274	90
274	93
275	115
275	113
276	84
277	87
277	85
277	84
280	87
280	85
280	131
280	84
281	111
281	107
281	109
281	104
282	109
282	104
283	109
283	105
284	109
284	106
284	111
286	32
287	26
287	28
287	29
287	31
288	29
290	35
290	34
290	38
290	41
291	134
292	38
292	39
292	34
293	41
293	35
293	34
294	4
295	3
297	4
298	3
299	27
300	48
300	49
301	50
301	48
301	54
302	51
302	52
303	49
303	50
303	54
306	16
306	12
306	138
307	15
307	18
308	14
308	19
309	14
309	19
309	17
310	53
310	48
311	51
311	48
312	50
312	48
313	49
313	48
314	48
314	54
315	50
315	51
316	52
316	53
316	50
318	117
318	114
318	112
319	115
319	112
320	116
321	115
321	114
321	113
322	12
324	15
324	17
324	132
324	138
324	19
325	18
325	14
327	108
328	22
328	25
329	139
330	23
330	25
330	22
331	23
332	139
332	20
332	25
333	21
333	139
333	25
334	23
335	22
335	21
336	21
337	20
337	139
\.


--
-- Data for Name: itinerary_day_template; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary_day_template (id, itinerary_id, no_guide, day) FROM stdin;
1	1	t	1
2	1	t	2
3	1	t	3
4	1	t	4
5	1	t	5
6	1	f	6
7	1	f	7
8	1	t	8
9	1	f	9
10	1	t	10
11	1	f	11
12	1	f	12
13	2	f	13
14	2	t	14
15	2	t	15
16	2	t	16
17	2	f	17
18	3	t	18
19	3	f	19
20	3	f	20
21	3	t	21
22	4	t	1
23	4	t	2
24	4	f	3
25	4	t	4
26	4	f	5
27	4	f	6
28	4	t	7
29	4	f	8
30	4	f	9
31	4	t	10
32	4	f	11
33	4	t	12
34	4	f	13
35	4	f	14
36	4	f	15
37	4	t	16
38	4	t	17
39	4	f	18
40	5	t	19
41	5	f	20
42	5	f	21
43	6	t	1
44	6	t	2
45	6	f	3
46	7	f	4
47	7	f	5
48	8	f	6
49	8	f	7
50	9	f	1
51	9	t	2
52	9	t	3
53	9	t	4
54	9	f	5
55	10	f	6
56	10	f	7
57	10	f	8
58	10	t	9
59	10	t	10
60	10	f	11
61	10	t	12
62	10	t	13
63	10	f	14
64	11	t	15
65	12	t	1
66	12	t	2
67	12	f	3
68	12	f	4
69	12	f	5
70	12	f	6
71	12	t	7
72	12	t	8
73	13	f	9
74	13	f	10
75	14	f	1
76	14	f	2
77	14	t	3
78	14	f	4
79	15	t	5
80	15	f	6
81	15	t	7
82	16	f	1
83	16	f	2
84	16	t	3
85	16	f	4
86	16	t	5
87	16	f	6
88	16	f	7
89	16	t	8
90	16	f	9
91	16	t	10
92	17	t	1
93	17	f	2
94	17	f	3
95	17	f	4
96	17	t	5
97	18	t	6
98	18	f	7
99	18	t	8
100	19	f	1
101	19	f	2
102	19	t	3
103	19	t	4
104	20	t	5
105	20	t	6
106	21	t	7
107	21	f	8
108	21	f	9
109	22	f	10
110	22	t	11
111	22	t	12
112	22	t	13
113	22	t	14
114	22	t	15
115	22	t	16
116	23	f	1
117	23	f	2
118	23	t	3
119	23	f	4
120	24	f	5
121	24	t	6
122	24	t	7
123	25	f	8
124	26	t	1
125	26	f	2
126	26	f	3
127	26	f	4
128	27	t	5
129	27	f	6
130	27	t	7
131	28	t	8
132	28	f	9
133	29	t	1
134	29	f	2
135	29	t	3
136	29	t	4
137	29	t	5
138	29	f	6
139	29	t	7
140	29	f	8
141	29	t	9
142	29	f	10
143	29	t	11
144	29	f	12
145	29	f	13
146	29	f	14
147	29	f	15
148	29	f	16
149	29	t	17
150	29	f	18
151	30	f	19
152	30	t	20
153	30	t	21
154	31	f	1
155	31	t	2
156	31	f	3
157	31	f	4
158	31	f	5
159	31	t	6
160	31	f	7
161	31	f	8
162	31	f	9
163	31	t	10
164	31	f	11
165	31	f	12
166	31	f	13
167	31	t	14
168	31	t	15
169	32	f	1
170	32	f	2
171	32	f	3
172	32	f	4
173	32	f	5
174	32	t	6
175	32	f	7
176	32	f	8
177	32	f	9
178	32	f	10
179	32	f	11
180	32	f	12
181	32	t	13
182	32	t	14
183	32	t	15
184	32	f	16
185	32	t	17
186	32	f	18
187	32	t	19
188	32	f	20
189	33	f	1
190	33	f	2
191	34	t	3
192	34	f	4
193	34	f	5
194	34	t	6
195	35	f	1
196	36	t	2
197	37	f	3
198	37	t	4
199	37	f	5
200	38	f	6
201	38	f	7
202	38	t	8
203	38	f	9
204	38	f	10
205	39	t	11
206	39	f	12
207	39	f	13
208	39	f	14
209	39	f	15
210	40	t	1
211	40	f	2
212	40	f	3
213	41	f	4
214	41	f	5
215	41	t	6
216	41	f	7
217	41	f	8
218	41	f	9
219	41	t	10
220	41	t	11
221	41	t	12
222	41	f	13
223	41	t	14
224	42	t	15
225	42	t	16
226	43	f	1
227	43	f	2
228	44	t	3
229	44	t	4
230	45	t	5
231	45	t	6
232	45	t	7
233	45	f	8
234	45	f	9
235	45	t	10
236	45	f	11
237	46	f	1
238	46	t	2
239	46	f	3
240	46	t	4
241	47	f	5
242	47	f	6
243	48	f	7
244	48	f	8
245	48	t	9
246	48	t	10
247	49	f	1
248	49	f	2
249	49	f	3
250	49	f	4
251	49	t	5
252	49	t	6
253	49	f	7
254	50	t	8
255	50	t	9
256	51	f	1
257	51	t	2
258	51	t	3
259	51	f	4
260	51	f	5
261	51	f	6
262	51	f	7
263	51	f	8
264	51	f	9
265	51	f	10
266	51	f	11
267	51	t	12
268	51	t	13
269	51	f	14
270	51	f	15
271	51	t	16
272	51	t	17
273	51	t	18
274	51	f	19
275	51	t	20
276	52	f	1
277	53	f	2
278	53	t	3
279	53	t	4
280	53	f	5
281	54	t	6
282	55	t	1
283	55	f	2
284	56	t	3
285	56	t	4
286	56	f	5
287	56	t	6
288	56	f	7
289	56	t	8
290	56	f	9
291	57	t	1
292	57	f	2
293	57	f	3
294	57	f	4
295	57	f	5
296	57	t	6
297	57	f	7
298	57	t	8
299	57	f	9
300	57	f	10
301	57	t	11
302	57	t	12
303	57	t	13
304	57	t	14
305	57	t	15
306	57	t	16
307	57	f	17
308	57	f	18
309	57	t	19
310	58	t	20
311	58	t	21
312	59	f	1
313	59	t	2
314	59	t	3
315	59	f	4
316	59	f	5
317	59	f	6
318	59	t	7
319	59	t	8
320	59	f	9
321	59	f	10
322	59	t	11
323	59	t	12
324	59	t	13
325	60	t	14
326	61	f	15
327	62	t	1
328	62	f	2
329	62	t	3
330	62	f	4
331	62	f	5
332	62	t	6
333	62	f	7
334	62	f	8
335	62	f	9
336	62	t	10
337	62	t	11
338	62	f	12
339	62	f	13
340	62	t	14
341	62	f	15
342	63	t	16
343	64	t	17
344	64	f	18
345	64	f	19
346	64	f	20
\.


--
-- Data for Name: itinerary_day_template_activity; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary_day_template_activity (itinerary_day_template_id, activity_id) FROM stdin;
1	34
1	134
1	37
2	38
2	40
2	35
2	34
3	36
3	39
3	37
4	37
4	41
4	38
5	39
5	40
5	41
5	34
6	40
6	35
7	134
7	34
7	39
8	37
8	34
8	39
9	35
9	41
10	36
10	34
11	40
11	134
11	37
12	134
12	35
12	40
12	34
13	28
13	31
13	30
13	32
14	28
15	32
16	32
16	28
16	29
17	31
17	33
17	26
17	32
18	95
18	90
18	94
19	92
19	91
20	135
21	94
21	95
21	92
22	100
22	97
23	103
23	102
24	103
24	99
24	100
25	103
25	97
26	97
26	101
26	100
27	101
27	99
28	102
28	100
28	98
29	101
29	98
29	97
29	96
30	102
30	98
31	97
31	98
31	101
32	98
32	99
32	100
32	97
33	102
33	103
33	97
33	100
34	99
35	96
35	98
36	103
36	97
36	101
37	99
38	99
39	101
39	102
40	123
40	121
41	122
41	119
42	118
42	122
42	124
42	121
43	104
43	109
44	108
44	109
44	104
44	106
45	110
46	114
47	112
48	125
48	127
49	125
50	29
50	28
51	26
51	29
52	31
52	27
52	28
53	33
54	32
54	29
54	31
55	2
56	1
56	5
57	2
58	1
58	2
59	2
59	1
59	3
60	4
60	3
61	2
61	5
62	4
62	3
63	3
63	2
63	1
64	88
65	62
66	133
66	61
67	59
67	133
68	55
68	61
69	56
69	61
69	133
70	61
70	56
70	133
71	62
71	59
71	57
72	61
72	58
72	59
72	57
73	45
73	46
74	42
74	46
75	107
76	109
76	107
76	105
76	110
76	106
76	104
77	109
77	107
77	105
77	108
77	110
78	111
79	117
80	116
80	112
80	115
80	113
81	113
81	116
81	114
82	67
82	65
83	69
84	65
84	64
85	66
85	63
85	67
85	65
86	68
86	67
86	69
86	63
86	65
87	63
87	65
88	65
88	63
89	69
90	67
90	69
90	68
90	66
91	63
91	67
91	66
91	68
92	124
92	118
93	123
93	124
94	122
95	122
96	118
96	123
96	119
97	53
97	54
97	48
97	49
98	54
98	51
99	49
99	53
99	54
100	111
101	110
101	106
101	104
102	107
102	110
102	108
102	104
103	105
103	109
104	134
104	39
105	38
105	36
106	69
106	65
107	66
107	67
107	65
108	69
109	84
109	87
109	131
110	84
110	86
110	85
111	86
111	85
112	85
113	131
113	87
114	87
114	88
115	131
116	2
116	3
116	1
117	2
117	1
118	4
118	2
119	2
120	110
120	108
120	105
121	109
121	110
121	104
121	108
122	106
122	108
123	29
123	33
124	68
124	66
124	67
125	69
125	67
126	68
126	66
126	69
127	67
127	69
127	65
128	20
128	24
129	25
129	22
130	24
130	22
130	20
131	98
131	99
132	103
132	98
132	99
133	83
133	79
134	81
135	82
135	80
136	82
136	83
136	79
137	83
137	82
138	81
138	78
138	79
139	81
139	80
139	79
140	78
140	79
141	80
141	81
142	79
142	83
142	80
143	82
143	79
143	81
144	81
144	82
144	79
145	80
145	82
145	79
145	78
146	79
146	83
146	78
147	83
147	81
148	82
148	81
149	81
150	80
150	78
150	82
151	91
152	93
152	91
153	91
153	92
153	94
154	108
154	105
154	111
155	110
155	106
156	108
156	111
156	104
157	104
157	108
157	111
158	104
158	105
159	109
159	110
159	108
160	105
161	107
161	106
162	109
162	104
162	105
162	108
163	108
163	107
164	107
164	109
165	105
165	106
166	104
166	105
167	104
168	108
168	104
169	16
169	132
170	18
170	16
170	13
171	13
171	17
171	14
172	137
172	138
172	15
173	14
173	138
173	16
173	13
174	14
174	13
174	137
174	18
175	15
175	17
175	12
175	14
175	13
175	19
176	16
176	15
176	14
176	17
176	13
176	137
177	132
177	18
177	17
177	14
178	14
178	12
178	19
179	137
180	15
180	16
181	12
181	132
181	137
182	132
182	138
182	15
183	14
183	132
183	16
183	13
183	17
183	137
184	132
184	19
184	16
184	18
184	17
184	14
185	138
185	15
185	132
186	12
186	13
186	14
186	16
186	18
187	17
187	12
188	137
188	12
189	135
190	92
190	90
190	93
190	95
190	91
191	102
191	100
191	99
191	97
192	103
192	100
192	101
193	100
193	101
193	99
193	97
194	100
194	102
194	103
194	98
194	99
195	129
196	81
196	78
196	82
197	116
197	117
197	113
197	114
198	114
198	116
198	115
199	113
199	117
199	115
199	114
200	51
200	53
200	49
200	54
201	50
201	54
201	49
202	48
202	53
202	54
203	49
203	51
203	54
204	48
204	52
204	51
205	22
205	25
205	20
205	21
206	21
207	25
207	22
207	23
208	20
208	23
208	22
208	25
209	139
209	25
209	24
209	20
210	48
210	53
211	50
211	49
211	52
212	49
213	83
213	82
213	81
214	83
215	83
215	80
215	82
215	79
216	81
216	82
216	83
217	81
218	82
218	81
218	83
219	82
219	83
220	79
221	81
221	78
221	82
222	80
222	79
222	83
223	79
223	78
223	82
224	11
224	7
224	10
224	9
225	136
225	11
225	10
226	136
226	11
226	10
227	7
227	9
228	32
228	33
228	30
228	29
228	31
229	29
229	33
230	85
230	88
231	87
231	88
231	86
232	85
233	86
234	87
234	86
235	86
236	89
236	88
237	65
237	66
238	64
238	65
238	68
239	64
239	66
239	69
240	67
240	66
240	63
241	68
241	65
241	64
241	69
242	69
242	64
243	83
244	80
244	78
244	83
245	78
245	81
246	79
246	81
246	83
247	61
247	57
248	55
248	57
248	59
248	61
248	60
249	133
249	56
249	55
250	57
250	60
251	58
251	55
251	60
251	59
251	133
252	55
253	60
253	59
253	62
254	69
255	67
256	20
256	24
257	139
257	22
258	25
258	24
258	23
259	21
259	22
259	23
260	20
261	139
262	24
262	25
263	21
264	23
264	20
265	139
265	21
265	23
266	24
267	22
267	21
267	23
268	21
268	139
268	23
269	22
269	20
270	139
270	22
270	25
270	20
271	21
271	25
271	22
272	23
272	25
272	22
273	25
273	23
274	139
275	24
275	21
275	23
276	38
276	41
277	15
277	17
278	18
278	137
279	132
279	19
279	18
279	14
280	16
280	137
280	15
280	132
281	2
281	5
281	4
281	1
282	119
282	122
282	120
283	121
283	120
283	118
283	122
284	45
284	44
284	130
285	130
285	43
286	47
286	130
286	42
286	44
287	43
287	44
288	46
288	42
288	44
289	42
289	46
289	45
290	47
290	45
291	39
291	34
291	41
291	38
291	37
291	40
292	40
292	41
292	36
293	41
293	35
294	38
294	40
295	36
295	37
295	38
295	39
295	34
296	40
296	34
296	134
297	41
298	36
298	39
298	134
298	41
299	36
299	39
299	34
299	40
300	39
300	40
300	35
300	37
301	35
301	36
302	40
302	39
303	41
303	34
304	38
304	41
304	34
305	134
305	34
306	38
306	39
307	34
307	35
307	40
308	134
308	40
308	37
308	35
308	36
309	134
310	107
310	108
310	106
310	104
311	108
311	109
311	104
312	17
312	16
312	18
312	19
312	15
313	137
313	15
313	138
313	16
314	138
314	16
314	132
314	14
315	17
315	15
315	14
315	16
315	12
316	138
316	12
316	137
317	13
317	12
317	137
318	12
319	138
320	19
320	12
320	13
320	132
320	14
321	138
321	14
322	18
322	132
322	16
323	19
323	18
323	14
323	12
323	137
323	138
324	138
324	14
324	18
324	137
325	86
325	89
325	84
326	110
326	107
326	111
327	51
327	48
327	54
328	52
328	48
329	51
330	53
330	54
330	52
331	50
331	49
331	52
332	50
333	52
333	54
334	54
334	48
334	52
335	49
335	53
335	54
335	48
336	52
336	54
336	50
337	50
337	52
338	49
338	51
339	50
339	49
339	54
340	53
340	50
340	48
340	51
341	50
341	52
342	129
342	127
343	94
343	90
343	91
344	93
344	91
344	90
344	135
344	95
345	135
345	94
345	92
346	90
\.


--
-- Data for Name: itinerary_template; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.itinerary_template (id, destination_id, house_id, tour_template_id, days) FROM stdin;
1	44	28	2	12
2	43	21	2	5
3	52	70	2	4
4	53	73	3	18
5	56	86	3	3
6	54	76	5	3
7	55	85	5	2
8	57	95	5	2
9	43	22	7	5
10	39	3	7	9
11	51	62	7	1
12	47	41	8	8
13	45	34	8	2
14	54	76	9	4
15	55	85	9	3
16	48	48	10	10
17	56	89	11	5
18	46	40	11	3
19	54	80	13	4
20	44	28	13	2
21	48	47	13	3
22	51	62	13	7
23	39	3	15	4
24	54	76	15	3
25	43	25	15	1
26	48	46	16	4
27	42	16	16	3
28	53	72	16	2
29	50	57	17	18
30	52	66	17	3
31	54	80	18	15
32	41	12	21	20
33	52	66	22	2
34	53	71	22	4
35	57	95	23	1
36	50	59	23	1
37	55	81	23	3
38	46	36	23	5
39	42	16	23	5
40	46	37	24	3
41	50	60	24	11
42	40	7	24	2
43	40	8	25	2
44	43	23	25	2
45	51	62	25	7
46	48	46	27	4
47	48	50	27	2
48	50	56	27	4
49	47	44	28	7
50	48	50	28	2
51	42	18	29	20
52	44	28	30	1
53	41	11	30	4
54	39	5	30	1
55	56	89	31	2
56	45	32	31	7
57	44	26	36	19
58	54	80	36	2
59	41	13	37	13
60	51	64	37	1
61	54	78	37	1
62	46	40	40	15
63	57	92	40	1
64	52	69	40	4
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.location (id, name) FROM stdin;
329	Pinar del Río
330	Cayo Jutias (Santa Lucía)
331	Mil Cumbres
332	Comunidad El Moncada
333	Aguas Claras
334	Maria la Gorda
335	Hotel Mirador (S.D. Baños)
336	Viñales
337	La Guabina
338	Cayo Levisa (Palma Rubia)
339	La Coloma
340	Soroa
341	Las Terrazas
342	Artemisa
343	Playa El Salado
344	Apto Baracoa
345	San Antonio de los Baños
346	Surgidero de Batabanó
347	San José de las Lajas
348	Playa Jibacoa
349	Arroyo Bermejo
350	Puerto Escondido
351	Madruga
352	Aerop. J. Martí Terminal 1
353	Aerop. J. Martí Terminal 2
354	Aerop. J. Martí Terminal 3
355	Aerop. Wajay
356	Marina Hemingway
357	Hoteles Miramar-Playa
358	Hoteles Vedado
359	Habana Vieja
360	Villa Panamericana
361	Playa Santa María del Mar 
362	Playa de Guanabo
363	Matanzas
364	Canimao
365	Aerop. J. G. Gómez
366	Playa de Varadero
367	Marina Gaviota
368	Cárdenas
369	Jaguey Grande
370	La Boca
371	Playa Larga
372	Playa Girón
373	Colón
374	Cienfuegos Ciudad 
375	Hotel Pasacaballos
376	Aguada de Pasageros
377	Castillo de Jagua
378	Delfinario
379	El Nicho
380	Palmira
381	Hacienda la Vega
382	Jardin Bontánico
383	Playa Yaguanabo
384	Mal Tiempo
385	Guajaimico
386	Cumanayagua
387	Playa Rancho Luna
388	Santa Clara
389	La Granjita
390	Baños de Elguea
391	Isabela de Sagua
392	Remedios
393	Caibarien
394	Hanabanilla
395	Cayo las Brujas
396	Cayo Santa María
397	Sancti Spíritus
398	Topes de Collantes
399	Trinidad
400	Playa Ancón
401	Valle de los Ingenios
402	 Zaza
403	Lagos de Mayajigua
404	Ciego de Avila
405	Morón
406	Cayo Coco
407	Aerop. Cayo Coco
408	Parque El Bagá
409	Marina Cayo Coco
410	Cayo Guillermo
411	Aerop. M. Gomez
412	Embarcadero Palo Alto
413	Camaguey
414	Aerop. I. Agramonte
415	Florida
416	Rancho King
417	La Belén
418	Cocodrilo
419	Camalote
420	Sierra de Cubitas
421	Jimbambay
422	Cayo Paredon Grande
423	Cayo Cruz
424	Nuevitas
425	Playa Santa Lucía
426	Santa Cruz del Sur
427	Playa Los Pinos
428	Las Tunas
429	Aerop. H. Amejeiras
430	Cerro Caisimú
431	Playa Covarrubias
432	Puerto Manatí
433	Puerto Padre
434	Puerto Carúpano
435	Guayabal
436	Holguín
437	Aerop. Frank País
438	Mirador de Mayabe
439	Gibara
440	Playa Blanca
441	Don Lino
442	Playa Pesquero
443	Bahía de Naranjo
444	Playa Guardalavaca
445	Chorro de Mahita
446	Boca de Samá
447	Banes
448	Macabí
449	Biran
450	Antilla
451	Mayarí
452	Guatemala
453	Cayo Saetía
454	Nicaro
455	Cayo Mambí
456	Moa
457	Bayamo
458	Aerop. C. M. de Céspedes
459	El Yarey
460	Manzanillo
461	Aerop Sierra Maestra
462	Ceiba Hueca
463	Niquero
464	Las Coloradas
465	Cabo Cruz
466	Pilón
467	Marea del Portillo
468	Villa Santo Domingo
469	Bartolomé Masó
470	Santiago de Cuba
471	Aerop. Antonio Maceo
472	Cayo Granma
473	Castillo del Morro
474	Santuario El Cobre
475	Granjita Siboney
476	Valle de la Prehistoría
477	Hotel Bucanero
478	Hotel Costa Morena
479	Hotel Carisol Los Corales
480	Palma Soriano
481	El Saltón
482	Hotel Sierramar
483	Hotel Los Galeones
484	La Gran Piedra
485	Baconao
486	Guantánamo
487	Aerop. M. Grajales
488	Mirador de Malones
489	Playita de Cajobabo
490	Baracoa
491	El Yunque
492	Caimanera
\.


--
-- Data for Name: location_distance; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.location_distance (id, location1_id, location2_id, kms) FROM stdin;
26729	329	330	90
26730	329	331	85
26731	329	332	50
26732	329	333	7
26733	329	334	150
26734	329	335	50
26735	329	336	30
26736	329	337	9
26737	329	338	82
26738	329	339	25
26739	329	340	100
26740	329	341	120
26741	329	342	125
26742	329	343	145
26743	329	344	143
26744	329	345	145
26745	329	346	225
26746	329	347	200
26747	329	348	240
26748	329	349	242
26749	329	350	258
26750	329	351	235
26751	329	352	180
26752	329	353	176
26753	329	354	175
26754	329	355	167
26755	329	356	155
26756	329	357	160
26757	329	358	175
26758	329	359	180
26759	329	360	185
26760	329	361	215
26761	329	362	219
26762	329	363	299
26763	329	364	307
26764	329	365	325
26765	329	366	370
26766	329	367	381
26767	329	368	335
26768	329	369	340
26769	329	370	360
26770	329	371	371
26771	329	372	406
26772	329	373	389
26773	329	374	445
26774	329	375	470
26775	329	376	375
26776	329	377	490
26777	329	378	467
26778	329	379	500
26779	329	380	458
26780	329	381	505
26781	329	382	475
26782	329	383	497
26783	329	384	455
26784	329	385	488
26785	329	386	478
26786	329	387	465
26787	329	388	472
26788	329	389	482
26789	329	390	577
26790	329	391	537
26791	329	392	522
26792	329	393	532
26793	329	394	496
26794	329	395	572
26795	329	396	582
26796	329	397	538
26797	329	398	548
26798	329	399	530
26799	329	400	545
26800	329	401	625
26801	329	402	608
26802	329	403	575
26803	329	404	610
26804	329	405	655
26805	329	406	742
26806	329	407	730
26807	329	408	762
26808	329	409	738
26809	329	410	782
26810	329	411	635
26811	329	412	660
26812	329	413	735
26813	329	414	745
26814	329	415	695
26815	329	416	816
26816	329	417	789
26817	329	418	795
26818	329	419	820
26819	329	420	800
26820	329	421	753
26821	329	422	923
26822	329	423	847
26823	329	424	888
26824	329	425	899
26825	329	426	862
26826	329	427	834
26827	329	428	865
26828	329	429	870
26829	329	430	890
26830	329	431	943
26831	329	432	932
26832	329	433	919
26833	329	434	929
26834	329	435	972
26835	329	436	950
26836	329	437	965
26837	329	438	970
26838	329	439	985
26839	329	440	993
26840	329	441	991
26841	329	442	999
26842	329	443	1005
26843	329	444	1010
26844	329	445	1020
26845	329	446	1032
26846	329	447	1045
26847	329	448	1055
26848	329	449	1020
26849	329	450	1030
26850	329	451	1038
26851	329	452	1049
26852	329	453	1073
26853	329	454	1070
26854	329	455	1093
26855	329	456	1138
26856	329	457	957
26857	329	458	963
26858	329	459	997
26859	329	460	1017
26860	329	461	1028
26861	329	462	1051
26862	329	463	1111
26863	329	464	1131
26864	329	465	1141
26865	329	466	1107
26866	329	467	1122
26867	329	468	1036
26868	329	469	1016
26869	329	470	1082
26870	329	471	1094
26871	329	472	1097
26872	329	473	1097
26873	329	474	1102
26874	329	475	1097
26875	329	476	1102
26876	329	477	1112
26877	329	478	1131
26878	329	479	1137
26879	329	480	1129
26880	329	481	1187
26881	329	482	1152
26882	329	483	1176
26883	329	484	1109
26884	329	485	1462
26885	329	486	1130
26886	329	487	1145
26887	329	488	1170
26888	329	489	1231
26889	329	490	1209
26890	329	491	1199
26891	329	492	1170
26892	330	331	100
26893	330	332	79
26894	330	333	62
26895	330	334	178
26896	330	335	105
26897	330	336	60
26898	330	337	81
26899	330	338	110
26900	330	339	115
26901	330	340	180
26902	330	341	200
26903	330	342	215
26904	330	343	235
26905	330	344	233
26906	330	345	235
26907	330	346	305
26908	330	347	290
26909	330	348	330
26910	330	349	332
26911	330	350	348
26912	330	351	325
26913	330	352	250
26914	330	353	246
26915	330	354	245
26916	330	355	247
26917	330	356	235
26918	330	357	240
26919	330	358	255
26920	330	359	260
26921	330	360	265
26922	330	361	255
26923	330	362	259
26924	330	363	339
26925	330	364	347
26926	330	365	364
26927	330	366	389
26928	330	367	400
26929	330	368	384
26930	330	369	420
26931	330	370	440
26932	330	371	441
26933	330	372	475
26934	330	373	429
26935	330	374	525
26936	330	375	550
26937	330	376	455
26938	330	377	570
26939	330	378	547
26940	330	379	580
26941	330	380	538
26942	330	381	585
26943	330	382	555
26944	330	383	577
26945	330	384	535
26946	330	385	568
26947	330	386	558
26948	330	387	545
26949	330	388	552
26950	330	389	562
26951	330	390	657
26952	330	391	617
26953	330	392	602
26954	330	393	612
26955	330	394	576
26956	330	395	652
26957	330	396	662
26958	330	397	618
26959	330	398	628
26960	330	399	630
26961	330	400	645
26962	330	401	705
26963	330	402	688
26964	330	403	655
26965	330	404	690
26966	330	405	735
26967	330	406	822
26968	330	407	810
26969	330	408	842
26970	330	409	818
26971	330	410	862
26972	330	411	715
26973	330	412	740
26974	330	413	815
26975	330	414	825
26976	330	415	775
26977	330	416	896
26978	330	417	869
26979	330	418	875
26980	330	419	900
26981	330	420	880
26982	330	421	833
26983	330	422	1003
26984	330	423	927
26985	330	424	968
26986	330	425	979
26987	330	426	942
26988	330	427	914
26989	330	428	945
26990	330	429	950
26991	330	430	970
26992	330	431	1023
26993	330	432	1012
26994	330	433	999
26995	330	434	1009
26996	330	435	1052
26997	330	436	1030
26998	330	437	1045
26999	330	438	1050
27000	330	439	1065
27001	330	440	1073
27002	330	441	1071
27003	330	442	1079
27004	330	443	1085
27005	330	444	1090
27006	330	445	1100
27007	330	446	1112
27008	330	447	1125
27009	330	448	1135
27010	330	449	1100
27011	330	450	1110
27012	330	451	1118
27013	330	452	1129
27014	330	453	1153
27015	330	454	1150
27016	330	455	1173
27017	330	456	1218
27018	330	457	1037
27019	330	458	1043
27020	330	459	1077
27021	330	460	1097
27022	330	461	1108
27023	330	462	1131
27024	330	463	1191
27025	330	464	1211
27026	330	465	1221
27027	330	466	1187
27028	330	467	1202
27029	330	468	1116
27030	330	469	1096
27031	330	470	1162
27032	330	471	1174
27033	330	472	1177
27034	330	473	1177
27035	330	474	1182
27036	330	475	1177
27037	330	476	1182
27038	330	477	1192
27039	330	478	1211
27040	330	479	1217
27041	330	480	1209
27042	330	481	1267
27043	330	482	1232
27044	330	483	1256
27045	330	484	1189
27046	330	485	1542
27047	330	486	1210
27048	330	487	1225
27049	330	488	1250
27050	330	489	1311
27051	330	490	1289
27052	330	491	1279
27053	330	492	1250
27054	331	332	81
27055	331	333	78
27056	331	334	235
27057	331	335	50
27058	331	336	55
27059	331	337	94
27060	331	338	45
27061	331	339	110
27062	331	340	55
27063	331	341	75
27064	331	342	75
27065	331	343	105
27066	331	344	103
27067	331	345	105
27068	331	346	186
27069	331	347	172
27070	331	348	205
27071	331	349	193
27072	331	350	217
27073	331	351	207
27074	331	352	131
27075	331	353	127
27076	331	354	126
27077	331	355	128
27078	331	356	116
27079	331	357	121
27080	331	358	136
27081	331	359	141
27082	331	360	146
27083	331	361	176
27084	331	362	180
27085	331	363	260
27086	331	364	268
27087	331	365	285
27088	331	366	310
27089	331	367	321
27090	331	368	305
27091	331	369	301
27092	331	370	321
27093	331	371	332
27094	331	372	368
27095	331	373	350
27096	331	374	406
27097	331	375	431
27098	331	376	336
27099	331	377	451
27100	331	378	428
27101	331	379	461
27102	331	380	419
27103	331	381	466
27104	331	382	436
27105	331	383	458
27106	331	384	416
27107	331	385	449
27108	331	386	439
27109	331	387	426
27110	331	388	433
27111	331	389	443
27112	331	390	538
27113	331	391	498
27114	331	392	483
27115	331	393	493
27116	331	394	457
27117	331	395	533
27118	331	396	543
27119	331	397	499
27120	331	398	509
27121	331	399	511
27122	331	400	526
27123	331	401	586
27124	331	402	569
27125	331	403	536
27126	331	404	571
27127	331	405	616
27128	331	406	703
27129	331	407	691
27130	331	408	723
27131	331	409	699
27132	331	410	743
27133	331	411	596
27134	331	412	621
27135	331	413	696
27136	331	414	706
27137	331	415	656
27138	331	416	777
27139	331	417	750
27140	331	418	756
27141	331	419	781
27142	331	420	761
27143	331	421	714
27144	331	422	884
27145	331	423	808
27146	331	424	849
27147	331	425	860
27148	331	426	823
27149	331	427	795
27150	331	428	826
27151	331	429	831
27152	331	430	851
27153	331	431	904
27154	331	432	893
27155	331	433	880
27156	331	434	890
27157	331	435	933
27158	331	436	911
27159	331	437	926
27160	331	438	931
27161	331	439	946
27162	331	440	954
27163	331	441	952
27164	331	442	960
27165	331	443	966
27166	331	444	971
27167	331	445	981
27168	331	446	993
27169	331	447	1006
27170	331	448	1016
27171	331	449	981
27172	331	450	991
27173	331	451	999
27174	331	452	1010
27175	331	453	1034
27176	331	454	1031
27177	331	455	1054
27178	331	456	1099
27179	331	457	918
27180	331	458	924
27181	331	459	958
27182	331	460	978
27183	331	461	989
27184	331	462	1012
27185	331	463	1072
27186	331	464	1092
27187	331	465	1102
27188	331	466	1068
27189	331	467	1083
27190	331	468	997
27191	331	469	977
27192	331	470	1043
27193	331	471	1055
27194	331	472	1058
27195	331	473	1058
27196	331	474	1063
27197	331	475	1058
27198	331	476	1063
27199	331	477	1073
27200	331	478	1092
27201	331	479	1098
27202	331	480	1090
27203	331	481	1148
27204	331	482	1113
27205	331	483	1137
27206	331	484	1070
27207	331	485	1423
27208	331	486	1091
27209	331	487	1106
27210	331	488	1131
27211	331	489	1192
27212	331	490	1170
27213	331	491	1160
27214	331	492	1131
27215	332	333	57
27216	332	334	200
27217	332	335	100
27218	332	336	20
27219	332	337	41
27220	332	338	72
27221	332	339	75
27222	332	340	140
27223	332	341	160
27224	332	342	175
27225	332	343	195
27226	332	344	193
27227	332	345	195
27228	332	346	275
27229	332	347	272
27230	332	348	290
27231	332	349	292
27232	332	350	308
27233	332	351	307
27234	332	352	216
27235	332	353	212
27236	332	354	215
27237	332	355	217
27238	332	356	205
27239	332	357	210
27240	332	358	225
27241	332	359	230
27242	332	360	235
27243	332	361	265
27244	332	362	269
27245	332	363	349
27246	332	364	357
27247	332	365	374
27248	332	366	399
27249	332	367	410
27250	332	368	394
27251	332	369	390
27252	332	370	410
27253	332	371	421
27254	332	372	455
27255	332	373	439
27256	332	374	495
27257	332	375	520
27258	332	376	425
27259	332	377	540
27260	332	378	517
27261	332	379	550
27262	332	380	508
27263	332	381	555
27264	332	382	525
27265	332	383	547
27266	332	384	505
27267	332	385	538
27268	332	386	528
27269	332	387	515
27270	332	388	522
27271	332	389	532
27272	332	390	627
27273	332	391	587
27274	332	392	572
27275	332	393	582
27276	332	394	546
27277	332	395	622
27278	332	396	632
27279	332	397	588
27280	332	398	598
27281	332	399	600
27282	332	400	615
27283	332	401	675
27284	332	402	658
27285	332	403	625
27286	332	404	660
27287	332	405	705
27288	332	406	792
27289	332	407	780
27290	332	408	812
27291	332	409	788
27292	332	410	832
27293	332	411	685
27294	332	412	710
27295	332	413	785
27296	332	414	795
27297	332	415	745
27298	332	416	866
27299	332	417	839
27300	332	418	845
27301	332	419	870
27302	332	420	850
27303	332	421	803
27304	332	422	973
27305	332	423	897
27306	332	424	938
27307	332	425	949
27308	332	426	912
27309	332	427	884
27310	332	428	915
27311	332	429	920
27312	332	430	940
27313	332	431	993
27314	332	432	982
27315	332	433	969
27316	332	434	979
27317	332	435	1022
27318	332	436	1000
27319	332	437	1015
27320	332	438	1020
27321	332	439	1035
27322	332	440	1043
27323	332	441	1041
27324	332	442	1049
27325	332	443	1055
27326	332	444	1060
27327	332	445	1070
27328	332	446	1082
27329	332	447	1095
27330	332	448	1105
27331	332	449	1070
27332	332	450	1080
27333	332	451	1088
27334	332	452	1099
27335	332	453	1123
27336	332	454	1120
27337	332	455	1143
27338	332	456	1188
27339	332	457	1007
27340	332	458	1013
27341	332	459	1047
27342	332	460	1067
27343	332	461	1078
27344	332	462	1101
27345	332	463	1161
27346	332	464	1181
27347	332	465	1191
27348	332	466	1157
27349	332	467	1172
27350	332	468	1086
27351	332	469	1066
27352	332	470	1132
27353	332	471	1144
27354	332	472	1147
27355	332	473	1147
27356	332	474	1152
27357	332	475	1147
27358	332	476	1152
27359	332	477	1162
27360	332	478	1181
27361	332	479	1187
27362	332	480	1179
27363	332	481	1237
27364	332	482	1202
27365	332	483	1226
27366	332	484	1159
27367	332	485	1512
27368	332	486	1180
27369	332	487	1195
27370	332	488	1220
27371	332	489	1281
27372	332	490	1259
27373	332	491	1249
27374	332	492	1220
27375	333	334	157
27376	333	335	57
27377	333	336	25
27378	333	337	16
27379	333	338	75
27380	333	339	32
27381	333	340	105
27382	333	341	125
27383	333	342	132
27384	333	343	152
27385	333	344	149
27386	333	345	152
27387	333	346	232
27388	333	347	229
27389	333	348	247
27390	333	349	249
27391	333	350	263
27392	333	351	264
27393	333	352	177
27394	333	353	173
27395	333	354	172
27396	333	355	174
27397	333	356	162
27398	333	357	167
27399	333	358	182
27400	333	359	187
27401	333	360	192
27402	333	361	222
27403	333	362	226
27404	333	363	296
27405	333	364	304
27406	333	365	321
27407	333	366	346
27408	333	367	357
27409	333	368	341
27410	333	369	347
27411	333	370	367
27412	333	371	378
27413	333	372	402
27414	333	373	386
27415	333	374	452
27416	333	375	477
27417	333	376	382
27418	333	377	497
27419	333	378	474
27420	333	379	507
27421	333	380	465
27422	333	381	512
27423	333	382	482
27424	333	383	504
27425	333	384	462
27426	333	385	495
27427	333	386	485
27428	333	387	472
27429	333	388	479
27430	333	389	489
27431	333	390	584
27432	333	391	544
27433	333	392	529
27434	333	393	539
27435	333	394	503
27436	333	395	579
27437	333	396	589
27438	333	397	545
27439	333	398	555
27440	333	399	557
27441	333	400	572
27442	333	401	632
27443	333	402	615
27444	333	403	582
27445	333	404	617
27446	333	405	662
27447	333	406	749
27448	333	407	737
27449	333	408	769
27450	333	409	745
27451	333	410	789
27452	333	411	642
27453	333	412	667
27454	333	413	742
27455	333	414	752
27456	333	415	702
27457	333	416	823
27458	333	417	796
27459	333	418	802
27460	333	419	827
27461	333	420	807
27462	333	421	760
27463	333	422	930
27464	333	423	854
27465	333	424	895
27466	333	425	906
27467	333	426	869
27468	333	427	841
27469	333	428	872
27470	333	429	877
27471	333	430	897
27472	333	431	950
27473	333	432	939
27474	333	433	926
27475	333	434	936
27476	333	435	979
27477	333	436	957
27478	333	437	972
27479	333	438	977
27480	333	439	992
27481	333	440	1000
27482	333	441	998
27483	333	442	1006
27484	333	443	1012
27485	333	444	1017
27486	333	445	1027
27487	333	446	1039
27488	333	447	1052
27489	333	448	1062
27490	333	449	1027
27491	333	450	1037
27492	333	451	1045
27493	333	452	1056
27494	333	453	1080
27495	333	454	1077
27496	333	455	1100
27497	333	456	1145
27498	333	457	964
27499	333	458	970
27500	333	459	1004
27501	333	460	1024
27502	333	461	1035
27503	333	462	1058
27504	333	463	1118
27505	333	464	1138
27506	333	465	1148
27507	333	466	1114
27508	333	467	1129
27509	333	468	1043
27510	333	469	1023
27511	333	470	1089
27512	333	471	1101
27513	333	472	1104
27514	333	473	1104
27515	333	474	1109
27516	333	475	1104
27517	333	476	1109
27518	333	477	1119
27519	333	478	1138
27520	333	479	1144
27521	333	480	1136
27522	333	481	1194
27523	333	482	1159
27524	333	483	1183
27525	333	484	1116
27526	333	485	1469
27527	333	486	1137
27528	333	487	1152
27529	333	488	1177
27530	333	489	1238
27531	333	490	1216
27532	333	491	1206
27533	333	492	1177
27534	334	335	200
27535	334	336	180
27536	334	337	159
27537	334	338	232
27538	334	339	138
27539	334	340	250
27540	334	341	270
27541	334	342	275
27542	334	343	295
27543	334	344	293
27544	334	345	295
27545	334	346	375
27546	334	347	372
27547	334	348	290
27548	334	349	392
27549	334	350	306
27550	334	351	407
27551	334	352	320
27552	334	353	316
27553	334	354	315
27554	334	355	317
27555	334	356	305
27556	334	357	310
27557	334	358	325
27558	334	359	330
27559	334	360	335
27560	334	361	365
27561	334	362	369
27562	334	363	449
27563	334	364	457
27564	334	365	474
27565	334	366	499
27566	334	367	560
27567	334	368	485
27568	334	369	490
27569	334	370	510
27570	334	371	521
27571	334	372	555
27572	334	373	539
27573	334	374	595
27574	334	375	620
27575	334	376	525
27576	334	377	640
27577	334	378	617
27578	334	379	650
27579	334	380	608
27580	334	381	655
27581	334	382	625
27582	334	383	647
27583	334	384	605
27584	334	385	638
27585	334	386	628
27586	334	387	615
27587	334	388	622
27588	334	389	632
27589	334	390	727
27590	334	391	687
27591	334	392	672
27592	334	393	682
27593	334	394	646
27594	334	395	722
27595	334	396	732
27596	334	397	688
27597	334	398	698
27598	334	399	680
27599	334	400	695
27600	334	401	775
27601	334	402	758
27602	334	403	725
27603	334	404	760
27604	334	405	805
27605	334	406	892
27606	334	407	880
27607	334	408	912
27608	334	409	888
27609	334	410	932
27610	334	411	785
27611	334	412	810
27612	334	413	885
27613	334	414	895
27614	334	415	845
27615	334	416	966
27616	334	417	939
27617	334	418	945
27618	334	419	970
27619	334	420	950
27620	334	421	903
27621	334	422	1073
27622	334	423	997
27623	334	424	1038
27624	334	425	1049
27625	334	426	1012
27626	334	427	984
27627	334	428	1015
27628	334	429	1020
27629	334	430	1040
27630	334	431	1093
27631	334	432	1082
27632	334	433	1069
27633	334	434	1079
27634	334	435	1122
27635	334	436	1100
27636	334	437	1115
27637	334	438	1120
27638	334	439	1135
27639	334	440	1143
27640	334	441	1141
27641	334	442	1149
27642	334	443	1155
27643	334	444	1160
27644	334	445	1170
27645	334	446	1182
27646	334	447	1195
27647	334	448	1205
27648	334	449	1170
27649	334	450	1180
27650	334	451	1188
27651	334	452	1199
27652	334	453	1223
27653	334	454	1220
27654	334	455	1243
27655	334	456	1288
27656	334	457	1107
27657	334	458	1113
27658	334	459	1147
27659	334	460	1167
27660	334	461	1178
27661	334	462	1201
27662	334	463	1261
27663	334	464	1281
27664	334	465	1291
27665	334	466	1257
27666	334	467	1272
27667	334	468	1186
27668	334	469	1166
27669	334	470	1232
27670	334	471	1244
27671	334	472	1247
27672	334	473	1247
27673	334	474	1252
27674	334	475	1247
27675	334	476	1252
27676	334	477	1262
27677	334	478	1281
27678	334	479	1287
27679	334	480	1279
27680	334	481	1337
27681	334	482	1302
27682	334	483	1326
27683	334	484	1259
27684	334	485	1612
27685	334	486	1280
27686	334	487	1295
27687	334	488	1320
27688	334	489	1381
27689	334	490	1359
27690	334	491	1349
27691	334	492	1320
27692	335	336	70
27693	335	337	79
27694	335	338	65
27695	335	339	95
27696	335	340	60
27697	335	341	80
27698	335	342	55
27699	335	343	95
27700	335	344	93
27701	335	345	95
27702	335	346	168
27703	335	347	152
27704	335	348	170
27705	335	349	179
27706	335	350	195
27707	335	351	187
27708	335	352	113
27709	335	353	109
27710	335	354	108
27711	335	355	110
27712	335	356	98
27713	335	357	103
27714	335	358	118
27715	335	359	123
27716	335	360	128
27717	335	361	158
27718	335	362	162
27719	335	363	242
27720	335	364	250
27721	335	365	267
27722	335	366	292
27723	335	367	303
27724	335	368	285
27725	335	369	283
27726	335	370	303
27727	335	371	314
27728	335	372	348
27729	335	373	332
27730	335	374	388
27731	335	375	413
27732	335	376	318
27733	335	377	433
27734	335	378	410
27735	335	379	443
27736	335	380	401
27737	335	381	448
27738	335	382	418
27739	335	383	440
27740	335	384	398
27741	335	385	431
27742	335	386	421
27743	335	387	408
27744	335	388	415
27745	335	389	425
27746	335	390	520
27747	335	391	480
27748	335	392	465
27749	335	393	475
27750	335	394	439
27751	335	395	515
27752	335	396	525
27753	335	397	481
27754	335	398	491
27755	335	399	493
27756	335	400	508
27757	335	401	568
27758	335	402	551
27759	335	403	518
27760	335	404	553
27761	335	405	598
27762	335	406	685
27763	335	407	673
27764	335	408	705
27765	335	409	681
27766	335	410	725
27767	335	411	578
27768	335	412	603
27769	335	413	678
27770	335	414	688
27771	335	415	638
27772	335	416	759
27773	335	417	732
27774	335	418	738
27775	335	419	763
27776	335	420	743
27777	335	421	696
27778	335	422	866
27779	335	423	790
27780	335	424	831
27781	335	425	842
27782	335	426	805
27783	335	427	777
27784	335	428	808
27785	335	429	813
27786	335	430	833
27787	335	431	886
27788	335	432	875
27789	335	433	862
27790	335	434	872
27791	335	435	915
27792	335	436	893
27793	335	437	908
27794	335	438	913
27795	335	439	928
27796	335	440	936
27797	335	441	934
27798	335	442	942
27799	335	443	948
27800	335	444	953
27801	335	445	963
27802	335	446	975
27803	335	447	988
27804	335	448	998
27805	335	449	963
27806	335	450	973
27807	335	451	981
27808	335	452	992
27809	335	453	1016
27810	335	454	1013
27811	335	455	1036
27812	335	456	1081
27813	335	457	900
27814	335	458	906
27815	335	459	940
27816	335	460	960
27817	335	461	971
27818	335	462	994
27819	335	463	1054
27820	335	464	1074
27821	335	465	1084
27822	335	466	1050
27823	335	467	1065
27824	335	468	979
27825	335	469	959
27826	335	470	1025
27827	335	471	1037
27828	335	472	1040
27829	335	473	1040
27830	335	474	1045
27831	335	475	1040
27832	335	476	1045
27833	335	477	1055
27834	335	478	1074
27835	335	479	1080
27836	335	480	1072
27837	335	481	1130
27838	335	482	1095
27839	335	483	1119
27840	335	484	1052
27841	335	485	1405
27842	335	486	1073
27843	335	487	1088
27844	335	488	1113
27845	335	489	1174
27846	335	490	1152
27847	335	491	1142
27848	335	492	1113
27849	336	337	40
27850	336	338	52
27851	336	339	55
27852	336	340	120
27853	336	341	140
27854	336	342	155
27855	336	343	173
27856	336	344	170
27857	336	345	173
27858	336	346	255
27859	336	347	247
27860	336	348	270
27861	336	349	272
27862	336	350	286
27863	336	351	282
27864	336	352	208
27865	336	353	206
27866	336	354	205
27867	336	355	197
27868	336	356	185
27869	336	357	190
27870	336	358	205
27871	336	359	210
27872	336	360	215
27873	336	361	245
27874	336	362	249
27875	336	363	329
27876	336	364	337
27877	336	365	355
27878	336	366	400
27879	336	367	411
27880	336	368	365
27881	336	369	370
27882	336	370	390
27883	336	371	401
27884	336	372	436
27885	336	373	419
27886	336	374	475
27887	336	375	500
27888	336	376	405
27889	336	377	520
27890	336	378	497
27891	336	379	530
27892	336	380	488
27893	336	381	535
27894	336	382	505
27895	336	383	527
27896	336	384	485
27897	336	385	518
27898	336	386	508
27899	336	387	495
27900	336	388	502
27901	336	389	512
27902	336	390	607
27903	336	391	567
27904	336	392	552
27905	336	393	562
27906	336	394	526
27907	336	395	602
27908	336	396	612
27909	336	397	568
27910	336	398	578
27911	336	399	560
27912	336	400	575
27913	336	401	655
27914	336	402	638
27915	336	403	605
27916	336	404	640
27917	336	405	685
27918	336	406	772
27919	336	407	760
27920	336	408	792
27921	336	409	768
27922	336	410	812
27923	336	411	665
27924	336	412	690
27925	336	413	765
27926	336	414	775
27927	336	415	725
27928	336	416	846
27929	336	417	819
27930	336	418	825
27931	336	419	850
27932	336	420	830
27933	336	421	783
27934	336	422	953
27935	336	423	877
27936	336	424	918
27937	336	425	929
27938	336	426	892
27939	336	427	864
27940	336	428	895
27941	336	429	900
27942	336	430	920
27943	336	431	973
27944	336	432	962
27945	336	433	949
27946	336	434	959
27947	336	435	1002
27948	336	436	980
27949	336	437	995
27950	336	438	1000
27951	336	439	1015
27952	336	440	1023
27953	336	441	1021
27954	336	442	1029
27955	336	443	1035
27956	336	444	1040
27957	336	445	1050
27958	336	446	1062
27959	336	447	1075
27960	336	448	1085
27961	336	449	1050
27962	336	450	1060
27963	336	451	1068
27964	336	452	1079
27965	336	453	1103
27966	336	454	1100
27967	336	455	1123
27968	336	456	1168
27969	336	457	987
27970	336	458	993
27971	336	459	1027
27972	336	460	1047
27973	336	461	1058
27974	336	462	1081
27975	336	463	1141
27976	336	464	1161
27977	336	465	1171
27978	336	466	1137
27979	336	467	1152
27980	336	468	1066
27981	336	469	1046
27982	336	470	1112
27983	336	471	1124
27984	336	472	1127
27985	336	473	1127
27986	336	474	1132
27987	336	475	1127
27988	336	476	1132
27989	336	477	1142
27990	336	478	1161
27991	336	479	1167
27992	336	480	1159
27993	336	481	1217
27994	336	482	1182
27995	336	483	1206
27996	336	484	1139
27997	336	485	1492
27998	336	486	1160
27999	336	487	1175
28000	336	488	1200
28001	336	489	1261
28002	336	490	1239
28003	336	491	1229
28004	336	492	1200
28005	337	338	91
28006	337	339	61
28007	337	340	110
28008	337	341	129
28009	337	342	174
28010	337	343	164
28011	337	344	161
28012	337	345	164
28013	337	346	231
28014	337	347	231
28015	337	348	249
28016	337	349	251
28017	337	350	265
28018	337	351	266
28019	337	352	179
28020	337	353	174
28021	337	354	171
28022	337	355	175
28023	337	356	164
28024	337	357	169
28025	337	358	184
28026	337	359	189
28027	337	360	194
28028	337	361	224
28029	337	362	228
28030	337	363	368
28031	337	364	316
28032	337	365	333
28033	337	366	358
28034	337	367	369
28035	337	368	352
28036	337	369	319
28037	337	370	369
28038	337	371	380
28039	337	372	141
28040	337	373	398
28041	337	374	424
28042	337	375	449
28043	337	376	354
28044	337	377	469
28045	337	378	446
28046	337	379	479
28047	337	380	437
28048	337	381	484
28049	337	382	454
28050	337	383	476
28051	337	384	464
28052	337	385	467
28053	337	386	457
28054	337	387	444
28055	337	388	451
28056	337	389	461
28057	337	390	556
28058	337	391	516
28059	337	392	501
28060	337	393	511
28061	337	394	475
28062	337	395	551
28063	337	396	561
28064	337	397	517
28065	337	398	527
28066	337	399	529
28067	337	400	544
28068	337	401	604
28069	337	402	587
28070	337	403	554
28071	337	404	589
28072	337	405	634
28073	337	406	721
28074	337	407	709
28075	337	408	741
28076	337	409	717
28077	337	410	761
28078	337	411	614
28079	337	412	639
28080	337	413	714
28081	337	414	724
28082	337	415	674
28083	337	416	795
28084	337	417	768
28085	337	418	774
28086	337	419	799
28087	337	420	779
28088	337	421	732
28089	337	422	902
28090	337	423	826
28091	337	424	867
28092	337	425	878
28093	337	426	841
28094	337	427	813
28095	337	428	844
28096	337	429	849
28097	337	430	869
28098	337	431	922
28099	337	432	911
28100	337	433	898
28101	337	434	908
28102	337	435	951
28103	337	436	929
28104	337	437	944
28105	337	438	949
28106	337	439	964
28107	337	440	972
28108	337	441	970
28109	337	442	978
28110	337	443	984
28111	337	444	989
28112	337	445	999
28113	337	446	1011
28114	337	447	1024
28115	337	448	1034
28116	337	449	999
28117	337	450	1009
28118	337	451	1017
28119	337	452	1028
28120	337	453	1052
28121	337	454	1049
28122	337	455	1072
28123	337	456	1117
28124	337	457	936
28125	337	458	942
28126	337	459	976
28127	337	460	996
28128	337	461	1007
28129	337	462	1030
28130	337	463	1090
28131	337	464	1110
28132	337	465	1120
28133	337	466	1086
28134	337	467	1101
28135	337	468	1015
28136	337	469	995
28137	337	470	1061
28138	337	471	1073
28139	337	472	1076
28140	337	473	1076
28141	337	474	1081
28142	337	475	1076
28143	337	476	1081
28144	337	477	1091
28145	337	478	1110
28146	337	479	1116
28147	337	480	1108
28148	337	481	1166
28149	337	482	1131
28150	337	483	1155
28151	337	484	1088
28152	337	485	1441
28153	337	486	1109
28154	337	487	1124
28155	337	488	1149
28156	337	489	1210
28157	337	490	1188
28158	337	491	1178
28159	337	492	1149
28160	338	339	107
28161	338	340	70
28162	338	341	80
28163	338	342	70
28164	338	343	104
28165	338	344	106
28166	338	345	104
28167	338	346	207
28168	338	347	167
28169	338	348	322
28170	338	349	324
28171	338	350	338
28172	338	351	202
28173	338	352	162
28174	338	353	158
28175	338	354	157
28176	338	355	161
28177	338	356	147
28178	338	357	162
28179	338	358	177
28180	338	359	182
28181	338	360	187
28182	338	361	202
28183	338	362	207
28184	338	363	301
28185	338	364	309
28186	338	365	326
28187	338	366	351
28188	338	367	362
28189	338	368	346
28190	338	369	325
28191	338	370	342
28192	338	371	353
28193	338	372	387
28194	338	373	391
28195	338	374	430
28196	338	375	455
28197	338	376	360
28198	338	377	475
28199	338	378	452
28200	338	379	485
28201	338	380	443
28202	338	381	490
28203	338	382	460
28204	338	383	482
28205	338	384	437
28206	338	385	473
28207	338	386	463
28208	338	387	450
28209	338	388	457
28210	338	389	467
28211	338	390	562
28212	338	391	522
28213	338	392	507
28214	338	393	517
28215	338	394	481
28216	338	395	557
28217	338	396	567
28218	338	397	523
28219	338	398	533
28220	338	399	535
28221	338	400	550
28222	338	401	610
28223	338	402	593
28224	338	403	560
28225	338	404	595
28226	338	405	640
28227	338	406	727
28228	338	407	715
28229	338	408	747
28230	338	409	723
28231	338	410	767
28232	338	411	620
28233	338	412	645
28234	338	413	720
28235	338	414	730
28236	338	415	680
28237	338	416	801
28238	338	417	774
28239	338	418	780
28240	338	419	805
28241	338	420	785
28242	338	421	738
28243	338	422	908
28244	338	423	832
28245	338	424	873
28246	338	425	884
28247	338	426	847
28248	338	427	819
28249	338	428	850
28250	338	429	855
28251	338	430	875
28252	338	431	928
28253	338	432	917
28254	338	433	904
28255	338	434	914
28256	338	435	957
28257	338	436	935
28258	338	437	950
28259	338	438	955
28260	338	439	970
28261	338	440	978
28262	338	441	976
28263	338	442	984
28264	338	443	990
28265	338	444	995
28266	338	445	1005
28267	338	446	1017
28268	338	447	1030
28269	338	448	1040
28270	338	449	1005
28271	338	450	1015
28272	338	451	1023
28273	338	452	1034
28274	338	453	1058
28275	338	454	1055
28276	338	455	1078
28277	338	456	1123
28278	338	457	942
28279	338	458	948
28280	338	459	982
28281	338	460	1002
28282	338	461	1013
28283	338	462	1036
28284	338	463	1096
28285	338	464	1116
28286	338	465	1126
28287	338	466	1092
28288	338	467	1107
28289	338	468	1021
28290	338	469	1001
28291	338	470	1067
28292	338	471	1079
28293	338	472	1082
28294	338	473	1082
28295	338	474	1087
28296	338	475	1082
28297	338	476	1087
28298	338	477	1097
28299	338	478	1116
28300	338	479	1122
28301	338	480	1114
28302	338	481	1172
28303	338	482	1137
28304	338	483	1161
28305	338	484	1094
28306	338	485	1447
28307	338	486	1115
28308	338	487	1130
28309	338	488	1155
28310	338	489	1216
28311	338	490	1194
28312	338	491	1184
28313	338	492	1155
28314	339	340	125
28315	339	341	143
28316	339	342	150
28317	339	343	175
28318	339	344	172
28319	339	345	175
28320	339	346	250
28321	339	347	247
28322	339	348	265
28323	339	349	267
28324	339	350	281
28325	339	351	282
28326	339	352	195
28327	339	353	191
28328	339	354	190
28329	339	355	194
28330	339	356	180
28331	339	357	185
28332	339	358	200
28333	339	359	205
28334	339	360	210
28335	339	361	240
28336	339	362	244
28337	339	363	324
28338	339	364	332
28339	339	365	349
28340	339	366	374
28341	339	367	385
28342	339	368	369
28343	339	369	365
28344	339	370	385
28345	339	371	396
28346	339	372	430
28347	339	373	414
28348	339	374	470
28349	339	375	495
28350	339	376	400
28351	339	377	515
28352	339	378	492
28353	339	379	525
28354	339	380	483
28355	339	381	530
28356	339	382	500
28357	339	383	522
28358	339	384	480
28359	339	385	513
28360	339	386	503
28361	339	387	490
28362	339	388	497
28363	339	389	507
28364	339	390	602
28365	339	391	562
28366	339	392	547
28367	339	393	557
28368	339	394	521
28369	339	395	597
28370	339	396	607
28371	339	397	563
28372	339	398	573
28373	339	399	575
28374	339	400	590
28375	339	401	650
28376	339	402	633
28377	339	403	600
28378	339	404	635
28379	339	405	680
28380	339	406	767
28381	339	407	755
28382	339	408	787
28383	339	409	763
28384	339	410	807
28385	339	411	660
28386	339	412	685
28387	339	413	760
28388	339	414	770
28389	339	415	720
28390	339	416	841
28391	339	417	814
28392	339	418	820
28393	339	419	845
28394	339	420	825
28395	339	421	778
28396	339	422	948
28397	339	423	872
28398	339	424	913
28399	339	425	924
28400	339	426	887
28401	339	427	859
28402	339	428	890
28403	339	429	895
28404	339	430	915
28405	339	431	968
28406	339	432	957
28407	339	433	944
28408	339	434	954
28409	339	435	997
28410	339	436	975
28411	339	437	990
28412	339	438	995
28413	339	439	1010
28414	339	440	1018
28415	339	441	1016
28416	339	442	1024
28417	339	443	1030
28418	339	444	1035
28419	339	445	1045
28420	339	446	1057
28421	339	447	1070
28422	339	448	1080
28423	339	449	1045
28424	339	450	1055
28425	339	451	1063
28426	339	452	1074
28427	339	453	1098
28428	339	454	1095
28429	339	455	1118
28430	339	456	1163
28431	339	457	982
28432	339	458	988
28433	339	459	1022
28434	339	460	1042
28435	339	461	1053
28436	339	462	1076
28437	339	463	1136
28438	339	464	1156
28439	339	465	1166
28440	339	466	1132
28441	339	467	1147
28442	339	468	1061
28443	339	469	1041
28444	339	470	1107
28445	339	471	1119
28446	339	472	1122
28447	339	473	1122
28448	339	474	1127
28449	339	475	1122
28450	339	476	1127
28451	339	477	1137
28452	339	478	1156
28453	339	479	1162
28454	339	480	1154
28455	339	481	1212
28456	339	482	1177
28457	339	483	1201
28458	339	484	1134
28459	339	485	1487
28460	339	486	1155
28461	339	487	1170
28462	339	488	1195
28463	339	489	1256
28464	339	490	1234
28465	339	491	1224
28466	339	492	1195
28467	340	341	20
28468	340	342	36
28469	340	343	68
28470	340	344	66
28471	340	345	68
28472	340	346	140
28473	340	347	133
28474	340	348	126
28475	340	349	128
28476	340	350	142
28477	340	351	168
28478	340	352	85
28479	340	353	81
28480	340	354	80
28481	340	355	84
28482	340	356	70
28483	340	357	75
28484	340	358	90
28485	340	359	95
28486	340	360	100
28487	340	361	130
28488	340	362	134
28489	340	363	199
28490	340	364	207
28491	340	365	245
28492	340	366	280
28493	340	367	291
28494	340	368	245
28495	340	369	240
28496	340	370	260
28497	340	371	271
28498	340	372	306
28499	340	373	289
28500	340	374	345
28501	340	375	370
28502	340	376	275
28503	340	377	390
28504	340	378	367
28505	340	379	400
28506	340	380	358
28507	340	381	405
28508	340	382	375
28509	340	383	397
28510	340	384	355
28511	340	385	388
28512	340	386	378
28513	340	387	365
28514	340	388	372
28515	340	389	382
28516	340	390	477
28517	340	391	437
28518	340	392	422
28519	340	393	432
28520	340	394	396
28521	340	395	472
28522	340	396	482
28523	340	397	438
28524	340	398	448
28525	340	399	430
28526	340	400	445
28527	340	401	525
28528	340	402	508
28529	340	403	475
28530	340	404	510
28531	340	405	555
28532	340	406	642
28533	340	407	630
28534	340	408	662
28535	340	409	638
28536	340	410	682
28537	340	411	535
28538	340	412	560
28539	340	413	635
28540	340	414	645
28541	340	415	595
28542	340	416	716
28543	340	417	689
28544	340	418	695
28545	340	419	720
28546	340	420	700
28547	340	421	653
28548	340	422	823
28549	340	423	747
28550	340	424	788
28551	340	425	799
28552	340	426	762
28553	340	427	734
28554	340	428	765
28555	340	429	770
28556	340	430	790
28557	340	431	843
28558	340	432	832
28559	340	433	819
28560	340	434	829
28561	340	435	872
28562	340	436	850
28563	340	437	865
28564	340	438	870
28565	340	439	885
28566	340	440	893
28567	340	441	891
28568	340	442	899
28569	340	443	905
28570	340	444	910
28571	340	445	920
28572	340	446	932
28573	340	447	945
28574	340	448	955
28575	340	449	920
28576	340	450	930
28577	340	451	938
28578	340	452	949
28579	340	453	973
28580	340	454	970
28581	340	455	993
28582	340	456	1038
28583	340	457	857
28584	340	458	863
28585	340	459	897
28586	340	460	917
28587	340	461	928
28588	340	462	951
28589	340	463	1011
28590	340	464	1031
28591	340	465	1041
28592	340	466	1007
28593	340	467	1022
28594	340	468	936
28595	340	469	916
28596	340	470	982
28597	340	471	994
28598	340	472	997
28599	340	473	997
28600	340	474	1002
28601	340	475	997
28602	340	476	1002
28603	340	477	1012
28604	340	478	1031
28605	340	479	1037
28606	340	480	1029
28607	340	481	1087
28608	340	482	1052
28609	340	483	1076
28610	340	484	1009
28611	340	485	1362
28612	340	486	1030
28613	340	487	1045
28614	340	488	1070
28615	340	489	1131
28616	340	490	1109
28617	340	491	1099
28618	340	492	1070
28619	341	342	28
28620	341	343	52
28621	341	344	50
28622	341	345	52
28623	341	346	127
28624	341	347	125
28625	341	348	113
28626	341	349	115
28627	341	350	129
28628	341	351	155
28629	341	352	72
28630	341	353	68
28631	341	354	67
28632	341	355	71
28633	341	356	57
28634	341	357	62
28635	341	358	77
28636	341	359	82
28637	341	360	87
28638	341	361	117
28639	341	362	121
28640	341	363	186
28641	341	364	194
28642	341	365	227
28643	341	366	262
28644	341	367	273
28645	341	368	227
28646	341	369	227
28647	341	370	247
28648	341	371	258
28649	341	372	293
28650	341	373	276
28651	341	374	332
28652	341	375	357
28653	341	376	262
28654	341	377	377
28655	341	378	354
28656	341	379	387
28657	341	380	345
28658	341	381	392
28659	341	382	362
28660	341	383	384
28661	341	384	342
28662	341	385	375
28663	341	386	365
28664	341	387	352
28665	341	388	359
28666	341	389	369
28667	341	390	464
28668	341	391	424
28669	341	392	409
28670	341	393	419
28671	341	394	383
28672	341	395	459
28673	341	396	469
28674	341	397	425
28675	341	398	435
28676	341	399	417
28677	341	400	432
28678	341	401	512
28679	341	402	495
28680	341	403	462
28681	341	404	497
28682	341	405	542
28683	341	406	629
28684	341	407	617
28685	341	408	649
28686	341	409	625
28687	341	410	669
28688	341	411	522
28689	341	412	547
28690	341	413	622
28691	341	414	632
28692	341	415	582
28693	341	416	703
28694	341	417	676
28695	341	418	682
28696	341	419	707
28697	341	420	687
28698	341	421	640
28699	341	422	810
28700	341	423	734
28701	341	424	775
28702	341	425	786
28703	341	426	749
28704	341	427	721
28705	341	428	752
28706	341	429	757
28707	341	430	777
28708	341	431	830
28709	341	432	819
28710	341	433	806
28711	341	434	816
28712	341	435	859
28713	341	436	837
28714	341	437	852
28715	341	438	857
28716	341	439	872
28717	341	440	880
28718	341	441	878
28719	341	442	886
28720	341	443	892
28721	341	444	897
28722	341	445	907
28723	341	446	919
28724	341	447	932
28725	341	448	942
28726	341	449	907
28727	341	450	917
28728	341	451	925
28729	341	452	936
28730	341	453	960
28731	341	454	957
28732	341	455	980
28733	341	456	1025
28734	341	457	844
28735	341	458	850
28736	341	459	884
28737	341	460	904
28738	341	461	915
28739	341	462	938
28740	341	463	998
28741	341	464	1018
28742	341	465	1028
28743	341	466	994
28744	341	467	1009
28745	341	468	923
28746	341	469	903
28747	341	470	969
28748	341	471	981
28749	341	472	984
28750	341	473	984
28751	341	474	989
28752	341	475	984
28753	341	476	989
28754	341	477	999
28755	341	478	1018
28756	341	479	1024
28757	341	480	1016
28758	341	481	1074
28759	341	482	1039
28760	341	483	1063
28761	341	484	996
28762	341	485	1349
28763	341	486	1017
28764	341	487	1032
28765	341	488	1057
28766	341	489	1118
28767	341	490	1096
28768	341	491	1086
28769	341	492	1057
28770	342	343	42
28771	342	344	40
28772	342	345	34
28773	342	346	49
28774	342	347	97
28775	342	348	140
28776	342	349	143
28777	342	350	156
28778	342	351	132
28779	342	352	65
28780	342	353	61
28781	342	354	60
28782	342	355	62
28783	342	356	50
28784	342	357	65
28785	342	358	60
28786	342	359	105
28787	342	360	110
28788	342	361	120
28789	342	362	124
28790	342	363	204
28791	342	364	212
28792	342	365	229
28793	342	366	254
28794	342	367	265
28795	342	368	299
28796	342	369	235
28797	342	370	255
28798	342	371	265
28799	342	372	300
28800	342	373	294
28801	342	374	340
28802	342	375	365
28803	342	376	270
28804	342	377	385
28805	342	378	362
28806	342	379	395
28807	342	380	363
28808	342	381	387
28809	342	382	370
28810	342	383	395
28811	342	384	350
28812	342	385	383
28813	342	386	373
28814	342	387	360
28815	342	388	367
28816	342	389	377
28817	342	390	472
28818	342	391	432
28819	342	392	417
28820	342	393	427
28821	342	394	381
28822	342	395	469
28823	342	396	479
28824	342	397	433
28825	342	398	443
28826	342	399	445
28827	342	400	460
28828	342	401	520
28829	342	402	503
28830	342	403	470
28831	342	404	505
28832	342	405	550
28833	342	406	637
28834	342	407	625
28835	342	408	657
28836	342	409	633
28837	342	410	677
28838	342	411	530
28839	342	412	555
28840	342	413	630
28841	342	414	640
28842	342	415	590
28843	342	416	711
28844	342	417	684
28845	342	418	690
28846	342	419	715
28847	342	420	695
28848	342	421	648
28849	342	422	818
28850	342	423	742
28851	342	424	783
28852	342	425	794
28853	342	426	757
28854	342	427	729
28855	342	428	760
28856	342	429	765
28857	342	430	785
28858	342	431	838
28859	342	432	827
28860	342	433	814
28861	342	434	824
28862	342	435	867
28863	342	436	845
28864	342	437	860
28865	342	438	865
28866	342	439	880
28867	342	440	888
28868	342	441	886
28869	342	442	894
28870	342	443	900
28871	342	444	905
28872	342	445	915
28873	342	446	927
28874	342	447	940
28875	342	448	950
28876	342	449	915
28877	342	450	925
28878	342	451	933
28879	342	452	944
28880	342	453	968
28881	342	454	965
28882	342	455	988
28883	342	456	1033
28884	342	457	852
28885	342	458	858
28886	342	459	892
28887	342	460	912
28888	342	461	923
28889	342	462	946
28890	342	463	1006
28891	342	464	1026
28892	342	465	1036
28893	342	466	1002
28894	342	467	1017
28895	342	468	931
28896	342	469	911
28897	342	470	977
28898	342	471	989
28899	342	472	992
28900	342	473	992
28901	342	474	997
28902	342	475	992
28903	342	476	997
28904	342	477	1007
28905	342	478	1026
28906	342	479	1032
28907	342	480	1024
28908	342	481	1082
28909	342	482	1047
28910	342	483	1071
28911	342	484	1004
28912	342	485	1357
28913	342	486	1025
28914	342	487	1040
28915	342	488	1065
28916	342	489	1126
28917	342	490	1104
28918	342	491	1094
28919	342	492	1065
28920	343	344	2
28921	343	345	33
28922	343	346	77
28923	343	347	65
28924	343	348	125
28925	343	349	127
28926	343	350	141
28927	343	351	127
28928	343	352	37
28929	343	353	33
28930	343	354	32
28931	343	355	34
28932	343	356	22
28933	343	357	37
28934	343	358	40
28935	343	359	45
28936	343	360	50
28937	343	361	55
28938	343	362	69
28939	343	363	140
28940	343	364	148
28941	343	365	165
28942	343	366	190
28943	343	367	201
28944	343	368	185
28945	343	369	207
28946	343	370	227
28947	343	371	237
28948	343	372	272
28949	343	373	230
28950	343	374	312
28951	343	375	337
28952	343	376	242
28953	343	377	357
28954	343	378	334
28955	343	379	367
28956	343	380	335
28957	343	381	359
28958	343	382	342
28959	343	383	367
28960	343	384	322
28961	343	385	355
28962	343	386	345
28963	343	387	332
28964	343	388	339
28965	343	389	349
28966	343	390	444
28967	343	391	404
28968	343	392	389
28969	343	393	399
28970	343	394	353
28971	343	395	441
28972	343	396	451
28973	343	397	405
28974	343	398	415
28975	343	399	417
28976	343	400	432
28977	343	401	492
28978	343	402	475
28979	343	403	442
28980	343	404	477
28981	343	405	522
28982	343	406	609
28983	343	407	597
28984	343	408	629
28985	343	409	605
28986	343	410	649
28987	343	411	502
28988	343	412	527
28989	343	413	602
28990	343	414	612
28991	343	415	562
28992	343	416	683
28993	343	417	656
28994	343	418	662
28995	343	419	687
28996	343	420	667
28997	343	421	620
28998	343	422	790
28999	343	423	714
29000	343	424	755
29001	343	425	766
29002	343	426	729
29003	343	427	701
29004	343	428	732
29005	343	429	737
29006	343	430	757
29007	343	431	810
29008	343	432	799
29009	343	433	786
29010	343	434	796
29011	343	435	839
29012	343	436	817
29013	343	437	832
29014	343	438	837
29015	343	439	852
29016	343	440	860
29017	343	441	858
29018	343	442	866
29019	343	443	872
29020	343	444	877
29021	343	445	887
29022	343	446	899
29023	343	447	912
29024	343	448	922
29025	343	449	887
29026	343	450	897
29027	343	451	905
29028	343	452	916
29029	343	453	940
29030	343	454	937
29031	343	455	960
29032	343	456	1005
29033	343	457	824
29034	343	458	830
29035	343	459	864
29036	343	460	884
29037	343	461	895
29038	343	462	918
29039	343	463	978
29040	343	464	998
29041	343	465	1008
29042	343	466	974
29043	343	467	989
29044	343	468	903
29045	343	469	883
29046	343	470	949
29047	343	471	961
29048	343	472	964
29049	343	473	964
29050	343	474	969
29051	343	475	964
29052	343	476	969
29053	343	477	979
29054	343	478	998
29055	343	479	1004
29056	343	480	996
29057	343	481	1054
29058	343	482	1019
29059	343	483	1043
29060	343	484	976
29061	343	485	1329
29062	343	486	997
29063	343	487	1012
29064	343	488	1037
29065	343	489	1098
29066	343	490	1076
29067	343	491	1066
29068	343	492	1037
29069	344	345	31
29070	344	346	75
29071	344	347	67
29072	344	348	127
29073	344	349	129
29074	344	350	143
29075	344	351	125
29076	344	352	35
29077	344	353	31
29078	344	354	30
29079	344	355	32
29080	344	356	20
29081	344	357	35
29082	344	358	40
29083	344	359	45
29084	344	360	50
29085	344	361	65
29086	344	362	70
29087	344	363	138
29088	344	364	146
29089	344	365	163
29090	344	366	188
29091	344	367	199
29092	344	368	183
29093	344	369	205
29094	344	370	225
29095	344	371	235
29096	344	372	270
29097	344	373	228
29098	344	374	310
29099	344	375	335
29100	344	376	240
29101	344	377	355
29102	344	378	332
29103	344	379	365
29104	344	380	333
29105	344	381	357
29106	344	382	340
29107	344	383	365
29108	344	384	320
29109	344	385	353
29110	344	386	343
29111	344	387	330
29112	344	388	337
29113	344	389	347
29114	344	390	442
29115	344	391	402
29116	344	392	387
29117	344	393	397
29118	344	394	351
29119	344	395	439
29120	344	396	449
29121	344	397	403
29122	344	398	413
29123	344	399	415
29124	344	400	430
29125	344	401	490
29126	344	402	473
29127	344	403	440
29128	344	404	475
29129	344	405	520
29130	344	406	607
29131	344	407	595
29132	344	408	627
29133	344	409	603
29134	344	410	647
29135	344	411	500
29136	344	412	525
29137	344	413	600
29138	344	414	610
29139	344	415	560
29140	344	416	681
29141	344	417	654
29142	344	418	660
29143	344	419	685
29144	344	420	665
29145	344	421	618
29146	344	422	788
29147	344	423	712
29148	344	424	753
29149	344	425	764
29150	344	426	727
29151	344	427	699
29152	344	428	730
29153	344	429	735
29154	344	430	755
29155	344	431	808
29156	344	432	797
29157	344	433	784
29158	344	434	794
29159	344	435	837
29160	344	436	815
29161	344	437	830
29162	344	438	835
29163	344	439	850
29164	344	440	858
29165	344	441	856
29166	344	442	864
29167	344	443	870
29168	344	444	875
29169	344	445	885
29170	344	446	897
29171	344	447	910
29172	344	448	920
29173	344	449	885
29174	344	450	895
29175	344	451	903
29176	344	452	914
29177	344	453	938
29178	344	454	935
29179	344	455	958
29180	344	456	1003
29181	344	457	822
29182	344	458	828
29183	344	459	862
29184	344	460	882
29185	344	461	893
29186	344	462	916
29187	344	463	976
29188	344	464	996
29189	344	465	1006
29190	344	466	972
29191	344	467	987
29192	344	468	901
29193	344	469	881
29194	344	470	947
29195	344	471	959
29196	344	472	962
29197	344	473	962
29198	344	474	967
29199	344	475	962
29200	344	476	967
29201	344	477	977
29202	344	478	996
29203	344	479	1002
29204	344	480	994
29205	344	481	1052
29206	344	482	1017
29207	344	483	1041
29208	344	484	974
29209	344	485	1327
29210	344	486	995
29211	344	487	1010
29212	344	488	1035
29213	344	489	1096
29214	344	490	1074
29215	344	491	1064
29216	344	492	1035
29217	345	346	44
29218	345	347	65
29219	345	348	115
29220	345	349	117
29221	345	350	131
29222	345	351	76
29223	345	352	25
29224	345	353	21
29225	345	354	20
29226	345	355	22
29227	345	356	30
29228	345	357	45
29229	345	358	35
29230	345	359	40
29231	345	360	45
29232	345	361	55
29233	345	362	69
29234	345	363	140
29235	345	364	148
29236	345	365	165
29237	345	366	190
29238	345	367	201
29239	345	368	185
29240	345	369	195
29241	345	370	215
29242	345	371	226
29243	345	372	260
29244	345	373	230
29245	345	374	300
29246	345	375	325
29247	345	376	230
29248	345	377	345
29249	345	378	322
29250	345	379	355
29251	345	380	323
29252	345	381	347
29253	345	382	330
29254	345	383	355
29255	345	384	310
29256	345	385	343
29257	345	386	333
29258	345	387	320
29259	345	388	327
29260	345	389	337
29261	345	390	432
29262	345	391	392
29263	345	392	377
29264	345	393	387
29265	345	394	341
29266	345	395	429
29267	345	396	439
29268	345	397	393
29269	345	398	403
29270	345	399	405
29271	345	400	420
29272	345	401	480
29273	345	402	463
29274	345	403	430
29275	345	404	465
29276	345	405	510
29277	345	406	597
29278	345	407	585
29279	345	408	617
29280	345	409	593
29281	345	410	637
29282	345	411	490
29283	345	412	515
29284	345	413	590
29285	345	414	600
29286	345	415	550
29287	345	416	671
29288	345	417	644
29289	345	418	650
29290	345	419	675
29291	345	420	655
29292	345	421	608
29293	345	422	778
29294	345	423	702
29295	345	424	743
29296	345	425	754
29297	345	426	717
29298	345	427	689
29299	345	428	720
29300	345	429	725
29301	345	430	745
29302	345	431	798
29303	345	432	787
29304	345	433	774
29305	345	434	784
29306	345	435	827
29307	345	436	805
29308	345	437	820
29309	345	438	825
29310	345	439	840
29311	345	440	848
29312	345	441	846
29313	345	442	854
29314	345	443	860
29315	345	444	865
29316	345	445	875
29317	345	446	887
29318	345	447	900
29319	345	448	910
29320	345	449	875
29321	345	450	885
29322	345	451	893
29323	345	452	904
29324	345	453	928
29325	345	454	925
29326	345	455	948
29327	345	456	993
29328	345	457	812
29329	345	458	818
29330	345	459	852
29331	345	460	872
29332	345	461	883
29333	345	462	906
29334	345	463	966
29335	345	464	986
29336	345	465	996
29337	345	466	962
29338	345	467	977
29339	345	468	891
29340	345	469	871
29341	345	470	937
29342	345	471	949
29343	345	472	952
29344	345	473	952
29345	345	474	957
29346	345	475	952
29347	345	476	957
29348	345	477	967
29349	345	478	986
29350	345	479	992
29351	345	480	984
29352	345	481	1042
29353	345	482	1007
29354	345	483	1031
29355	345	484	964
29356	345	485	1317
29357	345	486	985
29358	345	487	1000
29359	345	488	1025
29360	345	489	1086
29361	345	490	1064
29362	345	491	1054
29363	345	492	1025
29364	346	347	40
29365	346	348	130
29366	346	349	132
29367	346	350	146
29368	346	351	71
29369	346	352	65
29370	346	353	61
29371	346	354	60
29372	346	355	62
29373	346	356	70
29374	346	357	85
29375	346	358	65
29376	346	359	70
29377	346	360	75
29378	346	361	85
29379	346	362	89
29380	346	363	169
29381	346	364	177
29382	346	365	194
29383	346	366	219
29384	346	367	230
29385	346	368	214
29386	346	369	233
29387	346	370	255
29388	346	371	265
29389	346	372	300
29390	346	373	259
29391	346	374	338
29392	346	375	363
29393	346	376	268
29394	346	377	383
29395	346	378	360
29396	346	379	393
29397	346	380	361
29398	346	381	385
29399	346	382	368
29400	346	383	393
29401	346	384	348
29402	346	385	381
29403	346	386	371
29404	346	387	358
29405	346	388	365
29406	346	389	375
29407	346	390	470
29408	346	391	430
29409	346	392	415
29410	346	393	425
29411	346	394	379
29412	346	395	467
29413	346	396	477
29414	346	397	431
29415	346	398	441
29416	346	399	443
29417	346	400	458
29418	346	401	518
29419	346	402	501
29420	346	403	468
29421	346	404	503
29422	346	405	548
29423	346	406	635
29424	346	407	623
29425	346	408	655
29426	346	409	631
29427	346	410	675
29428	346	411	528
29429	346	412	553
29430	346	413	628
29431	346	414	638
29432	346	415	588
29433	346	416	709
29434	346	417	682
29435	346	418	688
29436	346	419	713
29437	346	420	693
29438	346	421	646
29439	346	422	816
29440	346	423	740
29441	346	424	781
29442	346	425	792
29443	346	426	755
29444	346	427	727
29445	346	428	758
29446	346	429	763
29447	346	430	783
29448	346	431	836
29449	346	432	825
29450	346	433	812
29451	346	434	822
29452	346	435	865
29453	346	436	843
29454	346	437	858
29455	346	438	863
29456	346	439	878
29457	346	440	886
29458	346	441	884
29459	346	442	892
29460	346	443	898
29461	346	444	903
29462	346	445	913
29463	346	446	925
29464	346	447	938
29465	346	448	948
29466	346	449	913
29467	346	450	923
29468	346	451	931
29469	346	452	942
29470	346	453	966
29471	346	454	963
29472	346	455	986
29473	346	456	1031
29474	346	457	850
29475	346	458	856
29476	346	459	890
29477	346	460	910
29478	346	461	921
29479	346	462	944
29480	346	463	1004
29481	346	464	1024
29482	346	465	1034
29483	346	466	1000
29484	346	467	1015
29485	346	468	929
29486	346	469	909
29487	346	470	975
29488	346	471	987
29489	346	472	990
29490	346	473	990
29491	346	474	995
29492	346	475	990
29493	346	476	995
29494	346	477	1005
29495	346	478	1024
29496	346	479	1030
29497	346	480	1022
29498	346	481	1080
29499	346	482	1045
29500	346	483	1069
29501	346	484	1002
29502	346	485	1355
29503	346	486	1023
29504	346	487	1038
29505	346	488	1063
29506	346	489	1124
29507	346	490	1102
29508	346	491	1092
29509	346	492	1063
29510	347	348	120
29511	347	349	122
29512	347	350	136
29513	347	351	35
29514	347	352	40
29515	347	353	36
29516	347	354	35
29517	347	355	37
29518	347	356	75
29519	347	357	98
29520	347	358	35
29521	347	359	40
29522	347	360	35
29523	347	361	55
29524	347	362	59
29525	347	363	140
29526	347	364	148
29527	347	365	165
29528	347	366	190
29529	347	367	201
29530	347	368	185
29531	347	369	210
29532	347	370	230
29533	347	371	240
29534	347	372	275
29535	347	373	230
29536	347	374	315
29537	347	375	340
29538	347	376	245
29539	347	377	360
29540	347	378	337
29541	347	379	370
29542	347	380	338
29543	347	381	362
29544	347	382	345
29545	347	383	370
29546	347	384	325
29547	347	385	358
29548	347	386	348
29549	347	387	335
29550	347	388	342
29551	347	389	352
29552	347	390	447
29553	347	391	407
29554	347	392	392
29555	347	393	402
29556	347	394	356
29557	347	395	444
29558	347	396	454
29559	347	397	408
29560	347	398	418
29561	347	399	420
29562	347	400	435
29563	347	401	495
29564	347	402	478
29565	347	403	445
29566	347	404	480
29567	347	405	525
29568	347	406	612
29569	347	407	600
29570	347	408	632
29571	347	409	608
29572	347	410	652
29573	347	411	505
29574	347	412	530
29575	347	413	605
29576	347	414	615
29577	347	415	565
29578	347	416	686
29579	347	417	659
29580	347	418	665
29581	347	419	690
29582	347	420	670
29583	347	421	623
29584	347	422	793
29585	347	423	717
29586	347	424	758
29587	347	425	769
29588	347	426	732
29589	347	427	704
29590	347	428	735
29591	347	429	740
29592	347	430	760
29593	347	431	813
29594	347	432	802
29595	347	433	789
29596	347	434	799
29597	347	435	842
29598	347	436	820
29599	347	437	835
29600	347	438	840
29601	347	439	855
29602	347	440	863
29603	347	441	861
29604	347	442	869
29605	347	443	875
29606	347	444	880
29607	347	445	890
29608	347	446	902
29609	347	447	915
29610	347	448	925
29611	347	449	890
29612	347	450	900
29613	347	451	908
29614	347	452	919
29615	347	453	943
29616	347	454	940
29617	347	455	963
29618	347	456	1008
29619	347	457	827
29620	347	458	833
29621	347	459	867
29622	347	460	887
29623	347	461	898
29624	347	462	921
29625	347	463	981
29626	347	464	1001
29627	347	465	1011
29628	347	466	977
29629	347	467	992
29630	347	468	906
29631	347	469	886
29632	347	470	952
29633	347	471	964
29634	347	472	967
29635	347	473	967
29636	347	474	972
29637	347	475	967
29638	347	476	972
29639	347	477	982
29640	347	478	1001
29641	347	479	1007
29642	347	480	999
29643	347	481	1057
29644	347	482	1022
29645	347	483	1046
29646	347	484	979
29647	347	485	1332
29648	347	486	1000
29649	347	487	1015
29650	347	488	1040
29651	347	489	1101
29652	347	490	1079
29653	347	491	1069
29654	347	492	1040
29655	348	349	2
29656	348	350	16
29657	348	351	157
29658	348	352	95
29659	348	353	91
29660	348	354	90
29661	348	355	92
29662	348	356	90
29663	348	357	105
29664	348	358	76
29665	348	359	71
29666	348	360	60
29667	348	361	50
29668	348	362	46
29669	348	363	126
29670	348	364	134
29671	348	365	151
29672	348	366	176
29673	348	367	187
29674	348	368	171
29675	348	369	255
29676	348	370	275
29677	348	371	285
29678	348	372	320
29679	348	373	216
29680	348	374	360
29681	348	375	385
29682	348	376	290
29683	348	377	405
29684	348	378	382
29685	348	379	415
29686	348	380	383
29687	348	381	407
29688	348	382	390
29689	348	383	415
29690	348	384	370
29691	348	385	403
29692	348	386	393
29693	348	387	380
29694	348	388	387
29695	348	389	397
29696	348	390	492
29697	348	391	452
29698	348	392	437
29699	348	393	447
29700	348	394	401
29701	348	395	489
29702	348	396	499
29703	348	397	453
29704	348	398	463
29705	348	399	465
29706	348	400	480
29707	348	401	540
29708	348	402	523
29709	348	403	490
29710	348	404	525
29711	348	405	570
29712	348	406	657
29713	348	407	645
29714	348	408	677
29715	348	409	653
29716	348	410	697
29717	348	411	550
29718	348	412	575
29719	348	413	650
29720	348	414	660
29721	348	415	610
29722	348	416	731
29723	348	417	704
29724	348	418	710
29725	348	419	735
29726	348	420	715
29727	348	421	668
29728	348	422	838
29729	348	423	762
29730	348	424	803
29731	348	425	814
29732	348	426	777
29733	348	427	749
29734	348	428	780
29735	348	429	785
29736	348	430	805
29737	348	431	858
29738	348	432	847
29739	348	433	834
29740	348	434	844
29741	348	435	887
29742	348	436	865
29743	348	437	880
29744	348	438	885
29745	348	439	900
29746	348	440	908
29747	348	441	906
29748	348	442	914
29749	348	443	920
29750	348	444	925
29751	348	445	935
29752	348	446	947
29753	348	447	960
29754	348	448	970
29755	348	449	935
29756	348	450	945
29757	348	451	953
29758	348	452	964
29759	348	453	988
29760	348	454	985
29761	348	455	1008
29762	348	456	1053
29763	348	457	872
29764	348	458	878
29765	348	459	912
29766	348	460	932
29767	348	461	943
29768	348	462	966
29769	348	463	1026
29770	348	464	1046
29771	348	465	1056
29772	348	466	1022
29773	348	467	1037
29774	348	468	951
29775	348	469	931
29776	348	470	997
29777	348	471	1009
29778	348	472	1012
29779	348	473	1012
29780	348	474	1017
29781	348	475	1012
29782	348	476	1017
29783	348	477	1027
29784	348	478	1046
29785	348	479	1052
29786	348	480	1044
29787	348	481	1102
29788	348	482	1067
29789	348	483	1091
29790	348	484	1024
29791	348	485	1377
29792	348	486	1045
29793	348	487	1060
29794	348	488	1085
29795	348	489	1146
29796	348	490	1124
29797	348	491	1114
29798	348	492	1085
29799	349	350	18
29800	349	351	159
29801	349	352	87
29802	349	353	83
29803	349	354	82
29804	349	355	84
29805	349	356	92
29806	349	357	107
29807	349	358	78
29808	349	359	73
29809	349	360	68
29810	349	361	43
29811	349	362	48
29812	349	363	128
29813	349	364	136
29814	349	365	133
29815	349	366	178
29816	349	367	189
29817	349	368	173
29818	349	369	257
29819	349	370	277
29820	349	371	288
29821	349	372	322
29822	349	373	318
29823	349	374	362
29824	349	375	387
29825	349	376	292
29826	349	377	407
29827	349	378	384
29828	349	379	417
29829	349	380	385
29830	349	381	409
29831	349	382	392
29832	349	383	417
29833	349	384	372
29834	349	385	405
29835	349	386	395
29836	349	387	382
29837	349	388	389
29838	349	389	399
29839	349	390	494
29840	349	391	454
29841	349	392	439
29842	349	393	449
29843	349	394	403
29844	349	395	491
29845	349	396	501
29846	349	397	455
29847	349	398	465
29848	349	399	467
29849	349	400	482
29850	349	401	542
29851	349	402	525
29852	349	403	492
29853	349	404	527
29854	349	405	572
29855	349	406	659
29856	349	407	647
29857	349	408	679
29858	349	409	655
29859	349	410	699
29860	349	411	552
29861	349	412	577
29862	349	413	652
29863	349	414	662
29864	349	415	612
29865	349	416	733
29866	349	417	706
29867	349	418	712
29868	349	419	737
29869	349	420	717
29870	349	421	670
29871	349	422	840
29872	349	423	764
29873	349	424	805
29874	349	425	816
29875	349	426	779
29876	349	427	751
29877	349	428	782
29878	349	429	787
29879	349	430	807
29880	349	431	860
29881	349	432	849
29882	349	433	836
29883	349	434	846
29884	349	435	889
29885	349	436	867
29886	349	437	882
29887	349	438	887
29888	349	439	902
29889	349	440	910
29890	349	441	908
29891	349	442	916
29892	349	443	922
29893	349	444	927
29894	349	445	937
29895	349	446	949
29896	349	447	962
29897	349	448	972
29898	349	449	937
29899	349	450	947
29900	349	451	955
29901	349	452	966
29902	349	453	990
29903	349	454	987
29904	349	455	1010
29905	349	456	1055
29906	349	457	874
29907	349	458	880
29908	349	459	914
29909	349	460	934
29910	349	461	945
29911	349	462	968
29912	349	463	1028
29913	349	464	1048
29914	349	465	1058
29915	349	466	1024
29916	349	467	1039
29917	349	468	953
29918	349	469	933
29919	349	470	999
29920	349	471	1011
29921	349	472	1014
29922	349	473	1014
29923	349	474	1019
29924	349	475	1014
29925	349	476	1019
29926	349	477	1029
29927	349	478	1048
29928	349	479	1054
29929	349	480	1046
29930	349	481	1104
29931	349	482	1069
29932	349	483	1093
29933	349	484	1026
29934	349	485	1379
29935	349	486	1047
29936	349	487	1062
29937	349	488	1087
29938	349	489	1148
29939	349	490	1126
29940	349	491	1116
29941	349	492	1087
29942	350	351	173
29943	350	352	101
29944	350	353	97
29945	350	354	96
29946	350	355	98
29947	350	356	105
29948	350	357	120
29949	350	358	92
29950	350	359	77
29951	350	360	72
29952	350	361	66
29953	350	362	52
29954	350	363	132
29955	350	364	140
29956	350	365	157
29957	350	366	182
29958	350	367	193
29959	350	368	177
29960	350	369	271
29961	350	370	291
29962	350	371	301
29963	350	372	336
29964	350	373	223
29965	350	374	376
29966	350	375	401
29967	350	376	306
29968	350	377	421
29969	350	378	398
29970	350	379	431
29971	350	380	399
29972	350	381	423
29973	350	382	406
29974	350	383	431
29975	350	384	386
29976	350	385	419
29977	350	386	409
29978	350	387	396
29979	350	388	403
29980	350	389	413
29981	350	390	508
29982	350	391	468
29983	350	392	453
29984	350	393	463
29985	350	394	417
29986	350	395	505
29987	350	396	515
29988	350	397	469
29989	350	398	479
29990	350	399	481
29991	350	400	496
29992	350	401	556
29993	350	402	539
29994	350	403	506
29995	350	404	541
29996	350	405	586
29997	350	406	673
29998	350	407	661
29999	350	408	693
30000	350	409	669
30001	350	410	713
30002	350	411	566
30003	350	412	591
30004	350	413	666
30005	350	414	676
30006	350	415	626
30007	350	416	747
30008	350	417	720
30009	350	418	726
30010	350	419	751
30011	350	420	731
30012	350	421	684
30013	350	422	854
30014	350	423	778
30015	350	424	819
30016	350	425	830
30017	350	426	793
30018	350	427	765
30019	350	428	796
30020	350	429	801
30021	350	430	821
30022	350	431	874
30023	350	432	863
30024	350	433	850
30025	350	434	860
30026	350	435	903
30027	350	436	881
30028	350	437	896
30029	350	438	901
30030	350	439	916
30031	350	440	924
30032	350	441	922
30033	350	442	930
30034	350	443	936
30035	350	444	941
30036	350	445	951
30037	350	446	963
30038	350	447	976
30039	350	448	986
30040	350	449	951
30041	350	450	961
30042	350	451	969
30043	350	452	980
30044	350	453	1004
30045	350	454	1001
30046	350	455	1024
30047	350	456	1069
30048	350	457	888
30049	350	458	894
30050	350	459	928
30051	350	460	948
30052	350	461	959
30053	350	462	982
30054	350	463	1042
30055	350	464	1062
30056	350	465	1072
30057	350	466	1038
30058	350	467	1053
30059	350	468	967
30060	350	469	947
30061	350	470	1013
30062	350	471	1025
30063	350	472	1028
30064	350	473	1028
30065	350	474	1033
30066	350	475	1028
30067	350	476	1033
30068	350	477	1043
30069	350	478	1062
30070	350	479	1068
30071	350	480	1060
30072	350	481	1118
30073	350	482	1083
30074	350	483	1107
30075	350	484	1040
30076	350	485	1393
30077	350	486	1061
30078	350	487	1076
30079	350	488	1101
30080	350	489	1162
30081	350	490	1140
30082	350	491	1130
30083	350	492	1101
30084	351	352	75
30085	351	353	71
30086	351	354	70
30087	351	355	72
30088	351	356	88
30089	351	357	95
30090	351	358	70
30091	351	359	65
30092	351	360	70
30093	351	361	89
30094	351	362	94
30095	351	363	35
30096	351	364	42
30097	351	365	60
30098	351	366	85
30099	351	367	100
30100	351	368	90
30101	351	369	87
30102	351	370	107
30103	351	371	118
30104	351	372	153
30105	351	373	120
30106	351	374	192
30107	351	375	217
30108	351	376	122
30109	351	377	237
30110	351	378	214
30111	351	379	247
30112	351	380	215
30113	351	381	239
30114	351	382	222
30115	351	383	247
30116	351	384	202
30117	351	385	235
30118	351	386	225
30119	351	387	212
30120	351	388	219
30121	351	389	229
30122	351	390	324
30123	351	391	284
30124	351	392	269
30125	351	393	279
30126	351	394	233
30127	351	395	321
30128	351	396	331
30129	351	397	285
30130	351	398	295
30131	351	399	297
30132	351	400	312
30133	351	401	372
30134	351	402	355
30135	351	403	322
30136	351	404	357
30137	351	405	402
30138	351	406	489
30139	351	407	477
30140	351	408	509
30141	351	409	485
30142	351	410	529
30143	351	411	382
30144	351	412	407
30145	351	413	482
30146	351	414	492
30147	351	415	442
30148	351	416	563
30149	351	417	536
30150	351	418	542
30151	351	419	567
30152	351	420	547
30153	351	421	500
30154	351	422	670
30155	351	423	594
30156	351	424	635
30157	351	425	646
30158	351	426	609
30159	351	427	581
30160	351	428	612
30161	351	429	617
30162	351	430	637
30163	351	431	690
30164	351	432	679
30165	351	433	666
30166	351	434	676
30167	351	435	719
30168	351	436	697
30169	351	437	712
30170	351	438	717
30171	351	439	732
30172	351	440	740
30173	351	441	738
30174	351	442	746
30175	351	443	752
30176	351	444	757
30177	351	445	767
30178	351	446	779
30179	351	447	792
30180	351	448	802
30181	351	449	767
30182	351	450	777
30183	351	451	785
30184	351	452	796
30185	351	453	820
30186	351	454	817
30187	351	455	840
30188	351	456	885
30189	351	457	704
30190	351	458	710
30191	351	459	744
30192	351	460	764
30193	351	461	775
30194	351	462	798
30195	351	463	858
30196	351	464	878
30197	351	465	888
30198	351	466	854
30199	351	467	869
30200	351	468	783
30201	351	469	763
30202	351	470	829
30203	351	471	841
30204	351	472	844
30205	351	473	844
30206	351	474	849
30207	351	475	844
30208	351	476	849
30209	351	477	859
30210	351	478	878
30211	351	479	884
30212	351	480	876
30213	351	481	934
30214	351	482	899
30215	351	483	923
30216	351	484	856
30217	351	485	1209
30218	351	486	877
30219	351	487	892
30220	351	488	917
30221	351	489	978
30222	351	490	956
30223	351	491	946
30224	351	492	917
30225	352	353	3
30226	352	354	5
30227	352	355	10
30228	352	356	35
30229	352	357	25
30230	352	358	25
30231	352	359	30
30232	352	360	40
30233	352	361	48
30234	352	362	55
30235	352	363	135
30236	352	364	140
30237	352	365	165
30238	352	366	200
30239	352	367	211
30240	352	368	200
30241	352	369	170
30242	352	370	190
30243	352	371	201
30244	352	372	245
30245	352	373	210
30246	352	374	275
30247	352	375	300
30248	352	376	205
30249	352	377	320
30250	352	378	297
30251	352	379	330
30252	352	380	298
30253	352	381	322
30254	352	382	305
30255	352	383	330
30256	352	384	285
30257	352	385	318
30258	352	386	308
30259	352	387	295
30260	352	388	315
30261	352	389	325
30262	352	390	407
30263	352	391	367
30264	352	392	352
30265	352	393	362
30266	352	394	316
30267	352	395	404
30268	352	396	414
30269	352	397	368
30270	352	398	378
30271	352	399	380
30272	352	400	395
30273	352	401	455
30274	352	402	438
30275	352	403	405
30276	352	404	440
30277	352	405	485
30278	352	406	572
30279	352	407	560
30280	352	408	592
30281	352	409	568
30282	352	410	612
30283	352	411	465
30284	352	412	490
30285	352	413	565
30286	352	414	575
30287	352	415	525
30288	352	416	646
30289	352	417	619
30290	352	418	625
30291	352	419	650
30292	352	420	630
30293	352	421	583
30294	352	422	753
30295	352	423	677
30296	352	424	645
30297	352	425	685
30298	352	426	692
30299	352	427	664
30300	352	428	695
30301	352	429	700
30302	352	430	720
30303	352	431	773
30304	352	432	762
30305	352	433	749
30306	352	434	759
30307	352	435	802
30308	352	436	780
30309	352	437	795
30310	352	438	800
30311	352	439	815
30312	352	440	823
30313	352	441	821
30314	352	442	829
30315	352	443	835
30316	352	444	840
30317	352	445	850
30318	352	446	862
30319	352	447	875
30320	352	448	885
30321	352	449	850
30322	352	450	860
30323	352	451	868
30324	352	452	879
30325	352	453	903
30326	352	454	900
30327	352	455	923
30328	352	456	968
30329	352	457	787
30330	352	458	793
30331	352	459	827
30332	352	460	847
30333	352	461	858
30334	352	462	881
30335	352	463	941
30336	352	464	961
30337	352	465	971
30338	352	466	937
30339	352	467	952
30340	352	468	866
30341	352	469	846
30342	352	470	912
30343	352	471	924
30344	352	472	927
30345	352	473	927
30346	352	474	932
30347	352	475	927
30348	352	476	932
30349	352	477	942
30350	352	478	961
30351	352	479	967
30352	352	480	959
30353	352	481	1017
30354	352	482	982
30355	352	483	1006
30356	352	484	939
30357	352	485	1292
30358	352	486	960
30359	352	487	975
30360	352	488	1000
30361	352	489	1061
30362	352	490	1039
30363	352	491	1029
30364	352	492	1000
30365	353	354	2
30366	353	355	7
30367	353	356	32
30368	353	357	22
30369	353	358	22
30370	353	359	27
30371	353	360	33
30372	353	361	42
30373	353	362	52
30374	353	363	132
30375	353	364	137
30376	353	365	162
30377	353	366	197
30378	353	367	208
30379	353	368	197
30380	353	369	167
30381	353	370	187
30382	353	371	198
30383	353	372	242
30384	353	373	207
30385	353	374	272
30386	353	375	297
30387	353	376	202
30388	353	377	317
30389	353	378	294
30390	353	379	327
30391	353	380	295
30392	353	381	319
30393	353	382	302
30394	353	383	327
30395	353	384	282
30396	353	385	315
30397	353	386	305
30398	353	387	292
30399	353	388	312
30400	353	389	322
30401	353	390	404
30402	353	391	364
30403	353	392	349
30404	353	393	359
30405	353	394	313
30406	353	395	401
30407	353	396	411
30408	353	397	365
30409	353	398	375
30410	353	399	377
30411	353	400	392
30412	353	401	452
30413	353	402	435
30414	353	403	402
30415	353	404	437
30416	353	405	482
30417	353	406	569
30418	353	407	557
30419	353	408	589
30420	353	409	565
30421	353	410	609
30422	353	411	462
30423	353	412	487
30424	353	413	562
30425	353	414	572
30426	353	415	522
30427	353	416	643
30428	353	417	616
30429	353	418	622
30430	353	419	647
30431	353	420	627
30432	353	421	580
30433	353	422	750
30434	353	423	674
30435	353	424	642
30436	353	425	682
30437	353	426	689
30438	353	427	661
30439	353	428	692
30440	353	429	697
30441	353	430	717
30442	353	431	770
30443	353	432	759
30444	353	433	746
30445	353	434	756
30446	353	435	799
30447	353	436	777
30448	353	437	792
30449	353	438	797
30450	353	439	812
30451	353	440	820
30452	353	441	818
30453	353	442	826
30454	353	443	832
30455	353	444	837
30456	353	445	847
30457	353	446	859
30458	353	447	872
30459	353	448	882
30460	353	449	847
30461	353	450	857
30462	353	451	865
30463	353	452	876
30464	353	453	900
30465	353	454	897
30466	353	455	920
30467	353	456	965
30468	353	457	784
30469	353	458	790
30470	353	459	824
30471	353	460	844
30472	353	461	855
30473	353	462	878
30474	353	463	938
30475	353	464	958
30476	353	465	968
30477	353	466	934
30478	353	467	949
30479	353	468	863
30480	353	469	843
30481	353	470	909
30482	353	471	921
30483	353	472	924
30484	353	473	924
30485	353	474	929
30486	353	475	924
30487	353	476	929
30488	353	477	939
30489	353	478	958
30490	353	479	964
30491	353	480	956
30492	353	481	1014
30493	353	482	979
30494	353	483	1003
30495	353	484	936
30496	353	485	1289
30497	353	486	957
30498	353	487	972
30499	353	488	997
30500	353	489	1058
30501	353	490	1036
30502	353	491	1026
30503	353	492	997
30504	354	355	5
30505	354	356	30
30506	354	357	20
30507	354	358	20
30508	354	359	25
30509	354	360	35
30510	354	361	45
30511	354	362	50
30512	354	363	130
30513	354	364	135
30514	354	365	160
30515	354	366	195
30516	354	367	206
30517	354	368	195
30518	354	369	165
30519	354	370	185
30520	354	371	196
30521	354	372	240
30522	354	373	205
30523	354	374	270
30524	354	375	295
30525	354	376	200
30526	354	377	315
30527	354	378	292
30528	354	379	325
30529	354	380	293
30530	354	381	317
30531	354	382	300
30532	354	383	325
30533	354	384	280
30534	354	385	313
30535	354	386	303
30536	354	387	290
30537	354	388	310
30538	354	389	320
30539	354	390	402
30540	354	391	362
30541	354	392	347
30542	354	393	357
30543	354	394	311
30544	354	395	399
30545	354	396	409
30546	354	397	363
30547	354	398	373
30548	354	399	375
30549	354	400	390
30550	354	401	450
30551	354	402	433
30552	354	403	400
30553	354	404	435
30554	354	405	480
30555	354	406	567
30556	354	407	555
30557	354	408	587
30558	354	409	563
30559	354	410	607
30560	354	411	460
30561	354	412	485
30562	354	413	560
30563	354	414	570
30564	354	415	520
30565	354	416	641
30566	354	417	614
30567	354	418	620
30568	354	419	645
30569	354	420	625
30570	354	421	578
30571	354	422	748
30572	354	423	672
30573	354	424	640
30574	354	425	680
30575	354	426	687
30576	354	427	659
30577	354	428	690
30578	354	429	695
30579	354	430	715
30580	354	431	768
30581	354	432	757
30582	354	433	744
30583	354	434	754
30584	354	435	797
30585	354	436	775
30586	354	437	790
30587	354	438	795
30588	354	439	810
30589	354	440	818
30590	354	441	816
30591	354	442	824
30592	354	443	830
30593	354	444	835
30594	354	445	845
30595	354	446	857
30596	354	447	870
30597	354	448	880
30598	354	449	845
30599	354	450	855
30600	354	451	863
30601	354	452	874
30602	354	453	898
30603	354	454	895
30604	354	455	918
30605	354	456	963
30606	354	457	782
30607	354	458	788
30608	354	459	822
30609	354	460	842
30610	354	461	853
30611	354	462	876
30612	354	463	936
30613	354	464	956
30614	354	465	966
30615	354	466	932
30616	354	467	947
30617	354	468	861
30618	354	469	841
30619	354	470	907
30620	354	471	919
30621	354	472	922
30622	354	473	922
30623	354	474	927
30624	354	475	922
30625	354	476	927
30626	354	477	937
30627	354	478	956
30628	354	479	962
30629	354	480	954
30630	354	481	1012
30631	354	482	977
30632	354	483	1001
30633	354	484	934
30634	354	485	1287
30635	354	486	955
30636	354	487	970
30637	354	488	995
30638	354	489	1056
30639	354	490	1034
30640	354	491	1024
30641	354	492	995
30642	355	356	24
30643	355	357	25
30644	355	358	25
30645	355	359	30
30646	355	360	40
30647	355	361	50
30648	355	362	55
30649	355	363	120
30650	355	364	128
30651	355	365	145
30652	355	366	180
30653	355	367	191
30654	355	368	180
30655	355	369	170
30656	355	370	190
30657	355	371	201
30658	355	372	245
30659	355	373	210
30660	355	374	275
30661	355	375	300
30662	355	376	205
30663	355	377	320
30664	355	378	297
30665	355	379	330
30666	355	380	298
30667	355	381	322
30668	355	382	305
30669	355	383	330
30670	355	384	285
30671	355	385	318
30672	355	386	308
30673	355	387	295
30674	355	388	315
30675	355	389	325
30676	355	390	407
30677	355	391	367
30678	355	392	352
30679	355	393	362
30680	355	394	316
30681	355	395	404
30682	355	396	414
30683	355	397	368
30684	355	398	378
30685	355	399	380
30686	355	400	395
30687	355	401	455
30688	355	402	438
30689	355	403	405
30690	355	404	440
30691	355	405	485
30692	355	406	572
30693	355	407	560
30694	355	408	592
30695	355	409	568
30696	355	410	612
30697	355	411	465
30698	355	412	490
30699	355	413	565
30700	355	414	575
30701	355	415	525
30702	355	416	646
30703	355	417	619
30704	355	418	625
30705	355	419	650
30706	355	420	630
30707	355	421	583
30708	355	422	753
30709	355	423	677
30710	355	424	645
30711	355	425	685
30712	355	426	692
30713	355	427	664
30714	355	428	695
30715	355	429	700
30716	355	430	720
30717	355	431	773
30718	355	432	762
30719	355	433	749
30720	355	434	759
30721	355	435	802
30722	355	436	780
30723	355	437	795
30724	355	438	800
30725	355	439	815
30726	355	440	823
30727	355	441	821
30728	355	442	829
30729	355	443	835
30730	355	444	840
30731	355	445	850
30732	355	446	862
30733	355	447	875
30734	355	448	885
30735	355	449	850
30736	355	450	860
30737	355	451	868
30738	355	452	879
30739	355	453	903
30740	355	454	900
30741	355	455	923
30742	355	456	968
30743	355	457	787
30744	355	458	793
30745	355	459	827
30746	355	460	847
30747	355	461	858
30748	355	462	881
30749	355	463	941
30750	355	464	961
30751	355	465	971
30752	355	466	937
30753	355	467	952
30754	355	468	866
30755	355	469	846
30756	355	470	912
30757	355	471	924
30758	355	472	927
30759	355	473	927
30760	355	474	932
30761	355	475	927
30762	355	476	932
30763	355	477	942
30764	355	478	961
30765	355	479	967
30766	355	480	959
30767	355	481	1017
30768	355	482	982
30769	355	483	1006
30770	355	484	939
30771	355	485	1292
30772	355	486	960
30773	355	487	975
30774	355	488	1000
30775	355	489	1061
30776	355	490	1039
30777	355	491	1029
30778	355	492	1000
30779	356	357	15
30780	356	358	30
30781	356	359	35
30782	356	360	40
30783	356	361	55
30784	356	362	60
30785	356	363	140
30786	356	364	148
30787	356	365	165
30788	356	366	215
30789	356	367	226
30790	356	368	210
30791	356	369	190
30792	356	370	210
30793	356	371	221
30794	356	372	261
30795	356	373	230
30796	356	374	295
30797	356	375	320
30798	356	376	225
30799	356	377	340
30800	356	378	317
30801	356	379	350
30802	356	380	318
30803	356	381	342
30804	356	382	325
30805	356	383	350
30806	356	384	305
30807	356	385	338
30808	356	386	328
30809	356	387	315
30810	356	388	330
30811	356	389	340
30812	356	390	427
30813	356	391	387
30814	356	392	372
30815	356	393	382
30816	356	394	336
30817	356	395	424
30818	356	396	434
30819	356	397	388
30820	356	398	398
30821	356	399	400
30822	356	400	415
30823	356	401	475
30824	356	402	458
30825	356	403	425
30826	356	404	460
30827	356	405	505
30828	356	406	592
30829	356	407	580
30830	356	408	612
30831	356	409	588
30832	356	410	632
30833	356	411	485
30834	356	412	510
30835	356	413	585
30836	356	414	595
30837	356	415	545
30838	356	416	666
30839	356	417	639
30840	356	418	645
30841	356	419	670
30842	356	420	650
30843	356	421	603
30844	356	422	773
30845	356	423	697
30846	356	424	665
30847	356	425	705
30848	356	426	712
30849	356	427	684
30850	356	428	715
30851	356	429	720
30852	356	430	740
30853	356	431	793
30854	356	432	782
30855	356	433	769
30856	356	434	779
30857	356	435	822
30858	356	436	800
30859	356	437	815
30860	356	438	820
30861	356	439	835
30862	356	440	843
30863	356	441	841
30864	356	442	849
30865	356	443	855
30866	356	444	860
30867	356	445	870
30868	356	446	882
30869	356	447	895
30870	356	448	905
30871	356	449	870
30872	356	450	880
30873	356	451	888
30874	356	452	899
30875	356	453	923
30876	356	454	920
30877	356	455	943
30878	356	456	988
30879	356	457	807
30880	356	458	813
30881	356	459	847
30882	356	460	867
30883	356	461	878
30884	356	462	901
30885	356	463	961
30886	356	464	981
30887	356	465	991
30888	356	466	957
30889	356	467	972
30890	356	468	886
30891	356	469	866
30892	356	470	932
30893	356	471	944
30894	356	472	947
30895	356	473	947
30896	356	474	952
30897	356	475	947
30898	356	476	952
30899	356	477	962
30900	356	478	981
30901	356	479	987
30902	356	480	979
30903	356	481	1037
30904	356	482	1002
30905	356	483	1026
30906	356	484	959
30907	356	485	1312
30908	356	486	980
30909	356	487	995
30910	356	488	1020
30911	356	489	1081
30912	356	490	1059
30913	356	491	1049
30914	356	492	1020
30915	357	358	15
30916	357	359	20
30917	357	360	25
30918	357	361	40
30919	357	362	45
30920	357	363	125
30921	357	364	133
30922	357	365	150
30923	357	366	200
30924	357	367	215
30925	357	368	195
30926	357	369	175
30927	357	370	195
30928	357	371	206
30929	357	372	240
30930	357	373	215
30931	357	374	280
30932	357	375	305
30933	357	376	210
30934	357	377	325
30935	357	378	302
30936	357	379	335
30937	357	380	303
30938	357	381	327
30939	357	382	310
30940	357	383	335
30941	357	384	290
30942	357	385	323
30943	357	386	313
30944	357	387	300
30945	357	388	315
30946	357	389	325
30947	357	390	412
30948	357	391	372
30949	357	392	357
30950	357	393	367
30951	357	394	321
30952	357	395	409
30953	357	396	419
30954	357	397	373
30955	357	398	383
30956	357	399	385
30957	357	400	400
30958	357	401	460
30959	357	402	443
30960	357	403	410
30961	357	404	445
30962	357	405	490
30963	357	406	577
30964	357	407	565
30965	357	408	597
30966	357	409	573
30967	357	410	617
30968	357	411	470
30969	357	412	495
30970	357	413	570
30971	357	414	580
30972	357	415	530
30973	357	416	651
30974	357	417	624
30975	357	418	630
30976	357	419	655
30977	357	420	635
30978	357	421	588
30979	357	422	758
30980	357	423	682
30981	357	424	650
30982	357	425	690
30983	357	426	697
30984	357	427	669
30985	357	428	700
30986	357	429	705
30987	357	430	725
30988	357	431	778
30989	357	432	767
30990	357	433	754
30991	357	434	764
30992	357	435	807
30993	357	436	785
30994	357	437	800
30995	357	438	805
30996	357	439	820
30997	357	440	828
30998	357	441	826
30999	357	442	834
31000	357	443	840
31001	357	444	845
31002	357	445	855
31003	357	446	867
31004	357	447	880
31005	357	448	890
31006	357	449	855
31007	357	450	865
31008	357	451	873
31009	357	452	884
31010	357	453	908
31011	357	454	905
31012	357	455	928
31013	357	456	973
31014	357	457	792
31015	357	458	798
31016	357	459	832
31017	357	460	852
31018	357	461	863
31019	357	462	886
31020	357	463	946
31021	357	464	966
31022	357	465	976
31023	357	466	942
31024	357	467	957
31025	357	468	871
31026	357	469	851
31027	357	470	917
31028	357	471	929
31029	357	472	932
31030	357	473	932
31031	357	474	937
31032	357	475	932
31033	357	476	937
31034	357	477	947
31035	357	478	966
31036	357	479	972
31037	357	480	964
31038	357	481	1022
31039	357	482	987
31040	357	483	1011
31041	357	484	944
31042	357	485	1297
31043	357	486	965
31044	357	487	980
31045	357	488	1005
31046	357	489	1066
31047	357	490	1044
31048	357	491	1034
31049	357	492	1005
31050	358	359	5
31051	358	360	10
31052	358	361	25
31053	358	362	30
31054	358	363	110
31055	358	364	115
31056	358	365	140
31057	358	366	175
31058	358	367	186
31059	358	368	175
31060	358	369	160
31061	358	370	180
31062	358	371	191
31063	358	372	225
31064	358	373	200
31065	358	374	265
31066	358	375	290
31067	358	376	195
31068	358	377	310
31069	358	378	287
31070	358	379	320
31071	358	380	288
31072	358	381	312
31073	358	382	295
31074	358	383	320
31075	358	384	275
31076	358	385	308
31077	358	386	298
31078	358	387	285
31079	358	388	305
31080	358	389	315
31081	358	390	397
31082	358	391	357
31083	358	392	342
31084	358	393	352
31085	358	394	306
31086	358	395	394
31087	358	396	404
31088	358	397	358
31089	358	398	368
31090	358	399	370
31091	358	400	385
31092	358	401	445
31093	358	402	428
31094	358	403	395
31095	358	404	430
31096	358	405	475
31097	358	406	562
31098	358	407	550
31099	358	408	582
31100	358	409	558
31101	358	410	602
31102	358	411	455
31103	358	412	480
31104	358	413	555
31105	358	414	565
31106	358	415	515
31107	358	416	636
31108	358	417	609
31109	358	418	615
31110	358	419	640
31111	358	420	620
31112	358	421	573
31113	358	422	743
31114	358	423	667
31115	358	424	635
31116	358	425	675
31117	358	426	682
31118	358	427	654
31119	358	428	685
31120	358	429	690
31121	358	430	710
31122	358	431	763
31123	358	432	752
31124	358	433	739
31125	358	434	749
31126	358	435	792
31127	358	436	770
31128	358	437	785
31129	358	438	790
31130	358	439	805
31131	358	440	813
31132	358	441	811
31133	358	442	819
31134	358	443	825
31135	358	444	830
31136	358	445	840
31137	358	446	852
31138	358	447	865
31139	358	448	875
31140	358	449	840
31141	358	450	850
31142	358	451	858
31143	358	452	869
31144	358	453	893
31145	358	454	890
31146	358	455	913
31147	358	456	958
31148	358	457	777
31149	358	458	783
31150	358	459	817
31151	358	460	837
31152	358	461	848
31153	358	462	871
31154	358	463	931
31155	358	464	951
31156	358	465	961
31157	358	466	927
31158	358	467	942
31159	358	468	856
31160	358	469	836
31161	358	470	902
31162	358	471	914
31163	358	472	917
31164	358	473	917
31165	358	474	922
31166	358	475	917
31167	358	476	922
31168	358	477	932
31169	358	478	951
31170	358	479	957
31171	358	480	949
31172	358	481	1007
31173	358	482	972
31174	358	483	996
31175	358	484	929
31176	358	485	1282
31177	358	486	950
31178	358	487	965
31179	358	488	990
31180	358	489	1051
31181	358	490	1029
31182	358	491	1019
31183	358	492	990
31184	359	360	5
31185	359	361	20
31186	359	362	25
31187	359	363	105
31188	359	364	123
31189	359	365	130
31190	359	366	180
31191	359	367	191
31192	359	368	175
31193	359	369	155
31194	359	370	175
31195	359	371	186
31196	359	372	220
31197	359	373	195
31198	359	374	260
31199	359	375	285
31200	359	376	190
31201	359	377	305
31202	359	378	282
31203	359	379	315
31204	359	380	283
31205	359	381	307
31206	359	382	290
31207	359	383	315
31208	359	384	270
31209	359	385	303
31210	359	386	293
31211	359	387	280
31212	359	388	300
31213	359	389	310
31214	359	390	392
31215	359	391	352
31216	359	392	337
31217	359	393	347
31218	359	394	301
31219	359	395	389
31220	359	396	399
31221	359	397	353
31222	359	398	363
31223	359	399	365
31224	359	400	380
31225	359	401	440
31226	359	402	423
31227	359	403	390
31228	359	404	425
31229	359	405	470
31230	359	406	557
31231	359	407	545
31232	359	408	577
31233	359	409	553
31234	359	410	597
31235	359	411	450
31236	359	412	475
31237	359	413	550
31238	359	414	560
31239	359	415	510
31240	359	416	631
31241	359	417	604
31242	359	418	610
31243	359	419	635
31244	359	420	615
31245	359	421	568
31246	359	422	738
31247	359	423	662
31248	359	424	630
31249	359	425	670
31250	359	426	677
31251	359	427	649
31252	359	428	680
31253	359	429	685
31254	359	430	705
31255	359	431	758
31256	359	432	747
31257	359	433	734
31258	359	434	744
31259	359	435	787
31260	359	436	765
31261	359	437	780
31262	359	438	785
31263	359	439	800
31264	359	440	808
31265	359	441	806
31266	359	442	814
31267	359	443	820
31268	359	444	825
31269	359	445	835
31270	359	446	847
31271	359	447	860
31272	359	448	870
31273	359	449	835
31274	359	450	845
31275	359	451	853
31276	359	452	864
31277	359	453	888
31278	359	454	885
31279	359	455	908
31280	359	456	953
31281	359	457	772
31282	359	458	778
31283	359	459	812
31284	359	460	832
31285	359	461	843
31286	359	462	866
31287	359	463	926
31288	359	464	946
31289	359	465	956
31290	359	466	922
31291	359	467	937
31292	359	468	851
31293	359	469	831
31294	359	470	897
31295	359	471	909
31296	359	472	912
31297	359	473	912
31298	359	474	917
31299	359	475	912
31300	359	476	917
31301	359	477	927
31302	359	478	946
31303	359	479	952
31304	359	480	944
31305	359	481	1002
31306	359	482	967
31307	359	483	991
31308	359	484	924
31309	359	485	1277
31310	359	486	945
31311	359	487	960
31312	359	488	985
31313	359	489	1046
31314	359	490	1024
31315	359	491	1014
31316	359	492	985
31317	360	361	15
31318	360	362	20
31319	360	363	100
31320	360	364	108
31321	360	365	125
31322	360	366	175
31323	360	367	186
31324	360	368	170
31325	360	369	150
31326	360	370	170
31327	360	371	181
31328	360	372	221
31329	360	373	190
31330	360	374	255
31331	360	375	280
31332	360	376	185
31333	360	377	300
31334	360	378	277
31335	360	379	310
31336	360	380	278
31337	360	381	302
31338	360	382	285
31339	360	383	310
31340	360	384	265
31341	360	385	298
31342	360	386	288
31343	360	387	275
31344	360	388	290
31345	360	389	300
31346	360	390	387
31347	360	391	347
31348	360	392	332
31349	360	393	342
31350	360	394	296
31351	360	395	384
31352	360	396	394
31353	360	397	348
31354	360	398	358
31355	360	399	360
31356	360	400	375
31357	360	401	435
31358	360	402	418
31359	360	403	385
31360	360	404	420
31361	360	405	465
31362	360	406	552
31363	360	407	540
31364	360	408	572
31365	360	409	548
31366	360	410	592
31367	360	411	445
31368	360	412	470
31369	360	413	545
31370	360	414	555
31371	360	415	505
31372	360	416	626
31373	360	417	599
31374	360	418	605
31375	360	419	630
31376	360	420	610
31377	360	421	563
31378	360	422	733
31379	360	423	657
31380	360	424	625
31381	360	425	665
31382	360	426	672
31383	360	427	644
31384	360	428	675
31385	360	429	680
31386	360	430	700
31387	360	431	753
31388	360	432	742
31389	360	433	729
31390	360	434	739
31391	360	435	782
31392	360	436	760
31393	360	437	775
31394	360	438	780
31395	360	439	795
31396	360	440	803
31397	360	441	801
31398	360	442	809
31399	360	443	815
31400	360	444	820
31401	360	445	830
31402	360	446	842
31403	360	447	855
31404	360	448	865
31405	360	449	830
31406	360	450	840
31407	360	451	848
31408	360	452	859
31409	360	453	883
31410	360	454	880
31411	360	455	903
31412	360	456	948
31413	360	457	767
31414	360	458	773
31415	360	459	807
31416	360	460	827
31417	360	461	838
31418	360	462	861
31419	360	463	921
31420	360	464	941
31421	360	465	951
31422	360	466	917
31423	360	467	932
31424	360	468	846
31425	360	469	826
31426	360	470	892
31427	360	471	904
31428	360	472	907
31429	360	473	907
31430	360	474	912
31431	360	475	907
31432	360	476	912
31433	360	477	922
31434	360	478	941
31435	360	479	947
31436	360	480	939
31437	360	481	997
31438	360	482	962
31439	360	483	986
31440	360	484	919
31441	360	485	1272
31442	360	486	940
31443	360	487	955
31444	360	488	980
31445	360	489	1041
31446	360	490	1019
31447	360	491	1009
31448	360	492	980
31449	361	362	5
31450	361	363	85
31451	361	364	93
31452	361	365	110
31453	361	366	170
31454	361	367	171
31455	361	368	155
31456	361	369	135
31457	361	370	183
31458	361	371	194
31459	361	372	234
31460	361	373	203
31461	361	374	240
31462	361	375	265
31463	361	376	170
31464	361	377	285
31465	361	378	262
31466	361	379	295
31467	361	380	263
31468	361	381	287
31469	361	382	270
31470	361	383	295
31471	361	384	250
31472	361	385	283
31473	361	386	273
31474	361	387	260
31475	361	388	277
31476	361	389	287
31477	361	390	372
31478	361	391	332
31479	361	392	317
31480	361	393	327
31481	361	394	281
31482	361	395	369
31483	361	396	379
31484	361	397	333
31485	361	398	343
31486	361	399	345
31487	361	400	360
31488	361	401	420
31489	361	402	403
31490	361	403	370
31491	361	404	405
31492	361	405	450
31493	361	406	537
31494	361	407	525
31495	361	408	557
31496	361	409	533
31497	361	410	577
31498	361	411	430
31499	361	412	455
31500	361	413	530
31501	361	414	540
31502	361	415	490
31503	361	416	611
31504	361	417	584
31505	361	418	590
31506	361	419	615
31507	361	420	595
31508	361	421	548
31509	361	422	718
31510	361	423	642
31511	361	424	610
31512	361	425	650
31513	361	426	657
31514	361	427	629
31515	361	428	660
31516	361	429	665
31517	361	430	685
31518	361	431	738
31519	361	432	727
31520	361	433	714
31521	361	434	724
31522	361	435	767
31523	361	436	745
31524	361	437	760
31525	361	438	765
31526	361	439	780
31527	361	440	788
31528	361	441	786
31529	361	442	794
31530	361	443	800
31531	361	444	805
31532	361	445	815
31533	361	446	827
31534	361	447	840
31535	361	448	850
31536	361	449	815
31537	361	450	825
31538	361	451	833
31539	361	452	844
31540	361	453	868
31541	361	454	865
31542	361	455	888
31543	361	456	933
31544	361	457	752
31545	361	458	758
31546	361	459	792
31547	361	460	812
31548	361	461	823
31549	361	462	846
31550	361	463	906
31551	361	464	926
31552	361	465	936
31553	361	466	902
31554	361	467	917
31555	361	468	831
31556	361	469	811
31557	361	470	877
31558	361	471	889
31559	361	472	892
31560	361	473	892
31561	361	474	897
31562	361	475	892
31563	361	476	897
31564	361	477	907
31565	361	478	926
31566	361	479	932
31567	361	480	924
31568	361	481	982
31569	361	482	947
31570	361	483	971
31571	361	484	904
31572	361	485	1257
31573	361	486	925
31574	361	487	940
31575	361	488	965
31576	361	489	1026
31577	361	490	1004
31578	361	491	994
31579	361	492	965
31580	362	363	80
31581	362	364	88
31582	362	365	105
31583	362	366	165
31584	362	367	176
31585	362	368	150
31586	362	369	130
31587	362	370	185
31588	362	371	199
31589	362	372	239
31590	362	373	208
31591	362	374	235
31592	362	375	260
31593	362	376	165
31594	362	377	280
31595	362	378	257
31596	362	379	290
31597	362	380	258
31598	362	381	282
31599	362	382	265
31600	362	383	290
31601	362	384	245
31602	362	385	278
31603	362	386	268
31604	362	387	255
31605	362	388	272
31606	362	389	282
31607	362	390	367
31608	362	391	327
31609	362	392	312
31610	362	393	322
31611	362	394	276
31612	362	395	364
31613	362	396	374
31614	362	397	328
31615	362	398	338
31616	362	399	340
31617	362	400	355
31618	362	401	415
31619	362	402	398
31620	362	403	365
31621	362	404	400
31622	362	405	445
31623	362	406	532
31624	362	407	520
31625	362	408	552
31626	362	409	528
31627	362	410	572
31628	362	411	425
31629	362	412	450
31630	362	413	525
31631	362	414	535
31632	362	415	485
31633	362	416	606
31634	362	417	579
31635	362	418	585
31636	362	419	610
31637	362	420	590
31638	362	421	543
31639	362	422	713
31640	362	423	637
31641	362	424	678
31642	362	425	645
31643	362	426	652
31644	362	427	624
31645	362	428	655
31646	362	429	660
31647	362	430	680
31648	362	431	733
31649	362	432	722
31650	362	433	709
31651	362	434	719
31652	362	435	762
31653	362	436	740
31654	362	437	755
31655	362	438	760
31656	362	439	775
31657	362	440	783
31658	362	441	781
31659	362	442	789
31660	362	443	795
31661	362	444	800
31662	362	445	810
31663	362	446	822
31664	362	447	835
31665	362	448	845
31666	362	449	810
31667	362	450	820
31668	362	451	828
31669	362	452	839
31670	362	453	863
31671	362	454	860
31672	362	455	883
31673	362	456	928
31674	362	457	747
31675	362	458	753
31676	362	459	787
31677	362	460	807
31678	362	461	818
31679	362	462	841
31680	362	463	901
31681	362	464	921
31682	362	465	931
31683	362	466	897
31684	362	467	912
31685	362	468	826
31686	362	469	806
31687	362	470	872
31688	362	471	884
31689	362	472	887
31690	362	473	887
31691	362	474	892
31692	362	475	887
31693	362	476	892
31694	362	477	902
31695	362	478	921
31696	362	479	927
31697	362	480	919
31698	362	481	977
31699	362	482	942
31700	362	483	966
31701	362	484	899
31702	362	485	1252
31703	362	486	920
31704	362	487	935
31705	362	488	960
31706	362	489	1021
31707	362	490	999
31708	362	491	989
31709	362	492	960
31710	363	364	8
31711	363	365	25
31712	363	366	50
31713	363	367	65
31714	363	368	45
31715	363	369	90
31716	363	370	110
31717	363	371	120
31718	363	372	155
31719	363	373	90
31720	363	374	195
31721	363	375	220
31722	363	376	125
31723	363	377	240
31724	363	378	217
31725	363	379	250
31726	363	380	218
31727	363	381	242
31728	363	382	225
31729	363	383	250
31730	363	384	205
31731	363	385	238
31732	363	386	228
31733	363	387	215
31734	363	388	222
31735	363	389	232
31736	363	390	327
31737	363	391	287
31738	363	392	272
31739	363	393	282
31740	363	394	236
31741	363	395	324
31742	363	396	334
31743	363	397	288
31744	363	398	298
31745	363	399	300
31746	363	400	315
31747	363	401	375
31748	363	402	358
31749	363	403	325
31750	363	404	360
31751	363	405	405
31752	363	406	492
31753	363	407	480
31754	363	408	512
31755	363	409	488
31756	363	410	532
31757	363	411	385
31758	363	412	410
31759	363	413	485
31760	363	414	495
31761	363	415	445
31762	363	416	566
31763	363	417	539
31764	363	418	545
31765	363	419	570
31766	363	420	550
31767	363	421	503
31768	363	422	673
31769	363	423	597
31770	363	424	565
31771	363	425	605
31772	363	426	612
31773	363	427	584
31774	363	428	615
31775	363	429	620
31776	363	430	640
31777	363	431	693
31778	363	432	682
31779	363	433	669
31780	363	434	679
31781	363	435	722
31782	363	436	700
31783	363	437	715
31784	363	438	720
31785	363	439	735
31786	363	440	743
31787	363	441	741
31788	363	442	749
31789	363	443	755
31790	363	444	760
31791	363	445	770
31792	363	446	782
31793	363	447	795
31794	363	448	805
31795	363	449	770
31796	363	450	780
31797	363	451	788
31798	363	452	799
31799	363	453	823
31800	363	454	820
31801	363	455	843
31802	363	456	888
31803	363	457	707
31804	363	458	713
31805	363	459	747
31806	363	460	767
31807	363	461	778
31808	363	462	801
31809	363	463	861
31810	363	464	881
31811	363	465	891
31812	363	466	857
31813	363	467	872
31814	363	468	786
31815	363	469	766
31816	363	470	832
31817	363	471	844
31818	363	472	847
31819	363	473	847
31820	363	474	852
31821	363	475	847
31822	363	476	852
31823	363	477	862
31824	363	478	881
31825	363	479	887
31826	363	480	879
31827	363	481	937
31828	363	482	902
31829	363	483	926
31830	363	484	859
31831	363	485	1212
31832	363	486	880
31833	363	487	895
31834	363	488	920
31835	363	489	981
31836	363	490	959
31837	363	491	949
31838	363	492	920
31839	364	365	17
31840	364	366	42
31841	364	367	57
31842	364	368	37
31843	364	369	82
31844	364	370	102
31845	364	371	113
31846	364	372	148
31847	364	373	82
31848	364	374	187
31849	364	375	212
31850	364	376	117
31851	364	377	232
31852	364	378	209
31853	364	379	242
31854	364	380	210
31855	364	381	234
31856	364	382	217
31857	364	383	242
31858	364	384	197
31859	364	385	230
31860	364	386	220
31861	364	387	207
31862	364	388	214
31863	364	389	224
31864	364	390	319
31865	364	391	279
31866	364	392	264
31867	364	393	274
31868	364	394	228
31869	364	395	316
31870	364	396	326
31871	364	397	280
31872	364	398	290
31873	364	399	292
31874	364	400	307
31875	364	401	367
31876	364	402	350
31877	364	403	317
31878	364	404	352
31879	364	405	397
31880	364	406	484
31881	364	407	472
31882	364	408	504
31883	364	409	480
31884	364	410	524
31885	364	411	377
31886	364	412	402
31887	364	413	477
31888	364	414	487
31889	364	415	437
31890	364	416	558
31891	364	417	531
31892	364	418	537
31893	364	419	562
31894	364	420	542
31895	364	421	495
31896	364	422	665
31897	364	423	589
31898	364	424	557
31899	364	425	597
31900	364	426	604
31901	364	427	576
31902	364	428	607
31903	364	429	612
31904	364	430	632
31905	364	431	685
31906	364	432	674
31907	364	433	661
31908	364	434	671
31909	364	435	714
31910	364	436	692
31911	364	437	707
31912	364	438	712
31913	364	439	727
31914	364	440	735
31915	364	441	733
31916	364	442	741
31917	364	443	747
31918	364	444	752
31919	364	445	762
31920	364	446	774
31921	364	447	787
31922	364	448	797
31923	364	449	762
31924	364	450	772
31925	364	451	780
31926	364	452	791
31927	364	453	815
31928	364	454	812
31929	364	455	835
31930	364	456	880
31931	364	457	699
31932	364	458	705
31933	364	459	739
31934	364	460	759
31935	364	461	770
31936	364	462	793
31937	364	463	853
31938	364	464	873
31939	364	465	883
31940	364	466	849
31941	364	467	864
31942	364	468	778
31943	364	469	758
31944	364	470	824
31945	364	471	836
31946	364	472	839
31947	364	473	839
31948	364	474	844
31949	364	475	839
31950	364	476	844
31951	364	477	854
31952	364	478	873
31953	364	479	879
31954	364	480	871
31955	364	481	929
31956	364	482	894
31957	364	483	918
31958	364	484	851
31959	364	485	1204
31960	364	486	872
31961	364	487	887
31962	364	488	912
31963	364	489	973
31964	364	490	951
31965	364	491	941
31966	364	492	912
31967	365	366	35
31968	365	367	44
31969	365	368	40
31970	365	369	110
31971	365	370	130
31972	365	371	140
31973	365	372	175
31974	365	373	85
31975	365	374	215
31976	365	375	240
31977	365	376	145
31978	365	377	260
31979	365	378	237
31980	365	379	270
31981	365	380	238
31982	365	381	262
31983	365	382	245
31984	365	383	270
31985	365	384	225
31986	365	385	258
31987	365	386	248
31988	365	387	235
31989	365	388	242
31990	365	389	252
31991	365	390	347
31992	365	391	307
31993	365	392	292
31994	365	393	302
31995	365	394	256
31996	365	395	344
31997	365	396	354
31998	365	397	308
31999	365	398	318
32000	365	399	320
32001	365	400	335
32002	365	401	395
32003	365	402	378
32004	365	403	345
32005	365	404	380
32006	365	405	425
32007	365	406	512
32008	365	407	500
32009	365	408	532
32010	365	409	508
32011	365	410	552
32012	365	411	405
32013	365	412	430
32014	365	413	505
32015	365	414	515
32016	365	415	465
32017	365	416	586
32018	365	417	559
32019	365	418	565
32020	365	419	590
32021	365	420	570
32022	365	421	523
32023	365	422	693
32024	365	423	617
32025	365	424	585
32026	365	425	625
32027	365	426	632
32028	365	427	604
32029	365	428	635
32030	365	429	640
32031	365	430	660
32032	365	431	713
32033	365	432	702
32034	365	433	689
32035	365	434	699
32036	365	435	742
32037	365	436	720
32038	365	437	735
32039	365	438	740
32040	365	439	755
32041	365	440	763
32042	365	441	761
32043	365	442	769
32044	365	443	775
32045	365	444	780
32046	365	445	790
32047	365	446	802
32048	365	447	815
32049	365	448	825
32050	365	449	790
32051	365	450	800
32052	365	451	808
32053	365	452	819
32054	365	453	843
32055	365	454	840
32056	365	455	863
32057	365	456	908
32058	365	457	727
32059	365	458	733
32060	365	459	767
32061	365	460	787
32062	365	461	798
32063	365	462	821
32064	365	463	881
32065	365	464	901
32066	365	465	911
32067	365	466	877
32068	365	467	892
32069	365	468	806
32070	365	469	786
32071	365	470	852
32072	365	471	864
32073	365	472	867
32074	365	473	867
32075	365	474	872
32076	365	475	867
32077	365	476	872
32078	365	477	882
32079	365	478	901
32080	365	479	907
32081	365	480	899
32082	365	481	957
32083	365	482	922
32084	365	483	946
32085	365	484	879
32086	365	485	1232
32087	365	486	900
32088	365	487	915
32089	365	488	940
32090	365	489	1001
32091	365	490	979
32092	365	491	969
32093	365	492	940
32094	366	367	11
32095	366	368	30
32096	366	369	95
32097	366	370	115
32098	366	371	125
32099	366	372	160
32100	366	373	90
32101	366	374	200
32102	366	375	225
32103	366	376	130
32104	366	377	245
32105	366	378	222
32106	366	379	255
32107	366	380	223
32108	366	381	247
32109	366	382	230
32110	366	383	255
32111	366	384	210
32112	366	385	243
32113	366	386	233
32114	366	387	220
32115	366	388	227
32116	366	389	237
32117	366	390	332
32118	366	391	292
32119	366	392	277
32120	366	393	287
32121	366	394	241
32122	366	395	329
32123	366	396	339
32124	366	397	293
32125	366	398	303
32126	366	399	305
32127	366	400	320
32128	366	401	380
32129	366	402	363
32130	366	403	330
32131	366	404	365
32132	366	405	410
32133	366	406	497
32134	366	407	485
32135	366	408	517
32136	366	409	493
32137	366	410	537
32138	366	411	390
32139	366	412	415
32140	366	413	490
32141	366	414	500
32142	366	415	450
32143	366	416	571
32144	366	417	544
32145	366	418	550
32146	366	419	575
32147	366	420	555
32148	366	421	508
32149	366	422	678
32150	366	423	602
32151	366	424	570
32152	366	425	610
32153	366	426	617
32154	366	427	589
32155	366	428	620
32156	366	429	625
32157	366	430	645
32158	366	431	698
32159	366	432	687
32160	366	433	674
32161	366	434	684
32162	366	435	727
32163	366	436	705
32164	366	437	720
32165	366	438	725
32166	366	439	740
32167	366	440	748
32168	366	441	746
32169	366	442	754
32170	366	443	760
32171	366	444	765
32172	366	445	775
32173	366	446	787
32174	366	447	800
32175	366	448	810
32176	366	449	775
32177	366	450	785
32178	366	451	793
32179	366	452	804
32180	366	453	828
32181	366	454	825
32182	366	455	848
32183	366	456	893
32184	366	457	712
32185	366	458	718
32186	366	459	752
32187	366	460	772
32188	366	461	783
32189	366	462	806
32190	366	463	866
32191	366	464	886
32192	366	465	896
32193	366	466	862
32194	366	467	877
32195	366	468	791
32196	366	469	771
32197	366	470	837
32198	366	471	849
32199	366	472	852
32200	366	473	852
32201	366	474	857
32202	366	475	852
32203	366	476	857
32204	366	477	867
32205	366	478	886
32206	366	479	892
32207	366	480	884
32208	366	481	942
32209	366	482	907
32210	366	483	931
32211	366	484	864
32212	366	485	1217
32213	366	486	885
32214	366	487	900
32215	366	488	925
32216	366	489	986
32217	366	490	964
32218	366	491	954
32219	366	492	925
32220	367	368	41
32221	367	369	96
32222	367	370	116
32223	367	371	136
32224	367	372	181
32225	367	373	101
32226	367	374	201
32227	367	375	226
32228	367	376	131
32229	367	377	246
32230	367	378	223
32231	367	379	256
32232	367	380	224
32233	367	381	248
32234	367	382	231
32235	367	383	256
32236	367	384	211
32237	367	385	244
32238	367	386	234
32239	367	387	221
32240	367	388	228
32241	367	389	238
32242	367	390	333
32243	367	391	293
32244	367	392	278
32245	367	393	288
32246	367	394	242
32247	367	395	330
32248	367	396	340
32249	367	397	304
32250	367	398	314
32251	367	399	316
32252	367	400	331
32253	367	401	391
32254	367	402	374
32255	367	403	341
32256	367	404	376
32257	367	405	421
32258	367	406	508
32259	367	407	496
32260	367	408	528
32261	367	409	504
32262	367	410	548
32263	367	411	401
32264	367	412	426
32265	367	413	501
32266	367	414	511
32267	367	415	461
32268	367	416	582
32269	367	417	555
32270	367	418	561
32271	367	419	586
32272	367	420	566
32273	367	421	519
32274	367	422	689
32275	367	423	613
32276	367	424	581
32277	367	425	621
32278	367	426	628
32279	367	427	600
32280	367	428	631
32281	367	429	636
32282	367	430	656
32283	367	431	709
32284	367	432	698
32285	367	433	685
32286	367	434	695
32287	367	435	738
32288	367	436	716
32289	367	437	731
32290	367	438	736
32291	367	439	751
32292	367	440	759
32293	367	441	757
32294	367	442	765
32295	367	443	771
32296	367	444	776
32297	367	445	786
32298	367	446	798
32299	367	447	811
32300	367	448	821
32301	367	449	786
32302	367	450	796
32303	367	451	804
32304	367	452	815
32305	367	453	839
32306	367	454	836
32307	367	455	859
32308	367	456	904
32309	367	457	723
32310	367	458	729
32311	367	459	763
32312	367	460	783
32313	367	461	794
32314	367	462	817
32315	367	463	877
32316	367	464	897
32317	367	465	907
32318	367	466	873
32319	367	467	888
32320	367	468	802
32321	367	469	782
32322	367	470	848
32323	367	471	860
32324	367	472	863
32325	367	473	863
32326	367	474	868
32327	367	475	863
32328	367	476	868
32329	367	477	878
32330	367	478	897
32331	367	479	903
32332	367	480	895
32333	367	481	953
32334	367	482	918
32335	367	483	942
32336	367	484	875
32337	367	485	1228
32338	367	486	896
32339	367	487	911
32340	367	488	936
32341	367	489	997
32342	367	490	975
32343	367	491	965
32344	367	492	936
32345	368	369	65
32346	368	370	85
32347	368	371	95
32348	368	372	130
32349	368	373	60
32350	368	374	170
32351	368	375	195
32352	368	376	100
32353	368	377	215
32354	368	378	192
32355	368	379	225
32356	368	380	193
32357	368	381	217
32358	368	382	200
32359	368	383	225
32360	368	384	180
32361	368	385	213
32362	368	386	203
32363	368	387	190
32364	368	388	197
32365	368	389	207
32366	368	390	302
32367	368	391	262
32368	368	392	247
32369	368	393	257
32370	368	394	211
32371	368	395	299
32372	368	396	309
32373	368	397	263
32374	368	398	273
32375	368	399	275
32376	368	400	290
32377	368	401	350
32378	368	402	333
32379	368	403	300
32380	368	404	335
32381	368	405	380
32382	368	406	467
32383	368	407	455
32384	368	408	487
32385	368	409	463
32386	368	410	507
32387	368	411	360
32388	368	412	385
32389	368	413	460
32390	368	414	470
32391	368	415	420
32392	368	416	541
32393	368	417	514
32394	368	418	520
32395	368	419	545
32396	368	420	525
32397	368	421	478
32398	368	422	648
32399	368	423	572
32400	368	424	540
32401	368	425	580
32402	368	426	587
32403	368	427	559
32404	368	428	590
32405	368	429	595
32406	368	430	615
32407	368	431	668
32408	368	432	657
32409	368	433	644
32410	368	434	654
32411	368	435	697
32412	368	436	675
32413	368	437	690
32414	368	438	695
32415	368	439	710
32416	368	440	718
32417	368	441	716
32418	368	442	724
32419	368	443	730
32420	368	444	735
32421	368	445	745
32422	368	446	757
32423	368	447	770
32424	368	448	780
32425	368	449	745
32426	368	450	755
32427	368	451	763
32428	368	452	774
32429	368	453	798
32430	368	454	795
32431	368	455	818
32432	368	456	863
32433	368	457	682
32434	368	458	688
32435	368	459	722
32436	368	460	742
32437	368	461	753
32438	368	462	776
32439	368	463	836
32440	368	464	856
32441	368	465	866
32442	368	466	832
32443	368	467	847
32444	368	468	761
32445	368	469	741
32446	368	470	807
32447	368	471	819
32448	368	472	822
32449	368	473	822
32450	368	474	827
32451	368	475	822
32452	368	476	827
32453	368	477	837
32454	368	478	856
32455	368	479	862
32456	368	480	854
32457	368	481	912
32458	368	482	877
32459	368	483	901
32460	368	484	834
32461	368	485	1187
32462	368	486	855
32463	368	487	870
32464	368	488	895
32465	368	489	956
32466	368	490	934
32467	368	491	924
32468	368	492	895
32469	369	370	20
32470	369	371	30
32471	369	372	65
32472	369	373	45
32473	369	374	105
32474	369	375	130
32475	369	376	35
32476	369	377	150
32477	369	378	127
32478	369	379	160
32479	369	380	128
32480	369	381	152
32481	369	382	135
32482	369	383	160
32483	369	384	115
32484	369	385	148
32485	369	386	138
32486	369	387	125
32487	369	388	132
32488	369	389	142
32489	369	390	237
32490	369	391	197
32491	369	392	182
32492	369	393	192
32493	369	394	146
32494	369	395	234
32495	369	396	244
32496	369	397	198
32497	369	398	208
32498	369	399	210
32499	369	400	225
32500	369	401	285
32501	369	402	268
32502	369	403	235
32503	369	404	270
32504	369	405	315
32505	369	406	402
32506	369	407	390
32507	369	408	422
32508	369	409	398
32509	369	410	442
32510	369	411	295
32511	369	412	320
32512	369	413	395
32513	369	414	405
32514	369	415	355
32515	369	416	476
32516	369	417	449
32517	369	418	455
32518	369	419	480
32519	369	420	460
32520	369	421	413
32521	369	422	583
32522	369	423	507
32523	369	424	475
32524	369	425	515
32525	369	426	522
32526	369	427	494
32527	369	428	525
32528	369	429	530
32529	369	430	550
32530	369	431	603
32531	369	432	592
32532	369	433	579
32533	369	434	589
32534	369	435	632
32535	369	436	610
32536	369	437	625
32537	369	438	630
32538	369	439	645
32539	369	440	653
32540	369	441	651
32541	369	442	659
32542	369	443	665
32543	369	444	670
32544	369	445	680
32545	369	446	692
32546	369	447	705
32547	369	448	715
32548	369	449	680
32549	369	450	690
32550	369	451	698
32551	369	452	709
32552	369	453	733
32553	369	454	730
32554	369	455	753
32555	369	456	798
32556	369	457	617
32557	369	458	623
32558	369	459	657
32559	369	460	677
32560	369	461	688
32561	369	462	711
32562	369	463	771
32563	369	464	791
32564	369	465	801
32565	369	466	767
32566	369	467	782
32567	369	468	696
32568	369	469	676
32569	369	470	742
32570	369	471	754
32571	369	472	757
32572	369	473	757
32573	369	474	762
32574	369	475	757
32575	369	476	762
32576	369	477	772
32577	369	478	791
32578	369	479	797
32579	369	480	789
32580	369	481	847
32581	369	482	812
32582	369	483	836
32583	369	484	769
32584	369	485	1122
32585	369	486	790
32586	369	487	805
32587	369	488	830
32588	369	489	891
32589	369	490	869
32590	369	491	859
32591	369	492	830
32592	370	371	11
32593	370	372	46
32594	370	373	65
32595	370	374	125
32596	370	375	150
32597	370	376	55
32598	370	377	170
32599	370	378	147
32600	370	379	180
32601	370	380	148
32602	370	381	172
32603	370	382	155
32604	370	383	180
32605	370	384	135
32606	370	385	168
32607	370	386	158
32608	370	387	145
32609	370	388	152
32610	370	389	162
32611	370	390	257
32612	370	391	217
32613	370	392	202
32614	370	393	212
32615	370	394	166
32616	370	395	254
32617	370	396	264
32618	370	397	218
32619	370	398	228
32620	370	399	230
32621	370	400	245
32622	370	401	305
32623	370	402	288
32624	370	403	255
32625	370	404	290
32626	370	405	335
32627	370	406	422
32628	370	407	410
32629	370	408	442
32630	370	409	418
32631	370	410	462
32632	370	411	315
32633	370	412	340
32634	370	413	415
32635	370	414	425
32636	370	415	375
32637	370	416	496
32638	370	417	469
32639	370	418	475
32640	370	419	500
32641	370	420	480
32642	370	421	433
32643	370	422	603
32644	370	423	527
32645	370	424	495
32646	370	425	535
32647	370	426	542
32648	370	427	514
32649	370	428	545
32650	370	429	550
32651	370	430	570
32652	370	431	623
32653	370	432	612
32654	370	433	599
32655	370	434	609
32656	370	435	652
32657	370	436	630
32658	370	437	645
32659	370	438	650
32660	370	439	665
32661	370	440	673
32662	370	441	671
32663	370	442	679
32664	370	443	685
32665	370	444	690
32666	370	445	700
32667	370	446	712
32668	370	447	725
32669	370	448	735
32670	370	449	700
32671	370	450	710
32672	370	451	718
32673	370	452	729
32674	370	453	753
32675	370	454	750
32676	370	455	773
32677	370	456	818
32678	370	457	637
32679	370	458	643
32680	370	459	677
32681	370	460	697
32682	370	461	708
32683	370	462	731
32684	370	463	791
32685	370	464	811
32686	370	465	821
32687	370	466	787
32688	370	467	802
32689	370	468	716
32690	370	469	696
32691	370	470	762
32692	370	471	774
32693	370	472	777
32694	370	473	777
32695	370	474	782
32696	370	475	777
32697	370	476	782
32698	370	477	792
32699	370	478	811
32700	370	479	817
32701	370	480	809
32702	370	481	867
32703	370	482	832
32704	370	483	856
32705	370	484	789
32706	370	485	1142
32707	370	486	810
32708	370	487	825
32709	370	488	850
32710	370	489	911
32711	370	490	889
32712	370	491	879
32713	370	492	850
32714	371	372	35
32715	371	373	76
32716	371	374	135
32717	371	375	160
32718	371	376	65
32719	371	377	180
32720	371	378	157
32721	371	379	190
32722	371	380	158
32723	371	381	182
32724	371	382	165
32725	371	383	190
32726	371	384	145
32727	371	385	178
32728	371	386	168
32729	371	387	155
32730	371	388	162
32731	371	389	172
32732	371	390	267
32733	371	391	227
32734	371	392	212
32735	371	393	222
32736	371	394	176
32737	371	395	264
32738	371	396	274
32739	371	397	228
32740	371	398	238
32741	371	399	240
32742	371	400	255
32743	371	401	315
32744	371	402	298
32745	371	403	265
32746	371	404	300
32747	371	405	345
32748	371	406	432
32749	371	407	420
32750	371	408	452
32751	371	409	428
32752	371	410	472
32753	371	411	325
32754	371	412	350
32755	371	413	425
32756	371	414	435
32757	371	415	385
32758	371	416	506
32759	371	417	479
32760	371	418	485
32761	371	419	510
32762	371	420	490
32763	371	421	443
32764	371	422	613
32765	371	423	537
32766	371	424	505
32767	371	425	545
32768	371	426	552
32769	371	427	524
32770	371	428	555
32771	371	429	560
32772	371	430	580
32773	371	431	633
32774	371	432	622
32775	371	433	609
32776	371	434	619
32777	371	435	662
32778	371	436	640
32779	371	437	655
32780	371	438	660
32781	371	439	675
32782	371	440	683
32783	371	441	681
32784	371	442	689
32785	371	443	695
32786	371	444	700
32787	371	445	710
32788	371	446	722
32789	371	447	735
32790	371	448	745
32791	371	449	710
32792	371	450	720
32793	371	451	728
32794	371	452	739
32795	371	453	763
32796	371	454	760
32797	371	455	783
32798	371	456	828
32799	371	457	647
32800	371	458	653
32801	371	459	687
32802	371	460	707
32803	371	461	718
32804	371	462	741
32805	371	463	801
32806	371	464	821
32807	371	465	831
32808	371	466	797
32809	371	467	812
32810	371	468	726
32811	371	469	706
32812	371	470	772
32813	371	471	784
32814	371	472	787
32815	371	473	787
32816	371	474	792
32817	371	475	787
32818	371	476	792
32819	371	477	802
32820	371	478	821
32821	371	479	827
32822	371	480	819
32823	371	481	877
32824	371	482	842
32825	371	483	866
32826	371	484	799
32827	371	485	1152
32828	371	486	820
32829	371	487	835
32830	371	488	860
32831	371	489	921
32832	371	490	899
32833	371	491	889
32834	371	492	860
32835	372	373	111
32836	372	374	170
32837	372	375	195
32838	372	376	100
32839	372	377	215
32840	372	378	192
32841	372	379	225
32842	372	380	193
32843	372	381	217
32844	372	382	200
32845	372	383	225
32846	372	384	180
32847	372	385	213
32848	372	386	203
32849	372	387	190
32850	372	388	197
32851	372	389	207
32852	372	390	302
32853	372	391	262
32854	372	392	247
32855	372	393	257
32856	372	394	211
32857	372	395	299
32858	372	396	309
32859	372	397	263
32860	372	398	273
32861	372	399	275
32862	372	400	290
32863	372	401	350
32864	372	402	333
32865	372	403	300
32866	372	404	335
32867	372	405	380
32868	372	406	467
32869	372	407	455
32870	372	408	487
32871	372	409	463
32872	372	410	507
32873	372	411	360
32874	372	412	385
32875	372	413	460
32876	372	414	470
32877	372	415	420
32878	372	416	541
32879	372	417	514
32880	372	418	520
32881	372	419	545
32882	372	420	525
32883	372	421	478
32884	372	422	648
32885	372	423	572
32886	372	424	540
32887	372	425	580
32888	372	426	587
32889	372	427	559
32890	372	428	590
32891	372	429	595
32892	372	430	615
32893	372	431	668
32894	372	432	657
32895	372	433	644
32896	372	434	654
32897	372	435	697
32898	372	436	675
32899	372	437	690
32900	372	438	695
32901	372	439	710
32902	372	440	718
32903	372	441	716
32904	372	442	724
32905	372	443	730
32906	372	444	735
32907	372	445	745
32908	372	446	757
32909	372	447	770
32910	372	448	780
32911	372	449	745
32912	372	450	755
32913	372	451	763
32914	372	452	774
32915	372	453	798
32916	372	454	795
32917	372	455	818
32918	372	456	863
32919	372	457	682
32920	372	458	688
32921	372	459	722
32922	372	460	742
32923	372	461	753
32924	372	462	776
32925	372	463	836
32926	372	464	856
32927	372	465	866
32928	372	466	832
32929	372	467	847
32930	372	468	761
32931	372	469	741
32932	372	470	807
32933	372	471	819
32934	372	472	822
32935	372	473	822
32936	372	474	827
32937	372	475	822
32938	372	476	827
32939	372	477	837
32940	372	478	856
32941	372	479	862
32942	372	480	854
32943	372	481	912
32944	372	482	877
32945	372	483	901
32946	372	484	834
32947	372	485	1187
32948	372	486	855
32949	372	487	870
32950	372	488	895
32951	372	489	956
32952	372	490	934
32953	372	491	924
32954	372	492	895
32955	373	374	150
32956	373	375	175
32957	373	376	80
32958	373	377	195
32959	373	378	172
32960	373	379	205
32961	373	380	173
32962	373	381	197
32963	373	382	180
32964	373	383	205
32965	373	384	160
32966	373	385	193
32967	373	386	183
32968	373	387	170
32969	373	388	177
32970	373	389	187
32971	373	390	282
32972	373	391	242
32973	373	392	227
32974	373	393	237
32975	373	394	191
32976	373	395	279
32977	373	396	289
32978	373	397	243
32979	373	398	253
32980	373	399	255
32981	373	400	270
32982	373	401	330
32983	373	402	313
32984	373	403	280
32985	373	404	315
32986	373	405	360
32987	373	406	447
32988	373	407	435
32989	373	408	467
32990	373	409	443
32991	373	410	487
32992	373	411	340
32993	373	412	365
32994	373	413	440
32995	373	414	450
32996	373	415	400
32997	373	416	521
32998	373	417	494
32999	373	418	500
33000	373	419	525
33001	373	420	505
33002	373	421	458
33003	373	422	628
33004	373	423	552
33005	373	424	520
33006	373	425	560
33007	373	426	567
33008	373	427	539
33009	373	428	570
33010	373	429	575
33011	373	430	595
33012	373	431	648
33013	373	432	637
33014	373	433	624
33015	373	434	634
33016	373	435	677
33017	373	436	655
33018	373	437	670
33019	373	438	675
33020	373	439	690
33021	373	440	698
33022	373	441	696
33023	373	442	704
33024	373	443	710
33025	373	444	715
33026	373	445	725
33027	373	446	737
33028	373	447	750
33029	373	448	760
33030	373	449	725
33031	373	450	735
33032	373	451	743
33033	373	452	754
33034	373	453	778
33035	373	454	775
33036	373	455	798
33037	373	456	843
33038	373	457	662
33039	373	458	668
33040	373	459	702
33041	373	460	722
33042	373	461	733
33043	373	462	756
33044	373	463	816
33045	373	464	836
33046	373	465	846
33047	373	466	812
33048	373	467	827
33049	373	468	741
33050	373	469	721
33051	373	470	787
33052	373	471	799
33053	373	472	802
33054	373	473	802
33055	373	474	807
33056	373	475	802
33057	373	476	807
33058	373	477	817
33059	373	478	836
33060	373	479	842
33061	373	480	834
33062	373	481	892
33063	373	482	857
33064	373	483	881
33065	373	484	814
33066	373	485	1167
33067	373	486	835
33068	373	487	850
33069	373	488	875
33070	373	489	936
33071	373	490	914
33072	373	491	904
33073	373	492	875
33074	374	375	25
33075	374	376	70
33076	374	377	45
33077	374	378	22
33078	374	379	55
33079	374	380	13
33080	374	381	60
33081	374	382	30
33082	374	383	52
33083	374	384	40
33084	374	385	43
33085	374	386	33
33086	374	387	20
33087	374	388	78
33088	374	389	88
33089	374	390	183
33090	374	391	143
33091	374	392	128
33092	374	393	138
33093	374	394	51
33094	374	395	178
33095	374	396	188
33096	374	397	155
33097	374	398	106
33098	374	399	85
33099	374	400	100
33100	374	401	160
33101	374	402	163
33102	374	403	230
33103	374	404	225
33104	374	405	253
33105	374	406	318
33106	374	407	328
33107	374	408	338
33108	374	409	336
33109	374	410	358
33110	374	411	250
33111	374	412	270
33112	374	413	350
33113	374	414	360
33114	374	415	310
33115	374	416	431
33116	374	417	404
33117	374	418	410
33118	374	419	435
33119	374	420	415
33120	374	421	368
33121	374	422	353
33122	374	423	462
33123	374	424	430
33124	374	425	470
33125	374	426	477
33126	374	427	449
33127	374	428	480
33128	374	429	485
33129	374	430	505
33130	374	431	558
33131	374	432	547
33132	374	433	534
33133	374	434	544
33134	374	435	587
33135	374	436	565
33136	374	437	580
33137	374	438	585
33138	374	439	600
33139	374	440	608
33140	374	441	606
33141	374	442	614
33142	374	443	620
33143	374	444	625
33144	374	445	635
33145	374	446	647
33146	374	447	660
33147	374	448	670
33148	374	449	635
33149	374	450	645
33150	374	451	653
33151	374	452	664
33152	374	453	688
33153	374	454	685
33154	374	455	708
33155	374	456	753
33156	374	457	572
33157	374	458	578
33158	374	459	612
33159	374	460	632
33160	374	461	643
33161	374	462	666
33162	374	463	726
33163	374	464	746
33164	374	465	756
33165	374	466	722
33166	374	467	737
33167	374	468	651
33168	374	469	631
33169	374	470	697
33170	374	471	709
33171	374	472	712
33172	374	473	712
33173	374	474	717
33174	374	475	712
33175	374	476	717
33176	374	477	727
33177	374	478	746
33178	374	479	752
33179	374	480	744
33180	374	481	802
33181	374	482	767
33182	374	483	791
33183	374	484	724
33184	374	485	758
33185	374	486	745
33186	374	487	760
33187	374	488	785
33188	374	489	846
33189	374	490	824
33190	374	491	814
33191	374	492	785
33192	375	376	95
33193	375	377	70
33194	375	378	3
33195	375	379	55
33196	375	380	34
33197	375	381	60
33198	375	382	20
33199	375	383	42
33200	375	384	65
33201	375	385	42
33202	375	386	58
33203	375	387	5
33204	375	388	103
33205	375	389	113
33206	375	390	208
33207	375	391	168
33208	375	392	153
33209	375	393	163
33210	375	394	76
33211	375	395	203
33212	375	396	213
33213	375	397	155
33214	375	398	106
33215	375	399	85
33216	375	400	100
33217	375	401	160
33218	375	402	163
33219	375	403	230
33220	375	404	250
33221	375	405	278
33222	375	406	343
33223	375	407	353
33224	375	408	363
33225	375	409	361
33226	375	410	383
33227	375	411	275
33228	375	412	295
33229	375	413	375
33230	375	414	385
33231	375	415	335
33232	375	416	456
33233	375	417	429
33234	375	418	435
33235	375	419	460
33236	375	420	440
33237	375	421	393
33238	375	422	378
33239	375	423	487
33240	375	424	455
33241	375	425	495
33242	375	426	502
33243	375	427	474
33244	375	428	505
33245	375	429	510
33246	375	430	530
33247	375	431	583
33248	375	432	572
33249	375	433	559
33250	375	434	569
33251	375	435	612
33252	375	436	590
33253	375	437	605
33254	375	438	610
33255	375	439	625
33256	375	440	633
33257	375	441	631
33258	375	442	639
33259	375	443	645
33260	375	444	650
33261	375	445	660
33262	375	446	672
33263	375	447	685
33264	375	448	695
33265	375	449	660
33266	375	450	670
33267	375	451	678
33268	375	452	689
33269	375	453	713
33270	375	454	710
33271	375	455	733
33272	375	456	778
33273	375	457	597
33274	375	458	603
33275	375	459	637
33276	375	460	657
33277	375	461	668
33278	375	462	691
33279	375	463	751
33280	375	464	771
33281	375	465	781
33282	375	466	747
33283	375	467	762
33284	375	468	676
33285	375	469	656
33286	375	470	722
33287	375	471	734
33288	375	472	737
33289	375	473	737
33290	375	474	742
33291	375	475	737
33292	375	476	742
33293	375	477	752
33294	375	478	771
33295	375	479	777
33296	375	480	769
33297	375	481	827
33298	375	482	792
33299	375	483	816
33300	375	484	749
33301	375	485	783
33302	375	486	770
33303	375	487	785
33304	375	488	810
33305	375	489	871
33306	375	490	849
33307	375	491	839
33308	375	492	810
33309	376	377	110
33310	376	378	92
33311	376	379	135
33312	376	380	81
33313	376	381	130
33314	376	382	100
33315	376	383	122
33316	376	384	105
33317	376	385	113
33318	376	386	103
33319	376	387	90
33320	376	388	143
33321	376	389	153
33322	376	390	248
33323	376	391	208
33324	376	392	193
33325	376	393	203
33326	376	394	121
33327	376	395	243
33328	376	396	253
33329	376	397	225
33330	376	398	176
33331	376	399	155
33332	376	400	170
33333	376	401	230
33334	376	402	233
33335	376	403	300
33336	376	404	255
33337	376	405	318
33338	376	406	383
33339	376	407	393
33340	376	408	403
33341	376	409	401
33342	376	410	423
33343	376	411	280
33344	376	412	300
33345	376	413	380
33346	376	414	390
33347	376	415	340
33348	376	416	461
33349	376	417	434
33350	376	418	440
33351	376	419	465
33352	376	420	445
33353	376	421	398
33354	376	422	383
33355	376	423	492
33356	376	424	460
33357	376	425	500
33358	376	426	507
33359	376	427	479
33360	376	428	510
33361	376	429	515
33362	376	430	535
33363	376	431	588
33364	376	432	577
33365	376	433	564
33366	376	434	574
33367	376	435	617
33368	376	436	595
33369	376	437	610
33370	376	438	615
33371	376	439	630
33372	376	440	638
33373	376	441	636
33374	376	442	644
33375	376	443	650
33376	376	444	655
33377	376	445	665
33378	376	446	677
33379	376	447	690
33380	376	448	700
33381	376	449	665
33382	376	450	675
33383	376	451	683
33384	376	452	694
33385	376	453	718
33386	376	454	715
33387	376	455	738
33388	376	456	783
33389	376	457	602
33390	376	458	608
33391	376	459	642
33392	376	460	662
33393	376	461	673
33394	376	462	696
33395	376	463	756
33396	376	464	776
33397	376	465	786
33398	376	466	752
33399	376	467	767
33400	376	468	681
33401	376	469	661
33402	376	470	727
33403	376	471	739
33404	376	472	742
33405	376	473	742
33406	376	474	747
33407	376	475	742
33408	376	476	747
33409	376	477	757
33410	376	478	776
33411	376	479	782
33412	376	480	774
33413	376	481	832
33414	376	482	797
33415	376	483	821
33416	376	484	754
33417	376	485	788
33418	376	486	775
33419	376	487	790
33420	376	488	815
33421	376	489	876
33422	376	490	854
33423	376	491	844
33424	376	492	815
33425	377	378	67
33426	377	379	85
33427	377	380	100
33428	377	381	105
33429	377	382	75
33430	377	383	97
33431	377	384	85
33432	377	385	88
33433	377	386	78
33434	377	387	65
33435	377	388	123
33436	377	389	133
33437	377	390	228
33438	377	391	188
33439	377	392	173
33440	377	393	183
33441	377	394	96
33442	377	395	223
33443	377	396	233
33444	377	397	200
33445	377	398	151
33446	377	399	130
33447	377	400	145
33448	377	401	205
33449	377	402	208
33450	377	403	275
33451	377	404	270
33452	377	405	298
33453	377	406	363
33454	377	407	373
33455	377	408	383
33456	377	409	381
33457	377	410	403
33458	377	411	295
33459	377	412	315
33460	377	413	395
33461	377	414	405
33462	377	415	355
33463	377	416	476
33464	377	417	449
33465	377	418	455
33466	377	419	480
33467	377	420	460
33468	377	421	413
33469	377	422	398
33470	377	423	507
33471	377	424	475
33472	377	425	515
33473	377	426	522
33474	377	427	494
33475	377	428	525
33476	377	429	530
33477	377	430	550
33478	377	431	603
33479	377	432	592
33480	377	433	579
33481	377	434	589
33482	377	435	632
33483	377	436	610
33484	377	437	625
33485	377	438	630
33486	377	439	645
33487	377	440	653
33488	377	441	651
33489	377	442	659
33490	377	443	665
33491	377	444	670
33492	377	445	680
33493	377	446	692
33494	377	447	705
33495	377	448	715
33496	377	449	680
33497	377	450	690
33498	377	451	698
33499	377	452	709
33500	377	453	733
33501	377	454	730
33502	377	455	753
33503	377	456	798
33504	377	457	617
33505	377	458	623
33506	377	459	657
33507	377	460	677
33508	377	461	688
33509	377	462	711
33510	377	463	771
33511	377	464	791
33512	377	465	801
33513	377	466	767
33514	377	467	782
33515	377	468	696
33516	377	469	676
33517	377	470	742
33518	377	471	754
33519	377	472	757
33520	377	473	757
33521	377	474	762
33522	377	475	757
33523	377	476	762
33524	377	477	772
33525	377	478	791
33526	377	479	797
33527	377	480	789
33528	377	481	847
33529	377	482	812
33530	377	483	836
33531	377	484	769
33532	377	485	803
33533	377	486	790
33534	377	487	805
33535	377	488	830
33536	377	489	891
33537	377	490	869
33538	377	491	859
33539	377	492	830
33540	378	379	52
33541	378	380	35
33542	378	381	69
33543	378	382	52
33544	378	383	52
33545	378	384	62
33546	378	385	65
33547	378	386	55
33548	378	387	2
33549	378	388	100
33550	378	389	110
33551	378	390	205
33552	378	391	165
33553	378	392	150
33554	378	393	160
33555	378	394	73
33556	378	395	200
33557	378	396	210
33558	378	397	197
33559	378	398	148
33560	378	399	127
33561	378	400	142
33562	378	401	202
33563	378	402	205
33564	378	403	272
33565	378	404	247
33566	378	405	275
33567	378	406	340
33568	378	407	350
33569	378	408	360
33570	378	409	358
33571	378	410	380
33572	378	411	272
33573	378	412	292
33574	378	413	372
33575	378	414	382
33576	378	415	332
33577	378	416	453
33578	378	417	426
33579	378	418	432
33580	378	419	457
33581	378	420	437
33582	378	421	390
33583	378	422	375
33584	378	423	484
33585	378	424	452
33586	378	425	492
33587	378	426	499
33588	378	427	471
33589	378	428	502
33590	378	429	507
33591	378	430	527
33592	378	431	580
33593	378	432	569
33594	378	433	556
33595	378	434	566
33596	378	435	609
33597	378	436	587
33598	378	437	602
33599	378	438	607
33600	378	439	622
33601	378	440	630
33602	378	441	628
33603	378	442	636
33604	378	443	642
33605	378	444	647
33606	378	445	657
33607	378	446	669
33608	378	447	682
33609	378	448	692
33610	378	449	657
33611	378	450	667
33612	378	451	675
33613	378	452	686
33614	378	453	710
33615	378	454	707
33616	378	455	730
33617	378	456	775
33618	378	457	594
33619	378	458	600
33620	378	459	634
33621	378	460	654
33622	378	461	665
33623	378	462	688
33624	378	463	748
33625	378	464	768
33626	378	465	778
33627	378	466	744
33628	378	467	759
33629	378	468	673
33630	378	469	653
33631	378	470	719
33632	378	471	731
33633	378	472	734
33634	378	473	734
33635	378	474	739
33636	378	475	734
33637	378	476	739
33638	378	477	749
33639	378	478	768
33640	378	479	774
33641	378	480	766
33642	378	481	824
33643	378	482	789
33644	378	483	813
33645	378	484	746
33646	378	485	780
33647	378	486	767
33648	378	487	782
33649	378	488	807
33650	378	489	868
33651	378	490	846
33652	378	491	836
33653	378	492	807
33654	379	380	68
33655	379	381	115
33656	379	382	42
33657	379	383	107
33658	379	384	95
33659	379	385	78
33660	379	386	20
33661	379	387	55
33662	379	388	133
33663	379	389	143
33664	379	390	238
33665	379	391	198
33666	379	392	183
33667	379	393	193
33668	379	394	38
33669	379	395	233
33670	379	396	243
33671	379	397	160
33672	379	398	111
33673	379	399	90
33674	379	400	105
33675	379	401	165
33676	379	402	168
33677	379	403	235
33678	379	404	280
33679	379	405	308
33680	379	406	373
33681	379	407	383
33682	379	408	393
33683	379	409	391
33684	379	410	413
33685	379	411	305
33686	379	412	325
33687	379	413	405
33688	379	414	415
33689	379	415	365
33690	379	416	486
33691	379	417	459
33692	379	418	465
33693	379	419	490
33694	379	420	470
33695	379	421	423
33696	379	422	408
33697	379	423	517
33698	379	424	485
33699	379	425	525
33700	379	426	532
33701	379	427	504
33702	379	428	535
33703	379	429	540
33704	379	430	560
33705	379	431	613
33706	379	432	602
33707	379	433	589
33708	379	434	599
33709	379	435	642
33710	379	436	620
33711	379	437	635
33712	379	438	640
33713	379	439	655
33714	379	440	663
33715	379	441	661
33716	379	442	669
33717	379	443	675
33718	379	444	680
33719	379	445	690
33720	379	446	702
33721	379	447	715
33722	379	448	725
33723	379	449	690
33724	379	450	700
33725	379	451	708
33726	379	452	719
33727	379	453	743
33728	379	454	740
33729	379	455	763
33730	379	456	808
33731	379	457	627
33732	379	458	633
33733	379	459	667
33734	379	460	687
33735	379	461	698
33736	379	462	721
33737	379	463	781
33738	379	464	801
33739	379	465	811
33740	379	466	777
33741	379	467	792
33742	379	468	706
33743	379	469	686
33744	379	470	752
33745	379	471	764
33746	379	472	767
33747	379	473	767
33748	379	474	772
33749	379	475	767
33750	379	476	772
33751	379	477	782
33752	379	478	801
33753	379	479	807
33754	379	480	799
33755	379	481	857
33756	379	482	822
33757	379	483	846
33758	379	484	779
33759	379	485	813
33760	379	486	800
33761	379	487	815
33762	379	488	840
33763	379	489	901
33764	379	490	879
33765	379	491	869
33766	379	492	840
33767	380	381	73
33768	380	382	43
33769	380	383	65
33770	380	384	18
33771	380	385	56
33772	380	386	46
33773	380	387	33
33774	380	388	56
33775	380	389	66
33776	380	390	161
33777	380	391	121
33778	380	392	106
33779	380	393	116
33780	380	394	53
33781	380	395	156
33782	380	396	166
33783	380	397	168
33784	380	398	119
33785	380	399	98
33786	380	400	113
33787	380	401	173
33788	380	402	176
33789	380	403	243
33790	380	404	203
33791	380	405	231
33792	380	406	296
33793	380	407	306
33794	380	408	316
33795	380	409	314
33796	380	410	336
33797	380	411	228
33798	380	412	248
33799	380	413	328
33800	380	414	338
33801	380	415	288
33802	380	416	409
33803	380	417	382
33804	380	418	388
33805	380	419	413
33806	380	420	393
33807	380	421	346
33808	380	422	331
33809	380	423	440
33810	380	424	408
33811	380	425	448
33812	380	426	455
33813	380	427	427
33814	380	428	458
33815	380	429	463
33816	380	430	483
33817	380	431	536
33818	380	432	525
33819	380	433	512
33820	380	434	522
33821	380	435	565
33822	380	436	543
33823	380	437	558
33824	380	438	563
33825	380	439	578
33826	380	440	586
33827	380	441	584
33828	380	442	592
33829	380	443	598
33830	380	444	603
33831	380	445	613
33832	380	446	625
33833	380	447	638
33834	380	448	648
33835	380	449	613
33836	380	450	623
33837	380	451	631
33838	380	452	642
33839	380	453	666
33840	380	454	663
33841	380	455	686
33842	380	456	731
33843	380	457	550
33844	380	458	556
33845	380	459	590
33846	380	460	610
33847	380	461	621
33848	380	462	644
33849	380	463	704
33850	380	464	724
33851	380	465	734
33852	380	466	700
33853	380	467	715
33854	380	468	629
33855	380	469	609
33856	380	470	675
33857	380	471	687
33858	380	472	690
33859	380	473	690
33860	380	474	695
33861	380	475	690
33862	380	476	695
33863	380	477	705
33864	380	478	724
33865	380	479	730
33866	380	480	722
33867	380	481	780
33868	380	482	745
33869	380	483	769
33870	380	484	702
33871	380	485	736
33872	380	486	723
33873	380	487	738
33874	380	488	763
33875	380	489	824
33876	380	490	802
33877	380	491	792
33878	380	492	763
33879	381	382	30
33880	381	383	8
33881	381	384	78
33882	381	385	5
33883	381	386	80
33884	381	387	36
33885	381	388	116
33886	381	389	126
33887	381	390	221
33888	381	391	181
33889	381	392	166
33890	381	393	176
33891	381	394	70
33892	381	395	216
33893	381	396	226
33894	381	397	108
33895	381	398	59
33896	381	399	38
33897	381	400	53
33898	381	401	113
33899	381	402	116
33900	381	403	183
33901	381	404	263
33902	381	405	291
33903	381	406	356
33904	381	407	366
33905	381	408	376
33906	381	409	374
33907	381	410	396
33908	381	411	288
33909	381	412	308
33910	381	413	388
33911	381	414	398
33912	381	415	348
33913	381	416	469
33914	381	417	442
33915	381	418	448
33916	381	419	473
33917	381	420	453
33918	381	421	406
33919	381	422	391
33920	381	423	500
33921	381	424	468
33922	381	425	508
33923	381	426	515
33924	381	427	487
33925	381	428	518
33926	381	429	523
33927	381	430	543
33928	381	431	596
33929	381	432	585
33930	381	433	572
33931	381	434	582
33932	381	435	625
33933	381	436	603
33934	381	437	618
33935	381	438	623
33936	381	439	638
33937	381	440	646
33938	381	441	644
33939	381	442	652
33940	381	443	658
33941	381	444	663
33942	381	445	673
33943	381	446	685
33944	381	447	698
33945	381	448	708
33946	381	449	673
33947	381	450	683
33948	381	451	691
33949	381	452	702
33950	381	453	726
33951	381	454	723
33952	381	455	746
33953	381	456	791
33954	381	457	610
33955	381	458	616
33956	381	459	650
33957	381	460	670
33958	381	461	681
33959	381	462	704
33960	381	463	764
33961	381	464	784
33962	381	465	794
33963	381	466	760
33964	381	467	775
33965	381	468	689
33966	381	469	669
33967	381	470	735
33968	381	471	747
33969	381	472	750
33970	381	473	750
33971	381	474	755
33972	381	475	750
33973	381	476	755
33974	381	477	765
33975	381	478	784
33976	381	479	790
33977	381	480	782
33978	381	481	840
33979	381	482	805
33980	381	483	829
33981	381	484	762
33982	381	485	796
33983	381	486	783
33984	381	487	798
33985	381	488	823
33986	381	489	884
33987	381	490	862
33988	381	491	852
33989	381	492	823
33990	382	383	38
33991	382	384	61
33992	382	385	42
33993	382	386	18
33994	382	387	16
33995	382	388	138
33996	382	389	148
33997	382	390	243
33998	382	391	203
33999	382	392	188
34000	382	393	198
34001	382	394	40
34002	382	395	238
34003	382	396	248
34004	382	397	122
34005	382	398	73
34006	382	399	78
34007	382	400	93
34008	382	401	127
34009	382	402	130
34010	382	403	197
34011	382	404	285
34012	382	405	313
34013	382	406	378
34014	382	407	388
34015	382	408	398
34016	382	409	396
34017	382	410	418
34018	382	411	310
34019	382	412	330
34020	382	413	410
34021	382	414	420
34022	382	415	370
34023	382	416	491
34024	382	417	464
34025	382	418	470
34026	382	419	495
34027	382	420	475
34028	382	421	428
34029	382	422	413
34030	382	423	522
34031	382	424	490
34032	382	425	530
34033	382	426	537
34034	382	427	509
34035	382	428	540
34036	382	429	545
34037	382	430	565
34038	382	431	618
34039	382	432	607
34040	382	433	594
34041	382	434	604
34042	382	435	647
34043	382	436	625
34044	382	437	640
34045	382	438	645
34046	382	439	660
34047	382	440	668
34048	382	441	666
34049	382	442	674
34050	382	443	680
34051	382	444	685
34052	382	445	695
34053	382	446	707
34054	382	447	720
34055	382	448	730
34056	382	449	695
34057	382	450	705
34058	382	451	713
34059	382	452	724
34060	382	453	748
34061	382	454	745
34062	382	455	768
34063	382	456	813
34064	382	457	632
34065	382	458	638
34066	382	459	672
34067	382	460	692
34068	382	461	703
34069	382	462	726
34070	382	463	786
34071	382	464	806
34072	382	465	816
34073	382	466	782
34074	382	467	797
34075	382	468	711
34076	382	469	691
34077	382	470	757
34078	382	471	769
34079	382	472	772
34080	382	473	772
34081	382	474	777
34082	382	475	772
34083	382	476	777
34084	382	477	787
34085	382	478	806
34086	382	479	812
34087	382	480	804
34088	382	481	862
34089	382	482	827
34090	382	483	851
34091	382	484	784
34092	382	485	818
34093	382	486	805
34094	382	487	820
34095	382	488	845
34096	382	489	906
34097	382	490	884
34098	382	491	874
34099	382	492	845
34100	383	384	86
34101	383	385	13
34102	383	386	88
34103	383	387	44
34104	383	388	130
34105	383	389	140
34106	383	390	235
34107	383	391	195
34108	383	392	180
34109	383	393	190
34110	383	394	78
34111	383	395	230
34112	383	396	240
34113	383	397	100
34114	383	398	51
34115	383	399	30
34116	383	400	45
34117	383	401	105
34118	383	402	108
34119	383	403	175
34120	383	404	277
34121	383	405	305
34122	383	406	370
34123	383	407	380
34124	383	408	390
34125	383	409	388
34126	383	410	410
34127	383	411	302
34128	383	412	322
34129	383	413	402
34130	383	414	412
34131	383	415	362
34132	383	416	483
34133	383	417	456
34134	383	418	462
34135	383	419	487
34136	383	420	467
34137	383	421	420
34138	383	422	405
34139	383	423	514
34140	383	424	482
34141	383	425	522
34142	383	426	529
34143	383	427	501
34144	383	428	532
34145	383	429	537
34146	383	430	557
34147	383	431	610
34148	383	432	599
34149	383	433	586
34150	383	434	596
34151	383	435	639
34152	383	436	617
34153	383	437	632
34154	383	438	637
34155	383	439	652
34156	383	440	660
34157	383	441	658
34158	383	442	666
34159	383	443	672
34160	383	444	677
34161	383	445	687
34162	383	446	699
34163	383	447	712
34164	383	448	722
34165	383	449	687
34166	383	450	697
34167	383	451	705
34168	383	452	716
34169	383	453	740
34170	383	454	737
34171	383	455	760
34172	383	456	805
34173	383	457	624
34174	383	458	630
34175	383	459	664
34176	383	460	684
34177	383	461	695
34178	383	462	718
34179	383	463	778
34180	383	464	798
34181	383	465	808
34182	383	466	774
34183	383	467	789
34184	383	468	703
34185	383	469	683
34186	383	470	749
34187	383	471	761
34188	383	472	764
34189	383	473	764
34190	383	474	769
34191	383	475	764
34192	383	476	769
34193	383	477	779
34194	383	478	798
34195	383	479	804
34196	383	480	796
34197	383	481	854
34198	383	482	819
34199	383	483	843
34200	383	484	776
34201	383	485	810
34202	383	486	797
34203	383	487	812
34204	383	488	837
34205	383	489	898
34206	383	490	876
34207	383	491	866
34208	383	492	837
34209	384	385	83
34210	384	386	73
34211	384	387	60
34212	384	388	38
34213	384	389	48
34214	384	390	143
34215	384	391	103
34216	384	392	88
34217	384	393	98
34218	384	394	60
34219	384	395	138
34220	384	396	148
34221	384	397	195
34222	384	398	146
34223	384	399	125
34224	384	400	140
34225	384	401	200
34226	384	402	203
34227	384	403	270
34228	384	404	185
34229	384	405	213
34230	384	406	278
34231	384	407	288
34232	384	408	298
34233	384	409	296
34234	384	410	318
34235	384	411	210
34236	384	412	230
34237	384	413	310
34238	384	414	320
34239	384	415	270
34240	384	416	391
34241	384	417	364
34242	384	418	370
34243	384	419	395
34244	384	420	375
34245	384	421	328
34246	384	422	313
34247	384	423	422
34248	384	424	390
34249	384	425	430
34250	384	426	437
34251	384	427	409
34252	384	428	440
34253	384	429	445
34254	384	430	465
34255	384	431	518
34256	384	432	507
34257	384	433	494
34258	384	434	504
34259	384	435	547
34260	384	436	525
34261	384	437	540
34262	384	438	545
34263	384	439	560
34264	384	440	568
34265	384	441	566
34266	384	442	574
34267	384	443	580
34268	384	444	585
34269	384	445	595
34270	384	446	607
34271	384	447	620
34272	384	448	630
34273	384	449	595
34274	384	450	605
34275	384	451	613
34276	384	452	624
34277	384	453	648
34278	384	454	645
34279	384	455	668
34280	384	456	713
34281	384	457	532
34282	384	458	538
34283	384	459	572
34284	384	460	592
34285	384	461	603
34286	384	462	626
34287	384	463	686
34288	384	464	706
34289	384	465	716
34290	384	466	682
34291	384	467	697
34292	384	468	611
34293	384	469	591
34294	384	470	657
34295	384	471	669
34296	384	472	672
34297	384	473	672
34298	384	474	677
34299	384	475	672
34300	384	476	677
34301	384	477	687
34302	384	478	706
34303	384	479	712
34304	384	480	704
34305	384	481	762
34306	384	482	727
34307	384	483	751
34308	384	484	684
34309	384	485	718
34310	384	486	705
34311	384	487	720
34312	384	488	745
34313	384	489	806
34314	384	490	784
34315	384	491	774
34316	384	492	745
34317	385	386	60
34318	385	387	43
34319	385	388	121
34320	385	389	131
34321	385	390	226
34322	385	391	186
34323	385	392	171
34324	385	393	181
34325	385	394	82
34326	385	395	221
34327	385	396	231
34328	385	397	112
34329	385	398	63
34330	385	399	42
34331	385	400	57
34332	385	401	117
34333	385	402	120
34334	385	403	187
34335	385	404	268
34336	385	405	296
34337	385	406	361
34338	385	407	371
34339	385	408	381
34340	385	409	379
34341	385	410	401
34342	385	411	293
34343	385	412	313
34344	385	413	393
34345	385	414	403
34346	385	415	353
34347	385	416	474
34348	385	417	447
34349	385	418	453
34350	385	419	478
34351	385	420	458
34352	385	421	411
34353	385	422	396
34354	385	423	505
34355	385	424	473
34356	385	425	513
34357	385	426	520
34358	385	427	492
34359	385	428	523
34360	385	429	528
34361	385	430	548
34362	385	431	601
34363	385	432	590
34364	385	433	577
34365	385	434	587
34366	385	435	630
34367	385	436	608
34368	385	437	623
34369	385	438	628
34370	385	439	643
34371	385	440	651
34372	385	441	649
34373	385	442	657
34374	385	443	663
34375	385	444	668
34376	385	445	678
34377	385	446	690
34378	385	447	703
34379	385	448	713
34380	385	449	678
34381	385	450	688
34382	385	451	696
34383	385	452	707
34384	385	453	731
34385	385	454	728
34386	385	455	751
34387	385	456	796
34388	385	457	615
34389	385	458	621
34390	385	459	655
34391	385	460	675
34392	385	461	686
34393	385	462	709
34394	385	463	769
34395	385	464	789
34396	385	465	799
34397	385	466	765
34398	385	467	780
34399	385	468	694
34400	385	469	674
34401	385	470	740
34402	385	471	752
34403	385	472	755
34404	385	473	755
34405	385	474	760
34406	385	475	755
34407	385	476	760
34408	385	477	770
34409	385	478	789
34410	385	479	795
34411	385	480	787
34412	385	481	845
34413	385	482	810
34414	385	483	834
34415	385	484	767
34416	385	485	801
34417	385	486	788
34418	385	487	803
34419	385	488	828
34420	385	489	889
34421	385	490	867
34422	385	491	857
34423	385	492	828
34424	386	387	53
34425	386	388	111
34426	386	389	121
34427	386	390	216
34428	386	391	176
34429	386	392	161
34430	386	393	171
34431	386	394	22
34432	386	395	211
34433	386	396	221
34434	386	397	140
34435	386	398	91
34436	386	399	70
34437	386	400	85
34438	386	401	145
34439	386	402	148
34440	386	403	215
34441	386	404	258
34442	386	405	286
34443	386	406	351
34444	386	407	361
34445	386	408	371
34446	386	409	369
34447	386	410	391
34448	386	411	283
34449	386	412	303
34450	386	413	383
34451	386	414	393
34452	386	415	343
34453	386	416	464
34454	386	417	437
34455	386	418	443
34456	386	419	468
34457	386	420	448
34458	386	421	401
34459	386	422	386
34460	386	423	495
34461	386	424	463
34462	386	425	503
34463	386	426	510
34464	386	427	482
34465	386	428	513
34466	386	429	518
34467	386	430	538
34468	386	431	591
34469	386	432	580
34470	386	433	567
34471	386	434	577
34472	386	435	620
34473	386	436	598
34474	386	437	613
34475	386	438	618
34476	386	439	633
34477	386	440	641
34478	386	441	639
34479	386	442	647
34480	386	443	653
34481	386	444	658
34482	386	445	668
34483	386	446	680
34484	386	447	693
34485	386	448	703
34486	386	449	668
34487	386	450	678
34488	386	451	686
34489	386	452	697
34490	386	453	721
34491	386	454	718
34492	386	455	741
34493	386	456	786
34494	386	457	605
34495	386	458	611
34496	386	459	645
34497	386	460	665
34498	386	461	676
34499	386	462	699
34500	386	463	759
34501	386	464	779
34502	386	465	789
34503	386	466	755
34504	386	467	770
34505	386	468	684
34506	386	469	664
34507	386	470	730
34508	386	471	742
34509	386	472	745
34510	386	473	745
34511	386	474	750
34512	386	475	745
34513	386	476	750
34514	386	477	760
34515	386	478	779
34516	386	479	785
34517	386	480	777
34518	386	481	835
34519	386	482	800
34520	386	483	824
34521	386	484	757
34522	386	485	791
34523	386	486	778
34524	386	487	793
34525	386	488	818
34526	386	489	879
34527	386	490	857
34528	386	491	847
34529	386	492	818
34530	387	388	98
34531	387	389	108
34532	387	390	203
34533	387	391	163
34534	387	392	148
34535	387	393	158
34536	387	394	55
34537	387	395	198
34538	387	396	208
34539	387	397	150
34540	387	398	101
34541	387	399	67
34542	387	400	82
34543	387	401	155
34544	387	402	158
34545	387	403	225
34546	387	404	245
34547	387	405	273
34548	387	406	338
34549	387	407	348
34550	387	408	358
34551	387	409	356
34552	387	410	378
34553	387	411	270
34554	387	412	290
34555	387	413	370
34556	387	414	380
34557	387	415	330
34558	387	416	451
34559	387	417	424
34560	387	418	430
34561	387	419	455
34562	387	420	435
34563	387	421	388
34564	387	422	373
34565	387	423	482
34566	387	424	450
34567	387	425	490
34568	387	426	497
34569	387	427	469
34570	387	428	500
34571	387	429	505
34572	387	430	525
34573	387	431	578
34574	387	432	567
34575	387	433	554
34576	387	434	564
34577	387	435	607
34578	387	436	585
34579	387	437	600
34580	387	438	605
34581	387	439	620
34582	387	440	628
34583	387	441	626
34584	387	442	634
34585	387	443	640
34586	387	444	645
34587	387	445	655
34588	387	446	667
34589	387	447	680
34590	387	448	690
34591	387	449	655
34592	387	450	665
34593	387	451	673
34594	387	452	684
34595	387	453	708
34596	387	454	705
34597	387	455	728
34598	387	456	773
34599	387	457	592
34600	387	458	598
34601	387	459	632
34602	387	460	652
34603	387	461	663
34604	387	462	686
34605	387	463	746
34606	387	464	766
34607	387	465	776
34608	387	466	742
34609	387	467	757
34610	387	468	671
34611	387	469	651
34612	387	470	717
34613	387	471	729
34614	387	472	732
34615	387	473	732
34616	387	474	737
34617	387	475	732
34618	387	476	737
34619	387	477	747
34620	387	478	766
34621	387	479	772
34622	387	480	764
34623	387	481	822
34624	387	482	787
34625	387	483	811
34626	387	484	744
34627	387	485	778
34628	387	486	765
34629	387	487	780
34630	387	488	805
34631	387	489	866
34632	387	490	844
34633	387	491	834
34634	387	492	805
34635	388	389	10
34636	388	390	105
34637	388	391	65
34638	388	392	50
34639	388	393	60
34640	388	394	50
34641	388	395	100
34642	388	396	110
34643	388	397	100
34644	388	398	75
34645	388	399	95
34646	388	400	110
34647	388	401	170
34648	388	402	215
34649	388	403	125
34650	388	404	170
34651	388	405	175
34652	388	406	252
34653	388	407	260
34654	388	408	260
34655	388	409	258
34656	388	410	292
34657	388	411	195
34658	388	412	215
34659	388	413	295
34660	388	414	305
34661	388	415	255
34662	388	416	376
34663	388	417	349
34664	388	418	355
34665	388	419	380
34666	388	420	360
34667	388	421	313
34668	388	422	298
34669	388	423	407
34670	388	424	375
34671	388	425	415
34672	388	426	422
34673	388	427	394
34674	388	428	425
34675	388	429	430
34676	388	430	450
34677	388	431	503
34678	388	432	492
34679	388	433	479
34680	388	434	489
34681	388	435	532
34682	388	436	510
34683	388	437	525
34684	388	438	530
34685	388	439	545
34686	388	440	553
34687	388	441	551
34688	388	442	559
34689	388	443	565
34690	388	444	570
34691	388	445	580
34692	388	446	592
34693	388	447	605
34694	388	448	615
34695	388	449	580
34696	388	450	590
34697	388	451	598
34698	388	452	609
34699	388	453	633
34700	388	454	630
34701	388	455	653
34702	388	456	698
34703	388	457	517
34704	388	458	523
34705	388	459	557
34706	388	460	577
34707	388	461	588
34708	388	462	611
34709	388	463	671
34710	388	464	691
34711	388	465	701
34712	388	466	667
34713	388	467	682
34714	388	468	596
34715	388	469	576
34716	388	470	642
34717	388	471	654
34718	388	472	657
34719	388	473	657
34720	388	474	662
34721	388	475	657
34722	388	476	662
34723	388	477	672
34724	388	478	691
34725	388	479	697
34726	388	480	689
34727	388	481	747
34728	388	482	712
34729	388	483	736
34730	388	484	669
34731	388	485	703
34732	388	486	690
34733	388	487	705
34734	388	488	730
34735	388	489	791
34736	388	490	769
34737	388	491	759
34738	388	492	730
34739	389	390	120
34740	389	391	80
34741	389	392	55
34742	389	393	65
34743	389	394	55
34744	389	395	105
34745	389	396	115
34746	389	397	110
34747	389	398	85
34748	389	399	105
34749	389	400	120
34750	389	401	180
34751	389	402	225
34752	389	403	135
34753	389	404	180
34754	389	405	185
34755	389	406	262
34756	389	407	270
34757	389	408	270
34758	389	409	268
34759	389	410	302
34760	389	411	205
34761	389	412	225
34762	389	413	305
34763	389	414	315
34764	389	415	265
34765	389	416	386
34766	389	417	359
34767	389	418	365
34768	389	419	390
34769	389	420	370
34770	389	421	323
34771	389	422	308
34772	389	423	417
34773	389	424	385
34774	389	425	425
34775	389	426	432
34776	389	427	404
34777	389	428	435
34778	389	429	440
34779	389	430	460
34780	389	431	513
34781	389	432	502
34782	389	433	489
34783	389	434	499
34784	389	435	542
34785	389	436	520
34786	389	437	535
34787	389	438	540
34788	389	439	555
34789	389	440	563
34790	389	441	561
34791	389	442	569
34792	389	443	575
34793	389	444	580
34794	389	445	590
34795	389	446	602
34796	389	447	615
34797	389	448	625
34798	389	449	590
34799	389	450	600
34800	389	451	608
34801	389	452	619
34802	389	453	643
34803	389	454	640
34804	389	455	663
34805	389	456	708
34806	389	457	527
34807	389	458	533
34808	389	459	567
34809	389	460	587
34810	389	461	598
34811	389	462	621
34812	389	463	681
34813	389	464	701
34814	389	465	711
34815	389	466	677
34816	389	467	692
34817	389	468	606
34818	389	469	586
34819	389	470	652
34820	389	471	664
34821	389	472	667
34822	389	473	667
34823	389	474	672
34824	389	475	667
34825	389	476	672
34826	389	477	682
34827	389	478	701
34828	389	479	707
34829	389	480	699
34830	389	481	757
34831	389	482	722
34832	389	483	746
34833	389	484	679
34834	389	485	713
34835	389	486	700
34836	389	487	715
34837	389	488	740
34838	389	489	801
34839	389	490	779
34840	389	491	769
34841	389	492	740
34842	390	391	97
34843	390	392	165
34844	390	393	175
34845	390	394	160
34846	390	395	205
34847	390	396	215
34848	390	397	205
34849	390	398	180
34850	390	399	200
34851	390	400	215
34852	390	401	275
34853	390	402	320
34854	390	403	292
34855	390	404	275
34856	390	405	290
34857	390	406	355
34858	390	407	365
34859	390	408	375
34860	390	409	373
34861	390	410	395
34862	390	411	300
34863	390	412	320
34864	390	413	400
34865	390	414	410
34866	390	415	360
34867	390	416	481
34868	390	417	454
34869	390	418	460
34870	390	419	485
34871	390	420	465
34872	390	421	418
34873	390	422	403
34874	390	423	512
34875	390	424	480
34876	390	425	520
34877	390	426	527
34878	390	427	499
34879	390	428	530
34880	390	429	535
34881	390	430	555
34882	390	431	608
34883	390	432	597
34884	390	433	584
34885	390	434	594
34886	390	435	637
34887	390	436	615
34888	390	437	630
34889	390	438	635
34890	390	439	650
34891	390	440	658
34892	390	441	656
34893	390	442	664
34894	390	443	670
34895	390	444	675
34896	390	445	685
34897	390	446	697
34898	390	447	710
34899	390	448	720
34900	390	449	685
34901	390	450	695
34902	390	451	703
34903	390	452	714
34904	390	453	738
34905	390	454	735
34906	390	455	758
34907	390	456	803
34908	390	457	622
34909	390	458	628
34910	390	459	662
34911	390	460	682
34912	390	461	693
34913	390	462	716
34914	390	463	776
34915	390	464	796
34916	390	465	806
34917	390	466	772
34918	390	467	787
34919	390	468	701
34920	390	469	681
34921	390	470	747
34922	390	471	759
34923	390	472	762
34924	390	473	762
34925	390	474	767
34926	390	475	762
34927	390	476	767
34928	390	477	777
34929	390	478	796
34930	390	479	802
34931	390	480	794
34932	390	481	852
34933	390	482	817
34934	390	483	841
34935	390	484	774
34936	390	485	808
34937	390	486	795
34938	390	487	810
34939	390	488	835
34940	390	489	896
34941	390	490	874
34942	390	491	864
34943	390	492	835
34944	391	392	90
34945	391	393	100
34946	391	394	115
34947	391	395	165
34948	391	396	175
34949	391	397	165
34950	391	398	140
34951	391	399	160
34952	391	400	175
34953	391	401	235
34954	391	402	280
34955	391	403	200
34956	391	404	235
34957	391	405	215
34958	391	406	280
34959	391	407	290
34960	391	408	300
34961	391	409	298
34962	391	410	320
34963	391	411	260
34964	391	412	280
34965	391	413	360
34966	391	414	370
34967	391	415	320
34968	391	416	441
34969	391	417	414
34970	391	418	420
34971	391	419	445
34972	391	420	425
34973	391	421	378
34974	391	422	363
34975	391	423	472
34976	391	424	440
34977	391	425	480
34978	391	426	487
34979	391	427	459
34980	391	428	490
34981	391	429	495
34982	391	430	515
34983	391	431	568
34984	391	432	557
34985	391	433	544
34986	391	434	554
34987	391	435	597
34988	391	436	575
34989	391	437	590
34990	391	438	595
34991	391	439	610
34992	391	440	618
34993	391	441	616
34994	391	442	624
34995	391	443	630
34996	391	444	635
34997	391	445	645
34998	391	446	657
34999	391	447	670
35000	391	448	680
35001	391	449	645
35002	391	450	655
35003	391	451	663
35004	391	452	674
35005	391	453	698
35006	391	454	695
35007	391	455	718
35008	391	456	763
35009	391	457	582
35010	391	458	588
35011	391	459	622
35012	391	460	642
35013	391	461	653
35014	391	462	676
35015	391	463	736
35016	391	464	756
35017	391	465	766
35018	391	466	732
35019	391	467	747
35020	391	468	661
35021	391	469	641
35022	391	470	707
35023	391	471	719
35024	391	472	722
35025	391	473	722
35026	391	474	727
35027	391	475	722
35028	391	476	727
35029	391	477	737
35030	391	478	756
35031	391	479	762
35032	391	480	754
35033	391	481	812
35034	391	482	777
35035	391	483	801
35036	391	484	734
35037	391	485	768
35038	391	486	755
35039	391	487	770
35040	391	488	795
35041	391	489	856
35042	391	490	834
35043	391	491	824
35044	391	492	795
35045	392	393	10
35046	392	394	100
35047	392	395	150
35048	392	396	160
35049	392	397	74
35050	392	398	125
35051	392	399	200
35052	392	400	152
35053	392	401	190
35054	392	402	189
35055	392	403	65
35056	392	404	165
35057	392	405	125
35058	392	406	190
35059	392	407	200
35060	392	408	210
35061	392	409	208
35062	392	410	230
35063	392	411	190
35064	392	412	210
35065	392	413	290
35066	392	414	300
35067	392	415	250
35068	392	416	371
35069	392	417	344
35070	392	418	350
35071	392	419	375
35072	392	420	355
35073	392	421	308
35074	392	422	293
35075	392	423	402
35076	392	424	370
35077	392	425	410
35078	392	426	417
35079	392	427	389
35080	392	428	420
35081	392	429	425
35082	392	430	445
35083	392	431	498
35084	392	432	487
35085	392	433	474
35086	392	434	484
35087	392	435	527
35088	392	436	505
35089	392	437	520
35090	392	438	525
35091	392	439	540
35092	392	440	548
35093	392	441	546
35094	392	442	554
35095	392	443	560
35096	392	444	565
35097	392	445	575
35098	392	446	587
35099	392	447	600
35100	392	448	610
35101	392	449	575
35102	392	450	585
35103	392	451	593
35104	392	452	604
35105	392	453	628
35106	392	454	625
35107	392	455	648
35108	392	456	693
35109	392	457	512
35110	392	458	518
35111	392	459	552
35112	392	460	572
35113	392	461	583
35114	392	462	606
35115	392	463	666
35116	392	464	686
35117	392	465	696
35118	392	466	662
35119	392	467	677
35120	392	468	591
35121	392	469	571
35122	392	470	637
35123	392	471	649
35124	392	472	652
35125	392	473	652
35126	392	474	657
35127	392	475	652
35128	392	476	657
35129	392	477	667
35130	392	478	686
35131	392	479	692
35132	392	480	684
35133	392	481	742
35134	392	482	707
35135	392	483	731
35136	392	484	664
35137	392	485	698
35138	392	486	685
35139	392	487	700
35140	392	488	725
35141	392	489	786
35142	392	490	764
35143	392	491	754
35144	392	492	725
35145	393	394	110
35146	393	395	160
35147	393	396	170
35148	393	397	84
35149	393	398	135
35150	393	399	190
35151	393	400	145
35152	393	401	205
35153	393	402	199
35154	393	403	60
35155	393	404	175
35156	393	405	175
35157	393	406	240
35158	393	407	250
35159	393	408	260
35160	393	409	258
35161	393	410	280
35162	393	411	200
35163	393	412	220
35164	393	413	300
35165	393	414	310
35166	393	415	260
35167	393	416	381
35168	393	417	354
35169	393	418	360
35170	393	419	385
35171	393	420	365
35172	393	421	318
35173	393	422	303
35174	393	423	412
35175	393	424	380
35176	393	425	420
35177	393	426	427
35178	393	427	399
35179	393	428	430
35180	393	429	435
35181	393	430	455
35182	393	431	508
35183	393	432	497
35184	393	433	484
35185	393	434	494
35186	393	435	537
35187	393	436	515
35188	393	437	530
35189	393	438	535
35190	393	439	550
35191	393	440	558
35192	393	441	556
35193	393	442	564
35194	393	443	570
35195	393	444	575
35196	393	445	585
35197	393	446	597
35198	393	447	610
35199	393	448	620
35200	393	449	585
35201	393	450	595
35202	393	451	603
35203	393	452	614
35204	393	453	638
35205	393	454	635
35206	393	455	658
35207	393	456	703
35208	393	457	522
35209	393	458	528
35210	393	459	562
35211	393	460	582
35212	393	461	593
35213	393	462	616
35214	393	463	676
35215	393	464	696
35216	393	465	706
35217	393	466	672
35218	393	467	687
35219	393	468	601
35220	393	469	581
35221	393	470	647
35222	393	471	659
35223	393	472	662
35224	393	473	662
35225	393	474	667
35226	393	475	662
35227	393	476	667
35228	393	477	677
35229	393	478	696
35230	393	479	702
35231	393	480	694
35232	393	481	752
35233	393	482	717
35234	393	483	741
35235	393	484	674
35236	393	485	708
35237	393	486	695
35238	393	487	710
35239	393	488	735
35240	393	489	796
35241	393	490	774
35242	393	491	764
35243	393	492	735
35244	394	395	150
35245	394	396	160
35246	394	397	162
35247	394	398	60
35248	394	399	92
35249	394	400	107
35250	394	401	167
35251	394	402	277
35252	394	403	175
35253	394	404	280
35254	394	405	363
35255	394	406	428
35256	394	407	438
35257	394	408	448
35258	394	409	446
35259	394	410	468
35260	394	411	305
35261	394	412	325
35262	394	413	405
35263	394	414	415
35264	394	415	365
35265	394	416	486
35266	394	417	459
35267	394	418	465
35268	394	419	490
35269	394	420	470
35270	394	421	423
35271	394	422	408
35272	394	423	517
35273	394	424	485
35274	394	425	525
35275	394	426	532
35276	394	427	504
35277	394	428	535
35278	394	429	540
35279	394	430	560
35280	394	431	613
35281	394	432	602
35282	394	433	589
35283	394	434	599
35284	394	435	642
35285	394	436	620
35286	394	437	635
35287	394	438	640
35288	394	439	655
35289	394	440	663
35290	394	441	661
35291	394	442	669
35292	394	443	675
35293	394	444	680
35294	394	445	690
35295	394	446	702
35296	394	447	715
35297	394	448	725
35298	394	449	690
35299	394	450	700
35300	394	451	708
35301	394	452	719
35302	394	453	743
35303	394	454	740
35304	394	455	763
35305	394	456	808
35306	394	457	627
35307	394	458	633
35308	394	459	667
35309	394	460	687
35310	394	461	698
35311	394	462	721
35312	394	463	781
35313	394	464	801
35314	394	465	811
35315	394	466	777
35316	394	467	792
35317	394	468	706
35318	394	469	686
35319	394	470	752
35320	394	471	764
35321	394	472	767
35322	394	473	767
35323	394	474	772
35324	394	475	767
35325	394	476	772
35326	394	477	782
35327	394	478	801
35328	394	479	807
35329	394	480	799
35330	394	481	857
35331	394	482	822
35332	394	483	846
35333	394	484	779
35334	394	485	813
35335	394	486	800
35336	394	487	815
35337	394	488	840
35338	394	489	901
35339	394	490	879
35340	394	491	869
35341	394	492	840
35342	395	396	10
35343	395	397	126
35344	395	398	175
35345	395	399	205
35346	395	400	182
35347	395	401	242
35348	395	402	241
35349	395	403	98
35350	395	404	315
35351	395	405	150
35352	395	406	215
35353	395	407	225
35354	395	408	235
35355	395	409	233
35356	395	410	255
35357	395	411	340
35358	395	412	360
35359	395	413	440
35360	395	414	450
35361	395	415	400
35362	395	416	521
35363	395	417	494
35364	395	418	500
35365	395	419	525
35366	395	420	505
35367	395	421	458
35368	395	422	443
35369	395	423	552
35370	395	424	520
35371	395	425	560
35372	395	426	567
35373	395	427	539
35374	395	428	570
35375	395	429	575
35376	395	430	595
35377	395	431	648
35378	395	432	637
35379	395	433	624
35380	395	434	634
35381	395	435	677
35382	395	436	655
35383	395	437	670
35384	395	438	675
35385	395	439	690
35386	395	440	698
35387	395	441	696
35388	395	442	704
35389	395	443	710
35390	395	444	715
35391	395	445	725
35392	395	446	737
35393	395	447	750
35394	395	448	760
35395	395	449	725
35396	395	450	735
35397	395	451	743
35398	395	452	754
35399	395	453	778
35400	395	454	775
35401	395	455	798
35402	395	456	843
35403	395	457	662
35404	395	458	668
35405	395	459	702
35406	395	460	722
35407	395	461	733
35408	395	462	756
35409	395	463	816
35410	395	464	836
35411	395	465	846
35412	395	466	812
35413	395	467	827
35414	395	468	741
35415	395	469	721
35416	395	470	787
35417	395	471	799
35418	395	472	802
35419	395	473	802
35420	395	474	807
35421	395	475	802
35422	395	476	807
35423	395	477	817
35424	395	478	836
35425	395	479	842
35426	395	480	834
35427	395	481	892
35428	395	482	857
35429	395	483	881
35430	395	484	814
35431	395	485	848
35432	395	486	835
35433	395	487	850
35434	395	488	875
35435	395	489	936
35436	395	490	914
35437	395	491	904
35438	395	492	875
35439	396	397	136
35440	396	398	185
35441	396	399	210
35442	396	400	192
35443	396	401	252
35444	396	402	251
35445	396	403	108
35446	396	404	325
35447	396	405	160
35448	396	406	225
35449	396	407	235
35450	396	408	245
35451	396	409	243
35452	396	410	265
35453	396	411	350
35454	396	412	370
35455	396	413	450
35456	396	414	460
35457	396	415	410
35458	396	416	531
35459	396	417	504
35460	396	418	510
35461	396	419	535
35462	396	420	515
35463	396	421	468
35464	396	422	453
35465	396	423	562
35466	396	424	530
35467	396	425	570
35468	396	426	577
35469	396	427	549
35470	396	428	580
35471	396	429	585
35472	396	430	605
35473	396	431	658
35474	396	432	647
35475	396	433	634
35476	396	434	644
35477	396	435	687
35478	396	436	665
35479	396	437	680
35480	396	438	685
35481	396	439	700
35482	396	440	708
35483	396	441	706
35484	396	442	714
35485	396	443	720
35486	396	444	725
35487	396	445	735
35488	396	446	747
35489	396	447	760
35490	396	448	770
35491	396	449	735
35492	396	450	745
35493	396	451	753
35494	396	452	764
35495	396	453	788
35496	396	454	785
35497	396	455	808
35498	396	456	853
35499	396	457	672
35500	396	458	678
35501	396	459	712
35502	396	460	732
35503	396	461	743
35504	396	462	766
35505	396	463	826
35506	396	464	846
35507	396	465	856
35508	396	466	822
35509	396	467	837
35510	396	468	751
35511	396	469	731
35512	396	470	797
35513	396	471	809
35514	396	472	812
35515	396	473	812
35516	396	474	817
35517	396	475	812
35518	396	476	817
35519	396	477	827
35520	396	478	846
35521	396	479	852
35522	396	480	844
35523	396	481	902
35524	396	482	867
35525	396	483	891
35526	396	484	824
35527	396	485	858
35528	396	486	845
35529	396	487	860
35530	396	488	885
35531	396	489	946
35532	396	490	924
35533	396	491	914
35534	396	492	885
35535	397	398	95
35536	397	399	75
35537	397	400	85
35538	397	401	63
35539	397	402	8
35540	397	403	115
35541	397	404	78
35542	397	405	123
35543	397	406	183
35544	397	407	198
35545	397	408	203
35546	397	409	206
35547	397	410	223
35548	397	411	103
35549	397	412	123
35550	397	413	203
35551	397	414	213
35552	397	415	163
35553	397	416	284
35554	397	417	257
35555	397	418	263
35556	397	419	288
35557	397	420	268
35558	397	421	221
35559	397	422	206
35560	397	423	315
35561	397	424	283
35562	397	425	323
35563	397	426	330
35564	397	427	302
35565	397	428	333
35566	397	429	338
35567	397	430	358
35568	397	431	411
35569	397	432	400
35570	397	433	387
35571	397	434	397
35572	397	435	440
35573	397	436	418
35574	397	437	433
35575	397	438	438
35576	397	439	453
35577	397	440	461
35578	397	441	459
35579	397	442	467
35580	397	443	473
35581	397	444	478
35582	397	445	488
35583	397	446	500
35584	397	447	513
35585	397	448	523
35586	397	449	488
35587	397	450	498
35588	397	451	506
35589	397	452	517
35590	397	453	541
35591	397	454	538
35592	397	455	561
35593	397	456	606
35594	397	457	425
35595	397	458	431
35596	397	459	465
35597	397	460	485
35598	397	461	496
35599	397	462	519
35600	397	463	579
35601	397	464	599
35602	397	465	609
35603	397	466	575
35604	397	467	590
35605	397	468	504
35606	397	469	484
35607	397	470	550
35608	397	471	562
35609	397	472	565
35610	397	473	565
35611	397	474	570
35612	397	475	565
35613	397	476	570
35614	397	477	580
35615	397	478	599
35616	397	479	605
35617	397	480	597
35618	397	481	655
35619	397	482	620
35620	397	483	644
35621	397	484	577
35622	397	485	611
35623	397	486	598
35624	397	487	613
35625	397	488	638
35626	397	489	699
35627	397	490	677
35628	397	491	667
35629	397	492	638
35630	398	399	25
35631	398	400	40
35632	398	401	32
35633	398	402	103
35634	398	403	210
35635	398	404	173
35636	398	405	218
35637	398	406	278
35638	398	407	293
35639	398	408	298
35640	398	409	301
35641	398	410	318
35642	398	411	198
35643	398	412	218
35644	398	413	298
35645	398	414	308
35646	398	415	258
35647	398	416	379
35648	398	417	352
35649	398	418	358
35650	398	419	383
35651	398	420	363
35652	398	421	316
35653	398	422	301
35654	398	423	410
35655	398	424	378
35656	398	425	418
35657	398	426	425
35658	398	427	397
35659	398	428	428
35660	398	429	433
35661	398	430	453
35662	398	431	506
35663	398	432	495
35664	398	433	482
35665	398	434	492
35666	398	435	535
35667	398	436	513
35668	398	437	528
35669	398	438	533
35670	398	439	548
35671	398	440	556
35672	398	441	554
35673	398	442	562
35674	398	443	568
35675	398	444	573
35676	398	445	583
35677	398	446	595
35678	398	447	608
35679	398	448	618
35680	398	449	583
35681	398	450	593
35682	398	451	601
35683	398	452	612
35684	398	453	636
35685	398	454	633
35686	398	455	656
35687	398	456	701
35688	398	457	520
35689	398	458	526
35690	398	459	560
35691	398	460	580
35692	398	461	591
35693	398	462	614
35694	398	463	674
35695	398	464	694
35696	398	465	704
35697	398	466	670
35698	398	467	685
35699	398	468	599
35700	398	469	579
35701	398	470	645
35702	398	471	657
35703	398	472	660
35704	398	473	660
35705	398	474	665
35706	398	475	660
35707	398	476	665
35708	398	477	675
35709	398	478	694
35710	398	479	700
35711	398	480	692
35712	398	481	750
35713	398	482	715
35714	398	483	739
35715	398	484	672
35716	398	485	706
35717	398	486	693
35718	398	487	708
35719	398	488	733
35720	398	489	794
35721	398	490	772
35722	398	491	762
35723	398	492	733
35724	399	400	15
35725	399	401	75
35726	399	402	78
35727	399	403	145
35728	399	404	148
35729	399	405	193
35730	399	406	253
35731	399	407	268
35732	399	408	273
35733	399	409	276
35734	399	410	293
35735	399	411	173
35736	399	412	193
35737	399	413	273
35738	399	414	283
35739	399	415	233
35740	399	416	354
35741	399	417	327
35742	399	418	333
35743	399	419	358
35744	399	420	338
35745	399	421	291
35746	399	422	276
35747	399	423	385
35748	399	424	353
35749	399	425	393
35750	399	426	400
35751	399	427	372
35752	399	428	403
35753	399	429	408
35754	399	430	428
35755	399	431	481
35756	399	432	470
35757	399	433	457
35758	399	434	467
35759	399	435	510
35760	399	436	488
35761	399	437	503
35762	399	438	508
35763	399	439	523
35764	399	440	531
35765	399	441	529
35766	399	442	537
35767	399	443	543
35768	399	444	548
35769	399	445	558
35770	399	446	570
35771	399	447	583
35772	399	448	593
35773	399	449	558
35774	399	450	568
35775	399	451	576
35776	399	452	587
35777	399	453	611
35778	399	454	608
35779	399	455	631
35780	399	456	676
35781	399	457	495
35782	399	458	501
35783	399	459	535
35784	399	460	555
35785	399	461	566
35786	399	462	589
35787	399	463	649
35788	399	464	669
35789	399	465	679
35790	399	466	645
35791	399	467	660
35792	399	468	574
35793	399	469	554
35794	399	470	620
35795	399	471	632
35796	399	472	635
35797	399	473	635
35798	399	474	640
35799	399	475	635
35800	399	476	640
35801	399	477	650
35802	399	478	669
35803	399	479	675
35804	399	480	667
35805	399	481	725
35806	399	482	690
35807	399	483	714
35808	399	484	647
35809	399	485	681
35810	399	486	668
35811	399	487	683
35812	399	488	708
35813	399	489	769
35814	399	490	747
35815	399	491	737
35816	399	492	708
35817	400	401	22
35818	400	402	93
35819	400	403	200
35820	400	404	163
35821	400	405	208
35822	400	406	268
35823	400	407	283
35824	400	408	288
35825	400	409	291
35826	400	410	308
35827	400	411	188
35828	400	412	208
35829	400	413	288
35830	400	414	298
35831	400	415	248
35832	400	416	369
35833	400	417	342
35834	400	418	348
35835	400	419	373
35836	400	420	353
35837	400	421	306
35838	400	422	291
35839	400	423	400
35840	400	424	368
35841	400	425	408
35842	400	426	415
35843	400	427	387
35844	400	428	418
35845	400	429	423
35846	400	430	443
35847	400	431	496
35848	400	432	485
35849	400	433	472
35850	400	434	482
35851	400	435	525
35852	400	436	503
35853	400	437	518
35854	400	438	523
35855	400	439	538
35856	400	440	546
35857	400	441	544
35858	400	442	552
35859	400	443	558
35860	400	444	563
35861	400	445	573
35862	400	446	585
35863	400	447	598
35864	400	448	608
35865	400	449	573
35866	400	450	583
35867	400	451	591
35868	400	452	602
35869	400	453	626
35870	400	454	623
35871	400	455	646
35872	400	456	691
35873	400	457	510
35874	400	458	516
35875	400	459	550
35876	400	460	570
35877	400	461	581
35878	400	462	604
35879	400	463	664
35880	400	464	684
35881	400	465	694
35882	400	466	660
35883	400	467	675
35884	400	468	589
35885	400	469	569
35886	400	470	635
35887	400	471	647
35888	400	472	650
35889	400	473	650
35890	400	474	655
35891	400	475	650
35892	400	476	655
35893	400	477	665
35894	400	478	684
35895	400	479	690
35896	400	480	682
35897	400	481	740
35898	400	482	705
35899	400	483	729
35900	400	484	662
35901	400	485	696
35902	400	486	683
35903	400	487	698
35904	400	488	723
35905	400	489	784
35906	400	490	762
35907	400	491	752
35908	400	492	723
35909	401	402	70
35910	401	403	178
35911	401	404	141
35912	401	405	186
35913	401	406	246
35914	401	407	261
35915	401	408	266
35916	401	409	269
35917	401	410	286
35918	401	411	166
35919	401	412	186
35920	401	413	266
35921	401	414	276
35922	401	415	226
35923	401	416	347
35924	401	417	320
35925	401	418	326
35926	401	419	351
35927	401	420	331
35928	401	421	284
35929	401	422	269
35930	401	423	378
35931	401	424	346
35932	401	425	386
35933	401	426	393
35934	401	427	365
35935	401	428	396
35936	401	429	401
35937	401	430	421
35938	401	431	474
35939	401	432	463
35940	401	433	450
35941	401	434	460
35942	401	435	503
35943	401	436	481
35944	401	437	496
35945	401	438	501
35946	401	439	516
35947	401	440	524
35948	401	441	522
35949	401	442	530
35950	401	443	536
35951	401	444	541
35952	401	445	551
35953	401	446	563
35954	401	447	576
35955	401	448	586
35956	401	449	551
35957	401	450	561
35958	401	451	569
35959	401	452	580
35960	401	453	604
35961	401	454	601
35962	401	455	624
35963	401	456	669
35964	401	457	488
35965	401	458	494
35966	401	459	528
35967	401	460	548
35968	401	461	559
35969	401	462	582
35970	401	463	642
35971	401	464	662
35972	401	465	672
35973	401	466	638
35974	401	467	653
35975	401	468	567
35976	401	469	547
35977	401	470	613
35978	401	471	625
35979	401	472	628
35980	401	473	628
35981	401	474	633
35982	401	475	628
35983	401	476	633
35984	401	477	643
35985	401	478	662
35986	401	479	668
35987	401	480	660
35988	401	481	718
35989	401	482	683
35990	401	483	707
35991	401	484	640
35992	401	485	674
35993	401	486	661
35994	401	487	676
35995	401	488	701
35996	401	489	762
35997	401	490	740
35998	401	491	730
35999	401	492	701
36000	402	403	183
36001	402	404	80
36002	402	405	125
36003	402	406	185
36004	402	407	200
36005	402	408	205
36006	402	409	208
36007	402	410	225
36008	402	411	105
36009	402	412	125
36010	402	413	205
36011	402	414	215
36012	402	415	165
36013	402	416	286
36014	402	417	259
36015	402	418	265
36016	402	419	290
36017	402	420	270
36018	402	421	223
36019	402	422	208
36020	402	423	317
36021	402	424	285
36022	402	425	325
36023	402	426	332
36024	402	427	304
36025	402	428	335
36026	402	429	340
36027	402	430	360
36028	402	431	413
36029	402	432	402
36030	402	433	389
36031	402	434	399
36032	402	435	442
36033	402	436	420
36034	402	437	435
36035	402	438	440
36036	402	439	455
36037	402	440	463
36038	402	441	461
36039	402	442	469
36040	402	443	475
36041	402	444	480
36042	402	445	490
36043	402	446	502
36044	402	447	515
36045	402	448	525
36046	402	449	490
36047	402	450	500
36048	402	451	508
36049	402	452	519
36050	402	453	543
36051	402	454	540
36052	402	455	563
36053	402	456	608
36054	402	457	427
36055	402	458	433
36056	402	459	467
36057	402	460	487
36058	402	461	498
36059	402	462	521
36060	402	463	581
36061	402	464	601
36062	402	465	611
36063	402	466	577
36064	402	467	592
36065	402	468	506
36066	402	469	486
36067	402	470	552
36068	402	471	564
36069	402	472	567
36070	402	473	567
36071	402	474	572
36072	402	475	567
36073	402	476	572
36074	402	477	582
36075	402	478	601
36076	402	479	607
36077	402	480	599
36078	402	481	657
36079	402	482	622
36080	402	483	646
36081	402	484	579
36082	402	485	613
36083	402	486	600
36084	402	487	615
36085	402	488	640
36086	402	489	701
36087	402	490	679
36088	402	491	669
36089	402	492	640
36090	403	404	193
36091	403	405	238
36092	403	406	298
36093	403	407	313
36094	403	408	318
36095	403	409	321
36096	403	410	338
36097	403	411	218
36098	403	412	238
36099	403	413	318
36100	403	414	328
36101	403	415	278
36102	403	416	399
36103	403	417	372
36104	403	418	378
36105	403	419	403
36106	403	420	383
36107	403	421	336
36108	403	422	321
36109	403	423	430
36110	403	424	398
36111	403	425	438
36112	403	426	445
36113	403	427	417
36114	403	428	448
36115	403	429	453
36116	403	430	473
36117	403	431	526
36118	403	432	515
36119	403	433	502
36120	403	434	512
36121	403	435	555
36122	403	436	533
36123	403	437	548
36124	403	438	553
36125	403	439	568
36126	403	440	576
36127	403	441	574
36128	403	442	582
36129	403	443	588
36130	403	444	593
36131	403	445	603
36132	403	446	615
36133	403	447	628
36134	403	448	638
36135	403	449	603
36136	403	450	613
36137	403	451	621
36138	403	452	632
36139	403	453	656
36140	403	454	653
36141	403	455	676
36142	403	456	721
36143	403	457	540
36144	403	458	546
36145	403	459	580
36146	403	460	600
36147	403	461	611
36148	403	462	634
36149	403	463	694
36150	403	464	714
36151	403	465	724
36152	403	466	690
36153	403	467	705
36154	403	468	619
36155	403	469	599
36156	403	470	665
36157	403	471	677
36158	403	472	680
36159	403	473	680
36160	403	474	685
36161	403	475	680
36162	403	476	685
36163	403	477	695
36164	403	478	714
36165	403	479	720
36166	403	480	712
36167	403	481	770
36168	403	482	735
36169	403	483	759
36170	403	484	692
36171	403	485	726
36172	403	486	713
36173	403	487	728
36174	403	488	753
36175	403	489	814
36176	403	490	792
36177	403	491	782
36178	403	492	753
36179	404	405	45
36180	404	406	105
36181	404	407	120
36182	404	408	125
36183	404	409	128
36184	404	410	150
36185	404	411	25
36186	404	412	45
36187	404	413	125
36188	404	414	135
36189	404	415	85
36190	404	416	206
36191	404	417	179
36192	404	418	185
36193	404	419	210
36194	404	420	190
36195	404	421	143
36196	404	422	128
36197	404	423	237
36198	404	424	205
36199	404	425	245
36200	404	426	252
36201	404	427	224
36202	404	428	255
36203	404	429	260
36204	404	430	280
36205	404	431	333
36206	404	432	322
36207	404	433	309
36208	404	434	319
36209	404	435	362
36210	404	436	340
36211	404	437	355
36212	404	438	360
36213	404	439	375
36214	404	440	383
36215	404	441	381
36216	404	442	389
36217	404	443	395
36218	404	444	400
36219	404	445	410
36220	404	446	422
36221	404	447	435
36222	404	448	445
36223	404	449	410
36224	404	450	420
36225	404	451	428
36226	404	452	439
36227	404	453	463
36228	404	454	460
36229	404	455	483
36230	404	456	528
36231	404	457	347
36232	404	458	353
36233	404	459	387
36234	404	460	407
36235	404	461	418
36236	404	462	441
36237	404	463	501
36238	404	464	521
36239	404	465	531
36240	404	466	497
36241	404	467	512
36242	404	468	426
36243	404	469	406
36244	404	470	472
36245	404	471	484
36246	404	472	487
36247	404	473	487
36248	404	474	492
36249	404	475	487
36250	404	476	492
36251	404	477	502
36252	404	478	521
36253	404	479	527
36254	404	480	519
36255	404	481	577
36256	404	482	542
36257	404	483	566
36258	404	484	499
36259	404	485	533
36260	404	486	520
36261	404	487	535
36262	404	488	560
36263	404	489	621
36264	404	490	599
36265	404	491	589
36266	404	492	560
36267	405	406	65
36268	405	407	75
36269	405	408	85
36270	405	409	83
36271	405	410	105
36272	405	411	17
36273	405	412	90
36274	405	413	170
36275	405	414	180
36276	405	415	130
36277	405	416	251
36278	405	417	224
36279	405	418	230
36280	405	419	255
36281	405	420	115
36282	405	421	188
36283	405	422	105
36284	405	423	125
36285	405	424	210
36286	405	425	228
36287	405	426	297
36288	405	427	206
36289	405	428	300
36290	405	429	305
36291	405	430	338
36292	405	431	378
36293	405	432	367
36294	405	433	354
36295	405	434	364
36296	405	435	407
36297	405	436	385
36298	405	437	400
36299	405	438	405
36300	405	439	420
36301	405	440	428
36302	405	441	426
36303	405	442	434
36304	405	443	440
36305	405	444	445
36306	405	445	455
36307	405	446	467
36308	405	447	480
36309	405	448	490
36310	405	449	455
36311	405	450	465
36312	405	451	473
36313	405	452	484
36314	405	453	508
36315	405	454	505
36316	405	455	528
36317	405	456	573
36318	405	457	392
36319	405	458	398
36320	405	459	432
36321	405	460	452
36322	405	461	462
36323	405	462	486
36324	405	463	546
36325	405	464	566
36326	405	465	576
36327	405	466	542
36328	405	467	557
36329	405	468	471
36330	405	469	451
36331	405	470	517
36332	405	471	529
36333	405	472	532
36334	405	473	532
36335	405	474	537
36336	405	475	532
36337	405	476	537
36338	405	477	547
36339	405	478	566
36340	405	479	572
36341	405	480	564
36342	405	481	622
36343	405	482	587
36344	405	483	611
36345	405	484	544
36346	405	485	578
36347	405	486	565
36348	405	487	580
36349	405	488	605
36350	405	489	666
36351	405	490	644
36352	405	491	634
36353	405	492	605
36354	406	407	15
36355	406	408	20
36356	406	409	40
36357	406	410	40
36358	406	411	85
36359	406	412	150
36360	406	413	230
36361	406	414	240
36362	406	415	190
36363	406	416	311
36364	406	417	284
36365	406	418	290
36366	406	419	315
36367	406	420	295
36368	406	421	248
36369	406	422	45
36370	406	423	230
36371	406	424	270
36372	406	425	288
36373	406	426	357
36374	406	427	329
36375	406	428	360
36376	406	429	365
36377	406	430	433
36378	406	431	438
36379	406	432	427
36380	406	433	414
36381	406	434	424
36382	406	435	467
36383	406	436	445
36384	406	437	460
36385	406	438	465
36386	406	439	480
36387	406	440	488
36388	406	441	486
36389	406	442	494
36390	406	443	500
36391	406	444	505
36392	406	445	515
36393	406	446	527
36394	406	447	540
36395	406	448	550
36396	406	449	515
36397	406	450	525
36398	406	451	533
36399	406	452	544
36400	406	453	568
36401	406	454	565
36402	406	455	588
36403	406	456	633
36404	406	457	452
36405	406	458	458
36406	406	459	492
36407	406	460	512
36408	406	461	523
36409	406	462	546
36410	406	463	606
36411	406	464	626
36412	406	465	636
36413	406	466	602
36414	406	467	617
36415	406	468	531
36416	406	469	511
36417	406	470	577
36418	406	471	589
36419	406	472	592
36420	406	473	592
36421	406	474	597
36422	406	475	592
36423	406	476	597
36424	406	477	607
36425	406	478	626
36426	406	479	632
36427	406	480	624
36428	406	481	682
36429	406	482	647
36430	406	483	671
36431	406	484	604
36432	406	485	638
36433	406	486	625
36434	406	487	640
36435	406	488	665
36436	406	489	726
36437	406	490	704
36438	406	491	694
36439	406	492	665
36440	407	408	35
36441	407	409	65
36442	407	410	45
36443	407	411	70
36444	407	412	155
36445	407	413	245
36446	407	414	255
36447	407	415	205
36448	407	416	326
36449	407	417	299
36450	407	418	305
36451	407	419	330
36452	407	420	310
36453	407	421	263
36454	407	422	25
36455	407	423	245
36456	407	424	285
36457	407	425	303
36458	407	426	372
36459	407	427	344
36460	407	428	375
36461	407	429	380
36462	407	430	408
36463	407	431	453
36464	407	432	442
36465	407	433	429
36466	407	434	439
36467	407	435	482
36468	407	436	460
36469	407	437	475
36470	407	438	480
36471	407	439	495
36472	407	440	503
36473	407	441	501
36474	407	442	509
36475	407	443	515
36476	407	444	520
36477	407	445	530
36478	407	446	542
36479	407	447	555
36480	407	448	565
36481	407	449	530
36482	407	450	540
36483	407	451	548
36484	407	452	559
36485	407	453	583
36486	407	454	580
36487	407	455	603
36488	407	456	648
36489	407	457	467
36490	407	458	473
36491	407	459	507
36492	407	460	527
36493	407	461	538
36494	407	462	561
36495	407	463	621
36496	407	464	641
36497	407	465	651
36498	407	466	617
36499	407	467	632
36500	407	468	546
36501	407	469	526
36502	407	470	592
36503	407	471	604
36504	407	472	607
36505	407	473	607
36506	407	474	612
36507	407	475	607
36508	407	476	612
36509	407	477	622
36510	407	478	641
36511	407	479	647
36512	407	480	639
36513	407	481	697
36514	407	482	662
36515	407	483	686
36516	407	484	619
36517	407	485	653
36518	407	486	640
36519	407	487	655
36520	407	488	680
36521	407	489	741
36522	407	490	719
36523	407	491	709
36524	407	492	680
36525	408	409	60
36526	408	410	22
36527	408	411	105
36528	408	412	170
36529	408	413	250
36530	408	414	260
36531	408	415	210
36532	408	416	331
36533	408	417	304
36534	408	418	310
36535	408	419	335
36536	408	420	315
36537	408	421	268
36538	408	422	65
36539	408	423	250
36540	408	424	268
36541	408	425	308
36542	408	426	377
36543	408	427	349
36544	408	428	380
36545	408	429	385
36546	408	430	453
36547	408	431	458
36548	408	432	447
36549	408	433	434
36550	408	434	444
36551	408	435	487
36552	408	436	465
36553	408	437	480
36554	408	438	485
36555	408	439	500
36556	408	440	508
36557	408	441	506
36558	408	442	514
36559	408	443	520
36560	408	444	525
36561	408	445	535
36562	408	446	547
36563	408	447	560
36564	408	448	570
36565	408	449	535
36566	408	450	545
36567	408	451	553
36568	408	452	564
36569	408	453	588
36570	408	454	585
36571	408	455	608
36572	408	456	653
36573	408	457	472
36574	408	458	478
36575	408	459	512
36576	408	460	532
36577	408	461	543
36578	408	462	566
36579	408	463	626
36580	408	464	646
36581	408	465	656
36582	408	466	622
36583	408	467	637
36584	408	468	551
36585	408	469	531
36586	408	470	597
36587	408	471	609
36588	408	472	612
36589	408	473	612
36590	408	474	617
36591	408	475	612
36592	408	476	617
36593	408	477	627
36594	408	478	646
36595	408	479	652
36596	408	480	644
36597	408	481	702
36598	408	482	667
36599	408	483	691
36600	408	484	624
36601	408	485	658
36602	408	486	645
36603	408	487	660
36604	408	488	685
36605	408	489	746
36606	408	490	724
36607	408	491	714
36608	408	492	685
36609	409	410	85
36610	409	411	100
36611	409	412	173
36612	409	413	253
36613	409	414	263
36614	409	415	213
36615	409	416	334
36616	409	417	307
36617	409	418	313
36618	409	419	338
36619	409	420	318
36620	409	421	271
36621	409	422	85
36622	409	423	253
36623	409	424	288
36624	409	425	328
36625	409	426	380
36626	409	427	352
36627	409	428	383
36628	409	429	388
36629	409	430	423
36630	409	431	461
36631	409	432	450
36632	409	433	437
36633	409	434	447
36634	409	435	490
36635	409	436	468
36636	409	437	483
36637	409	438	488
36638	409	439	503
36639	409	440	511
36640	409	441	509
36641	409	442	517
36642	409	443	523
36643	409	444	528
36644	409	445	538
36645	409	446	550
36646	409	447	563
36647	409	448	573
36648	409	449	538
36649	409	450	548
36650	409	451	556
36651	409	452	567
36652	409	453	591
36653	409	454	588
36654	409	455	611
36655	409	456	656
36656	409	457	475
36657	409	458	481
36658	409	459	515
36659	409	460	535
36660	409	461	546
36661	409	462	569
36662	409	463	629
36663	409	464	649
36664	409	465	659
36665	409	466	625
36666	409	467	640
36667	409	468	554
36668	409	469	534
36669	409	470	600
36670	409	471	612
36671	409	472	615
36672	409	473	615
36673	409	474	620
36674	409	475	615
36675	409	476	620
36676	409	477	630
36677	409	478	649
36678	409	479	655
36679	409	480	647
36680	409	481	705
36681	409	482	670
36682	409	483	694
36683	409	484	627
36684	409	485	661
36685	409	486	648
36686	409	487	663
36687	409	488	688
36688	409	489	749
36689	409	490	727
36690	409	491	717
36691	409	492	688
36692	410	411	125
36693	410	412	190
36694	410	413	275
36695	410	414	285
36696	410	415	235
36697	410	416	356
36698	410	417	329
36699	410	418	335
36700	410	419	360
36701	410	420	340
36702	410	421	293
36703	410	422	65
36704	410	423	275
36705	410	424	288
36706	410	425	328
36707	410	426	402
36708	410	427	374
36709	410	428	405
36710	410	429	410
36711	410	430	401
36712	410	431	483
36713	410	432	472
36714	410	433	459
36715	410	434	469
36716	410	435	512
36717	410	436	490
36718	410	437	505
36719	410	438	510
36720	410	439	525
36721	410	440	533
36722	410	441	531
36723	410	442	539
36724	410	443	545
36725	410	444	550
36726	410	445	560
36727	410	446	572
36728	410	447	585
36729	410	448	595
36730	410	449	560
36731	410	450	570
36732	410	451	578
36733	410	452	589
36734	410	453	613
36735	410	454	610
36736	410	455	633
36737	410	456	678
36738	410	457	497
36739	410	458	503
36740	410	459	537
36741	410	460	557
36742	410	461	568
36743	410	462	591
36744	410	463	651
36745	410	464	671
36746	410	465	681
36747	410	466	647
36748	410	467	662
36749	410	468	576
36750	410	469	556
36751	410	470	622
36752	410	471	634
36753	410	472	637
36754	410	473	637
36755	410	474	642
36756	410	475	637
36757	410	476	642
36758	410	477	652
36759	410	478	671
36760	410	479	677
36761	410	480	669
36762	410	481	727
36763	410	482	692
36764	410	483	716
36765	410	484	649
36766	410	485	683
36767	410	486	670
36768	410	487	685
36769	410	488	710
36770	410	489	771
36771	410	490	749
36772	410	491	739
36773	410	492	710
36774	411	412	70
36775	411	413	150
36776	411	414	160
36777	411	415	110
36778	411	416	231
36779	411	417	204
36780	411	418	210
36781	411	419	235
36782	411	420	215
36783	411	421	168
36784	411	422	107
36785	411	423	150
36786	411	424	230
36787	411	425	255
36788	411	426	277
36789	411	427	249
36790	411	428	280
36791	411	429	285
36792	411	430	340
36793	411	431	358
36794	411	432	347
36795	411	433	334
36796	411	434	344
36797	411	435	387
36798	411	436	365
36799	411	437	380
36800	411	438	385
36801	411	439	400
36802	411	440	408
36803	411	441	406
36804	411	442	414
36805	411	443	420
36806	411	444	425
36807	411	445	435
36808	411	446	447
36809	411	447	460
36810	411	448	470
36811	411	449	435
36812	411	450	445
36813	411	451	453
36814	411	452	464
36815	411	453	488
36816	411	454	485
36817	411	455	508
36818	411	456	553
36819	411	457	372
36820	411	458	378
36821	411	459	412
36822	411	460	432
36823	411	461	443
36824	411	462	466
36825	411	463	526
36826	411	464	546
36827	411	465	556
36828	411	466	522
36829	411	467	537
36830	411	468	451
36831	411	469	431
36832	411	470	497
36833	411	471	509
36834	411	472	512
36835	411	473	512
36836	411	474	517
36837	411	475	512
36838	411	476	517
36839	411	477	527
36840	411	478	546
36841	411	479	552
36842	411	480	544
36843	411	481	602
36844	411	482	567
36845	411	483	591
36846	411	484	524
36847	411	485	558
36848	411	486	545
36849	411	487	560
36850	411	488	585
36851	411	489	646
36852	411	490	624
36853	411	491	614
36854	411	492	585
36855	412	413	170
36856	412	414	180
36857	412	415	130
36858	412	416	251
36859	412	417	224
36860	412	418	230
36861	412	419	255
36862	412	420	235
36863	412	421	188
36864	412	422	174
36865	412	423	170
36866	412	424	250
36867	412	425	290
36868	412	426	297
36869	412	427	269
36870	412	428	300
36871	412	429	305
36872	412	430	453
36873	412	431	378
36874	412	432	367
36875	412	433	354
36876	412	434	364
36877	412	435	407
36878	412	436	385
36879	412	437	400
36880	412	438	405
36881	412	439	420
36882	412	440	428
36883	412	441	426
36884	412	442	434
36885	412	443	440
36886	412	444	445
36887	412	445	455
36888	412	446	467
36889	412	447	480
36890	412	448	490
36891	412	449	455
36892	412	450	465
36893	412	451	473
36894	412	452	484
36895	412	453	508
36896	412	454	505
36897	412	455	528
36898	412	456	573
36899	412	457	392
36900	412	458	398
36901	412	459	432
36902	412	460	452
36903	412	461	463
36904	412	462	486
36905	412	463	546
36906	412	464	566
36907	412	465	576
36908	412	466	542
36909	412	467	557
36910	412	468	471
36911	412	469	451
36912	412	470	517
36913	412	471	529
36914	412	472	532
36915	412	473	532
36916	412	474	537
36917	412	475	532
36918	412	476	537
36919	412	477	547
36920	412	478	566
36921	412	479	572
36922	412	480	564
36923	412	481	622
36924	412	482	587
36925	412	483	611
36926	412	484	544
36927	412	485	578
36928	412	486	565
36929	412	487	580
36930	412	488	605
36931	412	489	666
36932	412	490	644
36933	412	491	634
36934	412	492	605
36935	413	414	10
36936	413	415	40
36937	413	416	81
36938	413	417	54
36939	413	418	60
36940	413	419	85
36941	413	420	65
36942	413	421	18
36943	413	422	232
36944	413	423	135
36945	413	424	80
36946	413	425	120
36947	413	426	85
36948	413	427	143
36949	413	428	135
36950	413	429	140
36951	413	430	160
36952	413	431	213
36953	413	432	202
36954	413	433	189
36955	413	434	199
36956	413	435	242
36957	413	436	220
36958	413	437	235
36959	413	438	240
36960	413	439	255
36961	413	440	263
36962	413	441	261
36963	413	442	269
36964	413	443	275
36965	413	444	280
36966	413	445	290
36967	413	446	302
36968	413	447	315
36969	413	448	325
36970	413	449	290
36971	413	450	300
36972	413	451	308
36973	413	452	319
36974	413	453	343
36975	413	454	340
36976	413	455	363
36977	413	456	408
36978	413	457	222
36979	413	458	228
36980	413	459	262
36981	413	460	282
36982	413	461	293
36983	413	462	316
36984	413	463	376
36985	413	464	396
36986	413	465	406
36987	413	466	372
36988	413	467	387
36989	413	468	301
36990	413	469	281
36991	413	470	347
36992	413	471	359
36993	413	472	362
36994	413	473	362
36995	413	474	367
36996	413	475	362
36997	413	476	367
36998	413	477	377
36999	413	478	396
37000	413	479	402
37001	413	480	394
37002	413	481	452
37003	413	482	417
37004	413	483	441
37005	413	484	374
37006	413	485	408
37007	413	486	393
37008	413	487	408
37009	413	488	433
37010	413	489	494
37011	413	490	478
37012	413	491	468
37013	413	492	433
37014	414	415	54
37015	414	416	71
37016	414	417	64
37017	414	418	50
37018	414	419	75
37019	414	420	75
37020	414	421	28
37021	414	422	242
37022	414	423	125
37023	414	424	98
37024	414	425	110
37025	414	426	85
37026	414	427	133
37027	414	428	145
37028	414	429	150
37029	414	430	170
37030	414	431	223
37031	414	432	212
37032	414	433	199
37033	414	434	209
37034	414	435	252
37035	414	436	230
37036	414	437	245
37037	414	438	250
37038	414	439	265
37039	414	440	273
37040	414	441	271
37041	414	442	279
37042	414	443	285
37043	414	444	290
37044	414	445	300
37045	414	446	312
37046	414	447	325
37047	414	448	335
37048	414	449	300
37049	414	450	310
37050	414	451	318
37051	414	452	329
37052	414	453	353
37053	414	454	350
37054	414	455	373
37055	414	456	418
37056	414	457	232
37057	414	458	238
37058	414	459	272
37059	414	460	292
37060	414	461	303
37061	414	462	326
37062	414	463	386
37063	414	464	406
37064	414	465	416
37065	414	466	382
37066	414	467	397
37067	414	468	311
37068	414	469	291
37069	414	470	357
37070	414	471	369
37071	414	472	372
37072	414	473	372
37073	414	474	377
37074	414	475	372
37075	414	476	377
37076	414	477	387
37077	414	478	406
37078	414	479	412
37079	414	480	404
37080	414	481	462
37081	414	482	427
37082	414	483	451
37083	414	484	384
37084	414	485	418
37085	414	486	403
37086	414	487	418
37087	414	488	443
37088	414	489	504
37089	414	490	488
37090	414	491	478
37091	414	492	443
37092	415	416	121
37093	415	417	94
37094	415	418	100
37095	415	419	125
37096	415	420	94
37097	415	421	58
37098	415	422	188
37099	415	423	112
37100	415	424	153
37101	415	425	164
37102	415	426	127
37103	415	427	99
37104	415	428	175
37105	415	429	180
37106	415	430	200
37107	415	431	253
37108	415	432	242
37109	415	433	229
37110	415	434	239
37111	415	435	282
37112	415	436	260
37113	415	437	275
37114	415	438	280
37115	415	439	295
37116	415	440	303
37117	415	441	301
37118	415	442	309
37119	415	443	315
37120	415	444	320
37121	415	445	330
37122	415	446	342
37123	415	447	355
37124	415	448	365
37125	415	449	330
37126	415	450	340
37127	415	451	348
37128	415	452	359
37129	415	453	383
37130	415	454	380
37131	415	455	403
37132	415	456	448
37133	415	457	262
37134	415	458	268
37135	415	459	302
37136	415	460	322
37137	415	461	333
37138	415	462	356
37139	415	463	416
37140	415	464	436
37141	415	465	446
37142	415	466	412
37143	415	467	427
37144	415	468	341
37145	415	469	321
37146	415	470	387
37147	415	471	399
37148	415	472	402
37149	415	473	402
37150	415	474	407
37151	415	475	402
37152	415	476	407
37153	415	477	417
37154	415	478	436
37155	415	479	442
37156	415	480	434
37157	415	481	492
37158	415	482	457
37159	415	483	481
37160	415	484	414
37161	415	485	448
37162	415	486	433
37163	415	487	448
37164	415	488	473
37165	415	489	534
37166	415	490	518
37167	415	491	508
37168	415	492	473
37169	416	417	135
37170	416	418	35
37171	416	419	24
37172	416	420	70
37173	416	421	99
37174	416	422	268
37175	416	423	184
37176	416	424	26
37177	416	425	39
37178	416	426	166
37179	416	427	53
37180	416	428	216
37181	416	429	221
37182	416	430	241
37183	416	431	294
37184	416	432	283
37185	416	433	270
37186	416	434	280
37187	416	435	323
37188	416	436	301
37189	416	437	316
37190	416	438	321
37191	416	439	336
37192	416	440	344
37193	416	441	342
37194	416	442	350
37195	416	443	356
37196	416	444	361
37197	416	445	371
37198	416	446	383
37199	416	447	396
37200	416	448	406
37201	416	449	371
37202	416	450	381
37203	416	451	389
37204	416	452	400
37205	416	453	424
37206	416	454	421
37207	416	455	444
37208	416	456	489
37209	416	457	303
37210	416	458	309
37211	416	459	343
37212	416	460	363
37213	416	461	374
37214	416	462	397
37215	416	463	457
37216	416	464	477
37217	416	465	487
37218	416	466	453
37219	416	467	468
37220	416	468	382
37221	416	469	362
37222	416	470	428
37223	416	471	440
37224	416	472	443
37225	416	473	443
37226	416	474	448
37227	416	475	443
37228	416	476	448
37229	416	477	458
37230	416	478	477
37231	416	479	483
37232	416	480	475
37233	416	481	533
37234	416	482	498
37235	416	483	522
37236	416	484	455
37237	416	485	489
37238	416	486	474
37239	416	487	489
37240	416	488	514
37241	416	489	575
37242	416	490	559
37243	416	491	549
37244	416	492	514
37245	417	418	114
37246	417	419	138
37247	417	420	119
37248	417	421	72
37249	417	422	286
37250	417	423	189
37251	417	424	134
37252	417	425	174
37253	417	426	65
37254	417	427	197
37255	417	428	189
37256	417	429	194
37257	417	430	214
37258	417	431	267
37259	417	432	256
37260	417	433	243
37261	417	434	253
37262	417	435	296
37263	417	436	274
37264	417	437	289
37265	417	438	294
37266	417	439	309
37267	417	440	317
37268	417	441	315
37269	417	442	323
37270	417	443	329
37271	417	444	334
37272	417	445	344
37273	417	446	356
37274	417	447	369
37275	417	448	379
37276	417	449	344
37277	417	450	354
37278	417	451	362
37279	417	452	373
37280	417	453	397
37281	417	454	394
37282	417	455	417
37283	417	456	462
37284	417	457	276
37285	417	458	282
37286	417	459	316
37287	417	460	336
37288	417	461	347
37289	417	462	370
37290	417	463	430
37291	417	464	450
37292	417	465	460
37293	417	466	426
37294	417	467	441
37295	417	468	355
37296	417	469	335
37297	417	470	401
37298	417	471	413
37299	417	472	416
37300	417	473	416
37301	417	474	421
37302	417	475	416
37303	417	476	421
37304	417	477	431
37305	417	478	450
37306	417	479	456
37307	417	480	448
37308	417	481	506
37309	417	482	471
37310	417	483	495
37311	417	484	428
37312	417	485	462
37313	417	486	447
37314	417	487	462
37315	417	488	487
37316	417	489	548
37317	417	490	532
37318	417	491	522
37319	417	492	487
37320	418	419	59
37321	418	420	39
37322	418	421	78
37323	418	422	259
37324	418	423	124
37325	418	424	52
37326	418	425	115
37327	418	426	120
37328	418	427	108
37329	418	428	195
37330	418	429	200
37331	418	430	220
37332	418	431	273
37333	418	432	262
37334	418	433	249
37335	418	434	259
37336	418	435	302
37337	418	436	280
37338	418	437	295
37339	418	438	300
37340	418	439	315
37341	418	440	323
37342	418	441	321
37343	418	442	329
37344	418	443	335
37345	418	444	340
37346	418	445	350
37347	418	446	362
37348	418	447	375
37349	418	448	385
37350	418	449	350
37351	418	450	360
37352	418	451	368
37353	418	452	379
37354	418	453	403
37355	418	454	400
37356	418	455	423
37357	418	456	468
37358	418	457	282
37359	418	458	288
37360	418	459	322
37361	418	460	342
37362	418	461	353
37363	418	462	376
37364	418	463	436
37365	418	464	456
37366	418	465	466
37367	418	466	432
37368	418	467	447
37369	418	468	361
37370	418	469	341
37371	418	470	407
37372	418	471	419
37373	418	472	422
37374	418	473	422
37375	418	474	427
37376	418	475	422
37377	418	476	427
37378	418	477	437
37379	418	478	456
37380	418	479	462
37381	418	480	454
37382	418	481	512
37383	418	482	477
37384	418	483	501
37385	418	484	434
37386	418	485	468
37387	418	486	453
37388	418	487	468
37389	418	488	493
37390	418	489	554
37391	418	490	538
37392	418	491	528
37393	418	492	493
37394	419	420	92
37395	419	421	103
37396	419	422	284
37397	419	423	182
37398	419	424	42
37399	419	425	30
37400	419	426	182
37401	419	427	69
37402	419	428	220
37403	419	429	225
37404	419	430	245
37405	419	431	298
37406	419	432	287
37407	419	433	274
37408	419	434	284
37409	419	435	327
37410	419	436	305
37411	419	437	320
37412	419	438	325
37413	419	439	340
37414	419	440	348
37415	419	441	346
37416	419	442	354
37417	419	443	360
37418	419	444	365
37419	419	445	375
37420	419	446	387
37421	419	447	400
37422	419	448	410
37423	419	449	375
37424	419	450	385
37425	419	451	393
37426	419	452	404
37427	419	453	428
37428	419	454	425
37429	419	455	448
37430	419	456	493
37431	419	457	307
37432	419	458	313
37433	419	459	347
37434	419	460	367
37435	419	461	378
37436	419	462	401
37437	419	463	461
37438	419	464	481
37439	419	465	491
37440	419	466	457
37441	419	467	472
37442	419	468	386
37443	419	469	366
37444	419	470	432
37445	419	471	444
37446	419	472	447
37447	419	473	447
37448	419	474	452
37449	419	475	447
37450	419	476	452
37451	419	477	462
37452	419	478	481
37453	419	479	487
37454	419	480	479
37455	419	481	537
37456	419	482	502
37457	419	483	526
37458	419	484	459
37459	419	485	493
37460	419	486	478
37461	419	487	493
37462	419	488	518
37463	419	489	579
37464	419	490	563
37465	419	491	553
37466	419	492	518
37467	420	421	83
37468	420	422	220
37469	420	423	85
37470	420	424	68
37471	420	425	109
37472	420	426	208
37473	420	427	78
37474	420	428	200
37475	420	429	205
37476	420	430	225
37477	420	431	278
37478	420	432	267
37479	420	433	254
37480	420	434	264
37481	420	435	307
37482	420	436	285
37483	420	437	300
37484	420	438	305
37485	420	439	320
37486	420	440	328
37487	420	441	326
37488	420	442	334
37489	420	443	340
37490	420	444	345
37491	420	445	355
37492	420	446	367
37493	420	447	380
37494	420	448	390
37495	420	449	355
37496	420	450	365
37497	420	451	373
37498	420	452	384
37499	420	453	408
37500	420	454	405
37501	420	455	428
37502	420	456	473
37503	420	457	287
37504	420	458	293
37505	420	459	327
37506	420	460	347
37507	420	461	358
37508	420	462	381
37509	420	463	441
37510	420	464	461
37511	420	465	471
37512	420	466	437
37513	420	467	452
37514	420	468	366
37515	420	469	346
37516	420	470	412
37517	420	471	424
37518	420	472	427
37519	420	473	427
37520	420	474	432
37521	420	475	427
37522	420	476	432
37523	420	477	442
37524	420	478	461
37525	420	479	467
37526	420	480	459
37527	420	481	517
37528	420	482	482
37529	420	483	506
37530	420	484	439
37531	420	485	473
37532	420	486	458
37533	420	487	473
37534	420	488	498
37535	420	489	559
37536	420	490	543
37537	420	491	533
37538	420	492	498
37539	421	422	250
37540	421	423	153
37541	421	424	98
37542	421	425	138
37543	421	426	90
37544	421	427	161
37545	421	428	153
37546	421	429	158
37547	421	430	178
37548	421	431	231
37549	421	432	220
37550	421	433	207
37551	421	434	217
37552	421	435	260
37553	421	436	238
37554	421	437	253
37555	421	438	258
37556	421	439	273
37557	421	440	281
37558	421	441	279
37559	421	442	287
37560	421	443	293
37561	421	444	298
37562	421	445	308
37563	421	446	320
37564	421	447	333
37565	421	448	343
37566	421	449	308
37567	421	450	318
37568	421	451	326
37569	421	452	337
37570	421	453	361
37571	421	454	358
37572	421	455	381
37573	421	456	426
37574	421	457	240
37575	421	458	246
37576	421	459	280
37577	421	460	300
37578	421	461	311
37579	421	462	334
37580	421	463	394
37581	421	464	414
37582	421	465	424
37583	421	466	390
37584	421	467	405
37585	421	468	319
37586	421	469	299
37587	421	470	365
37588	421	471	377
37589	421	472	380
37590	421	473	380
37591	421	474	385
37592	421	475	380
37593	421	476	385
37594	421	477	395
37595	421	478	414
37596	421	479	420
37597	421	480	412
37598	421	481	470
37599	421	482	435
37600	421	483	459
37601	421	484	392
37602	421	485	426
37603	421	486	411
37604	421	487	426
37605	421	488	451
37606	421	489	512
37607	421	490	496
37608	421	491	486
37609	421	492	451
37610	422	423	217
37611	422	424	254
37612	422	425	307
37613	422	426	317
37614	422	427	261
37615	422	428	367
37616	422	429	372
37617	422	430	367
37618	422	431	579
37619	422	432	549
37620	422	433	630
37621	422	434	640
37622	422	435	683
37623	422	436	452
37624	422	437	467
37625	422	438	472
37626	422	439	487
37627	422	440	495
37628	422	441	493
37629	422	442	501
37630	422	443	507
37631	422	444	512
37632	422	445	522
37633	422	446	534
37634	422	447	547
37635	422	448	557
37636	422	449	522
37637	422	450	532
37638	422	451	540
37639	422	452	551
37640	422	453	575
37641	422	454	572
37642	422	455	595
37643	422	456	640
37644	422	457	454
37645	422	458	460
37646	422	459	494
37647	422	460	514
37648	422	461	525
37649	422	462	548
37650	422	463	608
37651	422	464	628
37652	422	465	638
37653	422	466	604
37654	422	467	619
37655	422	468	533
37656	422	469	513
37657	422	470	579
37658	422	471	591
37659	422	472	594
37660	422	473	594
37661	422	474	599
37662	422	475	594
37663	422	476	599
37664	422	477	609
37665	422	478	628
37666	422	479	634
37667	422	480	626
37668	422	481	684
37669	422	482	649
37670	422	483	673
37671	422	484	606
37672	422	485	640
37673	422	486	625
37674	422	487	640
37675	422	488	665
37676	422	489	726
37677	422	490	710
37678	422	491	700
37679	422	492	665
37680	423	424	152
37681	423	425	205
37682	423	426	22
37683	423	427	159
37684	423	428	270
37685	423	429	275
37686	423	430	270
37687	423	431	272
37688	423	432	242
37689	423	433	323
37690	423	434	333
37691	423	435	376
37692	423	436	355
37693	423	437	370
37694	423	438	375
37695	423	439	390
37696	423	440	398
37697	423	441	396
37698	423	442	404
37699	423	443	410
37700	423	444	415
37701	423	445	425
37702	423	446	437
37703	423	447	450
37704	423	448	460
37705	423	449	425
37706	423	450	435
37707	423	451	443
37708	423	452	454
37709	423	453	478
37710	423	454	475
37711	423	455	498
37712	423	456	543
37713	423	457	357
37714	423	458	363
37715	423	459	397
37716	423	460	417
37717	423	461	428
37718	423	462	451
37719	423	463	511
37720	423	464	531
37721	423	465	541
37722	423	466	507
37723	423	467	522
37724	423	468	436
37725	423	469	416
37726	423	470	482
37727	423	471	494
37728	423	472	497
37729	423	473	497
37730	423	474	502
37731	423	475	497
37732	423	476	502
37733	423	477	512
37734	423	478	531
37735	423	479	537
37736	423	480	529
37737	423	481	587
37738	423	482	552
37739	423	483	576
37740	423	484	509
37741	423	485	543
37742	423	486	528
37743	423	487	543
37744	423	488	568
37745	423	489	629
37746	423	490	613
37747	423	491	603
37748	423	492	568
37749	424	425	65
37750	424	426	193
37751	424	427	33
37752	424	428	117
37753	424	429	112
37754	424	430	142
37755	424	431	120
37756	424	432	90
37757	424	433	171
37758	424	434	181
37759	424	435	224
37760	424	436	202
37761	424	437	217
37762	424	438	222
37763	424	439	237
37764	424	440	245
37765	424	441	243
37766	424	442	251
37767	424	443	257
37768	424	444	262
37769	424	445	272
37770	424	446	284
37771	424	447	297
37772	424	448	307
37773	424	449	272
37774	424	450	282
37775	424	451	290
37776	424	452	301
37777	424	453	325
37778	424	454	322
37779	424	455	345
37780	424	456	390
37781	424	457	204
37782	424	458	210
37783	424	459	244
37784	424	460	264
37785	424	461	275
37786	424	462	298
37787	424	463	358
37788	424	464	378
37789	424	465	388
37790	424	466	354
37791	424	467	369
37792	424	468	283
37793	424	469	263
37794	424	470	329
37795	424	471	341
37796	424	472	344
37797	424	473	344
37798	424	474	349
37799	424	475	344
37800	424	476	349
37801	424	477	359
37802	424	478	378
37803	424	479	384
37804	424	480	376
37805	424	481	434
37806	424	482	399
37807	424	483	423
37808	424	484	356
37809	424	485	390
37810	424	486	375
37811	424	487	390
37812	424	488	415
37813	424	489	476
37814	424	490	460
37815	424	491	450
37816	424	492	415
37817	425	426	205
37818	425	427	92
37819	425	428	94
37820	425	429	89
37821	425	430	119
37822	425	431	97
37823	425	432	67
37824	425	433	148
37825	425	434	158
37826	425	435	201
37827	425	436	179
37828	425	437	194
37829	425	438	199
37830	425	439	214
37831	425	440	222
37832	425	441	220
37833	425	442	228
37834	425	443	234
37835	425	444	239
37836	425	445	249
37837	425	446	261
37838	425	447	274
37839	425	448	284
37840	425	449	249
37841	425	450	259
37842	425	451	267
37843	425	452	278
37844	425	453	302
37845	425	454	299
37846	425	455	322
37847	425	456	367
37848	425	457	181
37849	425	458	187
37850	425	459	221
37851	425	460	241
37852	425	461	252
37853	425	462	275
37854	425	463	335
37855	425	464	355
37856	425	465	365
37857	425	466	331
37858	425	467	346
37859	425	468	260
37860	425	469	240
37861	425	470	306
37862	425	471	318
37863	425	472	321
37864	425	473	321
37865	425	474	326
37866	425	475	321
37867	425	476	326
37868	425	477	336
37869	425	478	355
37870	425	479	361
37871	425	480	353
37872	425	481	411
37873	425	482	376
37874	425	483	400
37875	425	484	333
37876	425	485	367
37877	425	486	352
37878	425	487	367
37879	425	488	392
37880	425	489	453
37881	425	490	437
37882	425	491	427
37883	425	492	392
37884	426	427	228
37885	426	428	220
37886	426	429	225
37887	426	430	220
37888	426	431	240
37889	426	432	293
37890	426	433	282
37891	426	434	279
37892	426	435	289
37893	426	436	305
37894	426	437	320
37895	426	438	325
37896	426	439	340
37897	426	440	348
37898	426	441	346
37899	426	442	354
37900	426	443	360
37901	426	444	365
37902	426	445	375
37903	426	446	387
37904	426	447	400
37905	426	448	410
37906	426	449	375
37907	426	450	385
37908	426	451	393
37909	426	452	404
37910	426	453	428
37911	426	454	425
37912	426	455	448
37913	426	456	493
37914	426	457	307
37915	426	458	313
37916	426	459	347
37917	426	460	367
37918	426	461	378
37919	426	462	401
37920	426	463	461
37921	426	464	481
37922	426	465	491
37923	426	466	457
37924	426	467	472
37925	426	468	386
37926	426	469	366
37927	426	470	432
37928	426	471	444
37929	426	472	447
37930	426	473	447
37931	426	474	452
37932	426	475	447
37933	426	476	452
37934	426	477	462
37935	426	478	481
37936	426	479	487
37937	426	480	479
37938	426	481	537
37939	426	482	502
37940	426	483	526
37941	426	484	459
37942	426	485	493
37943	426	486	478
37944	426	487	493
37945	426	488	518
37946	426	489	579
37947	426	490	563
37948	426	491	553
37949	426	492	518
37950	427	428	278
37951	427	429	283
37952	427	430	278
37953	427	431	153
37954	427	432	123
37955	427	433	204
37956	427	434	214
37957	427	435	257
37958	427	436	363
37959	427	437	378
37960	427	438	383
37961	427	439	398
37962	427	440	406
37963	427	441	404
37964	427	442	412
37965	427	443	418
37966	427	444	423
37967	427	445	433
37968	427	446	445
37969	427	447	458
37970	427	448	468
37971	427	449	433
37972	427	450	443
37973	427	451	451
37974	427	452	462
37975	427	453	486
37976	427	454	483
37977	427	455	506
37978	427	456	551
37979	427	457	365
37980	427	458	371
37981	427	459	405
37982	427	460	425
37983	427	461	436
37984	427	462	459
37985	427	463	519
37986	427	464	539
37987	427	465	549
37988	427	466	515
37989	427	467	530
37990	427	468	444
37991	427	469	424
37992	427	470	490
37993	427	471	502
37994	427	472	505
37995	427	473	505
37996	427	474	510
37997	427	475	505
37998	427	476	510
37999	427	477	520
38000	427	478	539
38001	427	479	545
38002	427	480	537
38003	427	481	595
38004	427	482	560
38005	427	483	584
38006	427	484	517
38007	427	485	551
38008	427	486	536
38009	427	487	551
38010	427	488	576
38011	427	489	637
38012	427	490	621
38013	427	491	611
38014	427	492	576
38015	428	429	5
38016	428	430	25
38017	428	431	78
38018	428	432	67
38019	428	433	54
38020	428	434	64
38021	428	435	107
38022	428	436	85
38023	428	437	100
38024	428	438	105
38025	428	439	120
38026	428	440	128
38027	428	441	126
38028	428	442	134
38029	428	443	140
38030	428	444	145
38031	428	445	155
38032	428	446	167
38033	428	447	180
38034	428	448	190
38035	428	449	155
38036	428	450	165
38037	428	451	173
38038	428	452	184
38039	428	453	208
38040	428	454	205
38041	428	455	228
38042	428	456	273
38043	428	457	87
38044	428	458	93
38045	428	459	127
38046	428	460	147
38047	428	461	158
38048	428	462	181
38049	428	463	241
38050	428	464	261
38051	428	465	271
38052	428	466	237
38053	428	467	252
38054	428	468	166
38055	428	469	146
38056	428	470	212
38057	428	471	224
38058	428	472	227
38059	428	473	227
38060	428	474	232
38061	428	475	227
38062	428	476	232
38063	428	477	242
38064	428	478	261
38065	428	479	267
38066	428	480	259
38067	428	481	317
38068	428	482	282
38069	428	483	306
38070	428	484	239
38071	428	485	273
38072	428	486	258
38073	428	487	273
38074	428	488	298
38075	428	489	359
38076	428	490	343
38077	428	491	333
38078	428	492	298
38079	429	430	20
38080	429	431	73
38081	429	432	62
38082	429	433	59
38083	429	434	69
38084	429	435	112
38085	429	436	90
38086	429	437	105
38087	429	438	110
38088	429	439	125
38089	429	440	133
38090	429	441	131
38091	429	442	139
38092	429	443	145
38093	429	444	150
38094	429	445	160
38095	429	446	172
38096	429	447	185
38097	429	448	195
38098	429	449	160
38099	429	450	170
38100	429	451	178
38101	429	452	189
38102	429	453	213
38103	429	454	210
38104	429	455	233
38105	429	456	278
38106	429	457	92
38107	429	458	98
38108	429	459	132
38109	429	460	152
38110	429	461	163
38111	429	462	186
38112	429	463	246
38113	429	464	266
38114	429	465	276
38115	429	466	242
38116	429	467	257
38117	429	468	171
38118	429	469	151
38119	429	470	217
38120	429	471	229
38121	429	472	232
38122	429	473	232
38123	429	474	237
38124	429	475	232
38125	429	476	237
38126	429	477	247
38127	429	478	266
38128	429	479	272
38129	429	480	264
38130	429	481	322
38131	429	482	287
38132	429	483	311
38133	429	484	244
38134	429	485	278
38135	429	486	263
38136	429	487	278
38137	429	488	303
38138	429	489	364
38139	429	490	348
38140	429	491	338
38141	429	492	303
38142	430	431	53
38143	430	432	92
38144	430	433	79
38145	430	434	89
38146	430	435	132
38147	430	436	110
38148	430	437	125
38149	430	438	130
38150	430	439	145
38151	430	440	153
38152	430	441	151
38153	430	442	159
38154	430	443	165
38155	430	444	170
38156	430	445	180
38157	430	446	192
38158	430	447	205
38159	430	448	215
38160	430	449	180
38161	430	450	190
38162	430	451	198
38163	430	452	209
38164	430	453	233
38165	430	454	230
38166	430	455	253
38167	430	456	298
38168	430	457	112
38169	430	458	118
38170	430	459	152
38171	430	460	172
38172	430	461	183
38173	430	462	206
38174	430	463	266
38175	430	464	286
38176	430	465	296
38177	430	466	262
38178	430	467	277
38179	430	468	191
38180	430	469	171
38181	430	470	237
38182	430	471	249
38183	430	472	252
38184	430	473	252
38185	430	474	257
38186	430	475	252
38187	430	476	257
38188	430	477	267
38189	430	478	286
38190	430	479	292
38191	430	480	284
38192	430	481	342
38193	430	482	307
38194	430	483	331
38195	430	484	264
38196	430	485	298
38197	430	486	283
38198	430	487	298
38199	430	488	323
38200	430	489	384
38201	430	490	368
38202	430	491	358
38203	430	492	323
38204	431	432	70
38205	431	433	142
38206	431	434	152
38207	431	435	185
38208	431	436	105
38209	431	437	120
38210	431	438	125
38211	431	439	198
38212	431	440	206
38213	431	441	204
38214	431	442	212
38215	431	443	218
38216	431	444	190
38217	431	445	233
38218	431	446	245
38219	431	447	258
38220	431	448	268
38221	431	449	233
38222	431	450	243
38223	431	451	251
38224	431	452	262
38225	431	453	286
38226	431	454	283
38227	431	455	306
38228	431	456	351
38229	431	457	165
38230	431	458	171
38231	431	459	205
38232	431	460	225
38233	431	461	236
38234	431	462	259
38235	431	463	319
38236	431	464	339
38237	431	465	349
38238	431	466	315
38239	431	467	330
38240	431	468	244
38241	431	469	224
38242	431	470	290
38243	431	471	302
38244	431	472	305
38245	431	473	305
38246	431	474	310
38247	431	475	305
38248	431	476	310
38249	431	477	320
38250	431	478	339
38251	431	479	345
38252	431	480	337
38253	431	481	395
38254	431	482	360
38255	431	483	384
38256	431	484	317
38257	431	485	351
38258	431	486	336
38259	431	487	351
38260	431	488	376
38261	431	489	437
38262	431	490	421
38263	431	491	411
38264	431	492	376
38265	432	433	121
38266	432	434	131
38267	432	435	174
38268	432	436	152
38269	432	437	167
38270	432	438	172
38271	432	439	187
38272	432	440	195
38273	432	441	193
38274	432	442	201
38275	432	443	207
38276	432	444	212
38277	432	445	222
38278	432	446	234
38279	432	447	247
38280	432	448	257
38281	432	449	222
38282	432	450	232
38283	432	451	240
38284	432	452	251
38285	432	453	275
38286	432	454	272
38287	432	455	295
38288	432	456	340
38289	432	457	154
38290	432	458	160
38291	432	459	194
38292	432	460	214
38293	432	461	225
38294	432	462	248
38295	432	463	308
38296	432	464	328
38297	432	465	338
38298	432	466	304
38299	432	467	319
38300	432	468	233
38301	432	469	213
38302	432	470	279
38303	432	471	291
38304	432	472	294
38305	432	473	294
38306	432	474	299
38307	432	475	294
38308	432	476	299
38309	432	477	309
38310	432	478	328
38311	432	479	334
38312	432	480	326
38313	432	481	384
38314	432	482	349
38315	432	483	373
38316	432	484	306
38317	432	485	340
38318	432	486	325
38319	432	487	340
38320	432	488	365
38321	432	489	426
38322	432	490	410
38323	432	491	400
38324	432	492	365
38325	433	434	10
38326	433	435	161
38327	433	436	139
38328	433	437	154
38329	433	438	159
38330	433	439	174
38331	433	440	182
38332	433	441	180
38333	433	442	188
38334	433	443	194
38335	433	444	199
38336	433	445	209
38337	433	446	221
38338	433	447	234
38339	433	448	244
38340	433	449	209
38341	433	450	219
38342	433	451	227
38343	433	452	238
38344	433	453	262
38345	433	454	259
38346	433	455	282
38347	433	456	327
38348	433	457	141
38349	433	458	147
38350	433	459	181
38351	433	460	201
38352	433	461	212
38353	433	462	235
38354	433	463	295
38355	433	464	315
38356	433	465	325
38357	433	466	291
38358	433	467	306
38359	433	468	220
38360	433	469	200
38361	433	470	266
38362	433	471	278
38363	433	472	281
38364	433	473	281
38365	433	474	286
38366	433	475	281
38367	433	476	286
38368	433	477	296
38369	433	478	315
38370	433	479	321
38371	433	480	313
38372	433	481	371
38373	433	482	336
38374	433	483	360
38375	433	484	293
38376	433	485	327
38377	433	486	312
38378	433	487	327
38379	433	488	352
38380	433	489	413
38381	433	490	397
38382	433	491	387
38383	433	492	352
38384	434	435	171
38385	434	436	149
38386	434	437	164
38387	434	438	169
38388	434	439	184
38389	434	440	192
38390	434	441	190
38391	434	442	198
38392	434	443	204
38393	434	444	209
38394	434	445	219
38395	434	446	231
38396	434	447	244
38397	434	448	254
38398	434	449	219
38399	434	450	229
38400	434	451	237
38401	434	452	248
38402	434	453	272
38403	434	454	269
38404	434	455	292
38405	434	456	337
38406	434	457	151
38407	434	458	157
38408	434	459	191
38409	434	460	211
38410	434	461	222
38411	434	462	245
38412	434	463	305
38413	434	464	325
38414	434	465	335
38415	434	466	301
38416	434	467	316
38417	434	468	230
38418	434	469	210
38419	434	470	276
38420	434	471	288
38421	434	472	291
38422	434	473	291
38423	434	474	296
38424	434	475	291
38425	434	476	296
38426	434	477	306
38427	434	478	325
38428	434	479	331
38429	434	480	323
38430	434	481	381
38431	434	482	346
38432	434	483	370
38433	434	484	303
38434	434	485	337
38435	434	486	322
38436	434	487	337
38437	434	488	362
38438	434	489	423
38439	434	490	407
38440	434	491	397
38441	434	492	362
38442	435	436	192
38443	435	437	207
38444	435	438	212
38445	435	439	227
38446	435	440	235
38447	435	441	233
38448	435	442	241
38449	435	443	247
38450	435	444	252
38451	435	445	262
38452	435	446	274
38453	435	447	287
38454	435	448	297
38455	435	449	262
38456	435	450	272
38457	435	451	280
38458	435	452	291
38459	435	453	315
38460	435	454	312
38461	435	455	335
38462	435	456	380
38463	435	457	194
38464	435	458	200
38465	435	459	234
38466	435	460	254
38467	435	461	265
38468	435	462	288
38469	435	463	348
38470	435	464	368
38471	435	465	378
38472	435	466	344
38473	435	467	359
38474	435	468	273
38475	435	469	253
38476	435	470	319
38477	435	471	331
38478	435	472	334
38479	435	473	334
38480	435	474	339
38481	435	475	334
38482	435	476	339
38483	435	477	349
38484	435	478	368
38485	435	479	374
38486	435	480	366
38487	435	481	424
38488	435	482	389
38489	435	483	413
38490	435	484	346
38491	435	485	380
38492	435	486	365
38493	435	487	380
38494	435	488	405
38495	435	489	466
38496	435	490	450
38497	435	491	440
38498	435	492	405
38499	436	437	16
38500	436	438	20
38501	436	439	35
38502	436	440	43
38503	436	441	41
38504	436	442	49
38505	436	443	55
38506	436	444	60
38507	436	445	70
38508	436	446	82
38509	436	447	95
38510	436	448	105
38511	436	449	70
38512	436	450	80
38513	436	451	88
38514	436	452	99
38515	436	453	123
38516	436	454	120
38517	436	455	143
38518	436	456	188
38519	436	457	75
38520	436	458	81
38521	436	459	115
38522	436	460	135
38523	436	461	146
38524	436	462	169
38525	436	463	229
38526	436	464	249
38527	436	465	259
38528	436	466	225
38529	436	467	240
38530	436	468	154
38531	436	469	134
38532	436	470	155
38533	436	471	165
38534	436	472	166
38535	436	473	166
38536	436	474	171
38537	436	475	166
38538	436	476	171
38539	436	477	181
38540	436	478	200
38541	436	479	206
38542	436	480	198
38543	436	481	256
38544	436	482	221
38545	436	483	245
38546	436	484	178
38547	436	485	212
38548	436	486	190
38549	436	487	205
38550	436	488	230
38551	436	489	291
38552	436	490	258
38553	436	491	268
38554	436	492	230
38555	437	438	10
38556	437	439	50
38557	437	440	58
38558	437	441	56
38559	437	442	64
38560	437	443	69
38561	437	444	75
38562	437	445	85
38563	437	446	97
38564	437	447	110
38565	437	448	120
38566	437	449	83
38567	437	450	89
38568	437	451	97
38569	437	452	108
38570	437	453	131
38571	437	454	129
38572	437	455	152
38573	437	456	197
38574	437	457	60
38575	437	458	66
38576	437	459	100
38577	437	460	120
38578	437	461	131
38579	437	462	154
38580	437	463	214
38581	437	464	234
38582	437	465	244
38583	437	466	210
38584	437	467	225
38585	437	468	139
38586	437	469	119
38587	437	470	170
38588	437	471	178
38589	437	472	181
38590	437	473	181
38591	437	474	186
38592	437	475	181
38593	437	476	186
38594	437	477	196
38595	437	478	215
38596	437	479	221
38597	437	480	213
38598	437	481	271
38599	437	482	236
38600	437	483	260
38601	437	484	193
38602	437	485	227
38603	437	486	205
38604	437	487	220
38605	437	488	245
38606	437	489	306
38607	437	490	267
38608	437	491	277
38609	437	492	245
38610	438	439	55
38611	438	440	49
38612	438	441	47
38613	438	442	55
38614	438	443	61
38615	438	444	66
38616	438	445	76
38617	438	446	88
38618	438	447	101
38619	438	448	111
38620	438	449	75
38621	438	450	86
38622	438	451	94
38623	438	452	105
38624	438	453	129
38625	438	454	126
38626	438	455	149
38627	438	456	194
38628	438	457	95
38629	438	458	101
38630	438	459	135
38631	438	460	155
38632	438	461	166
38633	438	462	189
38634	438	463	249
38635	438	464	269
38636	438	465	279
38637	438	466	245
38638	438	467	260
38639	438	468	174
38640	438	469	154
38641	438	470	157
38642	438	471	169
38643	438	472	172
38644	438	473	172
38645	438	474	177
38646	438	475	172
38647	438	476	177
38648	438	477	187
38649	438	478	206
38650	438	479	212
38651	438	480	204
38652	438	481	262
38653	438	482	227
38654	438	483	251
38655	438	484	184
38656	438	485	218
38657	438	486	196
38658	438	487	211
38659	438	488	236
38660	438	489	297
38661	438	490	264
38662	438	491	274
38663	438	492	236
38664	439	440	34
38665	439	441	32
38666	439	442	51
38667	439	443	63
38668	439	444	68
38669	439	445	78
38670	439	446	46
38671	439	447	103
38672	439	448	113
38673	439	449	105
38674	439	450	115
38675	439	451	123
38676	439	452	134
38677	439	453	158
38678	439	454	155
38679	439	455	178
38680	439	456	223
38681	439	457	110
38682	439	458	116
38683	439	459	150
38684	439	460	170
38685	439	461	181
38686	439	462	204
38687	439	463	264
38688	439	464	284
38689	439	465	294
38690	439	466	260
38691	439	467	275
38692	439	468	189
38693	439	469	169
38694	439	470	186
38695	439	471	198
38696	439	472	201
38697	439	473	201
38698	439	474	206
38699	439	475	201
38700	439	476	206
38701	439	477	216
38702	439	478	235
38703	439	479	241
38704	439	480	233
38705	439	481	291
38706	439	482	256
38707	439	483	280
38708	439	484	213
38709	439	485	247
38710	439	486	225
38711	439	487	240
38712	439	488	265
38713	439	489	326
38714	439	490	293
38715	439	491	303
38716	439	492	265
38717	440	441	2
38718	440	442	26
38719	440	443	39
38720	440	444	43
38721	440	445	53
38722	440	446	65
38723	440	447	78
38724	440	448	88
38725	440	449	110
38726	440	450	105
38727	440	451	138
38728	440	452	149
38729	440	453	173
38730	440	454	170
38731	440	455	193
38732	440	456	238
38733	440	457	118
38734	440	458	124
38735	440	459	158
38736	440	460	178
38737	440	461	189
38738	440	462	212
38739	440	463	272
38740	440	464	292
38741	440	465	302
38742	440	466	268
38743	440	467	283
38744	440	468	197
38745	440	469	177
38746	440	470	194
38747	440	471	206
38748	440	472	209
38749	440	473	209
38750	440	474	214
38751	440	475	209
38752	440	476	214
38753	440	477	224
38754	440	478	243
38755	440	479	249
38756	440	480	241
38757	440	481	299
38758	440	482	264
38759	440	483	288
38760	440	484	221
38761	440	485	255
38762	440	486	233
38763	440	487	248
38764	440	488	273
38765	440	489	334
38766	440	490	308
38767	440	491	318
38768	440	492	273
38769	441	442	24
38770	441	443	37
38771	441	444	41
38772	441	445	51
38773	441	446	63
38774	441	447	76
38775	441	448	86
38776	441	449	108
38777	441	450	103
38778	441	451	136
38779	441	452	147
38780	441	453	171
38781	441	454	168
38782	441	455	191
38783	441	456	236
38784	441	457	116
38785	441	458	122
38786	441	459	156
38787	441	460	176
38788	441	461	187
38789	441	462	210
38790	441	463	270
38791	441	464	290
38792	441	465	300
38793	441	466	266
38794	441	467	281
38795	441	468	195
38796	441	469	175
38797	441	470	192
38798	441	471	204
38799	441	472	207
38800	441	473	207
38801	441	474	212
38802	441	475	207
38803	441	476	212
38804	441	477	222
38805	441	478	241
38806	441	479	247
38807	441	480	239
38808	441	481	297
38809	441	482	262
38810	441	483	286
38811	441	484	219
38812	441	485	253
38813	441	486	231
38814	441	487	246
38815	441	488	271
38816	441	489	332
38817	441	490	306
38818	441	491	316
38819	441	492	271
38820	442	443	12
38821	442	444	17
38822	442	445	27
38823	442	446	39
38824	442	447	52
38825	442	448	62
38826	442	449	125
38827	442	450	79
38828	442	451	112
38829	442	452	123
38830	442	453	147
38831	442	454	144
38832	442	455	167
38833	442	456	212
38834	442	457	124
38835	442	458	130
38836	442	459	164
38837	442	460	184
38838	442	461	195
38839	442	462	218
38840	442	463	278
38841	442	464	298
38842	442	465	308
38843	442	466	274
38844	442	467	289
38845	442	468	203
38846	442	469	183
38847	442	470	200
38848	442	471	212
38849	442	472	215
38850	442	473	215
38851	442	474	220
38852	442	475	215
38853	442	476	220
38854	442	477	230
38855	442	478	249
38856	442	479	255
38857	442	480	247
38858	442	481	305
38859	442	482	270
38860	442	483	294
38861	442	484	227
38862	442	485	261
38863	442	486	239
38864	442	487	254
38865	442	488	279
38866	442	489	340
38867	442	490	282
38868	442	491	292
38869	442	492	279
38870	443	444	5
38871	443	445	15
38872	443	446	27
38873	443	447	40
38874	443	448	50
38875	443	449	113
38876	443	450	67
38877	443	451	100
38878	443	452	111
38879	443	453	135
38880	443	454	132
38881	443	455	155
38882	443	456	200
38883	443	457	130
38884	443	458	136
38885	443	459	170
38886	443	460	190
38887	443	461	201
38888	443	462	224
38889	443	463	284
38890	443	464	304
38891	443	465	314
38892	443	466	280
38893	443	467	295
38894	443	468	209
38895	443	469	189
38896	443	470	206
38897	443	471	218
38898	443	472	221
38899	443	473	221
38900	443	474	226
38901	443	475	221
38902	443	476	226
38903	443	477	236
38904	443	478	255
38905	443	479	261
38906	443	480	253
38907	443	481	311
38908	443	482	276
38909	443	483	300
38910	443	484	233
38911	443	485	267
38912	443	486	245
38913	443	487	260
38914	443	488	285
38915	443	489	346
38916	443	490	270
38917	443	491	280
38918	443	492	285
38919	444	445	8
38920	444	446	22
38921	444	447	35
38922	444	448	45
38923	444	449	136
38924	444	450	62
38925	444	451	95
38926	444	452	106
38927	444	453	130
38928	444	454	127
38929	444	455	150
38930	444	456	195
38931	444	457	135
38932	444	458	141
38933	444	459	175
38934	444	460	195
38935	444	461	206
38936	444	462	229
38937	444	463	289
38938	444	464	309
38939	444	465	319
38940	444	466	285
38941	444	467	300
38942	444	468	214
38943	444	469	194
38944	444	470	220
38945	444	471	230
38946	444	472	226
38947	444	473	226
38948	444	474	231
38949	444	475	226
38950	444	476	231
38951	444	477	241
38952	444	478	260
38953	444	479	266
38954	444	480	258
38955	444	481	316
38956	444	482	281
38957	444	483	305
38958	444	484	238
38959	444	485	272
38960	444	486	250
38961	444	487	265
38962	444	488	290
38963	444	489	351
38964	444	490	265
38965	444	491	275
38966	444	492	290
38967	445	446	13
38968	445	447	27
38969	445	448	37
38970	445	449	113
38971	445	450	65
38972	445	451	85
38973	445	452	98
38974	445	453	120
38975	445	454	107
38976	445	455	130
38977	445	456	185
38978	445	457	145
38979	445	458	151
38980	445	459	185
38981	445	460	205
38982	445	461	216
38983	445	462	239
38984	445	463	299
38985	445	464	319
38986	445	465	329
38987	445	466	295
38988	445	467	310
38989	445	468	224
38990	445	469	204
38991	445	470	221
38992	445	471	233
38993	445	472	236
38994	445	473	236
38995	445	474	241
38996	445	475	236
38997	445	476	241
38998	445	477	251
38999	445	478	270
39000	445	479	276
39001	445	480	268
39002	445	481	326
39003	445	482	291
39004	445	483	315
39005	445	484	248
39006	445	485	282
39007	445	486	260
39008	445	487	275
39009	445	488	300
39010	445	489	361
39011	445	490	255
39012	445	491	265
39013	445	492	300
39014	446	447	31
39015	446	448	41
39016	446	449	127
39017	446	450	58
39018	446	451	91
39019	446	452	102
39020	446	453	126
39021	446	454	123
39022	446	455	146
39023	446	456	161
39024	446	457	157
39025	446	458	163
39026	446	459	197
39027	446	460	217
39028	446	461	228
39029	446	462	251
39030	446	463	311
39031	446	464	331
39032	446	465	341
39033	446	466	307
39034	446	467	322
39035	446	468	236
39036	446	469	216
39037	446	470	233
39038	446	471	245
39039	446	472	248
39040	446	473	248
39041	446	474	253
39042	446	475	248
39043	446	476	253
39044	446	477	263
39045	446	478	282
39046	446	479	288
39047	446	480	280
39048	446	481	338
39049	446	482	303
39050	446	483	327
39051	446	484	260
39052	446	485	294
39053	446	486	272
39054	446	487	287
39055	446	488	312
39056	446	489	373
39057	446	490	231
39058	446	491	241
39059	446	492	312
39060	447	448	10
39061	447	449	77
39062	447	450	28
39063	447	451	60
39064	447	452	71
39065	447	453	93
39066	447	454	82
39067	447	455	115
39068	447	456	160
39069	447	457	170
39070	447	458	176
39071	447	459	210
39072	447	460	230
39073	447	461	241
39074	447	462	264
39075	447	463	324
39076	447	464	344
39077	447	465	354
39078	447	466	320
39079	447	467	335
39080	447	468	249
39081	447	469	229
39082	447	470	171
39083	447	471	183
39084	447	472	186
39085	447	473	186
39086	447	474	191
39087	447	475	186
39088	447	476	191
39089	447	477	201
39090	447	478	220
39091	447	479	226
39092	447	480	218
39093	447	481	276
39094	447	482	241
39095	447	483	265
39096	447	484	198
39097	447	485	232
39098	447	486	210
39099	447	487	225
39100	447	488	250
39101	447	489	311
39102	447	490	230
39103	447	491	240
39104	447	492	250
39105	448	449	85
39106	448	450	38
39107	448	451	70
39108	448	452	81
39109	448	453	103
39110	448	454	92
39111	448	455	127
39112	448	456	170
39113	448	457	180
39114	448	458	186
39115	448	459	220
39116	448	460	240
39117	448	461	251
39118	448	462	274
39119	448	463	334
39120	448	464	354
39121	448	465	364
39122	448	466	330
39123	448	467	345
39124	448	468	259
39125	448	469	239
39126	448	470	181
39127	448	471	193
39128	448	472	196
39129	448	473	196
39130	448	474	201
39131	448	475	196
39132	448	476	201
39133	448	477	211
39134	448	478	230
39135	448	479	236
39136	448	480	228
39137	448	481	286
39138	448	482	251
39139	448	483	275
39140	448	484	208
39141	448	485	242
39142	448	486	220
39143	448	487	235
39144	448	488	260
39145	448	489	321
39146	448	490	240
39147	448	491	250
39148	448	492	260
39149	449	450	75
39150	449	451	50
39151	449	452	61
39152	449	453	85
39153	449	454	72
39154	449	455	105
39155	449	456	150
39156	449	457	145
39157	449	458	151
39158	449	459	185
39159	449	460	205
39160	449	461	216
39161	449	462	239
39162	449	463	299
39163	449	464	319
39164	449	465	329
39165	449	466	295
39166	449	467	310
39167	449	468	224
39168	449	469	204
39169	449	470	89
39170	449	471	101
39171	449	472	104
39172	449	473	104
39173	449	474	109
39174	449	475	104
39175	449	476	109
39176	449	477	119
39177	449	478	138
39178	449	479	144
39179	449	480	136
39180	449	481	194
39181	449	482	159
39182	449	483	183
39183	449	484	116
39184	449	485	150
39185	449	486	128
39186	449	487	143
39187	449	488	168
39188	449	489	229
39189	449	490	196
39190	449	491	206
39191	449	492	168
39192	450	451	56
39193	450	452	67
39194	450	453	89
39195	450	454	78
39196	450	455	111
39197	450	456	156
39198	450	457	155
39199	450	458	161
39200	450	459	195
39201	450	460	215
39202	450	461	226
39203	450	462	249
39204	450	463	309
39205	450	464	329
39206	450	465	339
39207	450	466	305
39208	450	467	320
39209	450	468	234
39210	450	469	214
39211	450	470	167
39212	450	471	179
39213	450	472	182
39214	450	473	182
39215	450	474	187
39216	450	475	182
39217	450	476	187
39218	450	477	197
39219	450	478	216
39220	450	479	222
39221	450	480	214
39222	450	481	272
39223	450	482	237
39224	450	483	261
39225	450	484	194
39226	450	485	228
39227	450	486	206
39228	450	487	221
39229	450	488	246
39230	450	489	307
39231	450	490	226
39232	450	491	236
39233	450	492	246
39234	451	452	11
39235	451	453	35
39236	451	454	22
39237	451	455	55
39238	451	456	100
39239	451	457	163
39240	451	458	169
39241	451	459	203
39242	451	460	223
39243	451	461	234
39244	451	462	257
39245	451	463	317
39246	451	464	337
39247	451	465	347
39248	451	466	313
39249	451	467	328
39250	451	468	242
39251	451	469	222
39252	451	470	143
39253	451	471	155
39254	451	472	158
39255	451	473	158
39256	451	474	163
39257	451	475	158
39258	451	476	163
39259	451	477	173
39260	451	478	192
39261	451	479	198
39262	451	480	190
39263	451	481	248
39264	451	482	213
39265	451	483	237
39266	451	484	170
39267	451	485	204
39268	451	486	182
39269	451	487	197
39270	451	488	222
39271	451	489	283
39272	451	490	170
39273	451	491	180
39274	451	492	222
39275	452	453	46
39276	452	454	33
39277	452	455	66
39278	452	456	111
39279	452	457	174
39280	452	458	180
39281	452	459	214
39282	452	460	234
39283	452	461	245
39284	452	462	268
39285	452	463	328
39286	452	464	348
39287	452	465	358
39288	452	466	324
39289	452	467	339
39290	452	468	253
39291	452	469	233
39292	452	470	154
39293	452	471	166
39294	452	472	169
39295	452	473	169
39296	452	474	174
39297	452	475	169
39298	452	476	174
39299	452	477	184
39300	452	478	203
39301	452	479	209
39302	452	480	201
39303	452	481	259
39304	452	482	224
39305	452	483	248
39306	452	484	181
39307	452	485	215
39308	452	486	193
39309	452	487	208
39310	452	488	233
39311	452	489	294
39312	452	490	181
39313	452	491	191
39314	452	492	233
39315	453	454	28
39316	453	455	52
39317	453	456	92
39318	453	457	198
39319	453	458	204
39320	453	459	238
39321	453	460	258
39322	453	461	269
39323	453	462	292
39324	453	463	352
39325	453	464	372
39326	453	465	382
39327	453	466	348
39328	453	467	363
39329	453	468	277
39330	453	469	257
39331	453	470	178
39332	453	471	190
39333	453	472	193
39334	453	473	193
39335	453	474	198
39336	453	475	193
39337	453	476	198
39338	453	477	208
39339	453	478	227
39340	453	479	233
39341	453	480	225
39342	453	481	283
39343	453	482	248
39344	453	483	272
39345	453	484	205
39346	453	485	239
39347	453	486	217
39348	453	487	232
39349	453	488	257
39350	453	489	318
39351	453	490	162
39352	453	491	172
39353	453	492	257
39354	454	455	48
39355	454	456	88
39356	454	457	195
39357	454	458	201
39358	454	459	235
39359	454	460	255
39360	454	461	266
39361	454	462	289
39362	454	463	349
39363	454	464	369
39364	454	465	379
39365	454	466	345
39366	454	467	360
39367	454	468	274
39368	454	469	254
39369	454	470	165
39370	454	471	177
39371	454	472	180
39372	454	473	180
39373	454	474	185
39374	454	475	180
39375	454	476	185
39376	454	477	195
39377	454	478	214
39378	454	479	220
39379	454	480	212
39380	454	481	270
39381	454	482	235
39382	454	483	259
39383	454	484	192
39384	454	485	226
39385	454	486	204
39386	454	487	219
39387	454	488	244
39388	454	489	305
39389	454	490	158
39390	454	491	168
39391	454	492	244
39392	455	456	52
39393	455	457	218
39394	455	458	224
39395	455	459	258
39396	455	460	278
39397	455	461	289
39398	455	462	312
39399	455	463	372
39400	455	464	392
39401	455	465	402
39402	455	466	368
39403	455	467	383
39404	455	468	297
39405	455	469	277
39406	455	470	198
39407	455	471	210
39408	455	472	213
39409	455	473	213
39410	455	474	218
39411	455	475	213
39412	455	476	218
39413	455	477	228
39414	455	478	247
39415	455	479	253
39416	455	480	245
39417	455	481	303
39418	455	482	268
39419	455	483	292
39420	455	484	225
39421	455	485	259
39422	455	486	237
39423	455	487	252
39424	455	488	277
39425	455	489	338
39426	455	490	122
39427	455	491	132
39428	455	492	277
39429	456	457	263
39430	456	458	269
39431	456	459	303
39432	456	460	323
39433	456	461	334
39434	456	462	357
39435	456	463	417
39436	456	464	437
39437	456	465	447
39438	456	466	413
39439	456	467	428
39440	456	468	342
39441	456	469	322
39442	456	470	243
39443	456	471	255
39444	456	472	258
39445	456	473	258
39446	456	474	263
39447	456	475	258
39448	456	476	263
39449	456	477	273
39450	456	478	292
39451	456	479	298
39452	456	480	290
39453	456	481	348
39454	456	482	313
39455	456	483	337
39456	456	484	270
39457	456	485	304
39458	456	486	282
39459	456	487	297
39460	456	488	322
39461	456	489	383
39462	456	490	70
39463	456	491	80
39464	456	492	322
39465	457	458	6
39466	457	459	40
39467	457	460	60
39468	457	461	60
39469	457	462	94
39470	457	463	154
39471	457	464	174
39472	457	465	184
39473	457	466	150
39474	457	467	165
39475	457	468	79
39476	457	469	59
39477	457	470	125
39478	457	471	137
39479	457	472	140
39480	457	473	140
39481	457	474	105
39482	457	475	140
39483	457	476	145
39484	457	477	155
39485	457	478	174
39486	457	479	180
39487	457	480	172
39488	457	481	64
39489	457	482	195
39490	457	483	219
39491	457	484	152
39492	457	485	186
39493	457	486	173
39494	457	487	188
39495	457	488	213
39496	457	489	274
39497	457	490	323
39498	457	491	338
39499	457	492	213
39500	458	459	46
39501	458	460	66
39502	458	461	66
39503	458	462	100
39504	458	463	160
39505	458	464	180
39506	458	465	190
39507	458	466	156
39508	458	467	171
39509	458	468	85
39510	458	469	65
39511	458	470	131
39512	458	471	143
39513	458	472	146
39514	458	473	146
39515	458	474	111
39516	458	475	146
39517	458	476	151
39518	458	477	161
39519	458	478	180
39520	458	479	186
39521	458	480	178
39522	458	481	70
39523	458	482	201
39524	458	483	225
39525	458	484	158
39526	458	485	192
39527	458	486	179
39528	458	487	194
39529	458	488	219
39530	458	489	280
39531	458	490	329
39532	458	491	344
39533	458	492	219
39534	459	460	100
39535	459	461	100
39536	459	462	134
39537	459	463	194
39538	459	464	214
39539	459	465	224
39540	459	466	190
39541	459	467	200
39542	459	468	119
39543	459	469	99
39544	459	470	165
39545	459	471	177
39546	459	472	180
39547	459	473	180
39548	459	474	145
39549	459	475	180
39550	459	476	185
39551	459	477	195
39552	459	478	214
39553	459	479	220
39554	459	480	212
39555	459	481	104
39556	459	482	235
39557	459	483	259
39558	459	484	192
39559	459	485	226
39560	459	486	133
39561	459	487	148
39562	459	488	173
39563	459	489	234
39564	459	490	283
39565	459	491	298
39566	459	492	173
39567	460	461	11
39568	460	462	34
39569	460	463	75
39570	460	464	95
39571	460	465	107
39572	460	466	90
39573	460	467	105
39574	460	468	55
39575	460	469	35
39576	460	470	293
39577	460	471	305
39578	460	472	317
39579	460	473	329
39580	460	474	341
39581	460	475	353
39582	460	476	365
39583	460	477	377
39584	460	478	389
39585	460	479	401
39586	460	480	413
39587	460	481	425
39588	460	482	437
39589	460	483	449
39590	460	484	461
39591	460	485	473
39592	460	486	233
39593	460	487	248
39594	460	488	273
39595	460	489	334
39596	460	490	383
39597	460	491	398
39598	460	492	273
39599	461	462	45
39600	461	463	86
39601	461	464	106
39602	461	465	118
39603	461	466	101
39604	461	467	116
39605	461	468	66
39606	461	469	46
39607	461	470	304
39608	461	471	316
39609	461	472	328
39610	461	473	340
39611	461	474	352
39612	461	475	364
39613	461	476	376
39614	461	477	388
39615	461	478	400
39616	461	479	412
39617	461	480	424
39618	461	481	436
39619	461	482	448
39620	461	483	460
39621	461	484	472
39622	461	485	484
39623	461	486	233
39624	461	487	248
39625	461	488	273
39626	461	489	334
39627	461	490	383
39628	461	491	398
39629	461	492	273
39630	462	463	41
39631	462	464	61
39632	462	465	73
39633	462	466	56
39634	462	467	71
39635	462	468	89
39636	462	469	69
39637	462	470	259
39638	462	471	271
39639	462	472	283
39640	462	473	295
39641	462	474	307
39642	462	475	319
39643	462	476	331
39644	462	477	343
39645	462	478	355
39646	462	479	367
39647	462	480	379
39648	462	481	391
39649	462	482	403
39650	462	483	415
39651	462	484	427
39652	462	485	439
39653	462	486	267
39654	462	487	282
39655	462	488	307
39656	462	489	368
39657	462	490	417
39658	462	491	432
39659	462	492	307
39660	463	464	20
39661	463	465	32
39662	463	466	25
39663	463	467	40
39664	463	468	130
39665	463	469	110
39666	463	470	228
39667	463	471	240
39668	463	472	252
39669	463	473	264
39670	463	474	276
39671	463	475	288
39672	463	476	300
39673	463	477	312
39674	463	478	324
39675	463	479	336
39676	463	480	348
39677	463	481	360
39678	463	482	372
39679	463	483	384
39680	463	484	396
39681	463	485	408
39682	463	486	327
39683	463	487	342
39684	463	488	367
39685	463	489	428
39686	463	490	477
39687	463	491	492
39688	463	492	367
39689	464	465	12
39690	464	466	45
39691	464	467	60
39692	464	468	150
39693	464	469	130
39694	464	470	248
39695	464	471	260
39696	464	472	272
39697	464	473	284
39698	464	474	296
39699	464	475	308
39700	464	476	320
39701	464	477	332
39702	464	478	344
39703	464	479	356
39704	464	480	368
39705	464	481	380
39706	464	482	392
39707	464	483	404
39708	464	484	416
39709	464	485	428
39710	464	486	347
39711	464	487	362
39712	464	488	387
39713	464	489	448
39714	464	490	497
39715	464	491	512
39716	464	492	387
39717	465	466	57
39718	465	467	72
39719	465	468	162
39720	465	469	142
39721	465	470	260
39722	465	471	272
39723	465	472	284
39724	465	473	296
39725	465	474	308
39726	465	475	320
39727	465	476	332
39728	465	477	344
39729	465	478	356
39730	465	479	368
39731	465	480	380
39732	465	481	392
39733	465	482	404
39734	465	483	416
39735	465	484	428
39736	465	485	440
39737	465	486	357
39738	465	487	372
39739	465	488	397
39740	465	489	458
39741	465	490	507
39742	465	491	522
39743	465	492	397
39744	466	467	15
39745	466	468	145
39746	466	469	125
39747	466	470	203
39748	466	471	215
39749	466	472	227
39750	466	473	239
39751	466	474	251
39752	466	475	263
39753	466	476	275
39754	466	477	287
39755	466	478	299
39756	466	479	311
39757	466	480	323
39758	466	481	335
39759	466	482	347
39760	466	483	359
39761	466	484	371
39762	466	485	383
39763	466	486	323
39764	466	487	338
39765	466	488	363
39766	466	489	424
39767	466	490	473
39768	466	491	488
39769	466	492	363
39770	467	468	160
39771	467	469	140
39772	467	470	188
39773	467	471	200
39774	467	472	212
39775	467	473	224
39776	467	474	236
39777	467	475	248
39778	467	476	260
39779	467	477	272
39780	467	478	284
39781	467	479	296
39782	467	480	308
39783	467	481	320
39784	467	482	332
39785	467	483	344
39786	467	484	356
39787	467	485	368
39788	467	486	338
39789	467	487	353
39790	467	488	378
39791	467	489	439
39792	467	490	488
39793	467	491	503
39794	467	492	378
39795	468	469	20
39796	468	470	204
39797	468	471	216
39798	468	472	219
39799	468	473	219
39800	468	474	184
39801	468	475	219
39802	468	476	224
39803	468	477	234
39804	468	478	253
39805	468	479	259
39806	468	480	251
39807	468	481	143
39808	468	482	274
39809	468	483	298
39810	468	484	231
39811	468	485	265
39812	468	486	252
39813	468	487	267
39814	468	488	292
39815	468	489	353
39816	468	490	402
39817	468	491	417
39818	468	492	292
39819	469	470	184
39820	469	471	196
39821	469	472	199
39822	469	473	199
39823	469	474	164
39824	469	475	199
39825	469	476	204
39826	469	477	214
39827	469	478	233
39828	469	479	239
39829	469	480	231
39830	469	481	123
39831	469	482	254
39832	469	483	278
39833	469	484	211
39834	469	485	245
39835	469	486	232
39836	469	487	247
39837	469	488	272
39838	469	489	333
39839	469	490	382
39840	469	491	397
39841	469	492	272
39842	470	471	12
39843	470	472	15
39844	470	473	15
39845	470	474	20
39846	470	475	15
39847	470	476	20
39848	470	477	30
39849	470	478	49
39850	470	479	55
39851	470	480	47
39852	470	481	105
39853	470	482	70
39854	470	483	94
39855	470	484	27
39856	470	485	61
39857	470	486	90
39858	470	487	105
39859	470	488	130
39860	470	489	191
39861	470	490	240
39862	470	491	255
39863	470	492	130
39864	471	472	6
39865	471	473	35
39866	471	474	25
39867	471	475	30
39868	471	476	30
39869	471	477	61
39870	471	478	67
39871	471	479	62
39872	471	480	120
39873	471	481	84
39874	471	482	108
39875	471	483	30
39876	471	484	73
39877	471	485	102
39878	471	486	117
39879	471	487	142
39880	471	488	203
39881	471	489	252
39882	471	490	267
39883	471	491	142
39884	472	473	38
39885	472	474	28
39886	472	475	33
39887	472	476	45
39888	472	477	64
39889	472	478	70
39890	472	479	65
39891	472	480	123
39892	472	481	87
39893	472	482	111
39894	472	483	33
39895	472	484	76
39896	472	485	105
39897	472	486	120
39898	472	487	145
39899	472	488	206
39900	472	489	255
39901	472	490	270
39902	472	491	145
39903	473	474	38
39904	473	475	28
39905	473	476	33
39906	473	477	45
39907	473	478	64
39908	473	479	70
39909	473	480	65
39910	473	481	123
39911	473	482	87
39912	473	483	111
39913	473	484	33
39914	473	485	76
39915	473	486	105
39916	473	487	120
39917	473	488	145
39918	473	489	206
39919	473	490	255
39920	473	491	270
39921	473	492	145
39922	474	475	35
39923	474	476	40
39924	474	477	50
39925	474	478	69
39926	474	479	75
39927	474	480	29
39928	474	481	85
39929	474	482	90
39930	474	483	114
39931	474	484	47
39932	474	485	81
39933	474	486	110
39934	474	487	125
39935	474	488	150
39936	474	489	211
39937	474	490	260
39938	474	491	275
39939	474	492	150
39940	475	476	6
39941	475	477	8
39942	475	478	27
39943	475	479	33
39944	475	480	62
39945	475	481	120
39946	475	482	84
39947	475	483	108
39948	475	484	14
39949	475	485	39
39950	475	486	105
39951	475	487	120
39952	475	488	145
39953	475	489	206
39954	475	490	255
39955	475	491	270
39956	475	492	145
39957	476	477	22
39958	476	478	41
39959	476	479	47
39960	476	480	67
39961	476	481	125
39962	476	482	90
39963	476	483	114
39964	476	484	20
39965	476	485	35
39966	476	486	110
39967	476	487	125
39968	476	488	150
39969	476	489	211
39970	476	490	260
39971	476	491	275
39972	476	492	150
39973	477	478	19
39974	477	479	25
39975	477	480	77
39976	477	481	135
39977	477	482	100
39978	477	483	124
39979	477	484	22
39980	477	485	31
39981	477	486	120
39982	477	487	135
39983	477	488	160
39984	477	489	221
39985	477	490	270
39986	477	491	285
39987	477	492	160
39988	478	479	6
39989	478	480	96
39990	478	481	154
39991	478	482	119
39992	478	483	143
39993	478	484	41
39994	478	485	12
39995	478	486	139
39996	478	487	154
39997	478	488	179
39998	478	489	240
39999	478	490	289
40000	478	491	304
40001	478	492	179
40002	479	480	102
40003	479	481	160
40004	479	482	125
40005	479	483	149
40006	479	484	47
40007	479	485	6
40008	479	486	145
40009	479	487	160
40010	479	488	185
40011	479	489	246
40012	479	490	295
40013	479	491	310
40014	479	492	185
40015	480	481	58
40016	480	482	117
40017	480	483	141
40018	480	484	74
40019	480	485	108
40020	480	486	137
40021	480	487	152
40022	480	488	177
40023	480	489	238
40024	480	490	287
40025	480	491	302
40026	480	492	177
40027	481	482	190
40028	481	483	214
40029	481	484	147
40030	481	485	181
40031	481	486	195
40032	481	487	210
40033	481	488	235
40034	481	489	296
40035	481	490	345
40036	481	491	360
40037	481	492	235
40038	482	483	24
40039	482	484	97
40040	482	485	131
40041	482	486	160
40042	482	487	175
40043	482	488	200
40044	482	489	261
40045	482	490	310
40046	482	491	325
40047	482	492	200
40048	483	484	121
40049	483	485	145
40050	483	486	184
40051	483	487	199
40052	483	488	224
40053	483	489	285
40054	483	490	334
40055	483	491	349
40056	483	492	224
40057	484	485	12
40058	484	486	117
40059	484	487	132
40060	484	488	157
40061	484	489	218
40062	484	490	267
40063	484	491	282
40064	484	492	157
40065	485	486	151
40066	485	487	166
40067	485	488	191
40068	485	489	252
40069	485	490	301
40070	485	491	316
40071	485	492	191
40072	486	487	15
40073	486	488	40
40074	486	489	101
40075	486	490	150
40076	486	491	165
40077	486	492	40
40078	487	488	35
40079	487	489	96
40080	487	490	145
40081	487	491	160
40082	487	492	55
40083	488	489	91
40084	488	490	140
40085	488	491	155
40086	488	492	80
40087	489	490	49
40088	489	491	64
40089	489	492	141
40090	490	491	15
40091	490	492	190
40092	491	492	205
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.notification (id, name, icon, days, priority, slug) FROM stdin;
21	Send to driver	email	10	1	send-to-driver
22	Accommodation in transfer	home	10	2	accommodation-in-transfer
23	Flight Data	flight_takeoff	10	3	flight-data
24	Sent to a Guide	send	15	4	sent-to-a-guide
25	Done	done	18	5	done
26	Asigned to Guide	how_to_reg	30	6	asigned-to-guide
27	Tour Extra	done_all	20	7	tour-extra
28	Internal Flights	flight	90	8	internal-flights
29	Include Activities	local_activity	16	9	include-activities
30	Transport	airport_shuttle	20	10	transport
\.


--
-- Data for Name: notification_service; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.notification_service (notification_id, service_id) FROM stdin;
21	15
22	15
23	15
24	14
24	13
25	14
25	13
26	14
26	13
27	14
28	14
29	14
30	14
\.


--
-- Data for Name: notification_tour; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.notification_tour (id, tour_id, notification_id, days, complete) FROM stdin;
1	1	24	15	\N
2	1	25	18	\N
3	1	26	30	\N
4	1	27	20	\N
5	1	28	90	\N
6	2	24	15	\N
7	2	25	18	\N
8	2	26	30	\N
9	2	27	20	\N
10	3	24	15	\N
11	3	25	18	\N
12	3	26	30	\N
13	3	27	20	\N
14	3	28	90	\N
15	4	24	15	\N
16	5	24	15	\N
17	5	25	18	\N
18	5	26	30	\N
19	5	27	20	\N
20	5	28	90	\N
21	6	24	15	\N
22	6	25	18	\N
23	6	26	30	\N
24	6	27	20	\N
25	6	28	90	\N
26	7	24	15	\N
27	8	24	15	\N
28	8	25	18	\N
29	8	26	30	\N
30	8	27	20	\N
31	9	24	15	\N
32	9	25	18	\N
33	10	24	15	\N
34	10	25	18	\N
35	11	24	15	\N
36	11	25	18	\N
37	11	26	30	\N
38	12	24	15	\N
39	12	25	18	\N
40	12	26	30	\N
41	13	24	15	\N
42	13	25	18	\N
43	13	26	30	\N
44	13	27	20	\N
45	14	24	15	\N
46	14	25	18	\N
47	14	26	30	\N
48	14	27	20	\N
49	15	24	15	\N
50	15	25	18	\N
51	15	26	30	\N
52	15	27	20	\N
53	16	24	15	\N
54	16	25	18	\N
55	17	24	15	\N
56	17	25	18	\N
57	17	26	30	\N
58	17	27	20	\N
59	18	24	15	\N
60	18	25	18	\N
61	18	26	30	\N
62	18	27	20	\N
63	19	24	15	\N
64	19	25	18	\N
65	19	26	30	\N
66	19	27	20	\N
67	19	28	90	\N
68	20	24	15	\N
69	20	25	18	\N
70	21	24	15	\N
71	21	25	18	\N
72	21	26	30	\N
73	21	27	20	\N
74	22	24	15	\N
75	22	25	18	\N
76	22	26	30	\N
77	23	24	15	\N
78	23	25	18	\N
79	23	26	30	\N
80	23	27	20	\N
81	24	24	15	\N
82	24	25	18	\N
83	24	26	30	\N
84	24	27	20	\N
85	25	24	15	\N
86	25	25	18	\N
87	25	26	30	\N
88	26	24	15	\N
89	26	25	18	\N
90	26	26	30	\N
91	26	27	20	\N
92	26	28	90	\N
93	27	24	15	\N
94	27	25	18	\N
95	28	24	15	\N
96	29	24	15	\N
97	29	25	18	\N
98	29	26	30	\N
99	29	27	20	\N
100	30	24	15	\N
101	31	24	15	\N
102	32	24	15	\N
103	32	25	18	\N
104	33	24	15	\N
105	34	24	15	\N
106	34	25	18	\N
107	34	26	30	\N
108	34	27	20	\N
109	35	24	15	\N
110	35	25	18	\N
111	36	24	15	\N
112	36	25	18	\N
113	37	24	15	\N
114	37	25	18	\N
115	37	26	30	\N
116	37	27	20	\N
117	38	24	15	\N
118	38	25	18	\N
119	38	26	30	\N
120	38	27	20	\N
121	38	28	90	\N
122	39	24	15	\N
123	39	25	18	\N
124	39	26	30	\N
125	39	27	20	\N
126	40	24	15	\N
127	41	24	15	\N
128	41	25	18	\N
129	41	26	30	\N
130	41	27	20	\N
131	42	24	15	\N
132	42	25	18	\N
133	42	26	30	\N
134	43	24	15	\N
135	43	25	18	\N
136	44	24	15	\N
137	44	25	18	\N
138	44	26	30	\N
139	44	27	20	\N
140	45	24	15	\N
141	45	25	18	\N
142	46	24	15	\N
143	46	25	18	\N
144	46	26	30	\N
145	46	27	20	\N
146	46	28	90	\N
147	47	24	15	\N
148	48	24	15	\N
149	48	25	18	\N
150	48	26	30	\N
151	49	24	15	\N
152	49	25	18	\N
153	49	26	30	\N
154	49	27	20	\N
155	50	24	15	\N
156	50	25	18	\N
157	50	26	30	\N
158	50	27	20	\N
159	51	24	15	\N
160	51	25	18	\N
161	51	26	30	\N
162	51	27	20	\N
163	52	24	15	\N
164	52	25	18	\N
165	52	26	30	\N
166	52	27	20	\N
167	52	28	90	\N
168	53	24	15	\N
169	53	25	18	\N
170	54	24	15	\N
171	54	25	18	\N
172	55	24	15	\N
173	55	25	18	\N
174	55	26	30	\N
175	55	27	20	\N
176	55	28	90	\N
177	56	24	15	\N
178	56	25	18	\N
179	56	26	30	\N
180	57	24	15	\N
181	57	25	18	\N
182	58	24	15	\N
183	59	24	15	\N
184	59	25	18	\N
185	60	24	15	\N
186	60	25	18	\N
\.


--
-- Data for Name: notification_tour_template; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.notification_tour_template (id, tour_template_id, notification_id, days) FROM stdin;
1	1	24	15
2	1	25	18
3	1	26	30
4	2	24	15
5	2	25	18
6	2	26	30
7	2	27	20
8	2	28	90
9	3	24	15
10	3	25	18
11	3	26	30
12	3	27	20
13	3	28	90
14	4	24	15
15	5	24	15
16	5	25	18
17	5	26	30
18	5	27	20
19	5	28	90
20	5	29	16
21	6	24	15
22	6	25	18
23	7	24	15
24	7	25	18
25	7	26	30
26	7	27	20
27	7	28	90
28	8	24	15
29	8	25	18
30	8	26	30
31	8	27	20
32	8	28	90
33	9	24	15
34	9	25	18
35	9	26	30
36	9	27	20
37	9	28	90
38	10	24	15
39	10	25	18
40	10	26	30
41	10	27	20
42	10	28	90
43	10	29	16
44	11	24	15
45	11	25	18
46	11	26	30
47	11	27	20
48	11	28	90
49	12	24	15
50	12	25	18
51	13	24	15
52	13	25	18
53	13	26	30
54	13	27	20
55	13	28	90
56	13	29	16
57	14	24	15
58	15	24	15
59	15	25	18
60	15	26	30
61	15	27	20
62	15	28	90
63	16	24	15
64	16	25	18
65	16	26	30
66	16	27	20
67	16	28	90
68	17	24	15
69	17	25	18
70	17	26	30
71	17	27	20
72	17	28	90
73	17	29	16
74	18	24	15
75	18	25	18
76	18	26	30
77	18	27	20
78	18	28	90
79	19	24	15
80	19	25	18
81	20	24	15
82	20	25	18
83	20	26	30
84	21	24	15
85	21	25	18
86	21	26	30
87	21	27	20
88	21	28	90
89	22	24	15
90	22	25	18
91	22	26	30
92	22	27	20
93	22	28	90
94	23	24	15
95	23	25	18
96	23	26	30
97	23	27	20
98	23	28	90
99	24	24	15
100	24	25	18
101	24	26	30
102	24	27	20
103	24	28	90
104	24	29	16
105	25	24	15
106	25	25	18
107	25	26	30
108	25	27	20
109	25	28	90
110	25	29	16
111	26	24	15
112	26	25	18
113	26	26	30
114	27	24	15
115	27	25	18
116	27	26	30
117	27	27	20
118	27	28	90
119	27	29	16
120	28	24	15
121	28	25	18
122	28	26	30
123	28	27	20
124	28	28	90
125	29	24	15
126	29	25	18
127	29	26	30
128	29	27	20
129	29	28	90
130	30	24	15
131	30	25	18
132	30	26	30
133	30	27	20
134	30	28	90
135	31	24	15
136	31	25	18
137	31	26	30
138	31	27	20
139	31	28	90
140	32	24	15
141	33	24	15
142	33	25	18
143	34	24	15
144	34	25	18
145	35	24	15
146	35	25	18
147	36	24	15
148	36	25	18
149	36	26	30
150	36	27	20
151	36	28	90
152	36	29	16
153	37	24	15
154	37	25	18
155	37	26	30
156	37	27	20
157	37	28	90
158	37	29	16
159	38	24	15
160	38	25	18
161	39	24	15
162	39	25	18
163	40	24	15
164	40	25	18
165	40	26	30
166	40	27	20
167	40	28	90
168	40	29	16
\.


--
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.province (id, name) FROM stdin;
33	Pinar del Río
34	Artemisa
35	La Habana
36	Mayabeque
37	Matanzas
38	Cienfuegos
39	Villa Clara
40	Sancti Spíritus
41	Ciego de Ávila
42	Camagüey
43	Las Tunas
44	Granma
45	Holguín
46	Santiago de Cuba
47	Guantánamo
48	Isla de la Juventud
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.service (id, name, code, days_to_show) FROM stdin;
13	HTC Tours	htc	20
14	LS Tours	ls	20
15	Transfer	transfer	20
16	HTC Tours	htc	20
17	LS Tour	ls	20
18	Transfer	transfer	20
\.


--
-- Data for Name: sleeping_requirement; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.sleeping_requirement (id, accommodation_type_id, description) FROM stdin;
\.


--
-- Data for Name: srroom_type; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.srroom_type (id, room_type_id, sleeping_requirement_id, cant) FROM stdin;
\.


--
-- Data for Name: tour; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.tour (id, guide_id, transfer_in_id, transfer_out_id, transportation_id, house_type_id, template_id, service_id, code, guide_wage, color, start_place, finish_place, description, bonus, days, start_day, agent, start_date, canceled, name, end_date) FROM stdin;
1	107	46	47	8	10	27	14	LS140822VH	9	#6d2b47	\N	\N	Temporealiquideosharumqui.Explicaboliberodistinctiofugaautem.	14	8	2	f	2022-08-14 12:04:43	\N	Aperiamrerumafaceredelenitiperspiciatisdeseruntid.	2022-08-23 12:04:43
2	82	57	51	16	10	3	14	LS020822OZ-A	5	#ca678b	\N	\N	Perspiciatisofficiadebitisnostrumquineque.Sedliberoeasitsequi.Perspiciatispossimusmolestiaesimiliquequis.	13	8	4	t	2022-08-02 12:04:43	\N	Voluptatesquisquamaut.	2022-08-11 12:04:43
3	83	46	53	40	11	40	14	LS230722GG	15	#d68278	\N	\N	Natusrerumoditiure.Aliquiddolorestenetursequi.Voluptatumutdoloresvelitmolestiaeducimusidtotam.	7	8	1	f	2022-07-23 12:04:43	\N	Pariatursedautaddolor.	2022-08-01 12:04:43
4	111	\N	\N	\N	\N	32	13	HTC250722LF	\N	#7a8b79	984 Broderick Gardens Suite 434\nEast Darrick, RI 63576	630 Madelyn Walk Suite 854\nPort Aliyah, DC 34595-2629	Molestiaedoloribusdoloresesseeosutamet.Numquamfugaporronesciunteaplaceatdoloromnis.Eiusofficialaboriosamnonasperiorestemporeoptio.Isterationererumidutesteosarchitecto.Delectussaepeeligendiculpaaliquidquod.	\N	1	\N	f	2022-07-25 12:04:44	\N	Vitaeeum.	\N
5	116	53	47	34	9	24	14	LS150822DZ-A	9	#222a9f	\N	\N	Estilloutlaudantiumetcorporisvoluptatumconsequaturvel.Iuremagnamhicsaepearchitectoasperioresquosillo.Namveniametfugitquasatque.	15	6	1	t	2022-08-15 12:04:44	\N	Estculpavoluptassed.	2022-08-22 12:04:44
6	83	54	46	28	10	36	14	LS130822WW-A	8	#4f6454	\N	\N	Doloremrerumeosadquaeconsequatur.Culpaquimaioressimiliqueblanditiisquasi.Molestiaeetquianoneumanimi.Estnemopariatursuscipit.	6	10	3	t	2022-08-13 12:04:44	\N	Utipsummodipariatur.	2022-08-24 12:04:44
7	116	\N	\N	\N	\N	32	13	HTC010822LF	\N	#7a8b79	984 Broderick Gardens Suite 434\nEast Darrick, RI 63576	630 Madelyn Walk Suite 854\nPort Aliyah, DC 34595-2629	Dignissimoshicveniamcupiditatefacere.Estmollitiarecusandaeveroinciduntadipisci.Molestiaeodioconsecteturducimusquodetdeseruntitaque.Architectoveroodioreiciendisquasiillo.	\N	1	\N	f	2022-08-01 12:04:44	\N	Vitaeeum.	\N
8	85	39	41	39	10	3	14	LS130822OZ-A	9	#ca678b	\N	\N	Nullarerumrepellatmodiin.Corruptieosetexnondolor.Evenietaspernaturautrerumdoloresvellaborum.	8	15	1	t	2022-08-13 12:04:44	\N	Voluptatesquisquamaut.	2022-08-29 12:04:44
9	103	\N	\N	\N	\N	39	13	HTC250722KO	\N	#e5967f	7913 Zackary Wells Apt. 659\nAndersonmouth, ME 98639	566 Tyrel Fall Suite 327\nMrazstad, SC 63669-7614	Consecteturdignissimosetdoloresuntcumexcepturi.Voluptasperspiciatisrerumdoloresrerumad.Officiisanimidoloremqueutsequi.	\N	1	\N	f	2022-07-25 12:04:44	\N	Debitisrepudiandaeetdeseruntconsequuntur.	\N
10	89	\N	\N	\N	\N	35	13	HTC230722SA-A	\N	#b373c0	525 Muller Viaduct Apt. 301\nTaraville, CT 57953-4229	4327 Patrick Plains Suite 789\nAbigailtown, TX 26318	Rationeautenimnamreiciendissedofficiisdolorperspiciatis.Nobisfacerequossuscipitvoluptatesquisdelectusexercitationem.Quidemvoluptatibusquiullamconsectetursed.Cumutmaximenumquamesteaqueomnisomnis.Voluptatemquossequiarepudiandaeestmodi.	\N	1	\N	t	2022-07-23 12:04:44	\N	Molestiaeprovident.	\N
11	96	\N	\N	\N	\N	26	13	HTC110822DR-A	\N	#ca3b40	464 Kuphal Place Suite 966\nLake Jordan, NV 79820	22959 Pearline Bypass\nPort Hannamouth, HI 92172	Doloreexplicaboquiconsequaturfacilissequi.Rerumvoluptateearumlaboriosamvoluptateevenietadipiscicorporiseum.Veromodierrorillonihilrepudiandaeetvoluptatem.Sequirecusandaealiquamvoluptas.	\N	1	\N	t	2022-08-11 12:04:44	\N	Voluptatenumquamrationesequiesse.	\N
12	115	\N	\N	\N	\N	26	13	HTC040822DR-A	\N	#ca3b40	464 Kuphal Place Suite 966\nLake Jordan, NV 79820	22959 Pearline Bypass\nPort Hannamouth, HI 92172	Ducimusreiciendisofficiiseiusvoluptasdoloremarchitectoquaeratreprehenderit.Eumidexvoluptastemporaharumutadexercitationem.Voluptatemsitrepellendusinquas.	\N	1	\N	t	2022-08-04 12:04:44	\N	Voluptatenumquamrationesequiesse.	\N
13	118	56	46	14	12	23	14	LS100822AY	9	#234a5e	\N	\N	Repellendusdelenitietutquiomnis.Explicaboaliquamquisquamoptioetetexcepturidolorem.Etdoloremvoluptatemquamnamtotamestrepellatsint.Etaliquidaperiamfacerelaboreeligendimagniet.Voluptateseummagnialiquidodio.	7	6	3	f	2022-08-10 12:04:44	\N	Dolorimpeditaut.	2022-08-17 12:04:44
14	89	57	50	28	9	7	14	LS040822LV-A	11	#54c4f5	\N	\N	Reiciendisillumoditquodictaasperioresdistinctiohicimpedit.Perferendisvoluptatesetnatussitautemdolorequi.Utsedvelitquaeratomnisconsecteturaasperiores.Facilisbeataeconsequaturminuscorporissunt.	8	15	6	t	2022-08-04 12:04:44	\N	Inciduntutexcepturicumeos.	2022-08-20 12:04:44
15	120	49	39	15	11	23	14	LS070822AY	10	#234a5e	\N	\N	Illumerrorvoluptatumvoluptatenecessitatibusquidemnonsunt.Suscipitconsequaturdoloresporropraesentium.Saepeipsamanimirecusandae.Officiisevenietcumasperioresaut.	7	20	7	f	2022-08-07 12:04:44	\N	Dolorimpeditaut.	2022-08-28 12:04:44
16	92	\N	\N	\N	\N	35	13	HTC070822SA	\N	#b373c0	525 Muller Viaduct Apt. 301\nTaraville, CT 57953-4229	4327 Patrick Plains Suite 789\nAbigailtown, TX 26318	Quiseosilloautplaceatrecusandaetemporaeum.Necessitatibusoditplaceateumquisquambeataeestsed.Doloremomnisipsameumomnis.	\N	1	\N	f	2022-08-07 12:04:44	\N	Molestiaeprovident.	\N
17	106	50	48	1	12	31	14	LS020822GS	8	#39e945	\N	\N	Ducimusiddolormagniipsaipsaculpanihil.Aperiameligendieavoluptatemdelenitireiciendisquisint.Suscipitquosnisiinventoreperferendis.Minimasapienteutvelconsequaturconsequaturdebitissimiliqueet.	7	8	4	f	2022-08-02 12:04:45	\N	Aperiamofficia.	2022-08-11 12:04:45
18	85	41	48	8	9	31	14	LS130822GS	7	#39e945	\N	\N	Natusoditadipiscilaborum.Ullaminventoreetabmollitia.Harumconsequaturidofficiamolestiae.	6	10	3	f	2022-08-13 12:04:45	\N	Aperiamofficia.	2022-08-24 12:04:45
19	81	46	53	23	10	40	14	LS300722GG	12	#d68278	\N	\N	Architectocorporisrerumautinminus.Nullanecessitatibusquoest.	8	20	6	f	2022-07-30 12:04:45	\N	Pariatursedautaddolor.	2022-08-20 12:04:45
20	88	\N	\N	\N	\N	19	13	HTC290722PQ-A	\N	#688161	99476 River Via\nSouth Wilmahaven, OK 65014-6860	10391 Fadel Brook Apt. 560\nPort Agustinaport, OR 61442	Quibusdamcumnihilnulla.Etiuretemporaipsaharumquispariaturreiciendis.Cupiditateconsequaturlaudantiumvelcupiditatecupiditateimpedit.Laboreeumimpeditdistinctioquaevitaesintquia.	\N	1	\N	t	2022-07-29 12:04:45	\N	Reprehenderitsuntnumquamessecumquemolestiae.	\N
21	109	52	49	9	12	15	14	LS300722UT	14	#8efde4	\N	\N	Adconsequaturillumlaudantiumoccaecati.Atatomniscupiditateiustoquam.Quisdoloredelectusaliquametesseipsaullam.Cumodiovoluptatemaliquamsed.	6	6	6	f	2022-07-30 12:04:45	\N	Quiavoluptassit.	2022-08-06 12:04:45
22	112	\N	\N	\N	\N	1	13	HTC010822LC-A	\N	#33853d	32110 Brenden Stravenue Apt. 346\nKarenmouth, GA 78489-5029	452 Goodwin Meadows\nLake Andre, CT 85567-4795	Magnicupiditateeumquiaea.Voluptaseumetrerumexcepturiautemtemporibus.Voluptassintdistinctioidverononquiadolorem.Ututeligenditemporesuntilloprovidentquae.	\N	1	\N	t	2022-08-01 12:04:45	\N	Molestiaequoverofacilis.	\N
23	83	54	52	37	9	28	14	LS030822SQ-A	14	#863eb5	\N	\N	Laboreconsequaturquisexpeditadoloresrecusandae.Quomaioresvoluptatibusteneturnesciuntquosplaceatex.Doloribusipsamdolorenemoculpaineaimpedit.Officianonrerumexcepturipraesentium.	7	20	3	t	2022-08-03 12:04:45	\N	Utsitut.	2022-08-24 12:04:45
24	110	45	45	1	12	28	14	LS030822SQ-A-2	9	#863eb5	\N	\N	Quibusdamdebitiseligendimaximeremnihilquas.Sitsequilaudantiumetvitaemodiconsequaturnulla.Voluptasetestremnemodolormolestias.Autemofficiavoluptatesanimiquisquamtempora.	14	6	3	t	2022-08-03 12:04:45	\N	Utsitut.	2022-08-10 12:04:45
25	107	\N	\N	\N	\N	26	13	HTC200722DR-A	\N	#ca3b40	464 Kuphal Place Suite 966\nLake Jordan, NV 79820	22959 Pearline Bypass\nPort Hannamouth, HI 92172	Nisiipsumquiut.Nullafugiatconsequaturtemporaquia.Inventoreipsaetquisexercitationem.	\N	1	\N	t	2022-07-20 12:04:45	\N	Voluptatenumquamrationesequiesse.	\N
26	82	45	53	35	12	24	14	LS110822DZ	13	#222a9f	\N	\N	Iureerroradipiscidelectusomnis.Nihilsaepeestvoluptasinquiacupiditate.Utquinecessitatibusaccusamushicomnisquisdelectus.Nihililloaperiamnostrumexpedita.	11	8	6	f	2022-08-11 12:04:45	\N	Estculpavoluptassed.	2022-08-20 12:04:45
27	111	\N	\N	\N	\N	38	13	HTC080822DV	\N	#0de74e	747 Haley Summit\nLake Donna, ID 39997	4023 Colten Falls\nKristoferside, MA 02255-2293	Veritatisveritatisnobisetnulla.Consecteturveldoloresveroasperioresomniseanullanostrum.Voluptasperferendisconsequunturrecusandaepariatur.Optioveroquianihilquasimagnidoloremvoluptatemprovident.	\N	1	\N	f	2022-08-08 12:04:45	\N	Itaquetemporibusveritatisofficiaet.	\N
28	117	\N	\N	\N	\N	4	13	HTC220722WA-A	\N	#c9a53c	861 Amy Corners Apt. 147\nNorth Robb, CT 40687	279 Alyson Hills\nLanechester, WA 89016	Doloremvelitutblanditiisquiaexpeditaeligendidolorem.Sintdoloremquodexipsa.Minusveniamhicaniminullaeumrepellendusfacilisrem.	\N	1	\N	t	2022-07-22 12:04:46	\N	Omniseumetvoluptates.	\N
29	93	55	49	16	10	22	14	LS090822US-A	8	#323a76	\N	\N	Estsunterrordeseruntnesciuntadipisciexcepturi.Doloremquevoluptatemexarchitectomolestiaeveladipisci.Odiolaboriosamnemoillumveniamvoluptashic.	15	8	4	t	2022-08-09 12:04:46	\N	Quovoluptas.	2022-08-18 12:04:46
30	95	\N	\N	\N	\N	4	13	HTC150822WA-A	\N	#c9a53c	861 Amy Corners Apt. 147\nNorth Robb, CT 40687	279 Alyson Hills\nLanechester, WA 89016	Recusandaeomnisexercitationemsedmagnisequiconsequuntur.Voluptatereprehenderitcumquequisremtenetur.Ullamestilloreiciendisofficiiseanostrum.Temporanihildoloresporroullam.Sequivoluptasasperioresperferendissaepedeserunt.	\N	1	\N	t	2022-08-15 12:04:46	\N	Omniseumetvoluptates.	\N
31	82	\N	\N	\N	\N	14	13	HTC290722ZD	\N	#db7e3c	93158 Alayna Neck\nAbshireport, MN 37119-1819	990 Phyllis Grove Suite 522\nJohannamouth, UT 97858-2527	Impeditconsequaturconsequaturquaeratnonetquicommodipraesentium.Velteneturvoluptatesesse.Aliquidadipisciexercitationemrepudiandaelaboriosamassumendaautipsamaccusamus.Aliquidsaepeaccusantiumquodolordoloresautem.	\N	1	\N	f	2022-07-29 12:04:46	\N	Voluptateslaudantiumexercitationemexplicabo.	\N
32	88	\N	\N	\N	\N	19	13	HTC240722PQ	\N	#688161	99476 River Via\nSouth Wilmahaven, OK 65014-6860	10391 Fadel Brook Apt. 560\nPort Agustinaport, OR 61442	Quofugiatsolutasintsuntnondolores.Atquemagnamutiustoconsequuntursolutaautdebitis.Quibusdamquieumlaudantiumalias.Aututharumcorruptinonnihillaborumvoluptatibussint.	\N	1	\N	f	2022-07-24 12:04:46	\N	Reprehenderitsuntnumquamessecumquemolestiae.	\N
33	94	\N	\N	\N	\N	32	13	HTC020822LF-A	\N	#7a8b79	984 Broderick Gardens Suite 434\nEast Darrick, RI 63576	630 Madelyn Walk Suite 854\nPort Aliyah, DC 34595-2629	Idsaepefugavoluptatemutvoluptatumsedveniamet.Laboreutquodsunt.Oditcumfugiterrornequeinventoreetconsequatur.	\N	1	\N	t	2022-08-02 12:04:46	\N	Vitaeeum.	\N
34	115	49	45	7	9	16	14	LS220722QH-A	6	#09e2f1	\N	\N	Quoexplicabofacilismolestiaeetasperiores.Veniamculpafugitquodrepellatquibusdamea.Nihilquisquamsitconsequunturet.	15	6	5	t	2022-07-22 12:04:46	\N	Natusdolores.	2022-07-29 12:04:46
35	110	\N	\N	\N	\N	39	13	HTC010822KO	\N	#e5967f	7913 Zackary Wells Apt. 659\nAndersonmouth, ME 98639	566 Tyrel Fall Suite 327\nMrazstad, SC 63669-7614	Sintnamtemporeidminima.Saepedoloresdoloremquevoluptatemmagniquirerum.Molestiascumqueculpaquaeratet.Reiciendiseossuntillocommodianimi.	\N	1	\N	f	2022-08-01 12:04:46	\N	Debitisrepudiandaeetdeseruntconsequuntur.	\N
36	106	\N	\N	\N	\N	19	13	HTC180822PQ	\N	#688161	99476 River Via\nSouth Wilmahaven, OK 65014-6860	10391 Fadel Brook Apt. 560\nPort Agustinaport, OR 61442	Quirepellatinnesciuntrerumquissuscipitqui.Voluptatemipsumquibusdamnobisreprehenderit.Aliquamestsitincidunt.	\N	1	\N	f	2022-08-18 12:04:47	\N	Reprehenderitsuntnumquamessecumquemolestiae.	\N
37	94	49	53	21	10	29	14	LS020822RR-A	8	#e50384	\N	\N	Sitdelenitiquiapariaturlaboriosamvero.Etesteligendianimi.Oditestetdelectusrerum.Sequiquasilloquiadalias.	12	20	2	t	2022-08-02 12:04:47	\N	Quosindoloraliquidfugit.	2022-08-23 12:04:47
38	103	44	48	36	9	27	14	LS240722VH-A	6	#6d2b47	\N	\N	Dolorumvoluptatumetmaximeveltemporenemoquis.Magnamfacilisconsequaturquidemsintadipisciqui.Minusenimaccusantiumeumexfugitverotempore.Exvoluptatibussaepeaccusamusutreprehenderitnequeetab.	8	10	4	t	2022-07-24 12:04:47	\N	Aperiamrerumafaceredelenitiperspiciatisdeseruntid.	2022-08-04 12:04:47
39	104	49	45	22	11	2	14	LS150822NA	10	#70e5df	\N	\N	Occaecatiquasiutdebitisdoloremdistinctioetarchitecto.Inventoreodioaliquamtemporahicporroamet.Ametfugiatquievenietquaeratsapienteeligendidolorumut.	13	10	5	f	2022-08-15 12:04:47	\N	Earerumipsaaut.	2022-08-26 12:04:47
40	117	\N	\N	\N	\N	4	13	HTC230722WA-A	\N	#c9a53c	861 Amy Corners Apt. 147\nNorth Robb, CT 40687	279 Alyson Hills\nLanechester, WA 89016	Facereodiominusexneque.Quasinonsitconsequunturquiinut.Undesedquaerattotaminvitaeetquo.	\N	1	\N	t	2022-07-23 12:04:47	\N	Omniseumetvoluptates.	\N
41	106	57	55	36	9	30	14	LS270722RJ-A	12	#9c83e7	\N	\N	Distinctiodoloremquidemeainsequi.Evenietrerumvoluptasquisab.Omnisquiseumveromolestiae.Pariaturmolestiaevoluptatemestestneque.	8	10	7	t	2022-07-27 12:04:47	\N	Pariaturprovident.	2022-08-07 12:04:47
42	112	\N	\N	\N	\N	1	13	HTC080822LC-A	\N	#33853d	32110 Brenden Stravenue Apt. 346\nKarenmouth, GA 78489-5029	452 Goodwin Meadows\nLake Andre, CT 85567-4795	Veritatismolestiaeseddoloremaututsequiullam.Utvitaequaeullametoptiooditquidem.Rerumquamnonmolestiaenemoipsa.	\N	1	\N	t	2022-08-08 12:04:48	\N	Molestiaequoverofacilis.	\N
43	116	\N	\N	\N	\N	6	13	HTC310722BX-A	\N	#a249ef	214 Kennedi Brook Apt. 859\nNorth Kenchester, DE 32468-1053	93595 Dandre Way\nKilbackville, OR 05212-1626	Eosutsintrerummodi.Dignissimosquidemsuntdolorumdolorquodcommodi.Voluptatemnatusestvoluptateetetvel.Itaquedistinctioquiprovident.	\N	1	\N	t	2022-07-31 12:04:48	\N	Officiaeafugasunt.	\N
44	108	54	44	5	11	28	14	LS240722SQ	12	#863eb5	\N	\N	Suntsintminimaveritatisutquiblanditiis.Eumsimiliqueteneturvoluptatemesseiustoet.Dictadoloremesseconsequaturquisexsuscipit.Illumnisietsunthic.	6	20	7	f	2022-07-24 12:04:48	\N	Utsitut.	2022-08-14 12:04:48
45	90	\N	\N	\N	\N	35	13	HTC070822SA-2	\N	#b373c0	525 Muller Viaduct Apt. 301\nTaraville, CT 57953-4229	4327 Patrick Plains Suite 789\nAbigailtown, TX 26318	Perspiciatiseoseumsintcumquenon.Quioccaecatisitomnisexcumqueitaque.Doloremeaodiovoluptatesquaerat.	\N	1	\N	f	2022-08-07 12:04:48	\N	Molestiaeprovident.	\N
46	112	51	57	22	12	36	14	LS030822WW	9	#4f6454	\N	\N	Facereveniamdolorquietofficiis.Quidelenitioditharumoccaecati.	12	10	7	f	2022-08-03 12:04:48	\N	Utipsummodipariatur.	2022-08-14 12:04:48
47	119	\N	\N	\N	\N	32	13	HTC010822LF-A	\N	#7a8b79	984 Broderick Gardens Suite 434\nEast Darrick, RI 63576	630 Madelyn Walk Suite 854\nPort Aliyah, DC 34595-2629	Voluptatemrepudiandaeteneturutipsumoccaecatiminimadolor.Providentquisquamquosuntvitaererum.Voluptasametetdeseruntquirepellendusautemqui.Estetautemquaeratex.	\N	1	\N	t	2022-08-01 12:04:48	\N	Vitaeeum.	\N
48	93	\N	\N	\N	\N	26	13	HTC070822DR	\N	#ca3b40	464 Kuphal Place Suite 966\nLake Jordan, NV 79820	22959 Pearline Bypass\nPort Hannamouth, HI 92172	Utsitinventoreexplicaboquaeratvitae.Utoccaecatiautemautnumquamsunt.Utvoluptatemperspiciatisconsecteturaliasnequeconsequatur.	\N	1	\N	f	2022-08-07 12:04:48	\N	Voluptatenumquamrationesequiesse.	\N
49	110	49	39	5	9	9	14	LS210722ET-A	14	#53dd34	\N	\N	Rerumlaudantiumetomnis.Suscipittenetursimiliquequamaccusamusexercitationemillum.	11	6	4	t	2022-07-21 12:04:48	\N	Quisquammolestiaequodet.	2022-07-28 12:04:48
50	100	40	48	20	11	29	14	LS190822RR	12	#e50384	\N	\N	Ipsaliberovoluptaslaborequibusdam.Corporisnambeataedelenitidelectusaliquamestquo.Velitipsamipsumamollitiasequiquiasit.	15	8	7	f	2022-08-19 12:04:49	\N	Quosindoloraliquidfugit.	2022-08-28 12:04:49
51	110	40	42	25	10	9	14	LS010822ET-A	6	#53dd34	\N	\N	Suntutremminusconsequatur.Quiateneturnonvoluptatemnumquamab.Suscipititaquelaboreexcepturiofficiaconsequaturrationeet.Quodoloremdoloremqueperspiciatislaboriosamrepellat.	13	8	3	t	2022-08-01 12:04:49	\N	Quisquammolestiaequodet.	2022-08-10 12:04:49
52	99	42	44	4	12	13	14	LS170822OS	15	#131757	\N	\N	Etquamquiitaqueanatusimpeditquia.Veroundebeataealiasipsummaximeplaceat.Autquiaanimidoloresaccusamus.Optiofacilisevenietnam.	12	8	5	f	2022-08-17 12:04:49	\N	Omnisaccusamusvoluptatemvelit.	2022-08-26 12:04:49
53	104	\N	\N	\N	\N	38	13	HTC190822DV	\N	#0de74e	747 Haley Summit\nLake Donna, ID 39997	4023 Colten Falls\nKristoferside, MA 02255-2293	Dolorumsapientesequiquidebitisreiciendisquiaenim.Natusquidemquisquamducimussapientequod.Eosperferendisutetrerumundetemporerepellendus.	\N	1	\N	f	2022-08-19 12:04:49	\N	Itaquetemporibusveritatisofficiaet.	\N
54	92	\N	\N	\N	\N	6	13	HTC260722BX	\N	#a249ef	214 Kennedi Brook Apt. 859\nNorth Kenchester, DE 32468-1053	93595 Dandre Way\nKilbackville, OR 05212-1626	Perspiciatisetmaximeadipiscialiquamsed.Voluptatemidminusipsamliberosapienteharumporrototam.Doloreblanditiispossimusremconsequaturnihil.Totamvoluptatemrepellatliberoremutquisquam.	\N	1	\N	f	2022-07-26 12:04:49	\N	Officiaeafugasunt.	\N
55	81	50	39	16	10	10	14	LS040822TY	9	#45cbfa	\N	\N	Rerumautconsecteturaliasut.Architectoautestaccusamusnihildoloresesse.Autoditaliquamenim.	6	10	1	f	2022-08-04 12:04:49	\N	Omnissequiutautaut.	2022-08-15 12:04:49
56	105	\N	\N	\N	\N	1	13	HTC030822LC	\N	#33853d	32110 Brenden Stravenue Apt. 346\nKarenmouth, GA 78489-5029	452 Goodwin Meadows\nLake Andre, CT 85567-4795	Aspernatursequirepudiandaeconsequunturmolestiasquiutbeatae.Repudiandaedoloremetidautemquia.Minuseadolorumquiblanditiispossimus.Illosuscipitnobismolestiaesimiliquealiasvoluptatem.Quiteneturhicquidemrepudiandaeveniam.	\N	1	\N	f	2022-08-03 12:04:49	\N	Molestiaequoverofacilis.	\N
57	95	\N	\N	\N	\N	33	13	HTC230722EJ	\N	#47c567	89143 Wolff Flats Apt. 179\nRomabury, NV 61790	085 Van Creek\nFrancescobury, NV 28645-5437	Occaecatireiciendisabaut.Estvelconsecteturquiaarchitecto.Veritatisquiaplaceatquiquodaccusamus.	\N	1	\N	f	2022-07-23 12:04:49	\N	Itaqueutexercitationemet.	\N
58	94	\N	\N	\N	\N	4	13	HTC140822WA-A	\N	#c9a53c	861 Amy Corners Apt. 147\nNorth Robb, CT 40687	279 Alyson Hills\nLanechester, WA 89016	Rerumaddistinctiosolutadeleniti.Aliquamvoluptasperferendisexplicaboeos.Aliasipsamnostrumdictaillo.Nostrumquianumquamomnis.	\N	1	\N	t	2022-08-14 12:04:50	\N	Omniseumetvoluptates.	\N
59	119	\N	\N	\N	\N	38	13	HTC130822DV	\N	#0de74e	747 Haley Summit\nLake Donna, ID 39997	4023 Colten Falls\nKristoferside, MA 02255-2293	Debitisprovidentevenietsedassumendaremmolestiaerem.Nonnatusetutcumquosfacilis.Placeatundeundedolorvoluptatemveritatis.Consequaturutadipiscisedvoluptatumrerum.	\N	1	\N	f	2022-08-13 12:04:50	\N	Itaquetemporibusveritatisofficiaet.	\N
60	119	\N	\N	\N	\N	38	13	HTC270722DV-A	\N	#0de74e	747 Haley Summit\nLake Donna, ID 39997	4023 Colten Falls\nKristoferside, MA 02255-2293	Etfacilissedrecusandaemagni.Repellatestdoloresquosnequevoluptaslaudantium.Sitquonatusliberoinventoreasperioresdoloresquo.	\N	1	\N	t	2022-07-27 12:04:50	\N	Itaquetemporibusveritatisofficiaet.	\N
\.


--
-- Data for Name: tour_activity; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.tour_activity (tour_id, activity_id) FROM stdin;
4	25
4	34
4	44
4	74
4	75
4	101
4	111
7	25
7	34
7	44
7	74
7	75
7	101
7	111
9	3
9	15
9	17
9	24
9	28
9	34
9	53
9	54
9	60
9	62
9	88
9	90
9	94
9	99
9	100
9	107
9	117
9	131
9	132
9	133
10	25
10	26
10	30
10	39
10	60
10	68
10	77
10	79
10	88
10	97
10	108
10	124
10	134
11	19
11	24
11	31
11	38
11	55
11	65
11	80
11	82
11	90
11	98
11	99
11	100
11	107
11	108
11	117
11	118
11	122
11	126
11	137
12	19
12	24
12	31
12	38
12	55
12	65
12	80
12	82
12	90
12	98
12	99
12	100
12	107
12	108
12	117
12	118
12	122
12	126
12	137
16	25
16	26
16	30
16	39
16	60
16	68
16	77
16	79
16	88
16	97
16	108
16	124
16	134
20	2
20	30
20	65
20	90
20	105
20	111
20	114
20	133
22	2
22	33
22	39
22	43
22	50
22	55
22	56
22	57
22	62
22	63
22	65
22	79
22	85
22	99
22	101
22	114
22	121
22	126
22	131
22	134
22	139
25	19
25	24
25	31
25	38
25	55
25	65
25	80
25	82
25	90
25	98
25	99
25	100
25	107
25	108
25	117
25	118
25	122
25	126
25	137
27	3
27	16
27	17
27	20
27	23
27	27
27	32
27	35
27	45
27	49
27	67
27	76
27	113
28	5
28	17
28	19
28	28
28	37
28	49
28	89
28	96
28	101
28	113
28	116
28	121
28	123
28	130
28	138
30	5
30	17
30	19
30	28
30	37
30	49
30	89
30	96
30	101
30	113
30	116
30	121
30	123
30	130
30	138
31	5
31	13
31	21
31	22
31	23
31	25
31	33
31	41
31	51
31	67
31	74
31	78
31	81
31	91
31	95
31	103
31	109
31	117
32	2
32	30
32	65
32	90
32	105
32	111
32	114
32	133
33	25
33	34
33	44
33	74
33	75
33	101
33	111
35	3
35	15
35	17
35	24
35	28
35	34
35	53
35	54
35	60
35	62
35	88
35	90
35	94
35	99
35	100
35	107
35	117
35	131
35	132
35	133
36	2
36	30
36	65
36	90
36	105
36	111
36	114
36	133
40	5
40	17
40	19
40	28
40	37
40	49
40	89
40	96
40	101
40	113
40	116
40	121
40	123
40	130
40	138
42	2
42	33
42	39
42	43
42	50
42	55
42	56
42	57
42	62
42	63
42	65
42	79
42	85
42	99
42	101
42	114
42	121
42	126
42	131
42	134
42	139
43	7
43	24
43	47
43	76
43	79
43	89
43	95
43	107
43	121
43	139
45	25
45	26
45	30
45	39
45	60
45	68
45	77
45	79
45	88
45	97
45	108
45	124
45	134
47	25
47	34
47	44
47	74
47	75
47	101
47	111
48	19
48	24
48	31
48	38
48	55
48	65
48	80
48	82
48	90
48	98
48	99
48	100
48	107
48	108
48	117
48	118
48	122
48	126
48	137
53	3
53	16
53	17
53	20
53	23
53	27
53	32
53	35
53	45
53	49
53	67
53	76
53	113
54	7
54	24
54	47
54	76
54	79
54	89
54	95
54	107
54	121
54	139
56	2
56	33
56	39
56	43
56	50
56	55
56	56
56	57
56	62
56	63
56	65
56	79
56	85
56	99
56	101
56	114
56	121
56	126
56	131
56	134
56	139
57	12
57	40
57	45
57	48
57	51
57	53
57	68
57	82
57	89
57	90
57	91
57	97
57	109
57	127
57	131
58	5
58	17
58	19
58	28
58	37
58	49
58	89
58	96
58	101
58	113
58	116
58	121
58	123
58	130
58	138
59	3
59	16
59	17
59	20
59	23
59	27
59	32
59	35
59	45
59	49
59	67
59	76
59	113
60	3
60	16
60	17
60	20
60	23
60	27
60	32
60	35
60	45
60	49
60	67
60	76
60	113
\.


--
-- Data for Name: tour_template; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.tour_template (id, template1_id, template2_id, transfer_in_id, transfer_out_id, transportation_id, house_type_id, name, code, type, tour_type, guide_wage, color, start_place, finish_place, description, bonus, days, start_day) FROM stdin;
1	\N	\N	\N	\N	\N	\N	Molestiaequoverofacilis.	LC	Private	htc	\N	#33853d	32110 Brenden Stravenue Apt. 346\nKarenmouth, GA 78489-5029	452 Goodwin Meadows\nLake Andre, CT 85567-4795	Quiunderepellendusipsamitaquevoluptatemvoluptatesvoluptatum.Laborumetmagnamdoloremmolestiaeet.Utvitaequiamolestiaedolor.	\N	1	\N
2	\N	\N	53	54	6	9	Earerumipsaaut.	NA	Mixed	ls	12	#70e5df	\N	\N	Etrerumeosrepudiandaetotamestvoluptas.Quasidistinctioaperiamvelit.Utsolutaquiveroin.Impeditoditeadebitisrecusandaenulla.	7	20	2
3	\N	\N	48	40	3	10	Voluptatesquisquamaut.	OZ	Mixed	ls	5	#ca678b	\N	\N	Etenimdoloreminipsamvoluptatibusiureutmaxime.Ullametnonquamdebitisetimpeditconsequaturcupiditate.Sapientevoluptatererumnisiullamfugit.	10	20	4
4	\N	\N	\N	\N	\N	\N	Omniseumetvoluptates.	WA	Private	htc	\N	#c9a53c	861 Amy Corners Apt. 147\nNorth Robb, CT 40687	279 Alyson Hills\nLanechester, WA 89016	Expeditasinttotamratione.Accusamusenimsuntnonesseodio.Sedaliasquaeratquidemestquosaut.Idnihilutlaudantiumquis.	\N	1	\N
5	\N	\N	54	54	1	12	Nonminimaetquasidoloremquilaborum.	CC	Private	ls	7	#d3c541	\N	\N	Estlaudantiumrepellendusrepellendusnemoteneturquia.Doloremutpraesentiumnullanemo.Reiciendisnondoloredoloresest.	12	6	6
6	\N	\N	\N	\N	\N	\N	Officiaeafugasunt.	BX	Private	htc	\N	#a249ef	214 Kennedi Brook Apt. 859\nNorth Kenchester, DE 32468-1053	93595 Dandre Way\nKilbackville, OR 05212-1626	Eligendietsedutoptioestvoluptatemvoluptastenetur.Etsitmodiconsequaturquialiberolaboriosam.	\N	1	\N
7	\N	\N	40	42	13	9	Inciduntutexcepturicumeos.	LV	Mixed	ls	8	#54c4f5	\N	\N	Quodsuntodioiurenullafacerevoluptatemnumquam.Eumatanimiautemearumpraesentiumneque.Autetperferendisaperiam.Nobiseumaliquamfacilismagnamistesapientesit.	13	15	5
8	\N	\N	42	39	33	12	Consequuntureligendiutodit.	TW	Tailor Made	ls	8	#f61cef	\N	\N	Minimanobisfacilisametdolormaxime.Consequaturquamvitaeveritatisquiareprehenderitconsequaturquos.Inillonostrumoptionihilvoluptatesrepellat.Quasiconsequaturutfaceredoloruminenimconsequatur.	6	10	5
9	\N	\N	39	45	27	10	Quisquammolestiaequodet.	ET	Group	ls	6	#53dd34	\N	\N	Eosmodiexpeditaiustoestimpeditaut.Remassumendautdolorumrerum.Nostrumipsaestaliquamvoluptasnostrumnonvoluptas.	10	6	5
10	\N	\N	39	48	22	9	Omnissequiutautaut.	TY	Private	ls	13	#45cbfa	\N	\N	Similiqueoccaecatisitetdeserunt.Suntquasautlaborumaliasvitaealiquamdoloribus.Voluptatemaliquamsolutaetaarchitectomodifacere.Consequaturatetconsecteturvoluptaseafacerequidolorum.	10	10	2
11	\N	\N	45	43	33	11	Maioresassumendaut.	UO	Private	ls	10	#d0f5a9	\N	\N	Ipsumestquisquodeseruntillumvoluptatum.Exvoluptatemveldelenitieaque.Officiisoditmolestiasautadporroetiste.Laborumnonetsitperspiciatissederror.	9	8	6
12	\N	\N	\N	\N	\N	\N	Etrerumexercitationem.	GB	Tailor Made	htc	\N	#4ecde6	72894 Littel Crest Apt. 124\nSouth Aida, MI 24840	25565 Kovacek Grove Suite 535\nPort Melvinafurt, OH 20039	Fugaautnonautemvoluptasrecusandaeremrationemolestiae.Sintofficiaofficiisinimpeditremcorrupti.Repellendusquasearumerrorsequiquasi.	\N	1	\N
13	\N	\N	43	54	7	10	Omnisaccusamusvoluptatemvelit.	OS	Tailor Made	ls	8	#131757	\N	\N	Architectoperferendisvoluptasid.Doloribuslaudantiumesseinventorevoluptatemquiadelectuset.Atqueomnisdictasimiliquepossimusculpa.	6	15	2
14	\N	\N	\N	\N	\N	\N	Voluptateslaudantiumexercitationemexplicabo.	ZD	Private	htc	\N	#db7e3c	93158 Alayna Neck\nAbshireport, MN 37119-1819	990 Phyllis Grove Suite 522\nJohannamouth, UT 97858-2527	Animivoluptasaliasquasaliquamestnumquam.Estrerumplaceatexpeditaveritatisrerum.Inenimestametneque.Facerenonenimdoloremplaceatsintmollitiaaccusantium.	\N	1	\N
15	\N	\N	54	44	36	10	Quiavoluptassit.	UT	Group	ls	8	#8efde4	\N	\N	Porroducimusperspiciatisdignissimoset.Doloremestmagnametplaceat.Quitemporibusremvoluptatemquiaconsequaturconsequunturest.Laborumsitsedomnisrepellendus.	11	8	7
16	\N	\N	56	49	28	9	Natusdolores.	QH	Group	ls	7	#09e2f1	\N	\N	Delenitiutnequemolestiaeliberoexpeditacupiditate.Porrorepellendusiureautemquasdebitis.Modinesciuntinventoresequidolor.Doloreseaquequineque.	5	8	3
17	\N	\N	55	51	20	10	Dolorquidemqui.	VN	Group	ls	7	#1b4a6f	\N	\N	Nonreiciendisexpeditanatusvoluptatessequi.Quisquamquiblanditiisearumexpeditapossimussint.Assumendasimiliquelaborequoautplaceatsedlibero.	10	20	3
18	\N	\N	40	56	8	12	Quosnemovoluptatibusvoluptatem.	MF	Group	ls	5	#a7b474	\N	\N	Fugitquiaomnisofficiarationeconsequaturvoluptatemdoloremesse.Laboriosamsuscipitassumendaesttemporesaepesaepe.Doloremvoluptasnulladolorumexcepturietsequisint.	9	15	6
19	\N	\N	\N	\N	\N	\N	Reprehenderitsuntnumquamessecumquemolestiae.	PQ	Mixed	htc	\N	#688161	99476 River Via\nSouth Wilmahaven, OK 65014-6860	10391 Fadel Brook Apt. 560\nPort Agustinaport, OR 61442	Omnisetatqueisteea.Iddeseruntutnihilomniset.Reiciendisdelectusullamfugitmolestiaeatfugabeataeasperiores.	\N	1	\N
20	\N	\N	\N	\N	\N	\N	Nostrumvoluptatibusculpa.	OM	Tailor Made	htc	\N	#49294b	06532 Aimee Alley Apt. 525\nRusselton, MO 45967-5485	2337 Gloria Wells\nWest Ramon, KY 38251	Atblanditiisdoloresillummolestiasillomolestiaeomnis.Eaquifacerevoluptasdoloredistinctioharumautest.Etoccaecatiquimodiconsequaturnatussapienteminima.	\N	1	\N
21	\N	\N	50	41	14	12	Doloribusoccaecatirecusandaeut.	GH	Private	ls	11	#6ce223	\N	\N	Molestiasquaevoluptasquaequaequiaexearerum.Consequunturlaudantiumoccaecativerositporro.Temporibusasittotamquidolornostrumet.	10	20	3
22	\N	\N	46	48	25	11	Quovoluptas.	US	Mixed	ls	5	#323a76	\N	\N	Animiveniamaspernaturexaliquamquiasint.Laborequiofficiissitinconsequaturveroestmagni.Nobiscommodicorruptioditetsedreiciendisquia.	11	6	5
23	\N	\N	55	47	28	9	Dolorimpeditaut.	AY	Mixed	ls	5	#234a5e	\N	\N	Dolorumquasasperioresnihilvoluptatibus.Eadistinctioinullamquomagninamodit.Laborerecusandaeodioquiculpa.	10	15	2
24	\N	\N	50	43	30	9	Estculpavoluptassed.	DZ	Private	ls	14	#222a9f	\N	\N	Oditconsequaturprovidentmollitiamagnamerror.Perspiciatisvoluptateminventoreautemeosnatus.Voluptasdoloremquesithicesterrorsint.Auteosvoluptatumnoncorporis.	12	15	4
25	\N	\N	57	52	37	12	Mollitiaerroritaque.	PR	Mixed	ls	15	#361718	\N	\N	Rerumoccaecatiexcepturiteneturaliquidtemporibusiurererum.Oditremdoloremqueexcepturialiquamquod.Ametrecusandaevelitvoluptatesillumvoluptaseius.	13	10	5
26	\N	\N	\N	\N	\N	\N	Voluptatenumquamrationesequiesse.	DR	Tailor Made	htc	\N	#ca3b40	464 Kuphal Place Suite 966\nLake Jordan, NV 79820	22959 Pearline Bypass\nPort Hannamouth, HI 92172	Numquamundeaspernaturofficia.Voluptasautnonistemagniutsimilique.Autipsaharumetut.	\N	1	\N
27	\N	\N	51	49	10	9	Aperiamrerumafaceredelenitiperspiciatisdeseruntid.	VH	Mixed	ls	10	#6d2b47	\N	\N	Voluptassequiaccusantiumrepellendusnobis.Voluptatemvoluptassitquiiusto.Evenieteosreprehenderitbeataeestaspernaturdolorumut.Eiustemporeomniscupiditatequia.	9	8	2
28	\N	\N	55	46	17	9	Utsitut.	SQ	Private	ls	10	#863eb5	\N	\N	Quasipsumsuntipsamesseutquia.Auteosutcommodiiureeosdolorem.Illumminimarepellatcorruptiminimanon.Rerumeossapienteconsecteturremnecessitatibuscupiditate.	11	8	4
29	\N	\N	41	49	26	10	Quosindoloraliquidfugit.	RR	Private	ls	14	#e50384	\N	\N	Modidoloresestipsamomnis.Sintnonassumendaut.Necessitatibuscupiditateperferendisautemlaboreaccusamus.	10	20	3
30	\N	\N	53	42	23	10	Pariaturprovident.	RJ	Group	ls	7	#9c83e7	\N	\N	Autlaudantiumevenietdistinctioliberoliberoblanditiis.Perferendisquoaperiamdelenitiiddolores.Laudantiumnatusutestquia.	15	6	2
31	\N	\N	57	57	16	10	Aperiamofficia.	GS	Tailor Made	ls	12	#39e945	\N	\N	Amagnamquaelaborumreiciendis.Nemoquiavelitfugitsit.Beataeconsequaturutsintnisiabconsectetur.	14	8	4
32	\N	\N	\N	\N	\N	\N	Vitaeeum.	LF	Group	htc	\N	#7a8b79	984 Broderick Gardens Suite 434\nEast Darrick, RI 63576	630 Madelyn Walk Suite 854\nPort Aliyah, DC 34595-2629	Debitisutvelitutquoquibusdamomnis.Corporisundeidharum.Autvoluptatemeumdoloribusveroitaqueestaccusantium.	\N	1	\N
33	\N	\N	\N	\N	\N	\N	Itaqueutexercitationemet.	EJ	Group	htc	\N	#47c567	89143 Wolff Flats Apt. 179\nRomabury, NV 61790	085 Van Creek\nFrancescobury, NV 28645-5437	Utexpeditaidnequeenimautemaliquam.Numquamnonquammolestiaeomnisoptiodebitis.Rerumquiassumendaquoquisquam.Consequaturoccaecatiminimaautrerummagnirerum.	\N	1	\N
34	\N	\N	\N	\N	\N	\N	Temporeidcommodisedcupiditate.	PD	Group	htc	\N	#40d70b	15758 Warren Skyway\nDavisfort, LA 83077-4511	7485 Pasquale Point Suite 628\nEliastown, TX 31688	Undedelenitimolestiasexconsequaturetetnisi.Utdelectusautmagnamaliquidexdolorumtemporibus.Temporaharumeadignissimosipsaetsaepemolestias.Solutaestestquiliberoharumaspernatur.	\N	1	\N
35	\N	\N	\N	\N	\N	\N	Molestiaeprovident.	SA	Private	htc	\N	#b373c0	525 Muller Viaduct Apt. 301\nTaraville, CT 57953-4229	4327 Patrick Plains Suite 789\nAbigailtown, TX 26318	Oditdoloresvoluptaseius.Maximeomnisnihilnihilreiciendisutomnisvoluptatemunde.Excepturipraesentiumplaceatdoloribus.Adipiscioptioquositutearumvoluptasquia.	\N	1	\N
36	\N	\N	47	42	4	12	Utipsummodipariatur.	WW	Private	ls	13	#4f6454	\N	\N	Officiatotamdoloresimpeditvoluptatem.Autnobisvoluptatemutautofficiisarchitecto.Enimmaximeerrortemporeipsam.Etidperferendisesseporroconsequuntur.	8	20	6
37	\N	\N	46	45	26	9	Animietquiquia.	LD	Tailor Made	ls	7	#7fe436	\N	\N	Veritatisnonillumvoluptatemdelenitivoluptatemautquae.Minusexpeditaveritatisnisisuscipitaut.Laboreillumquiaautvero.Sedquiadoloreosdistinctiorepellat.Nullautdolorfacererem.	14	15	3
38	\N	\N	\N	\N	\N	\N	Itaquetemporibusveritatisofficiaet.	DV	Group	htc	\N	#0de74e	747 Haley Summit\nLake Donna, ID 39997	4023 Colten Falls\nKristoferside, MA 02255-2293	Solutaullamautrepellatetculpamaxime.Consequaturdoloremmagnamimpeditrecusandaemodidoloremqueetquaerat.Necessitatibusquisquamnamtemporibusearepellatarchitectonisi.	\N	1	\N
39	\N	\N	\N	\N	\N	\N	Debitisrepudiandaeetdeseruntconsequuntur.	KO	Tailor Made	htc	\N	#e5967f	7913 Zackary Wells Apt. 659\nAndersonmouth, ME 98639	566 Tyrel Fall Suite 327\nMrazstad, SC 63669-7614	Quiaquiatemporaillonon.Delenitiearumquosautaccusantiumvoluptatesculpa.Deseruntvoluptasdelenitisuntrerumminimarepellat.Atqueeaqueerrortemporaaut.Sithicoccaecatiutplaceatvoluptatem.	\N	1	\N
40	\N	\N	57	51	2	9	Pariatursedautaddolor.	GG	Group	ls	7	#d68278	\N	\N	Providenttemporibuslaudantiumvoluptasdistinctioquis.Quametlaudantiumnihilaccusantium.Solutaexvoluptatummodirepellendus.Aspernaturestvoluptasquisquamveniamofficiisducimuset.Possimusveniamautatquia.	6	20	7
\.


--
-- Data for Name: tour_template_activity; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.tour_template_activity (tour_template_id, activity_id) FROM stdin;
1	62
1	43
1	121
1	55
1	2
1	65
1	99
1	139
1	134
1	57
1	50
1	33
1	126
1	39
1	56
1	131
1	79
1	63
1	114
1	85
1	101
4	123
4	37
4	130
4	89
4	116
4	5
4	17
4	49
4	121
4	28
4	101
4	19
4	113
4	96
4	138
6	95
6	47
6	121
6	24
6	107
6	76
6	89
6	7
6	79
6	139
12	59
12	8
14	91
14	13
14	41
14	103
14	109
14	22
14	5
14	67
14	95
14	33
14	25
14	117
14	21
14	78
14	81
14	74
14	23
14	51
19	133
19	114
19	105
19	111
19	2
19	90
19	30
19	65
20	90
20	124
20	125
20	91
20	41
20	81
20	103
20	13
20	37
20	83
26	117
26	82
26	80
26	107
26	99
26	98
26	55
26	122
26	90
26	126
26	19
26	100
26	24
26	108
26	65
26	137
26	38
26	118
26	31
32	101
32	74
32	44
32	25
32	34
32	111
32	75
33	90
33	51
33	109
33	97
33	131
33	12
33	89
33	127
33	40
33	48
33	82
33	91
33	53
33	68
33	45
34	13
34	10
34	99
34	85
34	26
34	36
34	137
34	132
34	81
34	121
34	22
34	39
34	94
34	25
34	59
34	89
34	58
34	74
34	123
35	60
35	26
35	124
35	77
35	25
35	68
35	88
35	97
35	30
35	108
35	79
35	134
35	39
38	20
38	76
38	67
38	45
38	113
38	17
38	3
38	49
38	16
38	32
38	27
38	23
38	35
39	94
39	17
39	107
39	62
39	117
39	54
39	53
39	132
39	131
39	34
39	28
39	99
39	24
39	88
39	15
39	3
39	100
39	90
39	60
39	133
\.


--
-- Data for Name: transportation; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.transportation (id, driver_id, name) FROM stdin;
1	118	Transportation1
2	83	Transportation2
3	95	Transportation3
4	82	Transportation4
5	92	Transportation5
6	88	Transportation6
7	82	Transportation7
8	81	Transportation8
9	112	Transportation9
10	101	Transportation10
11	86	Transportation11
12	83	Transportation12
13	105	Transportation13
14	118	Transportation14
15	85	Transportation15
16	103	Transportation16
17	92	Transportation17
18	99	Transportation18
19	100	Transportation19
20	92	Transportation20
21	109	Transportation21
22	118	Transportation22
23	110	Transportation23
24	100	Transportation24
25	116	Transportation25
26	115	Transportation26
27	119	Transportation27
28	98	Transportation28
29	113	Transportation29
30	89	Transportation30
31	85	Transportation31
32	86	Transportation32
33	94	Transportation33
34	102	Transportation34
35	102	Transportation35
36	92	Transportation36
37	112	Transportation37
38	105	Transportation38
39	117	Transportation39
40	118	Transportation40
\.


--
-- Data for Name: transportation_price; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.transportation_price (id, transportation_id, min, max, price) FROM stdin;
1	1	1	6	5
2	1	7	12	10
3	1	13	18	15
4	2	1	6	5
5	2	7	12	10
6	2	13	18	15
7	2	19	24	20
8	3	1	6	5
9	4	1	6	5
10	4	7	12	10
11	4	13	18	15
12	4	19	24	20
13	5	1	6	5
14	5	7	12	10
15	5	13	18	15
16	6	1	6	5
17	7	1	6	5
18	7	7	12	10
19	8	1	6	5
20	8	7	12	10
21	8	13	18	15
22	9	1	6	5
23	9	7	12	10
24	9	13	18	15
25	9	19	24	20
26	9	25	30	25
27	9	31	36	30
28	11	1	6	5
29	11	7	12	10
30	12	1	6	5
31	12	7	12	10
32	13	1	6	5
33	13	7	12	10
34	13	13	18	15
35	14	1	6	5
36	14	7	12	10
37	15	1	6	5
38	16	1	6	5
39	16	7	12	10
40	16	13	18	15
41	17	1	6	5
42	17	7	12	10
43	17	13	18	15
44	18	1	6	5
45	19	1	6	5
46	19	7	12	10
47	21	1	6	5
48	21	7	12	10
49	21	13	18	15
50	21	19	24	20
51	22	1	6	5
52	22	7	12	10
53	22	13	18	15
54	22	19	24	20
55	23	1	6	5
56	24	1	6	5
57	24	7	12	10
58	25	1	6	5
59	25	7	12	10
60	25	13	18	15
61	25	19	24	20
62	25	25	30	25
63	25	31	36	30
64	27	1	6	5
65	27	7	12	10
66	27	13	18	15
67	27	19	24	20
68	28	1	6	5
69	28	7	12	10
70	29	1	6	5
71	29	7	12	10
72	30	1	6	5
73	31	1	6	5
74	31	7	12	10
75	32	1	6	5
76	33	1	6	5
77	33	7	12	10
78	33	13	18	15
79	34	1	6	5
80	35	1	6	5
81	36	1	6	5
82	36	7	12	10
83	38	1	6	5
84	38	7	12	10
85	38	13	18	15
86	39	1	6	5
87	39	7	12	10
88	39	13	18	15
89	39	19	24	20
\.


--
-- Data for Name: transportation_route; Type: TABLE DATA; Schema: public; Owner: locallysourcedcuba
--

COPY public.transportation_route (id, location_from_id, location_to_id, transportation_id, kms) FROM stdin;
1	355	379	1	330
2	350	447	1	976
3	455	459	1	258
4	357	387	2	300
5	378	444	2	647
6	389	423	2	417
7	386	479	2	785
8	359	478	3	946
9	415	432	4	242
10	362	450	4	820
11	423	479	4	537
12	342	397	4	433
13	450	477	5	197
14	443	482	5	276
15	414	443	5	285
16	347	413	6	605
17	463	471	7	240
18	412	455	7	528
19	339	417	8	814
20	405	471	8	529
21	346	372	8	300
22	403	437	9	548
23	373	431	9	648
24	341	429	9	757
25	459	474	9	145
26	358	412	9	480
27	339	422	9	948
28	443	488	11	285
29	341	360	11	87
30	392	422	12	293
31	404	441	12	381
32	368	417	13	514
33	375	479	13	777
34	409	485	13	661
35	425	448	14	284
36	339	359	14	205
37	353	396	15	411
38	361	484	16	904
39	344	356	16	20
40	354	492	16	995
41	365	483	17	946
42	411	415	17	110
43	397	478	17	599
44	398	446	18	595
45	401	408	19	266
46	330	349	19	332
47	342	452	21	944
48	396	461	21	743
49	387	488	21	805
50	335	385	21	431
51	334	414	22	895
52	347	468	22	906
53	332	491	22	1249
54	368	450	22	755
55	407	480	23	639
56	333	400	24	572
57	408	413	24	250
58	411	483	25	591
59	439	443	25	63
60	356	434	25	779
61	367	429	25	636
62	413	420	25	65
63	424	446	25	284
64	354	445	27	845
65	383	438	27	637
66	386	415	27	343
67	439	480	27	233
68	441	478	28	241
69	381	451	28	691
70	423	444	29	415
71	397	455	29	561
72	334	436	30	1100
73	397	416	31	284
74	373	434	31	634
75	360	461	32	838
76	397	409	33	206
77	401	487	33	676
78	333	363	33	296
79	362	376	34	165
80	378	458	35	600
81	428	460	36	147
82	416	421	36	99
83	372	414	38	470
84	441	492	38	271
85	424	438	38	222
86	395	458	39	668
87	460	468	39	55
88	421	434	39	217
89	415	474	39	407
\.


--
-- Name: activity_combo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.activity_combo_id_seq', 16, true);


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.activity_id_seq', 139, true);


--
-- Name: booking_accommodation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.booking_accommodation_id_seq', 134, true);


--
-- Name: booking_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.booking_house_id_seq', 1, false);


--
-- Name: booking_house_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.booking_house_room_id_seq', 1, false);


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.booking_id_seq', 135, true);


--
-- Name: booking_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.booking_transfer_id_seq', 114, true);


--
-- Name: destination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.destination_id_seq', 57, true);


--
-- Name: driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.driver_id_seq', 120, true);


--
-- Name: guide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.guide_id_seq', 120, true);


--
-- Name: house_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_feature_id_seq', 15, true);


--
-- Name: house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_id_seq', 95, true);


--
-- Name: house_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_room_id_seq', 170, true);


--
-- Name: house_room_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_room_type_id_seq', 15, true);


--
-- Name: house_season_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_season_id_seq', 170, true);


--
-- Name: house_season_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_season_room_id_seq', 170, true);


--
-- Name: house_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.house_type_id_seq', 12, true);


--
-- Name: itinerary_day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.itinerary_day_id_seq', 337, true);


--
-- Name: itinerary_day_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.itinerary_day_template_id_seq', 346, true);


--
-- Name: itinerary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.itinerary_id_seq', 69, true);


--
-- Name: itinerary_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.itinerary_template_id_seq', 64, true);


--
-- Name: location_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.location_distance_id_seq', 40092, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.location_id_seq', 492, true);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.notification_id_seq', 30, true);


--
-- Name: notification_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.notification_tour_id_seq', 186, true);


--
-- Name: notification_tour_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.notification_tour_template_id_seq', 168, true);


--
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.province_id_seq', 48, true);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.service_id_seq', 18, true);


--
-- Name: sleeping_requirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.sleeping_requirement_id_seq', 1, false);


--
-- Name: srroom_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.srroom_type_id_seq', 1, false);


--
-- Name: tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.tour_id_seq', 60, true);


--
-- Name: tour_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.tour_template_id_seq', 40, true);


--
-- Name: transportation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.transportation_id_seq', 40, true);


--
-- Name: transportation_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.transportation_price_id_seq', 89, true);


--
-- Name: transportation_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: locallysourcedcuba
--

SELECT pg_catalog.setval('public.transportation_route_id_seq', 89, true);


--
-- Name: activity_combo activity_combo_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.activity_combo
    ADD CONSTRAINT activity_combo_pkey PRIMARY KEY (id);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: booking_accommodation booking_accommodation_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_accommodation
    ADD CONSTRAINT booking_accommodation_pkey PRIMARY KEY (id);


--
-- Name: booking_house booking_house_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house
    ADD CONSTRAINT booking_house_pkey PRIMARY KEY (id);


--
-- Name: booking_house_room booking_house_room_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house_room
    ADD CONSTRAINT booking_house_room_pkey PRIMARY KEY (id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: booking_transfer_house booking_transfer_house_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer_house
    ADD CONSTRAINT booking_transfer_house_pkey PRIMARY KEY (booking_transfer_id, house_id);


--
-- Name: booking_transfer booking_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT booking_transfer_pkey PRIMARY KEY (id);


--
-- Name: destination destination_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.destination
    ADD CONSTRAINT destination_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: guide guide_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.guide
    ADD CONSTRAINT guide_pkey PRIMARY KEY (id);


--
-- Name: house_feature house_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_feature
    ADD CONSTRAINT house_feature_pkey PRIMARY KEY (id);


--
-- Name: house_house_feature house_house_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_house_feature
    ADD CONSTRAINT house_house_feature_pkey PRIMARY KEY (house_id, house_feature_id);


--
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (id);


--
-- Name: house_room house_room_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_room
    ADD CONSTRAINT house_room_pkey PRIMARY KEY (id);


--
-- Name: house_room_type house_room_type_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_room_type
    ADD CONSTRAINT house_room_type_pkey PRIMARY KEY (id);


--
-- Name: house_season house_season_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_season
    ADD CONSTRAINT house_season_pkey PRIMARY KEY (id);


--
-- Name: house_season_room house_season_room_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_season_room
    ADD CONSTRAINT house_season_room_pkey PRIMARY KEY (id);


--
-- Name: house_type house_type_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_type
    ADD CONSTRAINT house_type_pkey PRIMARY KEY (id);


--
-- Name: itinerary_day_activity itinerary_day_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_activity
    ADD CONSTRAINT itinerary_day_activity_pkey PRIMARY KEY (itinerary_day_id, activity_id);


--
-- Name: itinerary_day itinerary_day_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day
    ADD CONSTRAINT itinerary_day_pkey PRIMARY KEY (id);


--
-- Name: itinerary_day_template_activity itinerary_day_template_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_template_activity
    ADD CONSTRAINT itinerary_day_template_activity_pkey PRIMARY KEY (itinerary_day_template_id, activity_id);


--
-- Name: itinerary_day_template itinerary_day_template_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_template
    ADD CONSTRAINT itinerary_day_template_pkey PRIMARY KEY (id);


--
-- Name: itinerary itinerary_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT itinerary_pkey PRIMARY KEY (id);


--
-- Name: itinerary_template itinerary_template_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_template
    ADD CONSTRAINT itinerary_template_pkey PRIMARY KEY (id);


--
-- Name: location_distance location_distance_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.location_distance
    ADD CONSTRAINT location_distance_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_service notification_service_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_service
    ADD CONSTRAINT notification_service_pkey PRIMARY KEY (notification_id, service_id);


--
-- Name: notification_tour notification_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour
    ADD CONSTRAINT notification_tour_pkey PRIMARY KEY (id);


--
-- Name: notification_tour_template notification_tour_template_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour_template
    ADD CONSTRAINT notification_tour_template_pkey PRIMARY KEY (id);


--
-- Name: province province_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: sleeping_requirement sleeping_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.sleeping_requirement
    ADD CONSTRAINT sleeping_requirement_pkey PRIMARY KEY (id);


--
-- Name: srroom_type srroom_type_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.srroom_type
    ADD CONSTRAINT srroom_type_pkey PRIMARY KEY (id);


--
-- Name: tour_activity tour_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_activity
    ADD CONSTRAINT tour_activity_pkey PRIMARY KEY (tour_id, activity_id);


--
-- Name: tour tour_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT tour_pkey PRIMARY KEY (id);


--
-- Name: tour_template_activity tour_template_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template_activity
    ADD CONSTRAINT tour_template_activity_pkey PRIMARY KEY (tour_template_id, activity_id);


--
-- Name: tour_template tour_template_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT tour_template_pkey PRIMARY KEY (id);


--
-- Name: transportation transportation_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT transportation_pkey PRIMARY KEY (id);


--
-- Name: transportation_price transportation_price_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_price
    ADD CONSTRAINT transportation_price_pkey PRIMARY KEY (id);


--
-- Name: transportation_route transportation_route_pkey; Type: CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_route
    ADD CONSTRAINT transportation_route_pkey PRIMARY KEY (id);


--
-- Name: idx_1ac37bd246690f40; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_1ac37bd246690f40 ON public.transportation_route USING btree (location_to_id);


--
-- Name: idx_1ac37bd2968bcaaf; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_1ac37bd2968bcaaf ON public.transportation_route USING btree (location_from_id);


--
-- Name: idx_1ac37bd2f7bb88e4; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_1ac37bd2f7bb88e4 ON public.transportation_route USING btree (transportation_id);


--
-- Name: idx_260114d215f737b2; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_260114d215f737b2 ON public.booking_accommodation USING btree (itinerary_id);


--
-- Name: idx_260114d23301c60; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_260114d23301c60 ON public.booking_accommodation USING btree (booking_id);


--
-- Name: idx_2af17fb1296e3073; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_2af17fb1296e3073 ON public.house_room USING btree (room_type_id);


--
-- Name: idx_2af17fb16bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_2af17fb16bb74515 ON public.house_room USING btree (house_id);


--
-- Name: idx_368b506915ed8d43; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_368b506915ed8d43 ON public.tour_activity USING btree (tour_id);


--
-- Name: idx_368b506981c06096; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_368b506981c06096 ON public.tour_activity USING btree (activity_id);


--
-- Name: idx_3ec63eaae946114a; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_3ec63eaae946114a ON public.destination USING btree (province_id);


--
-- Name: idx_413ad3ea8978f869; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_413ad3ea8978f869 ON public.sleeping_requirement USING btree (accommodation_type_id);


--
-- Name: idx_4359c2206bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_4359c2206bb74515 ON public.house_season USING btree (house_id);


--
-- Name: idx_4b773600174f074; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_4b773600174f074 ON public.house_house_feature USING btree (house_feature_id);


--
-- Name: idx_4b7736006bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_4b7736006bb74515 ON public.house_house_feature USING btree (house_id);


--
-- Name: idx_599c7de015f737b2; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_599c7de015f737b2 ON public.itinerary_day_template USING btree (itinerary_id);


--
-- Name: idx_5b2d8c79658c5d7b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_5b2d8c79658c5d7b ON public.notification_tour_template USING btree (tour_template_id);


--
-- Name: idx_5b2d8c79ef1a9d84; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_5b2d8c79ef1a9d84 ON public.notification_tour_template USING btree (notification_id);


--
-- Name: idx_5f3e37356bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_5f3e37356bb74515 ON public.booking_transfer_house USING btree (house_id);


--
-- Name: idx_5f3e373574eb9366; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_5f3e373574eb9366 ON public.booking_transfer_house USING btree (booking_transfer_id);


--
-- Name: idx_62886b397a725613; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_62886b397a725613 ON public.itinerary_day_activity USING btree (itinerary_day_id);


--
-- Name: idx_62886b3981c06096; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_62886b3981c06096 ON public.itinerary_day_activity USING btree (activity_id);


--
-- Name: idx_67d5399d816c6140; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_67d5399d816c6140 ON public.house USING btree (destination_id);


--
-- Name: idx_67d5399dc54c8c93; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_67d5399dc54c8c93 ON public.house USING btree (type_id);


--
-- Name: idx_6ad1f969519b0a8e; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969519b0a8e ON public.tour USING btree (house_type_id);


--
-- Name: idx_6ad1f9695da0fb8; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f9695da0fb8 ON public.tour USING btree (template_id);


--
-- Name: idx_6ad1f969611c0549; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969611c0549 ON public.tour USING btree (transfer_out_id);


--
-- Name: idx_6ad1f969b37d8b6b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969b37d8b6b ON public.tour USING btree (transfer_in_id);


--
-- Name: idx_6ad1f969d7ed1d4b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969d7ed1d4b ON public.tour USING btree (guide_id);


--
-- Name: idx_6ad1f969ed5ca9e6; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969ed5ca9e6 ON public.tour USING btree (service_id);


--
-- Name: idx_6ad1f969f7bb88e4; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_6ad1f969f7bb88e4 ON public.tour USING btree (transportation_id);


--
-- Name: idx_7b003d4d15ed8d43; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_7b003d4d15ed8d43 ON public.booking_transfer USING btree (tour_id);


--
-- Name: idx_7b003d4d816c6140; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_7b003d4d816c6140 ON public.booking_transfer USING btree (destination_id);


--
-- Name: idx_7b003d4d81858386; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_7b003d4d81858386 ON public.booking_transfer USING btree (booking_in_id);


--
-- Name: idx_7b003d4dbf956384; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_7b003d4dbf956384 ON public.booking_transfer USING btree (booking_out_id);


--
-- Name: idx_7b003d4dc3423909; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_7b003d4dc3423909 ON public.booking_transfer USING btree (driver_id);


--
-- Name: idx_803c52c6658c5d7b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_803c52c6658c5d7b ON public.tour_template_activity USING btree (tour_template_id);


--
-- Name: idx_803c52c681c06096; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_803c52c681c06096 ON public.tour_template_activity USING btree (activity_id);


--
-- Name: idx_8a0621f054177093; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_8a0621f054177093 ON public.house_season_room USING btree (room_id);


--
-- Name: idx_8a0621f0b577df0f; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_8a0621f0b577df0f ON public.house_season_room USING btree (house_season_id);


--
-- Name: idx_8c3e0ce781c06096; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_8c3e0ce781c06096 ON public.itinerary_day_template_activity USING btree (activity_id);


--
-- Name: idx_8c3e0ce7ac8bcd1d; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_8c3e0ce7ac8bcd1d ON public.itinerary_day_template_activity USING btree (itinerary_day_template_id);


--
-- Name: idx_9b1722dc3423909; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_9b1722dc3423909 ON public.transportation USING btree (driver_id);


--
-- Name: idx_ab0e649415f737b2; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_ab0e649415f737b2 ON public.itinerary_day USING btree (itinerary_id);


--
-- Name: idx_ac74095a816c6140; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_ac74095a816c6140 ON public.activity USING btree (destination_id);


--
-- Name: idx_af3e06f9727aca70; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_af3e06f9727aca70 ON public.activity_combo USING btree (parent_id);


--
-- Name: idx_af3e06f981c06096; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_af3e06f981c06096 ON public.activity_combo USING btree (activity_id);


--
-- Name: idx_b36b1cc05083db98; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_b36b1cc05083db98 ON public.booking_house_room USING btree (booking_house_id);


--
-- Name: idx_b36b1cc0c0c0f68e; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_b36b1cc0c0c0f68e ON public.booking_house_room USING btree (house_room_id);


--
-- Name: idx_b6822b42658c5d7b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_b6822b42658c5d7b ON public.itinerary_template USING btree (tour_template_id);


--
-- Name: idx_b6822b426bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_b6822b426bb74515 ON public.itinerary_template USING btree (house_id);


--
-- Name: idx_b6822b42816c6140; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_b6822b42816c6140 ON public.itinerary_template USING btree (destination_id);


--
-- Name: idx_cdc7b863cedf617b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_cdc7b863cedf617b ON public.location_distance USING btree (location2_id);


--
-- Name: idx_cdc7b863dc6ace95; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_cdc7b863dc6ace95 ON public.location_distance USING btree (location1_id);


--
-- Name: idx_d2cf7972f7bb88e4; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d2cf7972f7bb88e4 ON public.transportation_price USING btree (transportation_id);


--
-- Name: idx_d2edb25315ed8d43; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d2edb25315ed8d43 ON public.notification_tour USING btree (tour_id);


--
-- Name: idx_d2edb253ef1a9d84; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d2edb253ef1a9d84 ON public.notification_tour USING btree (notification_id);


--
-- Name: idx_d9f46b013d3cc22; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b013d3cc22 ON public.tour_template USING btree (template1_id);


--
-- Name: idx_d9f46b016663cc; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b016663cc ON public.tour_template USING btree (template2_id);


--
-- Name: idx_d9f46b0519b0a8e; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b0519b0a8e ON public.tour_template USING btree (house_type_id);


--
-- Name: idx_d9f46b0611c0549; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b0611c0549 ON public.tour_template USING btree (transfer_out_id);


--
-- Name: idx_d9f46b0b37d8b6b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b0b37d8b6b ON public.tour_template USING btree (transfer_in_id);


--
-- Name: idx_d9f46b0f7bb88e4; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_d9f46b0f7bb88e4 ON public.tour_template USING btree (transportation_id);


--
-- Name: idx_e00cedde15ed8d43; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_e00cedde15ed8d43 ON public.booking USING btree (tour_id);


--
-- Name: idx_f4831065ed5ca9e6; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f4831065ed5ca9e6 ON public.notification_service USING btree (service_id);


--
-- Name: idx_f4831065ef1a9d84; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f4831065ef1a9d84 ON public.notification_service USING btree (notification_id);


--
-- Name: idx_f6a9c4286bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f6a9c4286bb74515 ON public.booking_house USING btree (house_id);


--
-- Name: idx_f6a9c428b1e5c38b; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f6a9c428b1e5c38b ON public.booking_house USING btree (booking_accommodation_id);


--
-- Name: idx_f7287958296e3073; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f7287958296e3073 ON public.srroom_type USING btree (room_type_id);


--
-- Name: idx_f7287958ae2ddf69; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_f7287958ae2ddf69 ON public.srroom_type USING btree (sleeping_requirement_id);


--
-- Name: idx_ff2238f615ed8d43; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_ff2238f615ed8d43 ON public.itinerary USING btree (tour_id);


--
-- Name: idx_ff2238f66bb74515; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_ff2238f66bb74515 ON public.itinerary USING btree (house_id);


--
-- Name: idx_ff2238f6816c6140; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE INDEX idx_ff2238f6816c6140 ON public.itinerary USING btree (destination_id);


--
-- Name: uniq_6ad1f96977153098; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE UNIQUE INDEX uniq_6ad1f96977153098 ON public.tour USING btree (code);


--
-- Name: uniq_d9f46b077153098; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE UNIQUE INDEX uniq_d9f46b077153098 ON public.tour_template USING btree (code);


--
-- Name: uniq_e00ceddeae2ddf69; Type: INDEX; Schema: public; Owner: locallysourcedcuba
--

CREATE UNIQUE INDEX uniq_e00ceddeae2ddf69 ON public.booking USING btree (sleeping_requirement_id);


--
-- Name: transportation_route fk_1ac37bd246690f40; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_route
    ADD CONSTRAINT fk_1ac37bd246690f40 FOREIGN KEY (location_to_id) REFERENCES public.location(id);


--
-- Name: transportation_route fk_1ac37bd2968bcaaf; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_route
    ADD CONSTRAINT fk_1ac37bd2968bcaaf FOREIGN KEY (location_from_id) REFERENCES public.location(id);


--
-- Name: transportation_route fk_1ac37bd2f7bb88e4; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_route
    ADD CONSTRAINT fk_1ac37bd2f7bb88e4 FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);


--
-- Name: booking_accommodation fk_260114d215f737b2; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_accommodation
    ADD CONSTRAINT fk_260114d215f737b2 FOREIGN KEY (itinerary_id) REFERENCES public.itinerary(id);


--
-- Name: booking_accommodation fk_260114d23301c60; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_accommodation
    ADD CONSTRAINT fk_260114d23301c60 FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: house_room fk_2af17fb1296e3073; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_room
    ADD CONSTRAINT fk_2af17fb1296e3073 FOREIGN KEY (room_type_id) REFERENCES public.house_room_type(id);


--
-- Name: house_room fk_2af17fb16bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_room
    ADD CONSTRAINT fk_2af17fb16bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id);


--
-- Name: tour_activity fk_368b506915ed8d43; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_activity
    ADD CONSTRAINT fk_368b506915ed8d43 FOREIGN KEY (tour_id) REFERENCES public.tour(id) ON DELETE CASCADE;


--
-- Name: tour_activity fk_368b506981c06096; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_activity
    ADD CONSTRAINT fk_368b506981c06096 FOREIGN KEY (activity_id) REFERENCES public.activity(id) ON DELETE CASCADE;


--
-- Name: destination fk_3ec63eaae946114a; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.destination
    ADD CONSTRAINT fk_3ec63eaae946114a FOREIGN KEY (province_id) REFERENCES public.province(id);


--
-- Name: sleeping_requirement fk_413ad3ea8978f869; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.sleeping_requirement
    ADD CONSTRAINT fk_413ad3ea8978f869 FOREIGN KEY (accommodation_type_id) REFERENCES public.house_type(id);


--
-- Name: house_season fk_4359c2206bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_season
    ADD CONSTRAINT fk_4359c2206bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id);


--
-- Name: house_house_feature fk_4b773600174f074; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_house_feature
    ADD CONSTRAINT fk_4b773600174f074 FOREIGN KEY (house_feature_id) REFERENCES public.house_feature(id) ON DELETE CASCADE;


--
-- Name: house_house_feature fk_4b7736006bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_house_feature
    ADD CONSTRAINT fk_4b7736006bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id) ON DELETE CASCADE;


--
-- Name: itinerary_day_template fk_599c7de015f737b2; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_template
    ADD CONSTRAINT fk_599c7de015f737b2 FOREIGN KEY (itinerary_id) REFERENCES public.itinerary_template(id);


--
-- Name: notification_tour_template fk_5b2d8c79658c5d7b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour_template
    ADD CONSTRAINT fk_5b2d8c79658c5d7b FOREIGN KEY (tour_template_id) REFERENCES public.tour_template(id);


--
-- Name: notification_tour_template fk_5b2d8c79ef1a9d84; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour_template
    ADD CONSTRAINT fk_5b2d8c79ef1a9d84 FOREIGN KEY (notification_id) REFERENCES public.notification(id);


--
-- Name: booking_transfer_house fk_5f3e37356bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer_house
    ADD CONSTRAINT fk_5f3e37356bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id) ON DELETE CASCADE;


--
-- Name: booking_transfer_house fk_5f3e373574eb9366; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer_house
    ADD CONSTRAINT fk_5f3e373574eb9366 FOREIGN KEY (booking_transfer_id) REFERENCES public.booking_transfer(id) ON DELETE CASCADE;


--
-- Name: itinerary_day_activity fk_62886b397a725613; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_activity
    ADD CONSTRAINT fk_62886b397a725613 FOREIGN KEY (itinerary_day_id) REFERENCES public.itinerary_day(id) ON DELETE CASCADE;


--
-- Name: itinerary_day_activity fk_62886b3981c06096; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_activity
    ADD CONSTRAINT fk_62886b3981c06096 FOREIGN KEY (activity_id) REFERENCES public.activity(id) ON DELETE CASCADE;


--
-- Name: house fk_67d5399d816c6140; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT fk_67d5399d816c6140 FOREIGN KEY (destination_id) REFERENCES public.destination(id);


--
-- Name: house fk_67d5399dc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT fk_67d5399dc54c8c93 FOREIGN KEY (type_id) REFERENCES public.house_type(id);


--
-- Name: tour fk_6ad1f969519b0a8e; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969519b0a8e FOREIGN KEY (house_type_id) REFERENCES public.house_type(id);


--
-- Name: tour fk_6ad1f9695da0fb8; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f9695da0fb8 FOREIGN KEY (template_id) REFERENCES public.tour_template(id) ON DELETE SET NULL;


--
-- Name: tour fk_6ad1f969611c0549; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969611c0549 FOREIGN KEY (transfer_out_id) REFERENCES public.destination(id);


--
-- Name: tour fk_6ad1f969b37d8b6b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969b37d8b6b FOREIGN KEY (transfer_in_id) REFERENCES public.destination(id);


--
-- Name: tour fk_6ad1f969d7ed1d4b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969d7ed1d4b FOREIGN KEY (guide_id) REFERENCES public.guide(id) ON DELETE SET NULL;


--
-- Name: tour fk_6ad1f969ed5ca9e6; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969ed5ca9e6 FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: tour fk_6ad1f969f7bb88e4; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour
    ADD CONSTRAINT fk_6ad1f969f7bb88e4 FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);


--
-- Name: booking_transfer fk_7b003d4d15ed8d43; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT fk_7b003d4d15ed8d43 FOREIGN KEY (tour_id) REFERENCES public.tour(id);


--
-- Name: booking_transfer fk_7b003d4d816c6140; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT fk_7b003d4d816c6140 FOREIGN KEY (destination_id) REFERENCES public.destination(id);


--
-- Name: booking_transfer fk_7b003d4d81858386; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT fk_7b003d4d81858386 FOREIGN KEY (booking_in_id) REFERENCES public.booking(id);


--
-- Name: booking_transfer fk_7b003d4dbf956384; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT fk_7b003d4dbf956384 FOREIGN KEY (booking_out_id) REFERENCES public.booking(id);


--
-- Name: booking_transfer fk_7b003d4dc3423909; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_transfer
    ADD CONSTRAINT fk_7b003d4dc3423909 FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: tour_template_activity fk_803c52c6658c5d7b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template_activity
    ADD CONSTRAINT fk_803c52c6658c5d7b FOREIGN KEY (tour_template_id) REFERENCES public.tour_template(id) ON DELETE CASCADE;


--
-- Name: tour_template_activity fk_803c52c681c06096; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template_activity
    ADD CONSTRAINT fk_803c52c681c06096 FOREIGN KEY (activity_id) REFERENCES public.activity(id) ON DELETE CASCADE;


--
-- Name: house_season_room fk_8a0621f054177093; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_season_room
    ADD CONSTRAINT fk_8a0621f054177093 FOREIGN KEY (room_id) REFERENCES public.house_room(id);


--
-- Name: house_season_room fk_8a0621f0b577df0f; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.house_season_room
    ADD CONSTRAINT fk_8a0621f0b577df0f FOREIGN KEY (house_season_id) REFERENCES public.house_season(id);


--
-- Name: itinerary_day_template_activity fk_8c3e0ce781c06096; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_template_activity
    ADD CONSTRAINT fk_8c3e0ce781c06096 FOREIGN KEY (activity_id) REFERENCES public.activity(id) ON DELETE CASCADE;


--
-- Name: itinerary_day_template_activity fk_8c3e0ce7ac8bcd1d; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day_template_activity
    ADD CONSTRAINT fk_8c3e0ce7ac8bcd1d FOREIGN KEY (itinerary_day_template_id) REFERENCES public.itinerary_day_template(id) ON DELETE CASCADE;


--
-- Name: transportation fk_9b1722dc3423909; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT fk_9b1722dc3423909 FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: itinerary_day fk_ab0e649415f737b2; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_day
    ADD CONSTRAINT fk_ab0e649415f737b2 FOREIGN KEY (itinerary_id) REFERENCES public.itinerary(id);


--
-- Name: activity fk_ac74095a816c6140; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fk_ac74095a816c6140 FOREIGN KEY (destination_id) REFERENCES public.destination(id);


--
-- Name: activity_combo fk_af3e06f9727aca70; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.activity_combo
    ADD CONSTRAINT fk_af3e06f9727aca70 FOREIGN KEY (parent_id) REFERENCES public.activity(id);


--
-- Name: activity_combo fk_af3e06f981c06096; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.activity_combo
    ADD CONSTRAINT fk_af3e06f981c06096 FOREIGN KEY (activity_id) REFERENCES public.activity(id);


--
-- Name: booking_house_room fk_b36b1cc05083db98; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house_room
    ADD CONSTRAINT fk_b36b1cc05083db98 FOREIGN KEY (booking_house_id) REFERENCES public.booking_house(id);


--
-- Name: booking_house_room fk_b36b1cc0c0c0f68e; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house_room
    ADD CONSTRAINT fk_b36b1cc0c0c0f68e FOREIGN KEY (house_room_id) REFERENCES public.house_room(id);


--
-- Name: itinerary_template fk_b6822b42658c5d7b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_template
    ADD CONSTRAINT fk_b6822b42658c5d7b FOREIGN KEY (tour_template_id) REFERENCES public.tour_template(id);


--
-- Name: itinerary_template fk_b6822b426bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_template
    ADD CONSTRAINT fk_b6822b426bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id);


--
-- Name: itinerary_template fk_b6822b42816c6140; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary_template
    ADD CONSTRAINT fk_b6822b42816c6140 FOREIGN KEY (destination_id) REFERENCES public.destination(id);


--
-- Name: location_distance fk_cdc7b863cedf617b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.location_distance
    ADD CONSTRAINT fk_cdc7b863cedf617b FOREIGN KEY (location2_id) REFERENCES public.location(id);


--
-- Name: location_distance fk_cdc7b863dc6ace95; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.location_distance
    ADD CONSTRAINT fk_cdc7b863dc6ace95 FOREIGN KEY (location1_id) REFERENCES public.location(id);


--
-- Name: transportation_price fk_d2cf7972f7bb88e4; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.transportation_price
    ADD CONSTRAINT fk_d2cf7972f7bb88e4 FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);


--
-- Name: notification_tour fk_d2edb25315ed8d43; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour
    ADD CONSTRAINT fk_d2edb25315ed8d43 FOREIGN KEY (tour_id) REFERENCES public.tour(id);


--
-- Name: notification_tour fk_d2edb253ef1a9d84; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_tour
    ADD CONSTRAINT fk_d2edb253ef1a9d84 FOREIGN KEY (notification_id) REFERENCES public.notification(id);


--
-- Name: tour_template fk_d9f46b013d3cc22; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b013d3cc22 FOREIGN KEY (template1_id) REFERENCES public.tour_template(id) ON DELETE SET NULL;


--
-- Name: tour_template fk_d9f46b016663cc; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b016663cc FOREIGN KEY (template2_id) REFERENCES public.tour_template(id) ON DELETE SET NULL;


--
-- Name: tour_template fk_d9f46b0519b0a8e; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b0519b0a8e FOREIGN KEY (house_type_id) REFERENCES public.house_type(id);


--
-- Name: tour_template fk_d9f46b0611c0549; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b0611c0549 FOREIGN KEY (transfer_out_id) REFERENCES public.destination(id);


--
-- Name: tour_template fk_d9f46b0b37d8b6b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b0b37d8b6b FOREIGN KEY (transfer_in_id) REFERENCES public.destination(id);


--
-- Name: tour_template fk_d9f46b0f7bb88e4; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.tour_template
    ADD CONSTRAINT fk_d9f46b0f7bb88e4 FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);


--
-- Name: booking fk_e00cedde15ed8d43; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk_e00cedde15ed8d43 FOREIGN KEY (tour_id) REFERENCES public.tour(id);


--
-- Name: booking fk_e00ceddeae2ddf69; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk_e00ceddeae2ddf69 FOREIGN KEY (sleeping_requirement_id) REFERENCES public.sleeping_requirement(id);


--
-- Name: notification_service fk_f4831065ed5ca9e6; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_service
    ADD CONSTRAINT fk_f4831065ed5ca9e6 FOREIGN KEY (service_id) REFERENCES public.service(id) ON DELETE CASCADE;


--
-- Name: notification_service fk_f4831065ef1a9d84; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.notification_service
    ADD CONSTRAINT fk_f4831065ef1a9d84 FOREIGN KEY (notification_id) REFERENCES public.notification(id) ON DELETE CASCADE;


--
-- Name: booking_house fk_f6a9c4286bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house
    ADD CONSTRAINT fk_f6a9c4286bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id);


--
-- Name: booking_house fk_f6a9c428b1e5c38b; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.booking_house
    ADD CONSTRAINT fk_f6a9c428b1e5c38b FOREIGN KEY (booking_accommodation_id) REFERENCES public.booking_accommodation(id);


--
-- Name: srroom_type fk_f7287958296e3073; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.srroom_type
    ADD CONSTRAINT fk_f7287958296e3073 FOREIGN KEY (room_type_id) REFERENCES public.house_room_type(id);


--
-- Name: srroom_type fk_f7287958ae2ddf69; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.srroom_type
    ADD CONSTRAINT fk_f7287958ae2ddf69 FOREIGN KEY (sleeping_requirement_id) REFERENCES public.sleeping_requirement(id);


--
-- Name: itinerary fk_ff2238f615ed8d43; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT fk_ff2238f615ed8d43 FOREIGN KEY (tour_id) REFERENCES public.tour(id);


--
-- Name: itinerary fk_ff2238f66bb74515; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT fk_ff2238f66bb74515 FOREIGN KEY (house_id) REFERENCES public.house(id);


--
-- Name: itinerary fk_ff2238f6816c6140; Type: FK CONSTRAINT; Schema: public; Owner: locallysourcedcuba
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT fk_ff2238f6816c6140 FOREIGN KEY (destination_id) REFERENCES public.destination(id);


--
-- PostgreSQL database dump complete
--

