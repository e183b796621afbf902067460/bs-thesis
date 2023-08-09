--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "superset" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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

--
-- Name: superset; Type: DATABASE; Schema: -; Owner: superset
--

ALTER DATABASE superset OWNER TO superset;

\connect superset

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

--
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


ALTER TYPE public.emaildeliverytype OWNER TO superset;

--
-- Name: objecttypes; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.objecttypes AS ENUM (
    'query',
    'chart',
    'dashboard'
);


ALTER TYPE public.objecttypes OWNER TO superset;

--
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


ALTER TYPE public.sliceemailreportformat OWNER TO superset;

--
-- Name: tagtypes; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.tagtypes AS ENUM (
    'custom',
    'type',
    'owner',
    'favorited_by'
);


ALTER TYPE public.tagtypes OWNER TO superset;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO superset;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO superset;

--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO superset;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO superset;

--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO superset;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO superset;

--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO superset;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO superset;

--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO superset;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO superset;

--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(64) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO superset;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO superset;

--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO superset;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO superset;

--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO superset;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO superset;

--
-- Name: access_request; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.access_request (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_type character varying(200),
    datasource_id integer,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.access_request OWNER TO superset;

--
-- Name: access_request_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.access_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_request_id_seq OWNER TO superset;

--
-- Name: access_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.access_request_id_seq OWNED BY public.access_request.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO superset;

--
-- Name: alert_logs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alert_logs (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone,
    dttm_start timestamp without time zone,
    dttm_end timestamp without time zone,
    alert_id integer,
    state character varying(10)
);


ALTER TABLE public.alert_logs OWNER TO superset;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.alert_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_logs_id_seq OWNER TO superset;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.alert_logs_id_seq OWNED BY public.alert_logs.id;


--
-- Name: alert_owner; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alert_owner (
    id integer NOT NULL,
    user_id integer,
    alert_id integer
);


ALTER TABLE public.alert_owner OWNER TO superset;

--
-- Name: alert_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.alert_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_owner_id_seq OWNER TO superset;

--
-- Name: alert_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.alert_owner_id_seq OWNED BY public.alert_owner.id;


--
-- Name: alerts; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alerts (
    id integer NOT NULL,
    label character varying(150) NOT NULL,
    active boolean,
    crontab character varying(50) NOT NULL,
    alert_type character varying(50),
    log_retention integer NOT NULL,
    grace_period integer NOT NULL,
    recipients text,
    slice_id integer,
    dashboard_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(10),
    slack_channel text,
    changed_by_fk integer,
    changed_on timestamp without time zone,
    created_by_fk integer,
    created_on timestamp without time zone,
    validator_config text,
    database_id integer NOT NULL,
    sql text NOT NULL,
    validator_type character varying(100) NOT NULL
);


ALTER TABLE public.alerts OWNER TO superset;

--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.alerts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alerts_id_seq OWNER TO superset;

--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.alerts_id_seq OWNED BY public.alerts.id;


--
-- Name: annotation; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


ALTER TABLE public.annotation OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_id_seq OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_layer_id_seq OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


ALTER TABLE public.cache_keys OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cache_keys_id_seq OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.clusters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    cluster_name character varying(250) NOT NULL,
    broker_host character varying(255),
    broker_port integer,
    broker_endpoint character varying(255),
    metadata_last_refreshed timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    cache_timeout integer,
    verbose_name character varying(250),
    broker_pass bytea,
    broker_user character varying(255),
    uuid uuid
);


ALTER TABLE public.clusters OWNER TO superset;

--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_id_seq OWNER TO superset;

--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    column_name character varying(255) NOT NULL,
    is_active boolean,
    type character varying(32),
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    dimension_spec_json text,
    verbose_name character varying(1024),
    datasource_id integer,
    uuid uuid
);


ALTER TABLE public.columns OWNER TO superset;

--
-- Name: columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.columns_id_seq OWNER TO superset;

--
-- Name: columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.columns_id_seq OWNED BY public.columns.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.css_templates_id_seq OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_email_schedules; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_email_schedules (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    active boolean,
    crontab character varying(50),
    recipients text,
    deliver_as_group boolean,
    delivery_type public.emaildeliverytype,
    dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer,
    user_id integer,
    slack_channel text,
    uuid uuid
);


ALTER TABLE public.dashboard_email_schedules OWNER TO superset;

--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_email_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_email_schedules_id_seq OWNER TO superset;

--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_email_schedules_id_seq OWNED BY public.dashboard_email_schedules.id;


--
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


ALTER TABLE public.dashboard_roles OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_roles_id_seq OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_slices_id_seq OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_user_id_seq OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dashboards OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: datasources; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.datasources (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_name character varying(255) NOT NULL,
    is_featured boolean,
    is_hidden boolean,
    description text,
    default_endpoint text,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    cache_timeout integer,
    perm character varying(1000),
    filter_select_enabled boolean,
    params character varying(1000),
    fetch_values_from character varying(100),
    schema_perm character varying(1000),
    cluster_id integer NOT NULL,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.datasources OWNER TO superset;

--
-- Name: datasources_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.datasources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datasources_id_seq OWNER TO superset;

--
-- Name: datasources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.datasources_id_seq OWNED BY public.datasources.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_multi_schema_metadata_fetch boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dbs OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbs_id_seq OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: druiddatasource_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.druiddatasource_user (
    id integer NOT NULL,
    user_id integer,
    datasource_id integer
);


ALTER TABLE public.druiddatasource_user OWNER TO superset;

--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.druiddatasource_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.druiddatasource_user_id_seq OWNER TO superset;

--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.druiddatasource_user_id_seq OWNED BY public.druiddatasource_user.id;


--
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.dynamic_plugin OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynamic_plugin_id_seq OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.embedded_dashboards OWNER TO superset;

--
-- Name: favstar; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favstar_id_seq OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: filter_sets; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.filter_sets (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    description text,
    json_metadata text NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(255) NOT NULL,
    dashboard_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.filter_sets OWNER TO superset;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.filter_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_sets_id_seq OWNER TO superset;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.filter_sets_id_seq OWNED BY public.filter_sets.id;


--
-- Name: key_value; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


ALTER TABLE public.key_value OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_value_id_seq OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyvalue_id_seq OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    json text NOT NULL,
    description text,
    changed_by_fk integer,
    changed_on timestamp without time zone,
    created_by_fk integer,
    created_on timestamp without time zone,
    d3format character varying(128),
    warning_text text,
    datasource_id integer,
    uuid uuid
);


ALTER TABLE public.metrics OWNER TO superset;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO superset;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying
);


ALTER TABLE public.query OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


ALTER TABLE public.report_execution_log OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_execution_log_id_seq OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.report_recipient OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_recipient_id_seq OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra text NOT NULL,
    force_screenshot boolean
);


ALTER TABLE public.report_schedule OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_id_seq OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


ALTER TABLE public.report_schedule_user OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_user_id_seq OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_roles OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_roles_id_seq OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_tables OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_tables_id_seq OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255)
);


ALTER TABLE public.row_level_security_filters OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.row_level_security_filters_id_seq OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid
);


ALTER TABLE public.saved_query OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_query_id_seq OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: slice_email_schedules; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slice_email_schedules (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    active boolean,
    crontab character varying(50),
    recipients text,
    deliver_as_group boolean,
    delivery_type public.emaildeliverytype,
    slice_id integer,
    email_format public.sliceemailreportformat,
    created_by_fk integer,
    changed_by_fk integer,
    user_id integer,
    slack_channel text,
    uuid uuid
);


ALTER TABLE public.slice_email_schedules OWNER TO superset;

--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slice_email_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_email_schedules_id_seq OWNER TO superset;

--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slice_email_schedules_id_seq OWNED BY public.slice_email_schedules.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_user_id_seq OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.slices OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_id_seq OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid
);


ALTER TABLE public.sql_metrics OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_metrics_id_seq OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: sql_observations; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sql_observations (
    id integer NOT NULL,
    dttm timestamp without time zone,
    alert_id integer,
    value double precision,
    error_msg character varying(500)
);


ALTER TABLE public.sql_observations OWNER TO superset;

--
-- Name: sql_observations_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sql_observations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_observations_id_seq OWNER TO superset;

--
-- Name: sql_observations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sql_observations_id_seq OWNED BY public.sql_observations.id;


--
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


ALTER TABLE public.sqlatable_user OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sqlatable_user_id_seq OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- Name: tab_state; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer
);


ALTER TABLE public.tab_state OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_state_id_seq OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text
);


ALTER TABLE public.table_columns OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_columns_id_seq OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.table_schema OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_schema_id_seq OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.tables OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type public.tagtypes,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tag OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type public.objecttypes,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tagged_object OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagged_object_id_seq OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.url (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    url text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.url OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.url_id_seq OWNER TO superset;

--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.user_attribute OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_attribute_id_seq OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: access_request id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request ALTER COLUMN id SET DEFAULT nextval('public.access_request_id_seq'::regclass);


--
-- Name: alert_logs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_logs ALTER COLUMN id SET DEFAULT nextval('public.alert_logs_id_seq'::regclass);


--
-- Name: alert_owner id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_owner ALTER COLUMN id SET DEFAULT nextval('public.alert_owner_id_seq'::regclass);


--
-- Name: alerts id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts ALTER COLUMN id SET DEFAULT nextval('public.alerts_id_seq'::regclass);


--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns ALTER COLUMN id SET DEFAULT nextval('public.columns_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_email_schedules id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules ALTER COLUMN id SET DEFAULT nextval('public.dashboard_email_schedules_id_seq'::regclass);


--
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: datasources id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources ALTER COLUMN id SET DEFAULT nextval('public.datasources_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: druiddatasource_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.druiddatasource_user ALTER COLUMN id SET DEFAULT nextval('public.druiddatasource_user_id_seq'::regclass);


--
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: filter_sets id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets ALTER COLUMN id SET DEFAULT nextval('public.filter_sets_id_seq'::regclass);


--
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: slice_email_schedules id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules ALTER COLUMN id SET DEFAULT nextval('public.slice_email_schedules_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: sql_observations id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_observations ALTER COLUMN id SET DEFAULT nextval('public.sql_observations_id_seq'::regclass);


--
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_write
3	can_this_form_get
4	can_this_form_post
5	can_add
6	can_list
7	can_userinfo
8	can_show
9	can_edit
10	can_delete
11	resetmypassword
12	resetpasswords
13	userinfoedit
14	copyrole
15	can_get
16	can_invalidate
17	can_export
18	can_set_embedded
19	can_get_embedded
20	can_delete_embedded
21	can_import_
22	can_download
23	muldelete
24	can_query
25	can_query_form_data
26	can_time_range
27	can_external_metadata_by_name
28	can_save
29	can_external_metadata
30	can_get_value
31	can_store
32	can_my_queries
33	can_results
34	can_fetch_datasource_metadata
35	can_validate_sql_json
36	can_search_queries
37	can_datasources
38	can_csrf_token
39	can_estimate_query_cost
40	can_fave_dashboards_by_username
41	can_log
42	can_schemas
43	can_schemas_access_for_file_upload
44	can_filter
45	can_sql_json
46	can_publish
47	can_extra_table_metadata
48	can_copy_dash
49	can_approve
50	can_recent_activity
51	can_dashboard_permalink
52	can_testconn
53	can_fave_slices
54	can_import_dashboards
55	can_warm_up_cache
56	can_request_access
57	can_queries
58	can_user_slices
59	can_sqllab_history
60	can_slice
61	can_annotation_json
62	can_available_domains
63	can_csv
64	can_override_role_permissions
65	can_sqllab_viz
66	can_explore_json
67	can_sqllab
68	can_add_slices
69	can_fave_dashboards
70	can_stop_query
71	can_slice_json
72	can_select_star
73	can_tables
74	can_dashboard
75	can_created_dashboards
76	can_created_slices
77	can_explore
78	can_favstar
79	can_profile
80	can_save_dash
81	can_sqllab_table_viz
82	can_sync_druid_source
83	can_expanded
84	can_post
85	can_delete_query
86	can_activate
87	can_migrate_query
88	can_put
89	can_tagged_objects
90	can_suggestions
91	can_grant_guest_token
92	yaml_export
93	can_scan_new_datasources
94	can_refresh_datasources
95	menu_access
96	all_datasource_access
97	all_database_access
98	all_query_access
99	can_share_dashboard
100	can_share_chart
101	database_access
102	schema_access
103	datasource_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	1	3
6	2	3
7	1	4
8	2	4
9	1	5
10	2	5
11	1	6
12	2	6
13	1	7
14	2	7
15	1	8
16	2	8
17	1	9
18	2	9
19	1	10
20	3	15
21	4	15
22	3	16
23	4	16
24	3	17
25	4	17
26	5	19
27	6	19
28	7	19
29	8	19
30	9	19
31	10	19
32	11	19
33	12	19
34	13	19
35	5	20
36	6	20
37	8	20
38	9	20
39	10	20
40	14	20
41	15	21
42	8	22
43	15	23
44	6	24
45	16	25
46	17	4
47	2	27
48	1	27
49	2	28
50	1	28
51	17	8
52	18	8
53	19	8
54	20	8
55	17	9
56	17	6
57	2	29
58	1	29
59	2	30
60	1	30
61	5	31
62	9	31
63	6	31
64	10	31
65	21	32
66	17	32
67	17	1
68	5	33
69	6	33
70	2	33
71	8	33
72	9	33
73	22	33
74	10	33
75	5	34
76	6	34
77	8	34
78	9	34
79	22	34
80	10	34
81	23	34
82	24	35
83	25	35
84	26	35
85	3	36
86	4	36
87	3	37
88	4	37
89	3	38
90	4	38
91	27	39
92	28	39
93	15	39
94	29	39
95	30	41
96	31	41
97	32	43
98	33	44
99	34	44
100	35	44
101	36	44
102	37	44
103	38	44
104	39	44
105	40	44
106	41	44
107	42	44
108	43	44
109	44	44
110	45	44
111	46	44
112	47	44
113	48	44
114	49	44
115	50	44
116	51	44
117	52	44
118	53	44
119	54	44
120	55	44
121	56	44
122	57	44
123	58	44
124	59	44
125	60	44
126	61	44
127	62	44
128	63	44
129	64	44
130	65	44
131	66	44
132	67	44
133	68	44
134	69	44
135	70	44
136	71	44
137	72	44
138	73	44
139	74	44
140	75	44
141	76	44
142	77	44
143	78	44
144	79	44
145	80	44
146	81	44
147	82	44
148	83	45
149	10	45
150	84	45
151	85	46
152	86	46
153	87	46
154	84	46
155	88	46
156	15	46
157	10	46
158	89	47
159	84	47
160	90	47
161	15	47
162	10	47
163	91	48
164	1	48
165	5	49
166	6	49
167	8	49
168	9	49
169	10	49
170	23	49
171	5	50
172	6	50
173	8	50
174	9	50
175	10	50
176	23	50
177	5	51
178	6	51
179	8	51
180	9	51
181	10	51
182	8	52
183	6	52
184	8	53
185	6	53
186	5	54
187	6	54
188	8	54
189	9	54
190	10	54
191	23	54
192	5	55
193	6	55
194	8	55
195	9	55
196	10	55
197	23	55
198	92	55
199	5	56
200	6	56
201	8	56
202	9	56
203	10	56
204	23	56
205	92	56
206	5	57
207	9	57
208	6	57
209	10	57
210	5	58
211	9	58
212	6	58
213	10	58
214	93	59
215	94	59
216	95	60
217	95	61
218	95	62
219	95	63
220	95	64
221	95	65
222	95	66
223	95	67
224	95	68
225	95	69
226	95	70
227	95	71
228	95	72
229	95	73
230	95	74
231	95	75
232	95	76
233	95	77
234	95	78
235	95	79
236	95	80
237	95	81
238	95	82
239	95	83
240	95	84
241	95	85
242	95	86
243	95	87
244	95	88
245	96	89
246	97	90
247	98	91
248	99	44
249	100	44
250	101	92
251	102	93
252	102	94
253	102	95
254	102	96
255	102	97
256	103	98
257	103	99
267	103	109
268	103	110
269	103	111
270	103	112
271	103	113
272	103	114
273	103	115
274	103	116
275	103	117
276	103	118
277	103	119
278	103	120
279	103	121
280	103	122
281	103	123
282	103	124
283	103	125
284	103	126
285	103	127
286	103	128
287	103	129
288	103	130
289	103	131
290	103	132
291	103	133
292	103	134
293	103	135
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	20	1
2	21	1
3	22	1
4	23	1
5	24	1
6	25	1
7	26	1
8	27	1
9	28	1
10	29	1
11	30	1
12	31	1
13	32	1
14	33	1
15	34	1
16	35	1
17	36	1
18	37	1
19	38	1
20	39	1
21	40	1
22	41	1
23	42	1
24	43	1
25	9	1
26	10	1
27	44	1
28	45	1
29	46	1
30	7	1
31	8	1
32	3	1
33	4	1
34	47	1
35	48	1
36	49	1
37	50	1
38	51	1
39	52	1
40	53	1
41	54	1
42	15	1
43	16	1
44	55	1
45	17	1
46	18	1
47	56	1
48	11	1
49	12	1
50	57	1
51	58	1
52	59	1
53	60	1
54	61	1
55	62	1
56	63	1
57	64	1
58	65	1
59	66	1
60	19	1
61	5	1
62	6	1
63	67	1
64	1	1
65	2	1
66	68	1
67	69	1
68	70	1
69	71	1
70	72	1
71	73	1
72	74	1
73	75	1
74	76	1
75	77	1
76	78	1
77	79	1
78	80	1
79	81	1
80	82	1
81	83	1
82	84	1
83	85	1
84	86	1
85	87	1
86	88	1
87	89	1
88	90	1
89	91	1
90	92	1
91	93	1
92	94	1
93	95	1
94	96	1
95	97	1
96	98	1
97	99	1
98	100	1
99	101	1
100	102	1
101	103	1
102	104	1
103	105	1
104	106	1
105	107	1
106	108	1
107	109	1
108	110	1
109	111	1
110	112	1
111	113	1
112	114	1
113	115	1
114	116	1
115	117	1
116	118	1
117	119	1
118	120	1
119	121	1
120	122	1
121	123	1
122	124	1
123	125	1
124	126	1
125	127	1
126	128	1
127	129	1
128	130	1
129	131	1
130	132	1
131	133	1
132	134	1
133	135	1
134	136	1
135	137	1
136	138	1
137	139	1
138	140	1
139	141	1
140	142	1
141	143	1
142	144	1
143	145	1
144	146	1
145	147	1
146	148	1
147	149	1
148	150	1
149	151	1
150	152	1
151	153	1
152	154	1
153	155	1
154	156	1
155	157	1
156	158	1
157	159	1
158	160	1
159	161	1
160	162	1
161	13	1
162	14	1
163	163	1
164	164	1
165	165	1
166	166	1
167	167	1
168	168	1
169	169	1
170	170	1
171	171	1
172	172	1
173	173	1
174	174	1
175	175	1
176	176	1
177	177	1
178	178	1
179	179	1
180	180	1
181	181	1
182	182	1
183	183	1
184	184	1
185	185	1
186	186	1
187	187	1
188	188	1
189	189	1
190	190	1
191	191	1
192	192	1
193	193	1
194	194	1
195	195	1
196	196	1
197	197	1
198	198	1
199	199	1
200	200	1
201	201	1
202	202	1
203	203	1
204	204	1
205	205	1
206	206	1
207	207	1
208	208	1
209	209	1
210	210	1
211	211	1
212	212	1
213	213	1
214	214	1
215	215	1
216	216	1
217	217	1
218	218	1
219	219	1
220	220	1
221	221	1
222	222	1
223	223	1
224	224	1
225	225	1
226	226	1
227	227	1
228	228	1
229	229	1
230	230	1
231	231	1
232	232	1
233	233	1
234	234	1
235	235	1
236	236	1
237	237	1
238	238	1
239	239	1
240	240	1
241	241	1
242	242	1
243	243	1
244	244	1
245	245	1
246	246	1
247	247	1
248	248	1
249	249	1
250	1	5
251	2	5
252	3	5
253	4	5
254	5	5
255	6	5
256	7	5
257	8	5
258	9	5
259	10	5
260	11	5
261	12	5
262	15	5
263	16	5
264	17	5
265	19	5
266	22	5
267	23	5
268	24	5
269	25	5
270	28	5
271	32	5
272	41	5
273	42	5
274	43	5
275	44	5
276	45	5
277	46	5
278	47	5
279	48	5
280	49	5
281	50	5
282	51	5
283	53	5
284	54	5
285	56	5
286	57	5
287	58	5
288	59	5
289	60	5
290	61	5
291	62	5
292	63	5
293	64	5
294	65	5
295	66	5
296	67	5
297	69	5
298	71	5
299	82	5
300	83	5
301	84	5
302	85	5
303	86	5
304	87	5
305	88	5
306	89	5
307	90	5
308	91	5
309	92	5
310	93	5
311	94	5
312	95	5
313	96	5
314	97	5
315	98	5
316	99	5
317	100	5
318	101	5
319	102	5
320	103	5
321	104	5
322	105	5
323	106	5
324	107	5
325	108	5
326	109	5
327	111	5
328	112	5
329	113	5
330	115	5
331	116	5
332	117	5
333	118	5
334	119	5
335	120	5
336	121	5
337	122	5
338	123	5
339	124	5
340	125	5
341	126	5
342	127	5
343	128	5
344	130	5
345	131	5
346	132	5
347	133	5
348	134	5
349	135	5
350	136	5
351	137	5
352	138	5
353	139	5
354	140	5
355	141	5
356	142	5
357	143	5
358	144	5
359	145	5
360	146	5
361	148	5
362	149	5
363	150	5
364	151	5
365	152	5
366	153	5
367	154	5
368	155	5
369	156	5
370	157	5
371	158	5
372	159	5
373	160	5
374	161	5
375	162	5
376	164	5
377	165	5
378	166	5
379	167	5
380	168	5
381	169	5
382	170	5
383	171	5
384	172	5
385	173	5
386	174	5
387	175	5
388	176	5
389	177	5
390	178	5
391	179	5
392	180	5
393	181	5
394	182	5
395	183	5
396	184	5
397	185	5
398	192	5
399	193	5
400	194	5
401	195	5
402	196	5
403	197	5
404	198	5
405	200	5
406	201	5
407	206	5
408	207	5
409	208	5
410	209	5
411	210	5
412	211	5
413	212	5
414	213	5
415	214	5
416	215	5
417	217	5
418	218	5
419	220	5
420	221	5
421	222	5
422	223	5
423	224	5
424	225	5
425	226	5
426	227	5
427	228	5
428	229	5
429	230	5
430	231	5
431	232	5
432	233	5
433	235	5
434	236	5
435	237	5
436	238	5
437	239	5
438	240	5
439	241	5
440	242	5
441	243	5
442	245	5
443	246	5
444	248	5
445	249	5
446	1	6
447	2	6
448	3	6
449	4	6
450	5	6
451	6	6
452	7	6
453	8	6
454	9	6
455	10	6
456	11	6
457	15	6
458	16	6
459	17	6
460	19	6
461	22	6
462	23	6
463	24	6
464	25	6
465	28	6
466	32	6
467	41	6
468	42	6
469	43	6
470	44	6
471	45	6
472	46	6
473	47	6
474	48	6
475	49	6
476	50	6
477	51	6
478	53	6
479	54	6
480	57	6
481	58	6
482	59	6
483	60	6
484	61	6
485	62	6
486	63	6
487	64	6
488	65	6
489	66	6
490	67	6
491	69	6
492	71	6
493	82	6
494	83	6
495	84	6
496	85	6
497	86	6
498	87	6
499	88	6
500	89	6
501	90	6
502	91	6
503	93	6
504	94	6
505	95	6
506	96	6
507	97	6
508	98	6
509	99	6
510	100	6
511	101	6
512	102	6
513	103	6
514	104	6
515	105	6
516	106	6
517	107	6
518	108	6
519	109	6
520	111	6
521	112	6
522	113	6
523	115	6
524	116	6
525	117	6
526	118	6
527	119	6
528	120	6
529	121	6
530	122	6
531	123	6
532	124	6
533	125	6
534	126	6
535	127	6
536	128	6
537	130	6
538	131	6
539	132	6
540	133	6
541	134	6
542	135	6
543	136	6
544	137	6
545	138	6
546	139	6
547	140	6
548	141	6
549	142	6
550	143	6
551	144	6
552	145	6
553	146	6
554	148	6
555	149	6
556	150	6
557	151	6
558	152	6
559	153	6
560	154	6
561	155	6
562	156	6
563	157	6
564	158	6
565	159	6
566	160	6
567	161	6
568	162	6
569	164	6
570	165	6
571	166	6
572	167	6
573	168	6
574	169	6
575	171	6
576	172	6
577	173	6
578	174	6
579	175	6
580	177	6
581	178	6
582	179	6
583	180	6
584	181	6
585	182	6
586	183	6
587	184	6
588	185	6
589	193	6
590	194	6
591	200	6
592	201	6
593	208	6
594	212	6
595	214	6
596	215	6
597	217	6
598	218	6
599	220	6
600	221	6
601	222	6
602	224	6
603	225	6
604	227	6
605	228	6
606	229	6
607	230	6
608	231	6
609	232	6
610	233	6
611	235	6
612	236	6
613	237	6
614	238	6
615	239	6
616	240	6
617	241	6
618	242	6
619	243	6
620	248	6
621	249	6
622	114	7
623	129	7
624	1	8
625	17	8
626	110	8
627	128	8
628	130	8
629	132	8
630	146	8
631	234	8
632	235	8
633	236	8
634	237	8
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
3	Public
5	Alpha
6	Gamma
7	granter
8	sql_lab
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	admin	admin	admin	pbkdf2:sha256:150000$7HAT2Swr$962951bf4e5198905fa554e7bbe0f7b883a003ed118b8211986c35de38eb7c80	t	admin	2023-08-06 17:07:32.001904	2	0	2023-07-29 16:26:44.223196	2023-07-29 16:26:44.223204	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	SavedQuery
2	CssTemplate
3	ReportSchedule
4	Chart
5	Annotation
6	Dataset
7	Log
8	Dashboard
9	Database
10	Query
11	SupersetIndexView
12	UtilView
13	LocaleView
14	SecurityApi
15	ResetPasswordView
16	ResetMyPasswordView
17	UserInfoEditView
18	AuthDBView
19	UserDBModelView
20	RoleModelView
21	OpenApi
22	SwaggerView
23	MenuApi
24	AsyncEventsRestApi
25	CacheRestApi
26	CurrentUserRestApi
27	DashboardFilterStateRestApi
28	DashboardPermalinkRestApi
29	ExploreFormDataRestApi
30	ExplorePermalinkRestApi
31	FilterSets
32	ImportExportRestApi
33	DynamicPlugin
34	RowLevelSecurityFiltersModelView
35	Api
36	CsvToDatabaseView
37	ExcelToDatabaseView
38	ColumnarToDatabaseView
39	Datasource
40	EmbeddedView
41	KV
42	R
43	SqlLab
44	Superset
45	TableSchemaView
46	TabStateView
47	TagView
48	SecurityRestApi
49	DashboardEmailScheduleView
50	SliceEmailScheduleView
51	AlertModelView
52	AlertLogModelView
53	AlertObservationModelView
54	AccessRequestsModelView
55	DruidDatasourceModelView
56	DruidClusterModelView
57	DruidMetricInlineView
58	DruidColumnInlineView
59	Druid
60	Security
61	List Users
62	List Roles
63	Row Level Security
64	Action Log
65	Access requests
66	Home
67	Manage
68	Annotation Layers
69	Plugins
70	CSS Templates
71	Import Dashboards
72	Dashboard Email Schedules
73	Chart Emails
74	Alerts
75	Alerts & Report
76	Dashboards
77	Charts
78	SQL Lab
79	SQL Editor
80	Saved Queries
81	Query Search
82	Data
83	Databases
84	Datasets
85	Druid Datasources
86	Druid Clusters
87	Scan New Datasources
88	Refresh Druid Metadata
89	all_datasource_access
90	all_database_access
91	all_query_access
92	[ClickHouse].(id:1)
93	[ClickHouse].[INFORMATION_SCHEMA]
94	[ClickHouse].[clickhouse]
95	[ClickHouse].[default]
96	[ClickHouse].[information_schema]
97	[ClickHouse].[system]
98	[ClickHouse].[dm_real_time_tx_processing](id:1)
99	[ClickHouse].[dm_real_time_tx_processing.tx_table ](id:2)
109	[ClickHouse].[dm_real_time_tx_processing.price_chart 08/06/2023 21:40:42](id:12)
110	[ClickHouse].[dm_real_time_tx_processing.price_chart](id:12)
111	[ClickHouse].[dm_real_time_tx_processing.tx_qty](id:13)
112	[ClickHouse].[dm_real_time_tx_processing.tx_qty_by_side](id:13)
113	[ClickHouse].[dm_real_time_tx_processing.tx_vol_by_side](id:14)
114	[ClickHouse].[dm_real_time_tx_processing.tx_qty](id:15)
115	[ClickHouse].[dm_real_time_tx_processing.tx_makers_by_side](id:16)
116	[ClickHouse].[dm_real_time_tx_processing.tx_vol](id:17)
117	[ClickHouse].[dm_real_time_tx_processing.tx_makers](id:18)
118	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_by_side](id:16)
119	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_total](id:18)
120	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_total](id:17)
121	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_by_side](id:14)
122	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_total](id:15)
123	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_by_side](id:13)
124	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_chart](id:12)
125	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_table ](id:2)
126	[ClickHouse].[dm_real_time_tx_processing.price_current](id:19)
127	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_current](id:19)
128	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_30s_change](id:20)
129	[ClickHouse].[dm_real_time_tx_processing.price_60s_change](id:21)
130	[ClickHouse].[dm_real_time_tx_processing.price_1m_change](id:21)
131	[ClickHouse].[dm_real_time_tx_processing.price_5m_change](id:22)
132	[ClickHouse].[dm_real_time_tx_processing.price_10m_change](id:23)
133	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_1m_change](id:21)
134	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_5m_change](id:22)
135	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_10m_change](id:23)
\.


--
-- Data for Name: access_request; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.access_request (created_on, changed_on, id, datasource_type, datasource_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alembic_version (version_num) FROM stdin;
58df9d617f14
\.


--
-- Data for Name: alert_logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alert_logs (id, scheduled_dttm, dttm_start, dttm_end, alert_id, state) FROM stdin;
\.


--
-- Data for Name: alert_owner; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alert_owner (id, user_id, alert_id) FROM stdin;
\.


--
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alerts (id, label, active, crontab, alert_type, log_retention, grace_period, recipients, slice_id, dashboard_id, last_eval_dttm, last_state, slack_channel, changed_by_fk, changed_on, created_by_fk, created_on, validator_config, database_id, sql, validator_type) FROM stdin;
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk, json_metadata) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.cache_keys (id, cache_key, cache_timeout, datasource_uid, created_on) FROM stdin;
\.


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.clusters (created_on, changed_on, id, cluster_name, broker_host, broker_port, broker_endpoint, metadata_last_refreshed, created_by_fk, changed_by_fk, cache_timeout, verbose_name, broker_pass, broker_user, uuid) FROM stdin;
\.


--
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.columns (created_on, changed_on, id, column_name, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, dimension_spec_json, verbose_name, datasource_id, uuid) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: dashboard_email_schedules; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_email_schedules (created_on, changed_on, id, active, crontab, recipients, deliver_as_group, delivery_type, dashboard_id, created_by_fk, changed_by_fk, user_id, slack_channel, uuid) FROM stdin;
\.


--
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_roles (id, role_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
6	1	6
8	1	8
10	1	10
12	1	12
13	1	11
14	1	13
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2023-07-29 16:29:03.19564	2023-08-09 10:41:54.091701	1	D3 WETH/USDC	{"CHART--TFwr2vYVz":{"children":[],"id":"CHART--TFwr2vYVz","meta":{"chartId":22,"height":21,"sliceName":"PRICE 10M CHANGE","sliceNameOverride":"10m","uuid":"2c6a8cee-56a8-4136-88b3-be85d0b06549","width":2},"parents":["ROOT_ID","GRID_ID","ROW-Ul07fiuTPJ"],"type":"CHART"},"CHART-5rx8sn4VhK":{"children":[],"id":"CHART-5rx8sn4VhK","meta":{"chartId":21,"height":21,"sliceName":"PRICE 5M CHANGE","sliceNameOverride":"5m","uuid":"5cc50e68-8a60-4e38-acfb-a5b3303c3976","width":2},"parents":["ROOT_ID","GRID_ID","ROW-Ul07fiuTPJ"],"type":"CHART"},"CHART-FdlZ-E6Q_x":{"children":[],"id":"CHART-FdlZ-E6Q_x","meta":{"chartId":17,"height":21,"sliceName":"TX MAKERS TOTAL","sliceNameOverride":"TOTAL 24H","uuid":"5803d88f-6265-4ccb-a809-8484a74ad7bd","width":2},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-BZUChbEolw"],"type":"CHART"},"CHART-IkDqLlID-O":{"children":[],"id":"CHART-IkDqLlID-O","meta":{"chartId":13,"height":21,"sliceName":"TX MAKERS 24H","uuid":"15bc1fe4-5e78-400b-af05-f821853850f4","width":3},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-ltDedGrKMY"],"type":"CHART"},"CHART-Nmt6clxjPf":{"children":[],"id":"CHART-Nmt6clxjPf","meta":{"chartId":8,"height":67,"sliceName":"PRICE CHART","uuid":"190e42d4-63c7-4960-95bb-eb26f839f53e","width":4},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-zyv3RLddTm"],"type":"CHART"},"CHART-QW1_P1jeZ1":{"children":[],"id":"CHART-QW1_P1jeZ1","meta":{"chartId":20,"height":21,"sliceName":"PRICE 1M CHANGE","sliceNameOverride":"1m","uuid":"16be3222-3e2f-4756-947f-bfb0643b4565","width":2},"parents":["ROOT_ID","GRID_ID","ROW-Ul07fiuTPJ"],"type":"CHART"},"CHART-UUTgjhGR5u":{"children":[],"id":"CHART-UUTgjhGR5u","meta":{"chartId":19,"height":21,"sliceName":"PRICE 30S CHANGE","sliceNameOverride":"30s","uuid":"a74e0f9c-c39a-46c0-8de5-29267d9693a1","width":2},"parents":["ROOT_ID","GRID_ID","ROW-Ul07fiuTPJ"],"type":"CHART"},"CHART-VYarmI7F2r":{"children":[],"id":"CHART-VYarmI7F2r","meta":{"chartId":12,"height":21,"sliceName":"TX QTY TOTAL","sliceNameOverride":"TOTAL 24H","uuid":"5089ae4d-6c1c-418d-83c5-fe418769fe34","width":2},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-BZUChbEolw"],"type":"CHART"},"CHART-ViBXQz1UWa":{"children":[],"id":"CHART-ViBXQz1UWa","meta":{"chartId":11,"height":21,"sliceName":"TX VOL 24H","uuid":"c0235a57-fc0b-43ed-b6a6-f53df122a97e","width":3},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-ltDedGrKMY"],"type":"CHART"},"CHART-XN3RYbJxsm":{"children":[],"id":"CHART-XN3RYbJxsm","meta":{"chartId":6,"height":57,"sliceName":"TX TABLE","uuid":"7aecabc2-3446-4a77-9712-420f72a2279d","width":12},"parents":["ROOT_ID","GRID_ID","ROW-qQIhRUHTf"],"type":"CHART"},"CHART-aMjrj8NaQ1":{"children":[],"id":"CHART-aMjrj8NaQ1","meta":{"chartId":10,"height":21,"sliceName":"TX QTY 24H","sliceNameOverride":"TX QTY 24H","uuid":"e202f727-64c1-471e-8df1-973faecb0087","width":3},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-ltDedGrKMY"],"type":"CHART"},"CHART-dwQNsIdPLO":{"children":[],"id":"CHART-dwQNsIdPLO","meta":{"chartId":18,"height":21,"sliceName":"PRICE","uuid":"d03e9ad2-7203-4208-b80f-3adc17105cfd","width":4},"parents":["ROOT_ID","GRID_ID","ROW-Ul07fiuTPJ"],"type":"CHART"},"CHART-iY-qA4gjk9":{"children":[],"id":"CHART-iY-qA4gjk9","meta":{"chartId":16,"height":21,"sliceName":"TX VOL TOTAL","sliceNameOverride":"TOTAL 24H","uuid":"e7a90a3b-bf54-4285-a710-dbc9fc4c2da0","width":2},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E","COLUMN-BZUChbEolw"],"type":"CHART"},"COLUMN-BZUChbEolw":{"children":["CHART-VYarmI7F2r","CHART-iY-qA4gjk9","CHART-FdlZ-E6Q_x"],"id":"COLUMN-BZUChbEolw","meta":{"background":"BACKGROUND_TRANSPARENT","width":2},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E"],"type":"COLUMN"},"COLUMN-ltDedGrKMY":{"children":["CHART-aMjrj8NaQ1","CHART-ViBXQz1UWa","CHART-IkDqLlID-O"],"id":"COLUMN-ltDedGrKMY","meta":{"background":"BACKGROUND_TRANSPARENT","width":3},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E"],"type":"COLUMN"},"COLUMN-zyv3RLddTm":{"children":["CHART-Nmt6clxjPf"],"id":"COLUMN-zyv3RLddTm","meta":{"background":"BACKGROUND_TRANSPARENT","width":7},"parents":["ROOT_ID","GRID_ID","ROW-gWK1S8s66E"],"type":"COLUMN"},"DASHBOARD_VERSION_KEY":"v2","DIVIDER-JJ5E28DVee":{"children":[],"id":"DIVIDER-JJ5E28DVee","meta":{},"parents":["ROOT_ID","GRID_ID"],"type":"DIVIDER"},"DIVIDER-wjPy4-dxtq":{"children":[],"id":"DIVIDER-wjPy4-dxtq","meta":{},"parents":["ROOT_ID","GRID_ID"],"type":"DIVIDER"},"GRID_ID":{"children":["ROW-Ul07fiuTPJ","DIVIDER-JJ5E28DVee","ROW-gWK1S8s66E","DIVIDER-wjPy4-dxtq","ROW-qQIhRUHTf"],"id":"GRID_ID","parents":["ROOT_ID"],"type":"GRID"},"HEADER_ID":{"id":"HEADER_ID","meta":{"text":"D3 WETH/USDC"},"type":"HEADER"},"ROOT_ID":{"children":["GRID_ID"],"id":"ROOT_ID","type":"ROOT"},"ROW-Ul07fiuTPJ":{"children":["CHART-UUTgjhGR5u","CHART-QW1_P1jeZ1","CHART-5rx8sn4VhK","CHART--TFwr2vYVz","CHART-dwQNsIdPLO"],"id":"ROW-Ul07fiuTPJ","meta":{"background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"},"ROW-gWK1S8s66E":{"children":["COLUMN-zyv3RLddTm","COLUMN-ltDedGrKMY","COLUMN-BZUChbEolw"],"id":"ROW-gWK1S8s66E","meta":{"background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"},"ROW-qQIhRUHTf":{"children":["CHART-XN3RYbJxsm"],"id":"ROW-qQIhRUHTf","meta":{"0":"ROOT_ID","background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"}}	1	1	@import url('https://fonts.googleapis.com/css2?family=Rubik+Mono+One&display=swap');\n\ndiv[data-test-viz-type=big_number_total] {\n  text-align: center;\n}\n\ndiv[data-test-viz-type=echarts_timeseries_line] .chart-header {\n  display: none;\n}\n\ndiv[data-test-viz-type=table] .dashboard-chart {\n  top: 12px;\n}\n\ndiv[data-test-viz-type=table] .chart-header {\n  text-align: center;\n}\n	\N	\N	{"show_native_filters": true, "color_scheme": "googleCategory10c", "refresh_frequency": 10, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "stagger_refresh": false, "native_filter_configuration": [], "shared_label_colors": {}}	t	05e70fdd-1ba6-4fde-abfb-e44aa30bc47f	\N	\N	f	\N
\.


--
-- Data for Name: datasources; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.datasources (created_on, changed_on, id, datasource_name, is_featured, is_hidden, description, default_endpoint, created_by_fk, changed_by_fk, "offset", cache_timeout, perm, filter_select_enabled, params, fetch_values_from, schema_perm, cluster_id, uuid, is_managed_externally, external_url) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_multi_schema_metadata_fetch, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2023-07-29 16:28:47.549704	2023-07-29 16:28:47.54974	1	ClickHouse	clickhousedb://clickhouse:XXXXXXXXXX@clickhouse:8123/clickhouse	1	1	\\x6b6569354f684d547148414157347434645757446d413d3d	\N	{\n    "metadata_params": {},\n    "engine_params": {},\n    "metadata_cache_timeout": {},\n    "schemas_allowed_for_file_upload": []\n}\n	f	f	t	\N	f	f	\N	f	f	f	\N	\N	f	b9b9f63a-b5a4-4c54-8b54-643a88538fd6	sqlalchemy_form	f	\N
\.


--
-- Data for Name: druiddatasource_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.druiddatasource_user (id, user_id, datasource_id) FROM stdin;
\.


--
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dynamic_plugin (created_on, changed_on, id, name, key, bundle_url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.embedded_dashboards (created_on, changed_on, allow_domain_list, uuid, dashboard_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm) FROM stdin;
\.


--
-- Data for Name: filter_sets; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.filter_sets (created_on, changed_on, id, name, description, json_metadata, owner_id, owner_type, dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
1	explore_permalink	\\x8004953b040000000000007d94288c0763686172744964944b078c09646174617365744964944b0b8c0a64617461736f75726365948c0931315f5f7461626c65948c057374617465947d94288c08666f726d44617461947d94288c0876697a5f74797065948c17656368617274735f74696d657365726965735f6c696e65948c0a64617461736f757263659468048c08736c6963655f6964944b078c0a75726c5f706172616d73947d948c1474696d655f72616e67655f656e64706f696e7473945d94288c09696e636c7573697665948c096578636c757369766594658c106772616e756c61726974795f73716c61948c025453948c0f74696d655f677261696e5f73716c61944e8c0a74696d655f72616e6765948c094e6f2066696c746572948c076d657472696373945d947d94288c09616767726567617465944e8c06636f6c756d6e944e8c0e65787072657373696f6e54797065948c0353514c948c0e686173437573746f6d4c6162656c94888c0569734e657794898c056c6162656c948c055052494345948c0a6f7074696f6e4e616d65948c1e6d65747269635f77656b7131366736717a715f333776646d38317870376c948c0d73716c45787072657373696f6e948c0a415647285052494345299475618c0767726f75706279945d94288c0a424c4f434b434841494e948c08434f4e545241435494658c0d6164686f635f66696c74657273945d948c0a6f726465725f6465736394888c09726f775f6c696d6974944de8038c0f636f6d70617269736f6e5f74797065948c0676616c756573948c0d726573616d706c655f72756c65948c023153948c0f726573616d706c655f6d6574686f64948c066c696e656172948c11616e6e6f746174696f6e5f6c6179657273945d948c0f666f726563617374506572696f6473944b0a8c10666f726563617374496e74657276616c94473fe999999999999a8c13785f617869735f7469746c655f6d617267696e944b0f8c13795f617869735f7469746c655f6d617267696e944b0f8c15795f617869735f7469746c655f706f736974696f6e948c044c656674948c0c636f6c6f725f736368656d65948c0e7375706572736574436f6c6f7273948c0a6f6e6c795f746f74616c94888c0a6d61726b657253697a65944b068c0b73686f775f6c6567656e6494888c0a6c6567656e6454797065948c067363726f6c6c948c116c6567656e644f7269656e746174696f6e948c03746f70948c12785f617869735f74696d655f666f726d6174948c0a736d6172745f64617465948c0c726963685f746f6f6c74697094888c11746f6f6c74697054696d65466f726d6174948c0a736d6172745f64617465948c0d795f617869735f666f726d6174948c0c534d4152545f4e554d424552948c0d7472756e63617465594178697394888c0d795f617869735f626f756e6473945d94284e4e658c0f65787472615f666f726d5f64617461947d94758c0975726c506172616d73945d9475752e	5341bb78-5a1a-47d9-97f2-a0b04299f4a2	2023-08-06 18:24:09.461598	1	\N	\N	\N
2	app	\\x80049544000000000000008c40782d6d6c62414a2d786c2d375150625f30514d344845744859685942356e4976732d6951414e364f444f76656e64526375545a7a6c4d33305372567458365a4e942e	ebc919d5-7c84-36a5-9bb8-785d3ab43385	2023-08-06 18:24:09.474832	\N	\N	\N	\N
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.metrics (id, metric_name, verbose_name, metric_type, json, description, changed_by_fk, changed_on, created_by_fk, created_on, d3format, warning_text, datasource_id, uuid) FROM stdin;
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor) FROM stdin;
2	wphgaT8CF	1	\N	Query clickhouse.dm_real_time_tx_processing	RYLutXGHL	1	success	clickhouse	SELECT `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n       `dm_real_time_tx_processing_swap_side` AS `side`,\n       `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n       `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n       `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n       `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n       `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n       `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n       `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 10000;	\N	SELECT `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n       `dm_real_time_tx_processing_swap_side` AS `side`,\n       `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n       `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n       `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n       `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n       `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n       `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n       `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	33	\N	1690667119782.105000	2023-07-29 21:45:20.186702	1690667120172.067000	\N	1690667119933.602000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
65	thAFd1jSV	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691350482931.338100	2023-08-06 19:34:43.432703	1691350483358.515900	\N	1691350483041.007000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
142	aB_igfbjK	1	\N	Untitled Query 1	BT9MW6hpKE	1	success	clickhouse	SELECT\r\n    ROUND(SUM(`dm_real_time_tx_processing_t0_amount`), 2) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    ROUND(SUM(`dm_real_time_tx_processing_t0_amount`), 2) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691420765731.959000	2023-08-07 15:06:06.079234	1691420766066.264000	\N	1691420765804.742200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
3	cxew6_cQx	1	\N	Query clickhouse.dm_real_time_tx_processing	RYLutXGHL	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_swap_side` AS `side`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_swap_side` AS `side`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	36	\N	1690667216787.701000	2023-07-29 21:46:57.086332	1690667217073.989000	\N	1690667216852.871800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
5	RJKAPxXE4	1	\N	TX TABLE	v5tKlNW91i	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_swap_side` AS `side`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_swap_side` AS `side`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	74	\N	1690667882436.190000	2023-07-29 21:58:02.807886	1690667882782.748000	\N	1690667882529.722000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
8	fR9YDpOIS	1	\N	TX TABLE	UrysWjOkA	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	105	\N	1690668509584.658000	2023-07-29 22:08:29.978631	1690668509962.566000	\N	1690668509706.633000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
1	RUGH7FJt4y	1	\N	Query clickhouse.dm_real_time_tx_processing	RYLutXGHL	1	success	clickhouse	SELECT `dm_real_time_tx_processing_timestamp` AS `dm_real_time_tx_processing_timestamp`,\n       `dm_real_time_tx_processing_swap_side` AS `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_t0_symbol` AS `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t0_amount` AS `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_symbol` AS `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t1_amount` AS `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_maker` AS `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_tx_hash` AS `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_blockchain` AS `dm_real_time_tx_processing_blockchain`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 10000;	\N	SELECT `dm_real_time_tx_processing_timestamp` AS `dm_real_time_tx_processing_timestamp`,\n       `dm_real_time_tx_processing_swap_side` AS `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_t0_symbol` AS `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t0_amount` AS `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_symbol` AS `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t1_amount` AS `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_maker` AS `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_tx_hash` AS `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_blockchain` AS `dm_real_time_tx_processing_blockchain`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	27	\N	1690667061249.121800	2023-07-29 21:44:22.041942	1690667062028.223900	\N	1690667061355.828100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
80	XyCCUKu8aX	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `COUNT TXS`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `COUNT TXS`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691355690110.091000	2023-08-06 21:01:30.651044	1691355690638.296000	\N	1691355690207.391000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
86	DnJjEy1Di	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`,\nFROM \n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`,\nFROM\n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 230 ('`clickhouse.dm_real_time_tx_processing`') (line 6, col 3): `clickhouse.dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001\n FORMAT Native. Expected one of: token, Dot, OR, AND, IS NULL, IS NOT NULL, BETWEEN, NOT BETWEEN, LIKE, ILIKE, NOT LIKE, NOT ILIKE, REGEXP, IN, NOT IN, GLOBAL IN, GLOBAL NOT IN, MOD, DIV, alias, AS, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691358238617.869000	2023-08-06 21:43:58.976373	\N	\N	1691358238732.362000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 230 ('`clickhouse.dm_real_time_tx_processing`') (line 6, col 3): `clickhouse.dm_real_time_tx_processing`\\nGROUP BY\\n  `TS`\\nLIMIT 1001\\n FORMAT Native. Expected one of: token, Dot, OR, AND, IS NULL, IS NOT NULL, BETWEEN, NOT BETWEEN, LIKE, ILIKE, NOT LIKE, NOT ILIKE, REGEXP, IN, NOT IN, GLOBAL IN, GLOBAL NOT IN, MOD, DIV, alias, AS, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
4	GbCkAnEGzR	1	\N		\N	1	success	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 100	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 101	100	f	f	100	74	\N	1690667860049.888000	2023-07-29 21:57:40.482316	1690667860471.507000	\N	1690667860158.637000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
6	ojczbzF3S	1	\N	TX TABLE	UrysWjOkA	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_swap_side` AS `side`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_swap_side` AS `side`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	100	\N	1690668443908.064000	2023-07-29 22:07:24.504854	1690668444473.192900	\N	1690668444085.580000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
7	NDf1lM4FZ	1	\N	TX TABLE	UrysWjOkA	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount` * -1,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount` * -1,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` AS `t0_amount` * -1,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount` * -1,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 178 ('*') (line 4, col 57): * -1,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount` * -1,\n  `dm_real_time_tx_processing_swap_. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1690668486048.965800	2023-07-29 22:08:06.431256	\N	\N	1690668486159.131000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 178 ('*') (line 4, col 57): * -1,\\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\\n  `dm_real_time_tx_processing_t1_amount` AS `t1_amount` * -1,\\n  `dm_real_time_tx_processing_swap_. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
12	pYq5esod3	1	\N	TX TABLE	3Gs9UW5HX3	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\r\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\r\n  `dm_real_time_tx_processing_address` AS `address`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\n  `dm_real_time_tx_processing_address` AS `address`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	14	\N	1691184170371.577000	2023-08-04 21:22:50.912993	1691184170872.909200	\N	1691184170466.067100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
9	k6ijjeu7p	1	\N	TX TABLE	UrysWjOkA	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_swap_side` AS `side`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_swap_side` AS `side`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	110	\N	1690668534892.594000	2023-07-29 22:08:55.315068	1690668535299.089800	\N	1690668535054.576000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
15	L3fKIOCh8	1	\N	TX TABLE	Lq7rOL8hq	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	42	\N	1691184769190.884000	2023-08-04 21:32:49.533349	1691184769503.937000	\N	1691184769258.349900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
25	g608eW524	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	19	\N	1691249342979.552000	2023-08-05 15:29:03.416707	1691249343404.436000	\N	1691249343090.361000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
18	Lleu86K2Z	1	\N	TX TABLE	WVKMIEetSL	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 163 ('SUM') (line 4, col 3): SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol`. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691242997021.478000	2023-08-05 13:43:17.397498	\N	\N	1691242997131.307000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 163 ('SUM') (line 4, col 3): SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\\n  `dm_real_time_tx_processing_protocol`. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
235	u5c3CSBUV	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	\r\n--   `POOL`,\r\n--   `VOLUME`	\N	\N	1000	f	f	0	\N	local variable 'result_set' referenced before assignment	1691578948271.802000	2023-08-09 11:02:28.450086	\N	\N	1691578948363.885000	\N	\N	{"errors": [{"message": "local variable 'result_set' referenced before assignment", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
10	37eNZgeO7	1	\N	TX TABLE	UrysWjOkA	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	110	\N	1690668548107.001000	2023-07-29 22:09:08.396097	1690668548380.619100	\N	1690668548172.389000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
38	HKRIjNAzG	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  '<a href="google.com">google</a>',\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  '<a href="google.com">google</a>',\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342823555.454000	2023-08-06 17:27:04.002463	1691342823991.951000	\N	1691342823717.206000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
144	QjMflZNik	1	\N	dm_real_time_tx_processing.tx_vol	P-KZOi13OK	1	success	clickhouse	SELECT\r\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691421166000.994000	2023-08-07 15:12:46.373622	1691421166364.011000	\N	1691421166106.704000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
13	8N7rBxLuS	1	\N	TX TABLE	3Gs9UW5HX3	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\r\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\r\n  `dm_real_time_tx_processing_address` AS `address`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\n  `dm_real_time_tx_processing_address` AS `address`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	15	\N	1691184202464.171900	2023-08-04 21:23:22.777702	1691184202763.657000	\N	1691184202539.281000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
81	96n2gqg0q	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `QTY`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `QTY`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691355702662.362000	2023-08-06 21:01:42.923446	1691355702915.874000	\N	1691355702753.227000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
143	3JV0sD3Wq	1	\N	Untitled Query 1	BT9MW6hpKE	1	success	clickhouse	SELECT\r\n    ABS(ROUND(SUM(`dm_real_time_tx_processing_t0_amount`), 2)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    ABS(ROUND(SUM(`dm_real_time_tx_processing_t0_amount`), 2)) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691420773509.017000	2023-08-07 15:06:14.070649	1691420774064.406000	\N	1691420773603.461000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
16	nC3zfgoJ_	1	\N	TX TABLE	Lq7rOL8hq	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\r\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\r\n  `dm_real_time_tx_processing_address` AS `address`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\n  `dm_real_time_tx_processing_address` AS `address`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	42	\N	1691184821096.927000	2023-08-04 21:33:41.811999	1691184821798.524000	\N	1691184821255.162000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
11	stTQzSryI	1	\N	TX TABLE	nrsw2-0Ai	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	111	\N	1690668601154.819000	2023-07-29 22:10:01.617996	1690668601589.797000	\N	1690668601277.254200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
26	rY6C5kmGK	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	20	\N	1691249407309.122000	2023-08-05 15:30:07.656118	1691249407646.290000	\N	1691249407405.794000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
66	fFbwTEvaG	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'CONTRACT' 'BLOCKCHAIN' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, abs(avg(dm_real_time_tx_processing_swap_quote_price)) AS PRICE, concat(dm_real_time_tx_processing_blockchain, dm_real_time_tx_processing_address) AS POOL FROM clickhouse.dm_real_time_tx_processing GROUP BY TS, BLOCKCHAIN, CONTRACT ORDER BY TS DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'BLOCKCHAIN' 'CONTRACT' 'dm_real_time_tx_processing_swap_quote_price' 'dm_real_time_tx_processing_blockchain' 'dm_real_time_tx_processing_address', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_swap_quote_price', 'dm_real_time_tx_processing_blockchain' or 'dm_real_time_tx_processing_address'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691350561299.732000	2023-08-06 19:36:01.638037	\N	\N	1691350561435.097000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'CONTRACT' 'BLOCKCHAIN' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, abs(avg(dm_real_time_tx_processing_swap_quote_price)) AS PRICE, concat(dm_real_time_tx_processing_blockchain, dm_real_time_tx_processing_address) AS POOL FROM clickhouse.dm_real_time_tx_processing GROUP BY TS, BLOCKCHAIN, CONTRACT ORDER BY TS DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'BLOCKCHAIN' 'CONTRACT' 'dm_real_time_tx_processing_swap_quote_price' 'dm_real_time_tx_processing_blockchain' 'dm_real_time_tx_processing_address', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_swap_quote_price', 'dm_real_time_tx_processing_blockchain' or 'dm_real_time_tx_processing_address'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
14	J61uoDXfC	1	\N	TX TABLE	Lq7rOL8hq	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	29	\N	1691184437216.797000	2023-08-04 21:27:18.219511	1691184438113.723100	\N	1691184437332.387000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
17	Jk5Eu4vGQ	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\r\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\r\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\r\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\r\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\r\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\r\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\r\n  `dm_real_time_tx_processing_address` AS `address`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `timestamp`,\n  `dm_real_time_tx_processing_t0_symbol` AS `t0_symbol`,\n  `dm_real_time_tx_processing_t0_amount` * -1 AS `t0_amount`,\n  `dm_real_time_tx_processing_t1_symbol` AS `t1_symbol`,\n  `dm_real_time_tx_processing_t1_amount` *-1 AS `t1_amount`,\n  `dm_real_time_tx_processing_swap_maker` AS `swap_maker`,\n  `dm_real_time_tx_processing_tx_hash` AS `tx_hash`,\n  `dm_real_time_tx_processing_blockchain` AS `blockchain`,\n  `dm_real_time_tx_processing_protocol` AS `protocol`,\n  `dm_real_time_tx_processing_address` AS `address`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	100	42	\N	1691185471890.524000	2023-08-04 21:44:32.215623	1691185472201.421100	\N	1691185471968.168000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
19	Y-Dwuvueb	1	\N	TX TABLE	WVKMIEetSL	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `timestamp` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `timestamp` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'timestamp' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, abs(avg(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount)) AS PRICE, sum(dm_real_time_tx_processing_t0_amount) * -1 AS VOLUME, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_address AS ADDRESS, dm_real_time_tx_processing_swap_maker AS MAKER, dm_real_time_tx_processing_tx_hash AS `TX HASH` FROM clickhouse.dm_real_time_tx_processing GROUP BY TS, BLOCKCHAIN, PROTOCOL, ADDRESS, MAKER, `TX HASH` ORDER BY timestamp DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'dm_real_time_tx_processing_blockchain' 'dm_real_time_tx_processing_t1_amount' 'dm_real_time_tx_processing_address' 'dm_real_time_tx_processing_protocol' 'dm_real_time_tx_processing_t0_amount' 'dm_real_time_tx_processing_tx_hash' 'dm_real_time_tx_processing_swap_maker' 'timestamp', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_blockchain', 'dm_real_time_tx_processing_t1_amount', 'dm_real_time_tx_processing_address', 'dm_real_time_tx_processing_protocol', 'dm_real_time_tx_processing_t0_amount', 'dm_real_time_tx_processing_tx_hash' or 'dm_real_time_tx_processing_swap_maker'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691243018977.515000	2023-08-05 13:43:39.50447	\N	\N	1691243019156.575000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'timestamp' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, abs(avg(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount)) AS PRICE, sum(dm_real_time_tx_processing_t0_amount) * -1 AS VOLUME, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_address AS ADDRESS, dm_real_time_tx_processing_swap_maker AS MAKER, dm_real_time_tx_processing_tx_hash AS `TX HASH` FROM clickhouse.dm_real_time_tx_processing GROUP BY TS, BLOCKCHAIN, PROTOCOL, ADDRESS, MAKER, `TX HASH` ORDER BY timestamp DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'dm_real_time_tx_processing_blockchain' 'dm_real_time_tx_processing_t1_amount' 'dm_real_time_tx_processing_address' 'dm_real_time_tx_processing_protocol' 'dm_real_time_tx_processing_t0_amount' 'dm_real_time_tx_processing_tx_hash' 'dm_real_time_tx_processing_swap_maker' 'timestamp', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_blockchain', 'dm_real_time_tx_processing_t1_amount', 'dm_real_time_tx_processing_address', 'dm_real_time_tx_processing_protocol', 'dm_real_time_tx_processing_t0_amount', 'dm_real_time_tx_processing_tx_hash' or 'dm_real_time_tx_processing_swap_maker'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
27	Z6X-Pl5Bn	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	11	\N	1691249826786.451200	2023-08-05 15:37:07.071528	1691249827060.338100	\N	1691249826872.135000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
67	MvIxqt79C	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691350590072.976000	2023-08-06 19:36:30.429009	1691350590415.043200	\N	1691350590200.191000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
82	I2Wa3It_Z3	1	\N	Query clickhouse.dm_real_time_tx_processing.tx_qty	rRC2zJaLnF	1	success	clickhouse	SELECT\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `QTY`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `QTY`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691356448233.588900	2023-08-06 21:14:08.823815	1691356448785.428000	\N	1691356448341.967000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
33	BE2j9ORrO	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342323319.628000	2023-08-06 17:18:43.880636	1691342323869.421900	\N	1691342323456.296900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
84	SdkbzCve6	1	\N	Query clickhouse.dm_real_time_tx_processing.tx_qty	rRC2zJaLnF	1	success	clickhouse	SELECT\r\n  toDate(NOW()) AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `QTY`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  toDate(NOW()) AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `QTY`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691356580457.465800	2023-08-06 21:16:21.25028	1691356581187.279000	\N	1691356580559.098000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
20	AMOui8paj	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	142	\N	1691243083674.469000	2023-08-05 13:44:44.065979	1691243084053.103000	\N	1691243083762.875000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
51	l9ezTNmri	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691344109119.082000	2023-08-06 17:48:29.70243	1691344109665.792000	\N	1691344109252.182900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
28	Bnyf62sQ5	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691341810542.202000	2023-08-06 17:10:10.889645	1691341810877.093000	\N	1691341810649.266800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
95	0iYht0zNf	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	21	\N	1691358504652.252000	2023-08-06 21:48:25.020971	1691358504999.102000	\N	1691358504756.091000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
39	kluiGbt_C	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  <a href="google.com">google</a>,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  <a href="google.com">google</a>,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 450 ('<') (line 12, col 3): <a href="google.com">google</a>,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_ti. Expected one of: expression with optional alias, element of expression with optional alias, lambda expression, CAST operator, NOT, INTERVAL, CASE, DATE, TIMESTAMP, tuple, collection of literals, array, number, literal, NULL, Bool, true, false, string literal, asterisk, qualified asterisk, compound identifier, list of elements, identifier, COLUMNS matcher, COLUMNS, qualified COLUMNS matcher, substitution, MySQL-style global variable, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691342835552.460000	2023-08-06 17:27:16.067481	\N	\N	1691342835741.329800	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 450 ('<') (line 12, col 3): <a href=\\"google.com\\">google</a>,\\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\\n  `dm_real_ti. Expected one of: expression with optional alias, element of expression with optional alias, lambda expression, CAST operator, NOT, INTERVAL, CASE, DATE, TIMESTAMP, tuple, collection of literals, array, number, literal, NULL, Bool, true, false, string literal, asterisk, qualified asterisk, compound identifier, list of elements, identifier, COLUMNS matcher, COLUMNS, qualified COLUMNS matcher, substitution, MySQL-style global variable, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
21	hJYR1G-l_	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	142	\N	1691243394771.681200	2023-08-05 13:49:55.296067	1691243395279.593000	\N	1691243394898.360000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
83	mDyoyFRsk	1	\N	Query clickhouse.dm_real_time_tx_processing.tx_qty	rRC2zJaLnF	1	success	clickhouse	SELECT\r\n  NOW() AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `QTY`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  NOW() AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `QTY`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691356535796.235000	2023-08-06 21:15:36.267599	1691356536229.232200	\N	1691356535915.702100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
68	53hqc5TlY	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691350601174.268000	2023-08-06 19:36:41.50423	1691350601495.680200	\N	1691350601291.896000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
40	5XUCXl2ga	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	failed	clickhouse	<a href="google.com">google</a>	\N	\N	1000	f	f	0	\N	Only SELECT statements are allowed against this database.	1691342846032.418000	2023-08-06 17:27:26.212145	\N	\N	1691342846113.593000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "Only SELECT statements are allowed against this database.", "error_type": "DML_NOT_ALLOWED_ERROR", "level": "error", "extra": {"issue_codes": [{"code": 1022, "message": "Issue 1022 - Database does not allow data manipulation."}]}}]}	\N	TABLE	DROPDOWN
29	n2BUXPHPy	1	\N	TX TABLE	WVKMIEetSL	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n-- `dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\nABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_swap_side` is not under aggregate function and not in GROUP BY. Have columns: ['max(divide(dm_real_time_tx_processing_t1_amount, dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_tx_hash','dm_real_time_tx_processing_swap_maker','dm_real_time_tx_processing_protocol','min(divide(dm_real_time_tx_processing_t1_amount, dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_address','sum(dm_real_time_tx_processing_t0_amount)','dm_real_time_tx_processing_blockchain','dm_real_time_tx_processing_timestamp']: While processing dm_real_time_tx_processing_timestamp AS TS, abs(if(dm_real_time_tx_processing_swap_side = 'BUY', min(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount), max(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount))) AS PRICE, abs(sum(dm_real_time_tx_processing_t0_amount) * -1) AS VOLUME, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_address AS ADDRESS, dm_real_time_tx_processing_swap_maker AS MAKER, dm_real_time_tx_processing_tx_hash AS `TX HASH`. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691342170095.064000	2023-08-06 17:16:10.450747	\N	\N	1691342170193.905000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_swap_side` is not under aggregate function and not in GROUP BY. Have columns: ['max(divide(dm_real_time_tx_processing_t1_amount, dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_tx_hash','dm_real_time_tx_processing_swap_maker','dm_real_time_tx_processing_protocol','min(divide(dm_real_time_tx_processing_t1_amount, dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_address','sum(dm_real_time_tx_processing_t0_amount)','dm_real_time_tx_processing_blockchain','dm_real_time_tx_processing_timestamp']: While processing dm_real_time_tx_processing_timestamp AS TS, abs(if(dm_real_time_tx_processing_swap_side = 'BUY', min(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount), max(dm_real_time_tx_processing_t1_amount / dm_real_time_tx_processing_t0_amount))) AS PRICE, abs(sum(dm_real_time_tx_processing_t0_amount) * -1) AS VOLUME, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_address AS ADDRESS, dm_real_time_tx_processing_swap_maker AS MAKER, dm_real_time_tx_processing_tx_hash AS `TX HASH`. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
34	2PdpD-nw3	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  '<a href="google.com">Google</a>',\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  '<a href="google.com">Google</a>',\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342486740.017800	2023-08-06 17:21:27.109158	1691342487098.578000	\N	1691342486845.126000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
35	9u-JXCkQx	1	\N	TX TABLE	WVKMIEetSL	1	failed	clickhouse	Google	\N	\N	1000	f	f	0	\N	Only SELECT statements are allowed against this database.	1691342500114.533000	2023-08-06 17:21:40.241003	\N	\N	1691342500154.501000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "Only SELECT statements are allowed against this database.", "error_type": "DML_NOT_ALLOWED_ERROR", "level": "error", "extra": {"issue_codes": [{"code": 1022, "message": "Issue 1022 - Database does not allow data manipulation."}]}}]}	\N	TABLE	DROPDOWN
22	JtpSR1xH3	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  SUM(`dm_real_time_tx_processing_t0_amount` * -1) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	16	\N	1691249246189.252000	2023-08-05 15:27:26.886269	1691249246874.713000	\N	1691249246377.666000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
30	54oW3Elrh	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n-- `dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\nABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342194438.795200	2023-08-06 17:16:34.81702	1691342194806.650000	\N	1691342194561.868000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
41	dllpdlh53	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  '<a href="google.com">google</a>',\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  '<a href="google.com">google</a>',\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342848404.205000	2023-08-06 17:27:28.818328	1691342848810.463900	\N	1691342848520.722000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
85	QpBBk8aGa	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	SELECT\r\n  toDate(NOW()) AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `QTY`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  toDate(NOW()) AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `QTY`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691358070900.835000	2023-08-06 21:41:11.258855	1691358071233.983200	\N	1691358070994.257000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
64	5yzd7nrfY	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691350346896.204000	2023-08-06 19:32:27.289766	1691350347279.639000	\N	1691350347007.635000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
23	umzeaMpJT	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	16	\N	1691249264644.470000	2023-08-05 15:27:44.875326	1691249264869.443800	\N	1691249264714.528000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
52	lhWwbwTu0	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	5	\N	1691344481864.141800	2023-08-06 17:54:42.950079	1691344482911.651000	\N	1691344482237.828100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
31	kjGya4tTM	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342243634.576200	2023-08-06 17:17:24.050502	1691342244038.454000	\N	1691342243764.669000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
36	PToA9fI8S	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  '<a href="google.com">{Google}</a>',\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  '<a href="google.com">{Google}</a>',\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342504573.549000	2023-08-06 17:21:44.998239	1691342504984.636000	\N	1691342504713.644000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
37	SlZZYjjW3	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  '<a href="google.com">`dm_real_time_tx_processing_blockchain`</a>',\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  '<a href="google.com">`dm_real_time_tx_processing_blockchain`</a>',\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342524876.168000	2023-08-06 17:22:05.237783	1691342525229.625000	\N	1691342524983.639000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
24	3fG5CjGdF	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	16	\N	1691249291117.307900	2023-08-05 15:28:11.491832	1691249291483.869100	\N	1691249291266.294000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
42	jVGTJJqDe	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT('<a href="', dm_real_time_tx_processing_blockchain,'" target="_blank">Check Details</a>'),\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT('<a href="', dm_real_time_tx_processing_blockchain,'" target="_blank">Check Details</a>'),\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343229818.070800	2023-08-06 17:33:50.405559	1691343230365.932000	\N	1691343229973.107200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
32	MdG4EUQiA	1	\N	TX TABLE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount` * -1)) AS `VOLUME`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691342291627.084000	2023-08-06 17:18:12.092951	1691342292082.921900	\N	1691342291776.249000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
48	pejcpaLrG	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343722138.024200	2023-08-06 17:42:02.709283	1691343722667.797000	\N	1691343722279.475800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
49	UQZPx06iM	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343755919.138000	2023-08-06 17:42:36.335808	1691343756326.524000	\N	1691343756027.033200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
43	WAQlAHk0W	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT('<a href="', `dm_real_time_tx_processing_blockchain`,'" target="_blank">Check Details</a>') AS `TX`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT('<a href="', `dm_real_time_tx_processing_blockchain`,'" target="_blank">Check Details</a>') AS `TX`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343248135.015000	2023-08-06 17:34:08.561607	1691343248551.551000	\N	1691343248267.763000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
145	TCvG4L68s	1	\N	Untitled Query 1	4LU0P5KQKQ	1	success	clickhouse	SELECT\r\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691421565214.188000	2023-08-07 15:19:25.813931	1691421565766.826000	\N	1691421565295.216000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
93	yBREll-Vtg	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT * FROM `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT * FROM `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	21	\N	1691358454836.313000	2023-08-06 21:47:35.3869	1691358455317.532000	\N	1691358454963.063000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
53	MRbdy7c54	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	10	\N	1691344523226.515100	2023-08-06 17:55:23.971258	1691344523957.417000	\N	1691344523330.741000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
59	ctgs2QHNv	1	\N	TX TABLE	iAW30wu_O	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_protocol` is not under aggregate function and not in GROUP BY. Have columns: ['abs(sum(dm_real_time_tx_processing_t0_amount))','abs(avg(dm_real_time_tx_processing_swap_quote_price))','sum(dm_real_time_tx_processing_t0_amount)','avg(dm_real_time_tx_processing_swap_quote_price)','dm_real_time_tx_processing_timestamp','dm_real_time_tx_processing_swap_side','concat(\\'<a href="\\', \\'https://\\', dm_real_time_tx_processing_blockchain, \\'/tx/\\', lower(dm_real_time_tx_processing_tx_hash), \\'" target="_blank">\\', lower(dm_real_time_tx_processing_tx_hash), \\'</a>\\')','concat(\\'<a href="\\', \\'https://\\', dm_real_time_tx_processing_blockchain, \\'/address/\\', lower(dm_real_time_tx_processing_swap_maker), \\'" target="_blank">\\', lower(dm_real_time_tx_processing_swap_maker), \\'</a>\\')']: While processing dm_real_time_tx_processing_timestamp AS TS, dm_real_time_tx_processing_swap_side AS SIDE, abs(avg(dm_real_time_tx_processing_swap_quote_price)) AS PRICE, abs(sum(dm_real_time_tx_processing_t0_amount)) AS VOLUME, concat('<a href="', 'https://', dm_real_time_tx_processing_blockchain, '/address/', lower(dm_real_time_tx_processing_swap_maker), '" target="_blank">', lower(dm_real_time_tx_processing_swap_maker), '</a>') AS MAKER, concat('<a href="', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', lower(dm_real_time_tx_processing_tx_hash), '" target="_blank">', lower(dm_real_time_tx_processing_tx_hash), '</a>') AS `TX HASH`, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_address AS CONTRACT. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691345549357.992000	2023-08-06 18:12:29.807478	\N	\N	1691345549487.382800	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_protocol` is not under aggregate function and not in GROUP BY. Have columns: ['abs(sum(dm_real_time_tx_processing_t0_amount))','abs(avg(dm_real_time_tx_processing_swap_quote_price))','sum(dm_real_time_tx_processing_t0_amount)','avg(dm_real_time_tx_processing_swap_quote_price)','dm_real_time_tx_processing_timestamp','dm_real_time_tx_processing_swap_side','concat(\\\\'<a href=\\"\\\\', \\\\'https://\\\\', dm_real_time_tx_processing_blockchain, \\\\'/tx/\\\\', lower(dm_real_time_tx_processing_tx_hash), \\\\'\\" target=\\"_blank\\">\\\\', lower(dm_real_time_tx_processing_tx_hash), \\\\'</a>\\\\')','concat(\\\\'<a href=\\"\\\\', \\\\'https://\\\\', dm_real_time_tx_processing_blockchain, \\\\'/address/\\\\', lower(dm_real_time_tx_processing_swap_maker), \\\\'\\" target=\\"_blank\\">\\\\', lower(dm_real_time_tx_processing_swap_maker), \\\\'</a>\\\\')']: While processing dm_real_time_tx_processing_timestamp AS TS, dm_real_time_tx_processing_swap_side AS SIDE, abs(avg(dm_real_time_tx_processing_swap_quote_price)) AS PRICE, abs(sum(dm_real_time_tx_processing_t0_amount)) AS VOLUME, concat('<a href=\\"', 'https://', dm_real_time_tx_processing_blockchain, '/address/', lower(dm_real_time_tx_processing_swap_maker), '\\" target=\\"_blank\\">', lower(dm_real_time_tx_processing_swap_maker), '</a>') AS MAKER, concat('<a href=\\"', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', lower(dm_real_time_tx_processing_tx_hash), '\\" target=\\"_blank\\">', lower(dm_real_time_tx_processing_tx_hash), '</a>') AS `TX HASH`, dm_real_time_tx_processing_protocol AS PROTOCOL, dm_real_time_tx_processing_blockchain AS BLOCKCHAIN, dm_real_time_tx_processing_address AS CONTRACT. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
70	Boi8VfO60	1	\N	dm_real_time_tx_processing.price_chart	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691350821179.269000	2023-08-06 19:40:21.463299	1691350821455.721000	\N	1691350821274.818800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
44	Uyr4FEIJB	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT('<a href="', 'https://', `dm_real_time_tx_processing_blockchain`,'" target="_blank">Check Details</a>') AS `TX`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT('<a href="', 'https://', `dm_real_time_tx_processing_blockchain`,'" target="_blank">Check Details</a>') AS `TX`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343283997.019000	2023-08-06 17:34:44.448356	1691343284436.271000	\N	1691343284148.598900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
69	kPyeYJDwq9	1	\N	Query clickhouse.dm_real_time_tx_processing.price_chart	JnI0krnoq	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  `PROTOCOL`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`,\n  `PROTOCOL`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691350801120.021000	2023-08-06 19:40:02.377869	1691350802329.056000	\N	1691350801361.451000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
87	cpmuRU0aiv	1	\N		\N	1	success	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_swap_quote_price`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 100	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_swap_quote_price`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 101	100	f	f	100	26	\N	1691358251922.260000	2023-08-06 21:44:12.343749	1691358252283.159000	\N	1691358252005.671100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
54	wmZzwRvMF	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	16	\N	1691344554155.963900	2023-08-06 17:55:55.108513	1691344555094.296900	\N	1691344554443.254000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
100	b2VFegbFK	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691359012228.479000	2023-08-06 21:56:52.618019	1691359012585.067900	\N	1691359012344.931000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
71	aoUjug3EoN	1	\N		\N	1	success	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_swap_quote_price`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 100	\N	SELECT `dm_real_time_tx_processing_address`,\n       `dm_real_time_tx_processing_swap_maker`,\n       `dm_real_time_tx_processing_t0_symbol`,\n       `dm_real_time_tx_processing_t1_symbol`,\n       `dm_real_time_tx_processing_t0_amount`,\n       `dm_real_time_tx_processing_t1_amount`,\n       `dm_real_time_tx_processing_swap_side`,\n       `dm_real_time_tx_processing_swap_quote_price`,\n       `dm_real_time_tx_processing_tx_hash`,\n       `dm_real_time_tx_processing_protocol`,\n       `dm_real_time_tx_processing_blockchain`,\n       `dm_real_time_tx_processing_timestamp`\nFROM `clickhouse`.`dm_real_time_tx_processing`\nLIMIT 101	100	f	f	100	26	\N	1691352225308.390000	2023-08-06 20:03:45.63639	1691352225600.638000	\N	1691352225393.054000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
45	yYJT3aY4F	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">HYPERLINK</a>'\r\n  ) AS `TX`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">HYPERLINK</a>'\n  ) AS `TX`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343441349.105000	2023-08-06 17:37:21.888321	1691343441872.955000	\N	1691343441497.509000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
96	-udUYwWFS	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	21	\N	1691358611035.748000	2023-08-06 21:50:11.996376	1691358611899.507000	\N	1691358611135.189000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
72	v4b70c-D8	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691352227446.730000	2023-08-06 20:03:47.782694	1691352227776.544200	\N	1691352227559.689000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
55	5zlK-jxu_	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691344625037.557000	2023-08-06 17:57:05.452691	1691344625443.263000	\N	1691344625153.932100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
178	xkQCeH1L8	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 15 SECOND\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 15 SECOND\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	2	\N	1691528128577.865000	2023-08-08 20:55:28.943769	1691528128935.967000	\N	1691528128705.280000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
88	k1wEptwvSl	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`,\nFROM \n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`,\nFROM\n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 230 ('`clickhouse.dm_real_time_tx_processing`') (line 6, col 3): `clickhouse.dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001\n FORMAT Native. Expected one of: token, Dot, OR, AND, IS NULL, IS NOT NULL, BETWEEN, NOT BETWEEN, LIKE, ILIKE, NOT LIKE, NOT ILIKE, REGEXP, IN, NOT IN, GLOBAL IN, GLOBAL NOT IN, MOD, DIV, alias, AS, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691358254556.798800	2023-08-06 21:44:14.902147	\N	\N	1691358254667.109900	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 230 ('`clickhouse.dm_real_time_tx_processing`') (line 6, col 3): `clickhouse.dm_real_time_tx_processing`\\nGROUP BY\\n  `TS`\\nLIMIT 1001\\n FORMAT Native. Expected one of: token, Dot, OR, AND, IS NULL, IS NOT NULL, BETWEEN, NOT BETWEEN, LIKE, ILIKE, NOT LIKE, NOT ILIKE, REGEXP, IN, NOT IN, GLOBAL IN, GLOBAL NOT IN, MOD, DIV, alias, AS, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
46	09j6hZ34i	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	failed	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 179. DB::Exception: Different expressions with the same alias `TX HASH`:\ndm_real_time_tx_processing_tx_hash AS `TX HASH`\nand\nCONCAT('<a href="', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', LOWER(dm_real_time_tx_processing_tx_hash), '" target="_blank">', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', LOWER(dm_real_time_tx_processing_tx_hash), '</a>') AS `TX HASH`\n: While processing dm_real_time_tx_processing_tx_hash AS `TX HASH`. (MULTIPLE_EXPRESSIONS_FOR_ALIAS) (version 23.8.1.94 (official build))	1691343596892.954000	2023-08-06 17:39:57.476415	\N	\N	1691343597057.899000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 179. DB::Exception: Different expressions with the same alias `TX HASH`:\\ndm_real_time_tx_processing_tx_hash AS `TX HASH`\\nand\\nCONCAT('<a href=\\"', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', LOWER(dm_real_time_tx_processing_tx_hash), '\\" target=\\"_blank\\">', 'https://', dm_real_time_tx_processing_blockchain, '/tx/', LOWER(dm_real_time_tx_processing_tx_hash), '</a>') AS `TX HASH`\\n: While processing dm_real_time_tx_processing_tx_hash AS `TX HASH`. (MULTIPLE_EXPRESSIONS_FOR_ALIAS) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
56	aB2a16Tow	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691344702554.303000	2023-08-06 17:58:23.600024	1691344703583.331000	\N	1691344702848.161900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
73	NyvqqadvDc	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691352417942.824000	2023-08-06 20:06:58.395226	1691352418375.244000	\N	1691352418053.921000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
94	BzxcrgHdD6	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  SUM(`BUY`),\n  SUM(`SELL`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`),\n  SUM(`SELL`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691358492661.112000	2023-08-06 21:48:13.237019	1691358493199.630100	\N	1691358492757.720000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
47	M7pzU7Ubx	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX_HASH`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `BLOCKCHAIN`,\r\n  `PROTOCOL`,\r\n  `ADDRESS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX_HASH`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_address` AS `ADDRESS`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  `dm_real_time_tx_processing_tx_hash` AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `BLOCKCHAIN`,\n  `PROTOCOL`,\n  `ADDRESS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691343613099.746800	2023-08-06 17:40:13.64835	1691343613612.888200	\N	1691343613226.561000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
89	RZSmvg-PJX	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`\nFROM \n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`\nFROM\n  `clickhouse.dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 60. DB::Exception: Table clickhouse.`clickhouse.dm_real_time_tx_processing` doesn't exist. (UNKNOWN_TABLE) (version 23.8.1.94 (official build))	1691358269733.814000	2023-08-06 21:44:30.069081	\N	\N	1691358269807.473900	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 60. DB::Exception: Table clickhouse.`clickhouse.dm_real_time_tx_processing` doesn't exist. (UNKNOWN_TABLE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
57	w_EdijbFP	1	\N	TX TABLE	kNN22jHRr	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691344756161.369100	2023-08-06 17:59:16.715648	1691344756702.395000	\N	1691344756319.387000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
74	f-tHtmHUAZ	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	0	\N	1691352430359.509000	2023-08-06 20:07:10.658362	1691352430655.442000	\N	1691352430458.287000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
158	Mou69rdYr	1	\N	dm_real_time_tx_processing.tx_makers	4LU0P5KQKQ	1	success	clickhouse	SELECT\r\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	\N	SELECT\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691443154553.015900	2023-08-07 21:19:15.285959	1691443155200.337000	\N	1691443154681.209000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
90	mNGm-O0u2T	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`\nFROM \n  `dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, type = 'SELL')) AS `SELL`\nFROM\n  `dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'type' while processing query: 'SELECT toDate(now()) AS TS, length(groupUniqArrayIf(dm_real_time_tx_processing_swap_side, type = 'BUY')) AS BUY, length(groupUniqArrayIf(dm_real_time_tx_processing_swap_side, type = 'SELL')) AS SELL FROM dm_real_time_tx_processing GROUP BY TS LIMIT 1001', required columns: 'dm_real_time_tx_processing_swap_side' 'type', maybe you meant: 'dm_real_time_tx_processing_swap_side'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691358279084.433000	2023-08-06 21:44:39.456071	\N	\N	1691358279181.678000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'type' while processing query: 'SELECT toDate(now()) AS TS, length(groupUniqArrayIf(dm_real_time_tx_processing_swap_side, type = 'BUY')) AS BUY, length(groupUniqArrayIf(dm_real_time_tx_processing_swap_side, type = 'SELL')) AS SELL FROM dm_real_time_tx_processing GROUP BY TS LIMIT 1001', required columns: 'dm_real_time_tx_processing_swap_side' 'type', maybe you meant: 'dm_real_time_tx_processing_swap_side'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
50	_zzUfgPfc	1	\N	TX TABLE UPDATE	WVKMIEetSL	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(\r\n    if(\r\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\r\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\r\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\r\n    )\r\n  ) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(\n    if(\n      `dm_real_time_tx_processing_swap_side` = 'BUY',\n      MIN(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`),\n      MAX(`dm_real_time_tx_processing_t1_amount` / `dm_real_time_tx_processing_t0_amount`)\n    )\n  ) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  `dm_real_time_tx_processing_swap_maker` AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	28	\N	1691344015390.173800	2023-08-06 17:46:55.789595	1691344015779.737000	\N	1691344015498.415000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
58	FQgXO8VZq	1	\N	TX TABLE	0SvWfFXDj	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691344873731.638000	2023-08-06 18:01:14.62561	1691344874545.948000	\N	1691344873896.470000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
60	CpCBE2Ja4	1	\N	TX TABLE	iAW30wu_O	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  `PROTOCOL`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`,\n  `PROTOCOL`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691345582739.106000	2023-08-06 18:13:03.200874	1691345583190.071000	\N	1691345582891.034000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
75	0Rujh926J6	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	21	\N	1691352436240.434800	2023-08-06 20:07:16.533041	1691352436525.608200	\N	1691352436320.859000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
61	4EAiYRZVs	1	\N	TX TABLE	8Wc8J1Vhjk	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  `PROTOCOL`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`,\n  `PROTOCOL`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691345695502.924000	2023-08-06 18:14:55.943393	1691345695936.594000	\N	1691345695638.023000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
109	XTmk4bMr-	1	\N	dm_real_time_tx_processing.tx_qty_by_side	gnl1_5ik-	1	success	clickhouse	SELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  (\r\n    SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n    FROM \r\n      `dm_real_time_tx_processing`\r\n    WHERE\r\n      `TS` < NOW() - INTERVAL - 24 HOUR\r\n    GROUP BY \r\n      `TS`  \r\n  )	\N	SELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  (\n    SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n    FROM\n      `dm_real_time_tx_processing`\n    WHERE\n      `TS` < NOW() - INTERVAL - 24 HOUR\n    GROUP BY\n      `TS`\n  )\nLIMIT 1001	1000	f	f	100	1	\N	1691405331405.497000	2023-08-07 10:48:51.918625	1691405331904.271000	\N	1691405331499.657000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
97	1FCWS2UUU4	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691358641304.015000	2023-08-06 21:50:43.549315	1691358643456.730000	\N	1691358641490.170000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
76	pfLgSVXvt0	1	\N	Untitled Query 2	B8oFu7_wBg	1	failed	clickhouse	SELECT \r\n  COUNT(*)\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  COUNT(*)\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'TS' while processing query: 'SELECT count() FROM clickhouse.dm_real_time_tx_processing WHERE dm_real_time_tx_processing_timestamp > (dm_real_time_tx_processing_timestamp - toIntervalHour(24)) GROUP BY dm_real_time_tx_processing_swap_side ORDER BY TS DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'dm_real_time_tx_processing_swap_side' 'TS', maybe you meant: 'dm_real_time_tx_processing_timestamp' or 'dm_real_time_tx_processing_swap_side'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691355619441.644000	2023-08-06 21:00:19.851263	\N	\N	1691355619555.301000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'TS' while processing query: 'SELECT count() FROM clickhouse.dm_real_time_tx_processing WHERE dm_real_time_tx_processing_timestamp > (dm_real_time_tx_processing_timestamp - toIntervalHour(24)) GROUP BY dm_real_time_tx_processing_swap_side ORDER BY TS DESC LIMIT 1001', required columns: 'dm_real_time_tx_processing_timestamp' 'dm_real_time_tx_processing_swap_side' 'TS', maybe you meant: 'dm_real_time_tx_processing_timestamp' or 'dm_real_time_tx_processing_swap_side'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
78	lurmQDLn_i	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*)\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*)\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691355659152.182100	2023-08-06 21:00:59.390295	1691355659381.988000	\N	1691355659232.623000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
91	EV9MeisMW5	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\nFROM \n  `dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    toDate(NOW()) AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\nFROM\n  `dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	100	1	\N	1691358292237.419000	2023-08-06 21:44:52.584261	1691358292557.039000	\N	1691358292324.030000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
62	SsaPlZg5i	1	\N	TX TABLE	tdUn10uMz	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  `PROTOCOL`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`,\n  `PROTOCOL`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691350280636.722200	2023-08-06 19:31:21.139942	1691350281119.599000	\N	1691350280801.047000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
77	Qskp6NnxDt	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT \r\n  COUNT(*)\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `dm_real_time_tx_processing_swap_side`	\N	SELECT\n  COUNT(*)\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `dm_real_time_tx_processing_swap_side`\nLIMIT 1001	1000	f	f	100	2	\N	1691355629706.265900	2023-08-06 21:00:30.092568	1691355630063.909000	\N	1691355629789.486800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
98	R6lGDTMZnd	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      count(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      count(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      count(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      count(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 184. DB::Exception: Aggregate function groupUniqArrayIf(dm_real_time_tx_processing_swap_side, equals(dm_real_time_tx_processing_swap_side, 'BUY')) is found inside another aggregate function in query: While processing groupUniqArrayIf(dm_real_time_tx_processing_swap_side, dm_real_time_tx_processing_swap_side = 'BUY'). (ILLEGAL_AGGREGATION) (version 23.8.1.94 (official build))	1691358734430.901100	2023-08-06 21:52:15.234181	\N	\N	1691358734671.492200	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 184. DB::Exception: Aggregate function groupUniqArrayIf(dm_real_time_tx_processing_swap_side, equals(dm_real_time_tx_processing_swap_side, 'BUY')) is found inside another aggregate function in query: While processing groupUniqArrayIf(dm_real_time_tx_processing_swap_side, dm_real_time_tx_processing_swap_side = 'BUY'). (ILLEGAL_AGGREGATION) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
101	j9mQw_nsMQ	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691359077548.748000	2023-08-06 21:57:57.88348	1691359077874.767000	\N	1691359077650.402000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
104	NL2uxTSaaj	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691359127951.662000	2023-08-06 21:58:48.309992	1691359128304.490000	\N	1691359128075.135000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
63	w8l4H9Xwj	1	\N	dm_real_time_tx_processing.tx_table	WSpi5EV9nI	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`,\r\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\r\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\r\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`,\r\n  `PROTOCOL`,\r\n  `BLOCKCHAIN`,\r\n  `CONTRACT`\r\n  \r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`,\n  `dm_real_time_tx_processing_protocol` AS `PROTOCOL`,\n  `dm_real_time_tx_processing_blockchain` AS `BLOCKCHAIN`,\n  `dm_real_time_tx_processing_address` AS `CONTRACT`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`,\n  `PROTOCOL`,\n  `BLOCKCHAIN`,\n  `CONTRACT`\n\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	26	\N	1691350331074.496000	2023-08-06 19:32:11.637292	1691350331602.208000	\N	1691350331238.049000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
127	GA3LANKr3	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691406408311.345200	2023-08-07 11:06:48.709563	1691406408700.288000	\N	1691406408404.438000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
99	EFrxl2Wkp8	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691358751259.678000	2023-08-06 21:52:32.617138	1691358752543.818800	\N	1691358751460.561000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
79	1Ylhq3kthL	1	\N	Untitled Query 2	B8oFu7_wBg	1	success	clickhouse	SELECT\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  COUNT(*) AS `TXS`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR \r\nGROUP BY\r\n  `SIDE`	\N	SELECT\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  COUNT(*) AS `TXS`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > `dm_real_time_tx_processing_timestamp` - INTERVAL 24 HOUR\nGROUP BY\n  `SIDE`\nLIMIT 1001	1000	f	f	100	2	\N	1691355670244.474900	2023-08-06 21:01:10.497748	1691355670489.537000	\N	1691355670315.661900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
92	8tbMT2PFkv	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\nFROM \n  `dm_real_time_tx_processing`\nGROUP BY \n  `TS`	\N	SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n    length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\nFROM\n  `dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691358335797.795200	2023-08-06 21:45:36.260557	1691358336221.923000	\N	1691358335899.627000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
102	t0cBqYmXGg	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	21	\N	1691359091837.889000	2023-08-06 21:58:12.164752	1691359092154.252000	\N	1691359091933.029000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
103	tIbMX4koPS	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	hsFuF5LMX6	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM \n    `dm_real_time_tx_processing`\n  GROUP BY \n    `TS`\n)\n\nSELECT \n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM \n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['sum(SELL)','sum(BUY)']: While processing TS ASC. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691359120291.910000	2023-08-06 21:58:40.643764	\N	\N	1691359120403.854000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['sum(SELL)','sum(BUY)']: While processing TS ASC. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
110	qMjCnPS2w	1	\N	dm_real_time_tx_processing.tx_qty_by_side	gnl1_5ik-	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691405369588.255900	2023-08-07 10:49:30.232454	1691405370218.717000	\N	1691405369833.337200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
128	1kUNaHapM	1	\N	Untitled Query 3	MSVCc-W2ZQ	1	failed	clickhouse	SELECT\r\n    count(*)\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    count(*)\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `TS` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'TS' while processing query: 'SELECT count() FROM dm_real_time_tx_processing WHERE TS < (now() - toIntervalHour(-24)) LIMIT 1001', required columns: 'TS'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691406667083.780000	2023-08-07 11:11:07.445427	\N	\N	1691406667213.182000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'TS' while processing query: 'SELECT count() FROM dm_real_time_tx_processing WHERE TS < (now() - toIntervalHour(-24)) LIMIT 1001', required columns: 'TS'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
111	QnLWBSrgl	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691405500410.235800	2023-08-07 10:51:40.89423	1691405500884.700000	\N	1691405500584.358000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
134	TQoXVwE-g	1	\N	Untitled Query 3	MSQViQs4u1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691414990835.252000	2023-08-07 13:29:51.211746	1691414991202.005000	\N	1691414990928.339800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
146	p91eZYZMf	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691422818201.035000	2023-08-07 15:40:18.676678	1691422818649.264200	\N	1691422818291.089000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
105	3lM68OAnA	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	Z0cYXmBNOc	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` > NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691359271979.636000	2023-08-06 22:01:12.374801	1691359272368.130000	\N	1691359272118.554200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
129	XRyc3yWy1	1	\N	Untitled Query 3	MSVCc-W2ZQ	1	success	clickhouse	SELECT\r\n    count(*)\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    count(*)\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691406681039.061000	2023-08-07 11:11:21.263815	1691406681257.857200	\N	1691406681089.989000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
135	BlLq9J6CY	1	\N	Untitled Query 3	MSQViQs4u1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691415029522.169200	2023-08-07 13:30:30.004796	1691415029997.728000	\N	1691415029658.941000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
112	2AsvSxdrS	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405834516.418000	2023-08-07 10:57:14.979662	1691405834965.053000	\N	1691405834663.845000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
116	C_PiKatTd	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount` * -1, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount` * -1, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405953620.817000	2023-08-07 10:59:14.037887	1691405954030.921000	\N	1691405953742.738000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
106	tHWbJV4U3	1	\N	clickhouse.dm_real_time_tx_processing.tx_qty	Z0cYXmBNOc	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691359278411.418000	2023-08-06 22:01:18.945808	1691359278940.051000	\N	1691359278535.544000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
179	5C58K4N8E	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	88	\N	1691528136988.904000	2023-08-08 20:55:37.509121	1691528137500.236000	\N	1691528137084.150100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
113	JvXETMQrw	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405892883.052000	2023-08-07 10:58:13.26535	1691405893258.727000	\N	1691405893005.658000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
130	BrR2zbsqC	1	\N	Untitled Query 3	MSVCc-W2ZQ	1	success	clickhouse	SELECT\r\n    count(*) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    count(*) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691406693663.002000	2023-08-07 11:11:33.92896	1691406693918.487000	\N	1691406693738.406000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
117	TjxxbmPpI	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405962420.787000	2023-08-07 10:59:22.855672	1691405962843.211000	\N	1691405962551.946000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
119	2u0fz91cL	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\r\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  arraySum(`BUY`) AS `BUY`,\r\n  arraySum(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  arraySum(`BUY`) AS `BUY`,\n  arraySum(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406044897.437000	2023-08-07 11:00:45.277482	1691406045271.665000	\N	1691406045009.255900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
107	_PW8FneCc	1	\N	dm_real_time_tx_processing.tx_qty_by_side	iN1g-nJY2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691359433515.760000	2023-08-06 22:03:53.890655	1691359433880.398000	\N	1691359433618.433000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
149	aBTUG4_vE	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  COUNT(`BUY`),\r\n  COUNT(`SELL`)\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  COUNT(`BUY`),\n  COUNT(`SELL`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691422908781.229000	2023-08-07 15:41:49.13148	1691422909124.310000	\N	1691422908868.174000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
114	XJ2Os8sex	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t1_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405911408.848100	2023-08-07 10:58:31.752427	1691405911741.915000	\N	1691405911496.472000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
118	bzPCyd-Va	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\r\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406000011.369900	2023-08-07 11:00:00.464584	1691406000455.921900	\N	1691406000197.619900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
120	zeMnklKXT	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\r\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  arraySum(`BUY`) AS `BUY`,\r\n  arraySum(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  `TS`,\n  arraySum(`BUY`) AS `BUY`,\n  arraySum(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406058338.821000	2023-08-07 11:00:58.782315	1691406058775.044000	\N	1691406058508.089000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
121	sJ7HNcqlv	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\r\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406087280.157000	2023-08-07 11:01:27.603278	1691406087588.462200	\N	1691406087379.894000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
108	4rbXm4zSf	1	\N	dm_real_time_tx_processing.tx_qty_by_side	ivADRDAue	1	success	clickhouse	SELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  (\r\n    SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n    FROM \r\n      `dm_real_time_tx_processing`\r\n    WHERE\r\n      `TS` < NOW() - INTERVAL - 24 HOUR\r\n    GROUP BY \r\n      `TS`  \r\n  )	\N	SELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  (\n    SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n    FROM\n      `dm_real_time_tx_processing`\n    WHERE\n      `TS` < NOW() - INTERVAL - 24 HOUR\n    GROUP BY\n      `TS`\n  )\nLIMIT 1001	1000	f	f	100	1	\N	1691405194599.025000	2023-08-07 10:46:35.15588	1691405195140.619900	\N	1691405194757.463000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
131	Jnet_pxtX	1	\N	Untitled Query 3	MSQViQs4u1	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      =(groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      =(groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 231 ('=') (line 5, col 7): =(groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHER. Expected one of: expression with optional alias, element of expression with optional alias, lambda expression, CAST operator, NOT, INTERVAL, CASE, DATE, TIMESTAMP, tuple, collection of literals, array, number, literal, NULL, Bool, true, false, string literal, asterisk, qualified asterisk, compound identifier, list of elements, identifier, COLUMNS matcher, COLUMNS, qualified COLUMNS matcher, substitution, MySQL-style global variable. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691414899427.452100	2023-08-07 13:28:19.892758	\N	\N	1691414899543.745000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 231 ('=') (line 5, col 7): =(groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\\n  FROM\\n    `dm_real_time_tx_processing`\\n  WHER. Expected one of: expression with optional alias, element of expression with optional alias, lambda expression, CAST operator, NOT, INTERVAL, CASE, DATE, TIMESTAMP, tuple, collection of literals, array, number, literal, NULL, Bool, true, false, string literal, asterisk, qualified asterisk, compound identifier, list of elements, identifier, COLUMNS matcher, COLUMNS, qualified COLUMNS matcher, substitution, MySQL-style global variable. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
136	E6ELzIa0K	1	\N	dm_real_time_tx_processing.tx_vol_by_side	kU06G8pnp	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691420281958.712200	2023-08-07 14:58:02.541579	1691420282534.066000	\N	1691420282114.630000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
137	bXLlMDvJe	1	\N	dm_real_time_tx_processing.tx_vol_by_side	kU06G8pnp	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  ROUND(SUM(`BUY`)) AS `BUY`,\r\n  ROUND(SUM(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  ROUND(SUM(`BUY`)) AS `BUY`,\n  ROUND(SUM(`SELL`)) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691420301522.905000	2023-08-07 14:58:22.030762	1691420302017.484900	\N	1691420301703.484100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
115	RlfkPdVVL	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691405927779.836000	2023-08-07 10:58:48.317657	1691405928305.866000	\N	1691405927945.493000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
122	EdUoUqBjJ	1	\N	Untitled Query 1	vcVtCX3EcD	1	failed	clickhouse	`TS`,\r\n  arraySum(`BUY`) AS `BUY`,\r\n  arraySum(`SELL`) AS `SELL`	\N	\N	1000	f	f	0	\N	Only SELECT statements are allowed against this database.	1691406108249.238000	2023-08-07 11:01:48.456377	\N	\N	1691406108327.965000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "Only SELECT statements are allowed against this database.", "error_type": "DML_NOT_ALLOWED_ERROR", "level": "error", "extra": {"issue_codes": [{"code": 1022, "message": "Issue 1022 - Database does not allow data manipulation."}]}}]}	\N	TABLE	DROPDOWN
123	agUBk6tQh	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\r\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  arraySum(`BUY`) AS `BUY`,\r\n  arraySum(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY') AS `BUY`,\n      groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL') AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  `TS`,\n  arraySum(`BUY`) AS `BUY`,\n  arraySum(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406110208.508000	2023-08-07 11:01:50.645537	1691406110637.815000	\N	1691406110373.806000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
147	mg_Z7KcgG	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_timestamp` is not under aggregate function and not in GROUP BY. Have columns: ['groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, equals(dm_real_time_tx_processing_swap_side, \\'SELL\\'))','groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, equals(dm_real_time_tx_processing_swap_side, \\'BUY\\'))']: While processing dm_real_time_tx_processing_timestamp AS TS, groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, dm_real_time_tx_processing_swap_side = 'BUY') AS BUY, groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, dm_real_time_tx_processing_swap_side = 'SELL') AS SELL. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691422835890.423000	2023-08-07 15:40:36.257709	\N	\N	1691422836002.337000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_timestamp` is not under aggregate function and not in GROUP BY. Have columns: ['groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, equals(dm_real_time_tx_processing_swap_side, \\\\'SELL\\\\'))','groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, equals(dm_real_time_tx_processing_swap_side, \\\\'BUY\\\\'))']: While processing dm_real_time_tx_processing_timestamp AS TS, groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, dm_real_time_tx_processing_swap_side = 'BUY') AS BUY, groupUniqArrayIf(dm_real_time_tx_processing_swap_maker, dm_real_time_tx_processing_swap_side = 'SELL') AS SELL. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
124	E4od09Frt	1	\N	Untitled Query 1	vcVtCX3EcD	1	failed	clickhouse	groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')	\N	\N	1000	f	f	0	\N	Only SELECT statements are allowed against this database.	1691406137812.164000	2023-08-07 11:02:17.975314	\N	\N	1691406137860.417000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "Only SELECT statements are allowed against this database.", "error_type": "DML_NOT_ALLOWED_ERROR", "level": "error", "extra": {"issue_codes": [{"code": 1022, "message": "Issue 1022 - Database does not allow data manipulation."}]}}]}	\N	TABLE	DROPDOWN
132	w4UHRClQu	1	\N	Untitled Query 3	MSQViQs4u1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691414903820.067000	2023-08-07 13:28:24.260498	1691414904241.719000	\N	1691414903927.151000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
125	osw4kVYo3	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691406139003.614000	2023-08-07 11:02:19.383803	1691406139376.370800	\N	1691406139121.813000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
139	R_oedMT0T	1	\N	Untitled Query 1	BT9MW6hpKE	1	failed	clickhouse	SELECT\r\n    SUM(*) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    SUM(*) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 42. DB::Exception: Aggregate function sum requires single argument. (NUMBER_OF_ARGUMENTS_DOESNT_MATCH) (version 23.8.1.94 (official build))	1691420712155.643000	2023-08-07 15:05:12.503542	\N	\N	1691420712225.186000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 42. DB::Exception: Aggregate function sum requires single argument. (NUMBER_OF_ARGUMENTS_DOESNT_MATCH) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
160	-BrBIxcw7	1	\N	dm_real_time_tx_processing.tx_vol_by_side	85fYsc33W	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\r\n  ROUND(SUM(`SELL`), 2) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` > NOW() - INTERVAL 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\n  ROUND(SUM(`SELL`), 2) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691443292179.445000	2023-08-07 21:21:34.327123	1691443294216.021000	\N	1691443292425.369100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
126	WhO-oeLR-	1	\N	Untitled Query 1	vcVtCX3EcD	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691406162059.587000	2023-08-07 11:02:42.409041	1691406162402.519000	\N	1691406162148.335000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
133	Rt6ga_9YX	1	\N	Untitled Query 3	MSQViQs4u1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	38	\N	1691414971459.713900	2023-08-07 13:29:31.878319	1691414971862.862000	\N	1691414971574.844000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
172	4MbK-CUWd	1	\N	Untitled Query 1	zpr74kR2Lu	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`\r\nORDER BY\r\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	612	\N	1691526266406.417000	2023-08-08 20:24:26.747086	1691526266727.011000	\N	1691526266522.789000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
194	hBgtFg3hT	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529401380.040000	2023-08-08 21:16:41.957024	1691529401947.948000	\N	1691529401586.486000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
140	Y3YSvASKS	1	\N	Untitled Query 1	BT9MW6hpKE	1	success	clickhouse	SELECT\r\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691420731358.337000	2023-08-07 15:05:31.589469	1691420731579.902800	\N	1691420731409.559000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
141	Z-kSt0EPZ	1	\N	Untitled Query 1	BT9MW6hpKE	1	success	clickhouse	SELECT\r\n    ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR	\N	SELECT\n    ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691420742525.844000	2023-08-07 15:05:42.807411	1691420742802.126000	\N	1691420742619.401000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
138	xQMNOhBaJ	1	\N	dm_real_time_tx_processing.tx_vol_by_side	kU06G8pnp	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\r\n  ROUND(SUM(`SELL`), 2) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\n  ROUND(SUM(`SELL`), 2) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691420311830.325000	2023-08-07 14:58:32.249936	1691420312244.584000	\N	1691420311974.916000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
148	fMc0oXzB1	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	31	\N	1691422866446.863000	2023-08-07 15:41:06.819973	1691422866810.649000	\N	1691422866568.906000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
150	cIfLdwbXb	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	31	\N	1691422922758.781000	2023-08-07 15:42:03.17752	1691422923163.587200	\N	1691422922885.609000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
151	Wu6TOg9XQ	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`))\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`BUY`))\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691423712699.799000	2023-08-07 15:55:13.276869	1691423713243.781000	\N	1691423712806.997000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
152	xbFxBMpbd	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	31	\N	1691423725100.660200	2023-08-07 15:55:25.524587	1691423725518.451000	\N	1691423725240.353000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
161	bFRqWSCk7	1	\N	dm_real_time_tx_processing.tx_qty	SU97SXVVL	1	success	clickhouse	SELECT\r\n    count(*) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	\N	SELECT\n    count(*) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691443420637.849000	2023-08-07 21:23:41.034828	1691443420993.671000	\N	1691443420711.710000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
153	d-9WpHZ2D	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`SELL`))\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`SELL`))\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691423755324.828000	2023-08-07 15:55:55.703926	1691423755697.147000	\N	1691423755435.369000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
180	e9I5wwevX	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT * FROM `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT * FROM `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691528634654.878000	2023-08-08 21:03:55.154112	1691528635142.842000	\N	1691528634784.939000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
183	kFZ3xPqGq	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691528957996.712000	2023-08-08 21:09:18.368384	1691528958362.925000	\N	1691528958096.532200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
162	36vEOM4fc	1	\N	dm_real_time_tx_processing.tx_qty_by_side	Xe7DSgMF9	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `TS` > NOW() - INTERVAL 24 HOUR\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  toDate(NOW()) AS `TS`,\n  SUM(`BUY`) AS `BUY`,\n  SUM(`SELL`) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691443455432.489000	2023-08-07 21:24:15.907605	1691443455895.914000	\N	1691443455562.699000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
167	Rx0SkHjL-	1	\N	dm_real_time_tx_processing.price_chart	TvuHNICC0	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	131	\N	1691518861341.368000	2023-08-08 18:21:01.796617	1691518861780.921000	\N	1691518861460.900100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
173	2IlYnXu0b	1	\N	Untitled Query 1	zpr74kR2Lu	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 1	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 2	1	f	f	100	1	\N	1691526347094.084000	2023-08-08 20:25:47.411776	1691526347400.290000	\N	1691526347177.545200	\N	\N	{"progress": null}	\N	TABLE	QUERY
154	IWFeIIlyJ	1	\N	dm_real_time_tx_processing.tx_makers_by_side	MTSirv_M2	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL - 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`BUY`)) AS `BUY`,\n  countIf(notEmpty(`SELL`)) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691423785285.284000	2023-08-07 15:56:25.683488	1691423785674.637000	\N	1691423785402.435000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
163	SI2xmR3eq	1	\N	dm_real_time_tx_processing.price_chart	bODKVCf81d	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	119	\N	1691443526765.523000	2023-08-07 21:25:27.190331	1691443527154.298000	\N	1691443526858.860000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
181	0A0MiFkE4	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691528930368.829000	2023-08-08 21:08:50.732447	1691528930722.332000	\N	1691528930446.352000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
168	JSXz_GH8n	1	\N	dm_real_time_tx_processing.price_chart	TvuHNICC0	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(avgWeighted(`dm_real_time_tx_processing_swap_quote_price`, `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(avgWeighted(`dm_real_time_tx_processing_swap_quote_price`, `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	166	\N	1691518934355.707800	2023-08-08 18:22:14.716975	1691518934696.356000	\N	1691518934451.562000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
185	340EyzGr0	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529041146.394000	2023-08-08 21:10:41.513335	1691529041507.716800	\N	1691529041238.194800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
174	XiUNha-Ri	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	0	\N	1691527919424.130000	2023-08-08 20:51:59.779641	1691527919773.637000	\N	1691527919549.451200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
155	424Siw-_C	1	\N	dm_real_time_tx_processing.tx_makers_by_side	R8_4F2OlN_	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` < NOW() - INTERVAL 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`BUY`)) AS `BUY`,\n  countIf(notEmpty(`SELL`)) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691442993302.344000	2023-08-07 21:16:34.466084	1691442994381.669000	\N	1691442993595.160000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
217	qWLmGSeLq	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  argMax(`TS`, `PRICE`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMax(`TS`, `PRICE`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691578248633.471000	2023-08-09 10:50:49.040439	1691578249029.737000	\N	1691578248741.867200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
159	EdDSFXxZa	1	\N	dm_real_time_tx_processing.tx_vol	GZyDyHNM8p	1	success	clickhouse	SELECT\r\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	\N	SELECT\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\nFROM\n  `dm_real_time_tx_processing`\nWHERE\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\nLIMIT 1001	1000	f	f	100	1	\N	1691443211038.279000	2023-08-07 21:20:12.089224	1691443212011.272000	\N	1691443211178.646000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
164	EEcvrxmwW	1	\N	dm_real_time_tx_processing.price_chart	bODKVCf81d	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` < NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` < NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	0	\N	1691443531395.081000	2023-08-07 21:25:31.964871	1691443531961.251000	\N	1691443531594.950000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
171	gmWMUi5QQ	1	\N	dm_real_time_tx_processing.tx_table	GaM6SDifx	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	1000	\N	1691524935710.393000	2023-08-08 20:02:16.353771	1691524936321.023000	\N	1691524935895.213000	\N	\N	{"progress": null}	\N	TABLE	DROPDOWN
175	Ed-fFJQTY	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	612	\N	1691527938803.338100	2023-08-08 20:52:19.189561	1691527939172.442000	\N	1691527938902.092000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
156	6q8pq5ki1	1	\N	dm_real_time_tx_processing.tx_makers_by_side	R8_4F2OlN_	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`BUY`)) AS `BUY`,\n  countIf(notEmpty(`SELL`)) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691443004583.776900	2023-08-07 21:16:45.690529	1691443005608.786100	\N	1691443004829.374000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
182	5I5ulk72K	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691528943886.055000	2023-08-08 21:09:04.299604	1691528944288.617000	\N	1691528944033.410200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
184	GXMMsaMIS	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691528968885.591000	2023-08-08 21:09:29.260559	1691528969251.021000	\N	1691528968996.170000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
165	mXsmuXjPH	1	\N	dm_real_time_tx_processing.price_chart	bODKVCf81d	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	119	\N	1691443536412.563000	2023-08-07 21:25:36.773607	1691443536758.564000	\N	1691443536520.337200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
169	mGyfO6Py1	1	\N	dm_real_time_tx_processing.tx_table	XWW34IEnup	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(avgWeighted(`dm_real_time_tx_processing_swap_quote_price`, `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(avgWeighted(`dm_real_time_tx_processing_swap_quote_price`, `dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	418	\N	1691519072572.257000	2023-08-08 18:24:33.264414	1691519073239.066000	\N	1691519072802.922900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
176	5zajgzSan	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	88	\N	1691528110528.162000	2023-08-08 20:55:11.474083	1691528111465.938000	\N	1691528110601.080800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
198	gFWAEmiNd	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529687254.540000	2023-08-08 21:21:27.929944	1691529687919.599000	\N	1691529687524.568000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
157	E0EnLqWR3	1	\N	dm_real_time_tx_processing.tx_makers_by_side	R8_4F2OlN_	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\n  FROM\n    `dm_real_time_tx_processing`\n  WHERE\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\n  GROUP BY\n    `dm_real_time_tx_processing_swap_maker`\n)\n\nSELECT\n  countIf(notEmpty(`BUY`)) AS `BUY`,\n  countIf(notEmpty(`SELL`)) AS `SELL`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691443131576.399200	2023-08-07 21:18:53.347759	1691443133263.998000	\N	1691443131810.487000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
166	ME9uXyI0E	1	\N	dm_real_time_tx_processing.tx_table	dEdbu90Wq	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\n  ABS(AVG(`dm_real_time_tx_processing_swap_quote_price`)) AS `PRICE`,\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/address/',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\n    '</a>'\n  ) AS `MAKER`,\n  CONCAT(\n    '<a href="',\n    'https://',\n    `dm_real_time_tx_processing_blockchain`,\n    '/tx/',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '" target="_blank">',\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\n    '</a>'\n  ) AS `TX HASH`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `MAKER`,\n  `TX HASH`,\n  `dm_real_time_tx_processing_swap_side`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	156	\N	1691443602542.685000	2023-08-07 21:26:43.649089	1691443603050.993000	\N	1691443602658.163000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
186	j9oo3o2D-	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691529054710.089800	2023-08-08 21:10:55.177935	1691529055166.238000	\N	1691529054852.774000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
170	HQ4Uu0bdT	1	\N	dm_real_time_tx_processing.price_chart	Rw4BYDFGF	1	success	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n  CONCAT(\n    `dm_real_time_tx_processing_blockchain`,\n    ' ',\n    `dm_real_time_tx_processing_address`\n  ) AS `POOL`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > NOW() - INTERVAL 24 HOUR\nGROUP BY\n  `TS`,\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	765	\N	1691524875924.535200	2023-08-08 20:01:16.488055	1691524876462.191200	\N	1691524876137.920000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
177	25GKNtUpm	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	SELECT \n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM \n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 SECOND\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC	\N	SELECT\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\nFROM\n  `clickhouse`.`dm_real_time_tx_processing`\nWHERE\n  `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 SECOND\nGROUP BY\n  `TS`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	1	\N	1691528120092.941200	2023-08-08 20:55:20.488091	1691528120480.580000	\N	1691528120214.233000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
187	Yd8sQHiJH	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691529130298.953100	2023-08-08 21:12:10.622762	1691529130612.793000	\N	1691529130370.549800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
188	TIyHitp6E	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529136068.187000	2023-08-08 21:12:16.461697	1691529136455.156000	\N	1691529136174.932000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
199	iNyrkewH0	1	\N	Untitled Query 1	EaJ9ugPwBq	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'INTERVAL' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE FROM clickhouse.dm_real_time_tx_processing WHERE TS > ((identity(_CAST(0, 'Nullable(DateTime)')) AS _subquery603) - INTERVAL) GROUP BY TS', required columns: 'dm_real_time_tx_processing_timestamp' 'INTERVAL' 'dm_real_time_tx_processing_swap_quote_price' 'dm_real_time_tx_processing_t0_amount', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_swap_quote_price' or 'dm_real_time_tx_processing_t0_amount'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691529784995.020000	2023-08-08 21:23:05.620376	\N	\N	1691529785191.219000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'INTERVAL' while processing query: 'SELECT dm_real_time_tx_processing_timestamp AS TS, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE FROM clickhouse.dm_real_time_tx_processing WHERE TS > ((identity(_CAST(0, 'Nullable(DateTime)')) AS _subquery603) - INTERVAL) GROUP BY TS', required columns: 'dm_real_time_tx_processing_timestamp' 'INTERVAL' 'dm_real_time_tx_processing_swap_quote_price' 'dm_real_time_tx_processing_t0_amount', maybe you meant: 'dm_real_time_tx_processing_timestamp', 'dm_real_time_tx_processing_swap_quote_price' or 'dm_real_time_tx_processing_t0_amount'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
190	BQhM1xgZP	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691529333682.204000	2023-08-08 21:15:34.030848	1691529334020.828900	\N	1691529333772.943000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
204	7RjgoFi6c	1	\N	dm_real_time_tx_processing.price_30s_change	b3-TtBe0XN	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `TS`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  `TS`,\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `TS`\nLIMIT 1001	1000	f	f	100	6	\N	1691530638075.252000	2023-08-08 21:37:18.521905	1691530638488.932000	\N	1691530638165.998000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
195	mHv0_QnaG	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529427948.704000	2023-08-08 21:17:08.53349	1691529428524.467000	\N	1691529428147.249000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
189	URPZzBMD_	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT \n  first_value(`PRICE`),\n  last_value(`PRICE`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  first_value(`PRICE`),\n  last_value(`PRICE`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529277501.389000	2023-08-08 21:14:37.854074	1691529277847.780000	\N	1691529277595.865000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
216	ZqrvVQxz2	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	29	\N	1691578060821.588100	2023-08-09 10:47:41.308988	1691578061293.997000	\N	1691578060953.598100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
200	c-QvOxxjO	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 1 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 1 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529800253.619000	2023-08-08 21:23:20.912029	1691529800903.528000	\N	1691529800479.286000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
207	8SDDMnDst	1	\N	dm_real_time_tx_processing.price_60s_change	DfxpwBW88h	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 60 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 60 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691531670722.799000	2023-08-08 21:54:31.132077	1691531671124.272200	\N	1691531670827.228000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
208	WfeI9f-jM	1	\N	dm_real_time_tx_processing.price_5m_change	vJJWjFdAZ1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691531958964.943800	2023-08-08 21:59:20.29928	1691531960285.916000	\N	1691531959737.955000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
191	htg3qMTsM	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  first_value(`PRICE`),\n  last_value(`PRICE`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  first_value(`PRICE`),\n  last_value(`PRICE`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529340267.988000	2023-08-08 21:15:40.691145	1691529340684.022000	\N	1691529340393.426000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
220	Be4ca2bqQ	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691578269076.323000	2023-08-09 10:51:09.489468	1691578269483.549000	\N	1691578269206.784000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
201	nA474wDFe	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529843759.679200	2023-08-08 21:24:04.350002	1691529844339.903000	\N	1691529843984.200000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
205	n81DOQkH0	1	\N	dm_real_time_tx_processing.price_30s_change	b3-TtBe0XN	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691530662468.160000	2023-08-08 21:37:42.893915	1691530662883.515000	\N	1691530662589.273000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
210	X1GPhOab9	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691577917817.286900	2023-08-09 10:45:18.792795	1691577918774.649000	\N	1691577917966.181200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
192	evWrN2UuE	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691529347134.252000	2023-08-08 21:15:47.723661	1691529347698.643000	\N	1691529347292.636000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
202	9KRQehvxM	1	\N	dm_real_time_tx_processing.price_30s_change	b3-TtBe0XN	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691530609976.213000	2023-08-08 21:36:50.555695	1691530610514.554000	\N	1691530610146.950000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
218	F147ZB7G9	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  argMax(`TS`, `PRICE`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMax(`TS`, `PRICE`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691578257647.542000	2023-08-09 10:50:58.046233	1691578258039.812000	\N	1691578257759.346000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
222	MUge-kR5i	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `POOL` is not under aggregate function and not in GROUP BY. Have columns: ['argMax(PRICE, TS)']: While processing POOL, argMax(PRICE, TS). (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691578286288.547000	2023-08-09 10:51:26.719323	\N	\N	1691578286429.908000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `POOL` is not under aggregate function and not in GROUP BY. Have columns: ['argMax(PRICE, TS)']: While processing POOL, argMax(PRICE, TS). (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
226	VMVRefj0Q	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578424384.546900	2023-08-09 10:53:44.947973	1691578424935.095000	\N	1691578424537.019000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
193	j0Pi4svfW	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` ASC\n)\n\nSELECT\n  *\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n  ORDER BY\n    `TS` ASC\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	88	\N	1691529386238.807900	2023-08-08 21:16:26.874512	1691529386862.366000	\N	1691529386425.049000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
209	ljyTaVaab	1	\N	Untitled Query 1	DtfKVNotMA	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 10 MINUTE\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 10 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691532053688.059000	2023-08-08 22:00:54.465388	1691532054448.045000	\N	1691532053926.077000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
211	ucwG0_Q7h	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691577934076.433800	2023-08-09 10:45:34.493376	1691577934483.688200	\N	1691577934215.631000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
196	zKRzO8Vnh	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT \n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMin(`PRICE`, `TS`),\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529594969.954000	2023-08-08 21:19:55.599658	1691529595588.195000	\N	1691529595211.349900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
203	d_xA38-47	1	\N	dm_real_time_tx_processing.price_30s_change	b3-TtBe0XN	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  `TS`,\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['argMin(PRICE, TS)','argMax(PRICE, TS)']: While processing TS, (argMax(PRICE, TS) / argMin(PRICE, TS)) - 1 AS CHANGE. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691530618603.944000	2023-08-08 21:36:59.010168	\N	\N	1691530618730.753000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['argMin(PRICE, TS)','argMax(PRICE, TS)']: While processing TS, (argMax(PRICE, TS) / argMin(PRICE, TS)) - 1 AS CHANGE. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
197	Am5dZtx4Q	1	\N	Untitled Query 1	EaJ9ugPwBq	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT \n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM \n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1\nFROM \n  `agg_dm_real_time_tx_processing`\n	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691529658106.983000	2023-08-08 21:20:58.848731	1691529658826.680000	\N	1691529658380.918000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
236	IFkuoDIyq	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	74	\N	1691578975057.079000	2023-08-09 11:02:55.600977	1691578975591.055000	\N	1691578975219.476000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
206	vWw5CDa5j	1	\N	dm_real_time_tx_processing.price_30s_change	uMg9Z9a-b	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  NOW(),\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  NOW(),\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1 AS `CHANGE`\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691530777859.301000	2023-08-08 21:39:38.346892	1691530778324.603000	\N	1691530777963.309000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
212	bi7nfuvzR	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	36	\N	1691577949099.271000	2023-08-09 10:45:49.450564	1691577949442.213100	\N	1691577949198.526000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
213	krK8An0QZ	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', `dm_real_time_tx_processing_address`) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', `dm_real_time_tx_processing_address`) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_blockchain` is not under aggregate function and not in GROUP BY. Have columns: ['avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_timestamp']: While processing dm_real_time_tx_processing_timestamp AS TS, concat(dm_real_time_tx_processing_blockchain, ' ', dm_real_time_tx_processing_address) AS POOL, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691578017807.962000	2023-08-09 10:46:58.300687	\N	\N	1691578017991.492000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `dm_real_time_tx_processing_blockchain` is not under aggregate function and not in GROUP BY. Have columns: ['avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount))','dm_real_time_tx_processing_timestamp']: While processing dm_real_time_tx_processing_timestamp AS TS, concat(dm_real_time_tx_processing_blockchain, ' ', dm_real_time_tx_processing_address) AS POOL, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
219	Dc7a2b_La	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691578264587.632800	2023-08-09 10:51:05.143983	1691578265136.787800	\N	1691578264753.490000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
223	N_lsVpTEF	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  `TS`,\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`,\r\n  `TS`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  `TS`,\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`,\n  `TS`\nLIMIT 1001	1000	f	f	100	33	\N	1691578305829.542000	2023-08-09 10:51:46.270048	1691578306259.448000	\N	1691578305968.353000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
225	p46pUy6cA	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578332333.600000	2023-08-09 10:52:12.991906	1691578332980.331800	\N	1691578332467.612000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
214	xAywzNycG	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', `dm_real_time_tx_processing_address`) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', `dm_real_time_tx_processing_address`) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	31	\N	1691578025581.403000	2023-08-09 10:47:05.982661	1691578025972.225800	\N	1691578025697.537800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
237	BpPjpozyH	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	66	\N	1691578985069.072000	2023-08-09 11:03:05.532045	1691578985524.046900	\N	1691578985211.619000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
247	1otwuh5wO	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  first_value(`PRICE`) AS `FIRST_PRICE`,\r\n  first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n  last_value(`PRICE`) AS `LAST_PRICE`,\r\n  last_value(`VOLUME`) AS `LAST_PRICE`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n)\n\nSELECT\n  `POOL`,\n  first_value(`PRICE`) AS `FIRST_PRICE`,\n  first_value(`VOLUME`) AS `FIRST_VOLUME`,\n  last_value(`PRICE`) AS `LAST_PRICE`,\n  last_value(`VOLUME`) AS `LAST_PRICE`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 179. DB::Exception: Different expressions with the same alias LAST_PRICE:\nlast_value(VOLUME) AS LAST_PRICE\nand\nlast_value(PRICE) AS LAST_PRICE\n: While processing last_value(VOLUME) AS LAST_PRICE. (MULTIPLE_EXPRESSIONS_FOR_ALIAS) (version 23.8.1.94 (official build))	1691583573451.887000	2023-08-09 12:19:33.981807	\N	\N	1691583573645.663000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 179. DB::Exception: Different expressions with the same alias LAST_PRICE:\\nlast_value(VOLUME) AS LAST_PRICE\\nand\\nlast_value(PRICE) AS LAST_PRICE\\n: While processing last_value(VOLUME) AS LAST_PRICE. (MULTIPLE_EXPRESSIONS_FOR_ALIAS) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
249	OdcbdaWBp	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n)\r\n\r\nWITH `grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `FIRST_PRICE`,\r\n    first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n    last_value(`PRICE`) AS `LAST_PRICE`,\r\n    last_value(`VOLUME`) AS `LAST_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT * FROM `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n)\n\nWITH `grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `FIRST_PRICE`,\n    first_value(`VOLUME`) AS `FIRST_VOLUME`,\n    last_value(`PRICE`) AS `LAST_PRICE`,\n    last_value(`VOLUME`) AS `LAST_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT * FROM `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 659 ('WITH') (line 18, col 1): WITH `grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `FIRST_PRICE`,\n    first_value(`VOLUME`) AS `FIRST_VOLUME`,\n    . Expected one of: token, Comma, FROM, SELECT. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691583704371.192000	2023-08-09 12:21:44.932363	\N	\N	1691583704553.580000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 659 ('WITH') (line 18, col 1): WITH `grouped_dm_real_time_tx_processing` AS (\\n  SELECT\\n    `POOL`,\\n    first_value(`PRICE`) AS `FIRST_PRICE`,\\n    first_value(`VOLUME`) AS `FIRST_VOLUME`,\\n    . Expected one of: token, Comma, FROM, SELECT. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
221	wxhPzHFPe1	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691578270381.475800	2023-08-09 10:51:10.906857	1691578270901.242000	\N	1691578270588.094000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
215	pcBvl60eo	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n)\n\nSELECT\n  *\nFROM\n  `agg_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	29	\N	1691578042005.884800	2023-08-09 10:47:22.551706	1691578042536.956000	\N	1691578042220.928000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
224	Jf-EXFHOP	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  `TS`,\r\n  argMax(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`,\r\n  `TS`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  `TS`,\n  argMax(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`,\n  `TS`\nLIMIT 1001	1000	f	f	100	33	\N	1691578321446.221200	2023-08-09 10:52:01.899138	1691578321887.827000	\N	1691578321580.276100	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
227	CtK6DE17e	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`) / argMin(`PRICE`, `TS`) - 1\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578491614.775000	2023-08-09 10:54:52.197123	1691578492189.700000	\N	1691578491748.911000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
259	ZtmKXCF9I	1	\N	dm_real_time_tx_processing.price_10m_change	FwRRaAtYh1	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 10 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 10 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584172375.279800	2023-08-09 12:29:33.560907	1691584173548.135000	\N	1691584172750.217000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
228	H05b17gvV	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\n Code: 62. DB::Exception: Syntax error: failed at position 618 ('(') (line 19, col 9): (`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001\n FORMAT Native. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))	1691578686598.429000	2023-08-09 10:58:06.996339	\N	\N	1691578686715.464000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 400)\\n Code: 62. DB::Exception: Syntax error: failed at position 618 ('(') (line 19, col 9): (`PRICE`, `TS`),\\n  argMin(`PRICE`, `TS`)\\nFROM\\n  `agg_dm_real_time_tx_processing`\\nGROUP BY\\n  `POOL`\\nLIMIT 1001\\n FORMAT Native. Expected one of: token, Comma, FROM, PREWHERE, WHERE, GROUP BY, WITH, HAVING, WINDOW, ORDER BY, LIMIT, OFFSET, FETCH, SETTINGS, UNION, EXCEPT, INTERSECT, INTO OUTFILE, FORMAT, end of query. (SYNTAX_ERROR) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
238	LgFVc-jUT	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	59	\N	1691578992444.547900	2023-08-09 11:03:12.968704	1691578992940.538800	\N	1691578992602.257000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
229	0l3uUr4id	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578691601.910200	2023-08-09 10:58:12.186263	1691578692160.616000	\N	1691578691744.400000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
239	GBNb_ufbn	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	48	\N	1691583032143.519000	2023-08-09 12:10:32.625837	1691583032618.378000	\N	1691583032302.806000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
248	dMgpMVk7A	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  first_value(`PRICE`) AS `FIRST_PRICE`,\r\n  first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n  last_value(`PRICE`) AS `LAST_PRICE`,\r\n  last_value(`VOLUME`) AS `LAST_VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n)\n\nSELECT\n  `POOL`,\n  first_value(`PRICE`) AS `FIRST_PRICE`,\n  first_value(`VOLUME`) AS `FIRST_VOLUME`,\n  last_value(`PRICE`) AS `LAST_PRICE`,\n  last_value(`VOLUME`) AS `LAST_VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691583588443.249000	2023-08-09 12:19:48.954781	1691583588946.631800	\N	1691583588611.455800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
230	Vmo9qg_A9	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`),\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`),\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `VOLUME` is not under aggregate function and not in GROUP BY. Have columns: ['argMax(PRICE, TS)','argMin(PRICE, TS)','POOL']: While processing POOL, argMax(PRICE, TS), argMin(PRICE, TS), VOLUME. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691578812492.422000	2023-08-09 11:00:13.206186	\N	\N	1691578812751.445000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `VOLUME` is not under aggregate function and not in GROUP BY. Have columns: ['argMax(PRICE, TS)','argMin(PRICE, TS)','POOL']: While processing POOL, argMax(PRICE, TS), argMin(PRICE, TS), VOLUME. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
240	p_4qpjRjg	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  first_value(*)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  first_value(*)\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 42. DB::Exception: Aggregate function first_value requires single argument. (NUMBER_OF_ARGUMENTS_DOESNT_MATCH) (version 23.8.1.94 (official build))	1691583268011.615000	2023-08-09 12:14:28.519196	\N	\N	1691583268196.678000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 42. DB::Exception: Aggregate function first_value requires single argument. (NUMBER_OF_ARGUMENTS_DOESNT_MATCH) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
245	rxGJDI53H	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  first_value(`PRICE`),\r\n  first_value(`VOLUME`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  first_value(`PRICE`),\n  first_value(`VOLUME`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['first_value(VOLUME)','first_value(PRICE)','POOL']: While processing TS DESC. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691583460675.988000	2023-08-09 12:17:41.122486	\N	\N	1691583460827.031000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['first_value(VOLUME)','first_value(PRICE)','POOL']: While processing TS DESC. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
260	EH-T0RBne	1	\N	dm_real_time_tx_processing.price_5m_change	CF0lvs3RWI	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584211160.528800	2023-08-09 12:30:12.592788	1691584212575.154000	\N	1691584211583.808800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
231	C21i0qaNP	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`),\r\n  SUM(`VOLUME`) AS `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(`dm_real_time_tx_processing_t0_amount`) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`),\n  SUM(`VOLUME`) AS `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578827488.023000	2023-08-09 11:00:28.139246	1691578828124.961000	\N	1691578827627.100000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
241	mxGrbrq-F	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS`\nLIMIT 1001	1000	f	f	100	48	\N	1691583279720.840000	2023-08-09 12:14:40.207813	1691583280198.459000	\N	1691583279885.124000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
243	ZU_OO-x5E	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` ASC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` ASC\nLIMIT 1001	1000	f	f	100	48	\N	1691583359918.505900	2023-08-09 12:16:00.396138	1691583360385.304000	\N	1691583360080.840000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
232	oD-RBI8-L	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`),\r\n  SUM(`VOLUME`) AS `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`),\n  SUM(`VOLUME`) AS `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691578840517.810000	2023-08-09 11:00:41.149915	1691578841139.833000	\N	1691578840700.171900	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
244	6kSBIJcpM	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	48	\N	1691583365825.368000	2023-08-09 12:16:06.269581	1691583366260.200000	\N	1691583365973.308000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
233	466xBsoAY	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  argMax(`PRICE`, `TS`),\r\n  argMin(`PRICE`, `TS`),\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`,\r\n  `VOLUME`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  argMax(`PRICE`, `TS`),\n  argMin(`PRICE`, `TS`),\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`,\n  `VOLUME`\nLIMIT 1001	1000	f	f	100	56	\N	1691578886159.790000	2023-08-09 11:01:26.71665	1691578886703.830000	\N	1691578886305.825000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
242	44u4Q5v40	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nORDER BY\r\n  `TS` DESC	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nORDER BY\n  `TS` DESC\nLIMIT 1001	1000	f	f	100	48	\N	1691583350344.091800	2023-08-09 12:15:50.810745	1691583350801.337000	\N	1691583350500.454800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
234	5gWf4H0Df	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `TS`,\r\n  `POOL`,\r\n  `PRICE`,\r\n  -- argMax(`PRICE`, `TS`),\r\n  -- argMin(`PRICE`, `TS`),\r\n  `VOLUME`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`,\r\n  `VOLUME`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `TS`,\n  `POOL`,\n  `PRICE`,\n  `VOLUME`\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`,\n  `VOLUME`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['VOLUME','POOL']: While processing TS, POOL, PRICE, VOLUME. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))	1691578938469.482000	2023-08-09 11:02:18.993078	\N	\N	1691578938624.001000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 500)\\n Code: 215. DB::Exception: Column `TS` is not under aggregate function and not in GROUP BY. Have columns: ['VOLUME','POOL']: While processing TS, POOL, PRICE, VOLUME. (NOT_AN_AGGREGATE) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
261	Wq2njNEI3	1	\N	dm_real_time_tx_processing.price_1m_change	2GvJ6kl16-	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 1 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 1 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584254780.065000	2023-08-09 12:30:56.262812	1691584256249.148000	\N	1691584255220.205000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
246	_0eEA5PDx	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` DESC\r\n)\r\n\r\nSELECT\r\n  `POOL`,\r\n  first_value(`PRICE`),\r\n  first_value(`VOLUME`)\r\nFROM \r\n  `agg_dm_real_time_tx_processing`\r\nGROUP BY\r\n  `POOL`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` DESC\n)\n\nSELECT\n  `POOL`,\n  first_value(`PRICE`),\n  first_value(`VOLUME`)\nFROM\n  `agg_dm_real_time_tx_processing`\nGROUP BY\n  `POOL`\nLIMIT 1001	1000	f	f	100	4	\N	1691583472729.629200	2023-08-09 12:17:53.320487	1691583473310.400000	\N	1691583472904.535200	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
250	t6mjuWVN2	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `FIRST_PRICE`,\r\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n      last_value(`PRICE`) AS `LAST_PRICE`,\r\n      last_value(`VOLUME`) AS `LAST_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT * FROM `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `FIRST_PRICE`,\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\n      last_value(`PRICE`) AS `LAST_PRICE`,\n      last_value(`VOLUME`) AS `LAST_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT * FROM `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	4	\N	1691583734228.585000	2023-08-09 12:22:15.423211	1691583735400.633000	\N	1691583734581.373000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
251	2EYA5mnY1	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `FIRST_PRICE`,\r\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n      last_value(`PRICE`) AS `LAST_PRICE`,\r\n      last_value(`VOLUME`) AS `LAST_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT \r\n  avgWeighted(`FIRST_PRICE`, `FIRST_VOLUME`),\r\n  avgWeighted(`LAST_PRICE`, `LAST_VOLUME`)\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `FIRST_PRICE`,\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\n      last_value(`PRICE`) AS `LAST_PRICE`,\n      last_value(`VOLUME`) AS `LAST_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT\n  avgWeighted(`FIRST_PRICE`, `FIRST_VOLUME`),\n  avgWeighted(`LAST_PRICE`, `LAST_VOLUME`)\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691583839284.171100	2023-08-09 12:24:00.532491	1691583840511.947000	\N	1691583839634.178000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
262	Hw4Q2my0q	1	\N	dm_real_time_tx_processing.price_current	GlnFsTMOaS	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH'\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691586237129.957000	2023-08-09 13:03:57.683788	1691586237675.185000	\N	1691586237281.780000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
256	ju97xtKQb	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584081306.187000	2023-08-09 12:28:02.570393	1691584082558.409000	\N	1691584081608.633000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
252	iI1vtIR6Q	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `FIRST_PRICE`,\r\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\r\n      last_value(`PRICE`) AS `LAST_PRICE`,\r\n      last_value(`VOLUME`) AS `LAST_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT \r\n  *\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `FIRST_PRICE`,\n      first_value(`VOLUME`) AS `FIRST_VOLUME`,\n      last_value(`PRICE`) AS `LAST_PRICE`,\n      last_value(`VOLUME`) AS `LAST_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT\n  *\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	4	\N	1691583873622.162000	2023-08-09 12:24:34.954771	1691583874936.604000	\N	1691583873878.578000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
263	9W2PiDozy	1	\N	dm_real_time_tx_processing.price_current	GlnFsTMOaS	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  *\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH'\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  *\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	4	\N	1691586245764.825200	2023-08-09 13:04:06.250995	1691586246244.031000	\N	1691586245923.390000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
253	FC8JQR726	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	failed	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT \r\n  avgWeighted(`FIRST_PRICE`, `FIRST_VOLUME`),\r\n  avgWeighted(`LAST_PRICE`, `LAST_VOLUME`)\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT\n  avgWeighted(`FIRST_PRICE`, `FIRST_VOLUME`),\n  avgWeighted(`LAST_PRICE`, `LAST_VOLUME`)\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	0	\N	base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\n Code: 47. DB::Exception: Missing columns: 'LAST_VOLUME' 'LAST_PRICE' 'FIRST_VOLUME' 'FIRST_PRICE' while processing query: 'WITH agg_dm_real_time_tx_processing AS (SELECT dm_real_time_tx_processing_timestamp AS TS, concat(dm_real_time_tx_processing_blockchain, ' ', lower(dm_real_time_tx_processing_address)) AS POOL, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE, sum(abs(dm_real_time_tx_processing_t0_amount)) AS VOLUME FROM clickhouse.dm_real_time_tx_processing WHERE TS > ((SELECT max(dm_real_time_tx_processing_timestamp) FROM clickhouse.dm_real_time_tx_processing) - toIntervalMinute(5)) GROUP BY TS, POOL ORDER BY TS ASC), grouped_dm_real_time_tx_processing AS (SELECT POOL, first_value(PRICE) AS PREVIOUS_PRICE, first_value(VOLUME) AS PREVIOUS_VOLUME, last_value(PRICE) AS CURRENT_PRICE, last_value(VOLUME) AS CURRENT_VOLUME FROM agg_dm_real_time_tx_processing GROUP BY POOL) SELECT avgWeighted(FIRST_PRICE, FIRST_VOLUME), avgWeighted(LAST_PRICE, LAST_VOLUME) FROM grouped_dm_real_time_tx_processing LIMIT 1001', required columns: 'FIRST_PRICE' 'FIRST_VOLUME' 'LAST_PRICE' 'LAST_VOLUME' 'FIRST_PRICE' 'FIRST_VOLUME' 'LAST_PRICE' 'LAST_VOLUME'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))	1691583913831.817000	2023-08-09 12:25:14.971702	\N	\N	1691583914219.512000	\N	\N	{"progress": "Running statement 1 out of 1", "errors": [{"message": "base error: :HTTPDriver for http://clickhouse:8123 returned response code 404)\\n Code: 47. DB::Exception: Missing columns: 'LAST_VOLUME' 'LAST_PRICE' 'FIRST_VOLUME' 'FIRST_PRICE' while processing query: 'WITH agg_dm_real_time_tx_processing AS (SELECT dm_real_time_tx_processing_timestamp AS TS, concat(dm_real_time_tx_processing_blockchain, ' ', lower(dm_real_time_tx_processing_address)) AS POOL, avgWeighted(abs(dm_real_time_tx_processing_swap_quote_price), abs(dm_real_time_tx_processing_t0_amount)) AS PRICE, sum(abs(dm_real_time_tx_processing_t0_amount)) AS VOLUME FROM clickhouse.dm_real_time_tx_processing WHERE TS > ((SELECT max(dm_real_time_tx_processing_timestamp) FROM clickhouse.dm_real_time_tx_processing) - toIntervalMinute(5)) GROUP BY TS, POOL ORDER BY TS ASC), grouped_dm_real_time_tx_processing AS (SELECT POOL, first_value(PRICE) AS PREVIOUS_PRICE, first_value(VOLUME) AS PREVIOUS_VOLUME, last_value(PRICE) AS CURRENT_PRICE, last_value(VOLUME) AS CURRENT_VOLUME FROM agg_dm_real_time_tx_processing GROUP BY POOL) SELECT avgWeighted(FIRST_PRICE, FIRST_VOLUME), avgWeighted(LAST_PRICE, LAST_VOLUME) FROM grouped_dm_real_time_tx_processing LIMIT 1001', required columns: 'FIRST_PRICE' 'FIRST_VOLUME' 'LAST_PRICE' 'LAST_VOLUME' 'FIRST_PRICE' 'FIRST_VOLUME' 'LAST_PRICE' 'LAST_VOLUME'. (UNKNOWN_IDENTIFIER) (version 23.8.1.94 (official build))\\n", "error_type": "GENERIC_DB_ENGINE_ERROR", "level": "error", "extra": {"engine_name": null, "issue_codes": [{"code": 1002, "message": "Issue 1002 - The database returned an unexpected error."}]}}]}	\N	TABLE	DROPDOWN
254	hWI48VyvY	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT \r\n  avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`),\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`)\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT\n  avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`),\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`)\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691583930621.432100	2023-08-09 12:25:31.940775	1691583931927.992200	\N	1691583931018.080000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
264	p0i6bdcaN	1	\N	dm_real_time_tx_processing.price_current	GlnFsTMOaS	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH'\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691586272089.041000	2023-08-09 13:04:32.619771	1691586272611.619000	\N	1691586272252.621800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
257	bR9Zy1V5D	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584091099.225000	2023-08-09 12:28:12.359146	1691584092350.600000	\N	1691584091521.348000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
255	c_fgae4ef	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n), \r\n  `grouped_dm_real_time_tx_processing` AS (\r\n    SELECT\r\n      `POOL`,\r\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n    FROM \r\n      `agg_dm_real_time_tx_processing`\r\n    GROUP BY\r\n      `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n  `grouped_dm_real_time_tx_processing` AS (\n    SELECT\n      `POOL`,\n      first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n      first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n      last_value(`PRICE`) AS `CURRENT_PRICE`,\n      last_value(`VOLUME`) AS `CURRENT_VOLUME`\n    FROM\n      `agg_dm_real_time_tx_processing`\n    GROUP BY\n      `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584057757.056000	2023-08-09 12:27:38.937527	1691584058927.987000	\N	1691584058112.819800	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
265	rg-0Keb25	1	\N	dm_real_time_tx_processing.price_current	GlnFsTMOaS	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691586306563.189000	2023-08-09 13:05:07.192929	1691586307185.744100	\N	1691586306687.175000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
258	8x-cSEAoA	1	\N	dm_real_time_tx_processing.price_30s_change	yUWTANX6VM	1	success	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	WITH `agg_dm_real_time_tx_processing` AS (\n  SELECT\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\n  FROM\n    `clickhouse`.`dm_real_time_tx_processing`\n  WHERE\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\n  GROUP BY\n    `TS`,\n    `POOL`\n  ORDER BY\n    `TS` ASC\n),\n\n`grouped_dm_real_time_tx_processing` AS (\n  SELECT\n    `POOL`,\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\n  FROM\n    `agg_dm_real_time_tx_processing`\n  GROUP BY\n    `POOL`\n)\n\nSELECT\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\nFROM\n  `grouped_dm_real_time_tx_processing`\nLIMIT 1001	1000	f	f	100	1	\N	1691584117741.874000	2023-08-09 12:28:38.932243	1691584118924.107200	\N	1691584118143.419000	\N	\N	{"progress": null}	\N	TABLE	NOT_LIMITED
\.


--
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_execution_log (id, scheduled_dttm, start_dttm, end_dttm, value, value_row_json, state, error_message, report_schedule_id, uuid) FROM stdin;
\.


--
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_recipient (id, type, recipient_config_json, report_schedule_id, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra, force_screenshot) FROM stdin;
\.


--
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule_user (id, user_id, report_schedule_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_roles (id, role_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_tables (id, table_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.row_level_security_filters (created_on, changed_on, id, clause, created_by_fk, changed_by_fk, filter_type, group_key) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid) FROM stdin;
2023-08-08 21:24:12.846988	2023-08-09 12:28:42.496667	11	1	1	dm_real_time_tx_processing.price_30s_change	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 30 SECOND\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	None	1	1	{}	2023-08-09 10:45:18.836882	1	0c57f7bd-cf91-4db8-b4d0-667f73d04d69
2023-08-08 21:59:11.261538	2023-08-09 12:30:15.448659	13	1	1	dm_real_time_tx_processing.price_5m_change	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 5 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	None	1	1	{}	2023-08-08 21:59:20.353194	1	f4b5cfc4-0642-4919-aab3-6a11777d133d
2023-08-06 19:37:47.844799	2023-08-08 20:01:48.248987	3	1	1	dm_real_time_tx_processing.price_chart	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000;	None	1	1	{}	2023-08-08 18:21:01.832509	131	43608627-2d69-487c-9e5a-8db860203ea8
2023-08-07 15:06:40.885686	2023-08-07 21:20:16.816361	8	1	1	dm_real_time_tx_processing.tx_vol	clickhouse	SELECT\r\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	None	1	1	{}	\N	\N	fb21b43d-47b1-48c5-a206-0d084383dd6b
2023-08-07 11:07:03.373569	2023-08-07 21:21:47.708133	5	1	1	dm_real_time_tx_processing.tx_vol_by_side	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\r\n  ROUND(SUM(`SELL`), 2) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	None	1	1	{}	2023-08-07 14:58:02.573618	1	6824e2a2-ab24-468a-82ce-3c0f03da279e
2023-08-06 17:24:43.311085	2023-08-08 20:02:24.601128	2	1	1	dm_real_time_tx_processing.tx_table	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC	None	1	1	{}	2023-08-06 19:32:11.662804	26	d4da962d-df4f-4b8d-ac89-35f66660926b
2023-08-07 13:30:50.903827	2023-08-07 21:18:53.40867	7	1	1	dm_real_time_tx_processing.tx_makers_by_side	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	None	\N	1	{}	2023-08-07 21:18:53.404059	1	f137a4f0-68da-4e0d-8df2-2daa65b4e03f
2023-08-07 15:35:18.008227	2023-08-07 21:19:20.534898	9	1	1	dm_real_time_tx_processing.tx_makers	clickhouse	SELECT\r\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	\N	1	1	{}	\N	\N	5d8d2cd4-d0e5-4bf4-9946-50fa866157b2
2023-08-07 11:11:52.40044	2023-08-07 21:23:52.352624	6	1	1	dm_real_time_tx_processing.tx_qty	clickhouse	SELECT\r\n    COUNT(*) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR	None	1	1	{}	\N	\N	f4af6c91-74bf-49e1-af61-9fc099e2e667
2023-08-06 21:16:35.605214	2023-08-07 21:24:25.549353	4	1	1	dm_real_time_tx_processing.tx_qty_by_side	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	None	1	1	{}	2023-08-07 10:51:40.925895	1	efc2d84d-9b68-4e6c-ac81-a6a8cf522110
2023-08-08 21:54:27.262221	2023-08-09 12:30:58.957227	12	1	1	dm_real_time_tx_processing.price_1m_change	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 1 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	None	1	1	{}	2023-08-08 21:54:31.161126	1	f8b3feec-f3d3-43b4-bc07-af023e4923c6
2023-08-08 20:26:30.885989	2023-08-09 13:05:11.513062	10	1	1	dm_real_time_tx_processing.price_current	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	None	1	1	{}	\N	\N	f105b778-cd9a-43e0-9647-2068ed4a5bd4
2023-08-08 22:01:13.406031	2023-08-09 12:29:37.684179	14	1	1	dm_real_time_tx_processing.price_10m_change	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (SELECT MAX(`dm_real_time_tx_processing_timestamp`) FROM `clickhouse`.`dm_real_time_tx_processing`) - INTERVAL 10 MINUTE\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	None	1	1	{}	\N	\N	788fcf84-2e95-4799-bf61-5766b12d94e5
\.


--
-- Data for Name: slice_email_schedules; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slice_email_schedules (created_on, changed_on, id, active, crontab, recipients, deliver_as_group, delivery_type, slice_id, email_format, created_by_fk, changed_by_fk, user_id, slack_channel, uuid) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
6	1	6
8	1	8
10	1	10
11	1	11
12	1	12
13	1	13
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slices (created_on, changed_on, id, slice_name, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2023-08-06 19:44:49.557075	2023-08-08 18:31:16.039664	8	PRICE CHART	table	clickhouse.dm_real_time_tx_processing.weth.usdc.price_chart	echarts_timeseries_line	{\n  "adhoc_filters": [],\n  "annotation_layers": [],\n  "color_scheme": "supersetColors",\n  "comparison_type": "values",\n  "datasource": "12__table",\n  "extra_form_data": {},\n  "forecastInterval": 0.8,\n  "forecastPeriods": 10,\n  "granularity_sqla": "TS",\n  "groupby": [\n    "POOL"\n  ],\n  "legendOrientation": "top",\n  "legendType": "scroll",\n  "markerEnabled": false,\n  "markerSize": 6,\n  "metrics": [\n    {\n      "aggregate": null,\n      "column": null,\n      "expressionType": "SQL",\n      "hasCustomLabel": true,\n      "isNew": false,\n      "label": "PRICE",\n      "optionName": "metric_6nj5i34fg3n_ekie1ow5mmu",\n      "sqlExpression": "AVG(`PRICE`)"\n    }\n  ],\n  "only_total": true,\n  "order_desc": true,\n  "resample_method": "linear",\n  "resample_rule": "1S",\n  "rich_tooltip": false,\n  "row_limit": 1000,\n  "show_legend": true,\n  "show_value": false,\n  "slice_id": 8,\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "tooltipTimeFormat": "smart_date",\n  "truncateYAxis": true,\n  "viz_type": "echarts_timeseries_line",\n  "x_axis_time_format": "smart_date",\n  "x_axis_title_margin": 15,\n  "y_axis_bounds": [\n    null,\n    null\n  ],\n  "y_axis_format": "~g",\n  "y_axis_title_margin": 15,\n  "y_axis_title_position": "Left",\n  "zoomable": true\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_chart](id:12)	12	[ClickHouse].[clickhouse]	190e42d4-63c7-4960-95bb-eb26f839f53e	{"datasource":{"id":12,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"TS","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":["POOL"],"metrics":[{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":true,"isNew":false,"label":"PRICE","optionName":"metric_6nj5i34fg3n_ekie1ow5mmu","sqlExpression":"AVG(`PRICE`)"}],"orderby":[[{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":true,"isNew":false,"label":"PRICE","optionName":"metric_6nj5i34fg3n_ekie1ow5mmu","sqlExpression":"AVG(`PRICE`)"},false]],"annotation_layers":[],"row_limit":1000,"series_columns":["POOL"],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"is_timeseries":true,"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["__timestamp"],"columns":["POOL"],"aggregates":{"PRICE":{"operator":"mean"}},"drop_missing_columns":false,"flatten_columns":false,"reset_index":false}},{"operation":"resample","options":{"method":"linear","rule":"1S","fill_value":null}},{"operation":"rename","options":{"columns":{"PRICE":null},"level":0,"inplace":true}},{"operation":"flatten"}]}],"form_data":{"viz_type":"echarts_timeseries_line","datasource":"12__table","slice_id":8,"time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"TS","time_grain_sqla":null,"time_range":"No filter","metrics":[{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":true,"isNew":false,"label":"PRICE","optionName":"metric_6nj5i34fg3n_ekie1ow5mmu","sqlExpression":"AVG(`PRICE`)"}],"groupby":["POOL"],"adhoc_filters":[],"order_desc":true,"row_limit":1000,"comparison_type":"values","resample_rule":"1S","resample_method":"linear","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","color_scheme":"supersetColors","show_value":false,"only_total":true,"markerEnabled":false,"markerSize":6,"zoomable":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","rich_tooltip":false,"tooltipTimeFormat":"smart_date","y_axis_format":"~g","truncateYAxis":true,"y_axis_bounds":[null,null],"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 18:31:16.032905	1	\N	\N	f	\N
2023-08-07 13:32:30.412492	2023-08-07 21:34:30.905338	13	TX MAKERS 24H	table	clickhouse.dm_real_time_tx_processing.tx_makers_by_side	table	{\n  "adhoc_filters": [],\n  "all_columns": [\n    "BUY",\n    "SELL"\n  ],\n  "color_pn": false,\n  "column_config": {\n    "BUY": {\n      "colorPositiveNegative": true,\n      "d3NumberFormat": ".3s",\n      "d3SmallNumberFormat": ".3s",\n      "horizontalAlign": "center",\n      "showCellBars": false\n    },\n    "SELL": {\n      "alignPositiveNegative": false,\n      "colorPositiveNegative": true,\n      "d3NumberFormat": ".3s",\n      "d3SmallNumberFormat": ".3s",\n      "horizontalAlign": "center",\n      "showCellBars": false\n    }\n  },\n  "conditional_formatting": [\n    {\n      "colorScheme": "rgb(0,255,0)",\n      "column": "BUY",\n      "operator": ">",\n      "targetValue": 0\n    },\n    {\n      "colorScheme": "rgb(255,0,0)",\n      "column": "SELL",\n      "operator": ">",\n      "targetValue": 0\n    }\n  ],\n  "datasource": "16__table",\n  "extra_form_data": {},\n  "groupby": [],\n  "metrics": [],\n  "order_by_cols": [],\n  "order_desc": true,\n  "percent_metrics": [],\n  "query_mode": "raw",\n  "row_limit": 1000,\n  "server_page_length": 10,\n  "show_cell_bars": false,\n  "table_timestamp_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "table"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_by_side](id:16)	16	[ClickHouse].[clickhouse]	15bc1fe4-5e78-400b-af05-f821853850f4	{"datasource":{"id":16,"type":"table"},"force":false,"queries":[{"time_range":"No filter","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":["BUY","SELL"],"orderby":[],"annotation_layers":[],"row_limit":1000,"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"post_processing":[]}],"form_data":{"viz_type":"table","datasource":"16__table","time_range_endpoints":["inclusive","exclusive"],"time_grain_sqla":null,"time_range":"No filter","query_mode":"raw","groupby":[],"metrics":[],"all_columns":["BUY","SELL"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":1000,"server_page_length":10,"include_time":false,"order_desc":true,"table_timestamp_format":"smart_date","show_cell_bars":false,"color_pn":false,"column_config":{"BUY":{"horizontalAlign":"center","d3NumberFormat":".3s","d3SmallNumberFormat":".3s","showCellBars":false,"colorPositiveNegative":true},"SELL":{"horizontalAlign":"center","d3NumberFormat":".3s","d3SmallNumberFormat":".3s","showCellBars":false,"colorPositiveNegative":true,"alignPositiveNegative":false}},"conditional_formatting":[{"column":"BUY","colorScheme":"rgb(0,255,0)","operator":">","targetValue":0},{"column":"SELL","colorScheme":"rgb(255,0,0)","operator":">","targetValue":0}],"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-07 13:32:30.406494	1	\N	\N	f	\N
2023-08-06 18:03:21.638818	2023-08-07 21:34:30.833504	6	TX TABLE	table	clickhouse.dm_real_time_tx_processing.tx_table 	table	{\n  "adhoc_filters": [],\n  "all_columns": [\n    "TS",\n    "SIDE",\n    "PRICE",\n    "VOLUME",\n    "MAKER",\n    "TX HASH"\n  ],\n  "color_pn": false,\n  "conditional_formatting": [],\n  "datasource": "2__table",\n  "extra_form_data": {},\n  "granularity_sqla": "TS",\n  "groupby": [],\n  "metrics": [],\n  "order_by_cols": [],\n  "order_desc": true,\n  "page_length": 10,\n  "percent_metrics": [],\n  "query_mode": "raw",\n  "row_limit": 10000,\n  "server_page_length": 10,\n  "show_cell_bars": false,\n  "table_timestamp_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "table"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_table ](id:2)	2	[ClickHouse].[clickhouse]	7aecabc2-3446-4a77-9712-420f72a2279d	{"datasource":{"id":2,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"TS","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":["TS","SIDE","PRICE","VOLUME","MAKER","TX HASH"],"orderby":[],"annotation_layers":[],"row_limit":10000,"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"post_processing":[]}],"form_data":{"viz_type":"table","datasource":"2__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"TS","time_grain_sqla":null,"time_range":"No filter","query_mode":"raw","groupby":[],"metrics":[],"all_columns":["TS","SIDE","PRICE","VOLUME","MAKER","TX HASH"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":10000,"server_page_length":10,"include_time":false,"order_desc":true,"table_timestamp_format":"smart_date","page_length":10,"show_cell_bars":false,"color_pn":false,"conditional_formatting":[],"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-06 18:03:21.628983	1	\N	\N	f	\N
2023-08-06 22:07:19.019819	2023-08-07 21:34:30.86502	10	TX QTY 24H	table	clickhouse.dm_real_time_tx_processing.tx_qty	table	{\n  "adhoc_filters": [],\n  "all_columns": [\n    "TS",\n    "BUY",\n    "SELL"\n  ],\n  "color_pn": true,\n  "column_config": {\n    "BUY": {\n      "colorPositiveNegative": true,\n      "horizontalAlign": "center",\n      "showCellBars": false\n    },\n    "SELL": {\n      "colorPositiveNegative": true,\n      "horizontalAlign": "center",\n      "showCellBars": false\n    }\n  },\n  "conditional_formatting": [\n    {\n      "colorScheme": "rgb(0,255,0)",\n      "column": "BUY",\n      "operator": ">",\n      "targetValue": 0\n    },\n    {\n      "colorScheme": "rgb(255,0,0)",\n      "column": "SELL",\n      "operator": ">",\n      "targetValue": 0\n    }\n  ],\n  "datasource": "13__table",\n  "extra_form_data": {},\n  "granularity_sqla": "TS",\n  "groupby": [\n    "BUY",\n    "SELL"\n  ],\n  "metrics": [],\n  "order_by_cols": [],\n  "order_desc": true,\n  "percent_metrics": [],\n  "query_mode": "aggregate",\n  "row_limit": 10000,\n  "server_page_length": 10,\n  "show_cell_bars": true,\n  "show_totals": false,\n  "table_timestamp_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "table"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_by_side](id:13)	13	[ClickHouse].[clickhouse]	e202f727-64c1-471e-8df1-973faecb0087	{"datasource":{"id":13,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"TS","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":["BUY","SELL"],"metrics":[],"orderby":[],"annotation_layers":[],"row_limit":10000,"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"post_processing":[]}],"form_data":{"viz_type":"table","datasource":"13__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"TS","time_grain_sqla":null,"time_range":"No filter","query_mode":"aggregate","groupby":["BUY","SELL"],"metrics":[],"all_columns":["TS","BUY","SELL"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":10000,"server_page_length":10,"order_desc":true,"show_totals":false,"table_timestamp_format":"smart_date","show_cell_bars":true,"color_pn":true,"column_config":{"BUY":{"showCellBars":false,"colorPositiveNegative":true,"horizontalAlign":"center"},"SELL":{"horizontalAlign":"center","showCellBars":false,"colorPositiveNegative":true}},"conditional_formatting":[{"column":"BUY","colorScheme":"rgb(0,255,0)","operator":">","targetValue":0},{"column":"SELL","colorScheme":"rgb(255,0,0)","operator":">","targetValue":0}],"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-06 22:10:31.54235	1	\N	\N	f	\N
2023-08-07 11:14:03.700435	2023-08-07 21:34:30.8764	12	TX QTY TOTAL	table	clickhouse.dm_real_time_tx_processing.tx_qty	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "15__table",\n  "extra_form_data": {},\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": true,\n    "isNew": false,\n    "label": "TOTAL",\n    "optionName": "metric_ovwvsuu3yh_26pps3gbj7s",\n    "sqlExpression": "AVG(TOTAL)"\n  },\n  "slice_id": 12,\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": ".3s"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_total](id:15)	15	[ClickHouse].[clickhouse]	5089ae4d-6c1c-418d-83c5-fe418769fe34	{"datasource":{"id":15,"type":"table"},"force":false,"queries":[{"time_range":"No filter","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":true,"isNew":false,"label":"TOTAL","optionName":"metric_ovwvsuu3yh_26pps3gbj7s","sqlExpression":"AVG(TOTAL)"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"15__table","slice_id":12,"time_range_endpoints":["inclusive","exclusive"],"time_grain_sqla":null,"time_range":"No filter","metric":{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":true,"isNew":false,"label":"TOTAL","optionName":"metric_ovwvsuu3yh_26pps3gbj7s","sqlExpression":"AVG(TOTAL)"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":".3s","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-07 12:01:08.702034	1	\N	\N	f	\N
2023-08-07 15:37:15.197731	2023-08-07 21:34:30.939383	17	TX MAKERS TOTAL	table	clickhouse.dm_real_time_tx_processing.tx_makers	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "18__table",\n  "extra_form_data": {},\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": true,\n    "isNew": false,\n    "label": "TOTAL",\n    "optionName": "metric_wt55p0cnm7_gl2j050ilem",\n    "sqlExpression": "AVG(TOTAL)"\n  },\n  "slice_id": 17,\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": "SMART_NUMBER"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_total](id:18)	18	[ClickHouse].[clickhouse]	5803d88f-6265-4ccb-a809-8484a74ad7bd	{"datasource":{"id":18,"type":"table"},"force":false,"queries":[{"time_range":"No filter","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(TOTAL)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"TOTAL","optionName":"metric_wt55p0cnm7_gl2j050ilem"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"18__table","slice_id":17,"time_range_endpoints":["inclusive","exclusive"],"time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(TOTAL)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"TOTAL","optionName":"metric_wt55p0cnm7_gl2j050ilem"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-07 15:38:42.957797	1	\N	\N	f	\N
2023-08-08 20:46:46.929079	2023-08-08 21:42:37.363496	18	PRICE	table	clickhouse.dm_real_time_tx_processing.price_current	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "19__table",\n  "extra_form_data": {},\n  "granularity_sqla": "TS",\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": true,\n    "isNew": false,\n    "label": "PRICE",\n    "optionName": "metric_5d1ka8vax1i_9fvvdqium37",\n    "sqlExpression": "AVG(PRICE)"\n  },\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": "~g"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_current](id:19)	19	[ClickHouse].[clickhouse]	d03e9ad2-7203-4208-b80f-3adc17105cfd	{"datasource":{"id":19,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"TS","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(PRICE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"PRICE","optionName":"metric_5d1ka8vax1i_9fvvdqium37"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"19__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"TS","time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(PRICE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"PRICE","optionName":"metric_5d1ka8vax1i_9fvvdqium37"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"~g","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 20:46:46.917176	1	\N	\N	f	\N
2023-08-07 11:04:59.077104	2023-08-07 21:34:30.891053	11	TX VOL 24H	table	clickhouse.dm_real_time_tx_processing.tx_vol_by_side	table	{\n  "adhoc_filters": [],\n  "all_columns": [\n    "BUY",\n    "SELL"\n  ],\n  "color_pn": true,\n  "column_config": {\n    "BUY": {\n      "alignPositiveNegative": false,\n      "colorPositiveNegative": false,\n      "d3NumberFormat": ".3s",\n      "d3SmallNumberFormat": ".3s",\n      "horizontalAlign": "center",\n      "showCellBars": false\n    },\n    "SELL": {\n      "horizontalAlign": "center",\n      "showCellBars": false\n    }\n  },\n  "conditional_formatting": [\n    {\n      "colorScheme": "rgb(0,255,0)",\n      "column": "BUY",\n      "operator": ">",\n      "targetValue": 0\n    },\n    {\n      "colorScheme": "rgb(255,0,0)",\n      "column": "SELL",\n      "operator": ">",\n      "targetValue": 0\n    }\n  ],\n  "datasource": "14__table",\n  "extra_form_data": {},\n  "groupby": [],\n  "metrics": [],\n  "order_by_cols": [],\n  "order_desc": true,\n  "percent_metrics": [],\n  "query_mode": "raw",\n  "row_limit": 1000,\n  "server_page_length": 10,\n  "show_cell_bars": false,\n  "slice_id": 11,\n  "table_timestamp_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "table"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_by_side](id:14)	14	[ClickHouse].[clickhouse]	c0235a57-fc0b-43ed-b6a6-f53df122a97e	{"datasource":{"id":14,"type":"table"},"force":false,"queries":[{"time_range":"No filter","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":["BUY","SELL"],"orderby":[],"annotation_layers":[],"row_limit":1000,"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"post_processing":[]}],"form_data":{"viz_type":"table","datasource":"14__table","slice_id":11,"time_range_endpoints":["inclusive","exclusive"],"time_grain_sqla":null,"time_range":"No filter","query_mode":"raw","groupby":[],"metrics":[],"all_columns":["BUY","SELL"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":1000,"server_page_length":10,"include_time":false,"order_desc":true,"table_timestamp_format":"smart_date","show_cell_bars":false,"color_pn":true,"column_config":{"BUY":{"horizontalAlign":"center","showCellBars":false,"d3NumberFormat":".3s","d3SmallNumberFormat":".3s","alignPositiveNegative":false,"colorPositiveNegative":false},"SELL":{"horizontalAlign":"center","showCellBars":false}},"conditional_formatting":[{"colorScheme":"rgb(0,255,0)","column":"BUY","operator":">","targetValue":0},{"colorScheme":"rgb(255,0,0)","column":"SELL","operator":">","targetValue":0}],"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-07 14:56:01.263756	1	\N	\N	f	\N
2023-08-07 15:13:38.442647	2023-08-07 21:34:30.919491	16	TX VOL TOTAL	table	clickhouse.dm_real_time_tx_processing.tx_vol	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "17__table",\n  "extra_form_data": {},\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": true,\n    "isNew": false,\n    "label": "TOTAL",\n    "optionName": "metric_vne8kj0351r_7bxmbdynn7s",\n    "sqlExpression": "AVG(TOTAL)"\n  },\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": "SMART_NUMBER"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_total](id:17)	17	[ClickHouse].[clickhouse]	e7a90a3b-bf54-4285-a710-dbc9fc4c2da0	{"datasource":{"id":17,"type":"table"},"force":false,"queries":[{"time_range":"No filter","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(TOTAL)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"TOTAL","optionName":"metric_vne8kj0351r_7bxmbdynn7s"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"17__table","time_range_endpoints":["inclusive","exclusive"],"time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(TOTAL)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":true,"label":"TOTAL","optionName":"metric_vne8kj0351r_7bxmbdynn7s"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-07 15:14:13.097626	1	\N	\N	f	\N
2023-08-08 21:42:01.089878	2023-08-08 21:46:59.626625	19	PRICE 30S CHANGE	table	clickhouse.dm_real_time_tx_processing.weth.usdc.price_30s_change	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "20__table",\n  "extra_form_data": {},\n  "force_timestamp_formatting": false,\n  "granularity_sqla": "now()",\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": false,\n    "isNew": false,\n    "label": "AVG(CHANGE)",\n    "optionName": "metric_qtu05s37oxb_khzl9a46tj",\n    "sqlExpression": "AVG(CHANGE)"\n  },\n  "slice_id": 19,\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": ".3%"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_30s_change](id:20)	20	[ClickHouse].[clickhouse]	a74e0f9c-c39a-46c0-8de5-29267d9693a1	{"datasource":{"id":20,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"now()","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":false,"isNew":false,"label":"AVG(CHANGE)","optionName":"metric_qtu05s37oxb_khzl9a46tj","sqlExpression":"AVG(CHANGE)"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"20__table","slice_id":19,"time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"now()","time_grain_sqla":null,"time_range":"No filter","metric":{"aggregate":null,"column":null,"expressionType":"SQL","hasCustomLabel":false,"isNew":false,"label":"AVG(CHANGE)","optionName":"metric_qtu05s37oxb_khzl9a46tj","sqlExpression":"AVG(CHANGE)"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":".3%","time_format":"smart_date","force_timestamp_formatting":false,"extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 21:46:59.622582	1	\N	\N	f	\N
2023-08-08 21:56:25.030818	2023-08-08 22:06:22.809038	20	PRICE 1M CHANGE	table	clickhouse.dm_real_time_tx_processing.price_60s_change	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "21__table",\n  "extra_form_data": {},\n  "granularity_sqla": "now()",\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": false,\n    "isNew": false,\n    "label": "AVG(CHANGE)",\n    "optionName": "metric_6jgl45sm4fe_bhlzz2y8z4s",\n    "sqlExpression": "AVG(CHANGE)"\n  },\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": ".3%"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_1m_change](id:21)	21	[ClickHouse].[clickhouse]	16be3222-3e2f-4756-947f-bfb0643b4565	{"datasource":{"id":21,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"now()","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_6jgl45sm4fe_bhlzz2y8z4s"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"21__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"now()","time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_6jgl45sm4fe_bhlzz2y8z4s"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":".3%","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 21:56:25.025726	1	\N	\N	f	\N
2023-08-08 22:00:15.610628	2023-08-08 22:06:22.809088	21	PRICE 5M CHANGE	table	clickhouse.dm_real_time_tx_processing.price_5m_change	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "22__table",\n  "extra_form_data": {},\n  "granularity_sqla": "now()",\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": false,\n    "isNew": false,\n    "label": "AVG(CHANGE)",\n    "optionName": "metric_cpa2c7lnjw7_qa2jygd041",\n    "sqlExpression": "AVG(CHANGE)"\n  },\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": ".3%"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_5m_change](id:22)	22	[ClickHouse].[clickhouse]	5cc50e68-8a60-4e38-acfb-a5b3303c3976	{"datasource":{"id":22,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"now()","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_cpa2c7lnjw7_qa2jygd041"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"22__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"now()","time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_cpa2c7lnjw7_qa2jygd041"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":".3%","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 22:00:15.601906	1	\N	\N	f	\N
2023-08-08 22:02:10.993271	2023-08-08 22:06:22.809181	22	PRICE 10M CHANGE	table	clickhouse.dm_real_time_tx_processing.price_10m_change	big_number_total	{\n  "adhoc_filters": [],\n  "datasource": "23__table",\n  "extra_form_data": {},\n  "granularity_sqla": "now()",\n  "header_font_size": 0.4,\n  "metric": {\n    "aggregate": null,\n    "column": null,\n    "expressionType": "SQL",\n    "hasCustomLabel": false,\n    "isNew": false,\n    "label": "AVG(CHANGE)",\n    "optionName": "metric_f8iqw5i1svj_chc9glfrmyd",\n    "sqlExpression": "AVG(CHANGE)"\n  },\n  "subheader_font_size": 0.15,\n  "time_format": "smart_date",\n  "time_grain_sqla": null,\n  "time_range": "No filter",\n  "time_range_endpoints": [\n    "inclusive",\n    "exclusive"\n  ],\n  "viz_type": "big_number_total",\n  "y_axis_format": ".3%"\n}	1	1	\N	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_10m_change](id:23)	23	[ClickHouse].[clickhouse]	2c6a8cee-56a8-4136-88b3-be85d0b06549	{"datasource":{"id":23,"type":"table"},"force":false,"queries":[{"time_range":"No filter","granularity":"now()","filters":[],"extras":{"time_grain_sqla":null,"time_range_endpoints":["inclusive","exclusive"],"having":"","having_druid":[],"where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_f8iqw5i1svj_chc9glfrmyd"}],"annotation_layers":[],"timeseries_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"viz_type":"big_number_total","datasource":"23__table","time_range_endpoints":["inclusive","exclusive"],"granularity_sqla":"now()","time_grain_sqla":null,"time_range":"No filter","metric":{"expressionType":"SQL","sqlExpression":"AVG(CHANGE)","column":null,"aggregate":null,"isNew":false,"hasCustomLabel":false,"label":"AVG(CHANGE)","optionName":"metric_f8iqw5i1svj_chc9glfrmyd"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":".3%","time_format":"smart_date","extra_form_data":{},"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2023-08-08 22:02:10.985123	1	\N	\N	f	\N
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, d3format, warning_text, extra, uuid) FROM stdin;
2023-07-29 16:31:04.750724	2023-07-29 16:31:04.75073	1	count	COUNT(*)	count	1	COUNT(*)	\N	1	1	\N	\N	\N	32f448d2-b84e-49ca-a011-8d5c5acd8386
2023-08-06 19:41:10.532756	2023-08-06 19:47:09.212843	12	count	\N	\N	12	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	ded5c521-d25c-4429-8db7-16b71aee9d38
2023-08-06 21:02:16.696406	2023-08-06 22:09:53.255901	13	count	\N	\N	13	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	e01d318b-6065-419d-b817-d50c013060c8
2023-08-07 13:31:02.859953	2023-08-07 21:05:41.034903	16	count	\N	\N	16	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	e7d11623-d92b-4313-b9a9-3f692539eccc
2023-08-07 15:35:39.481679	2023-08-07 21:08:17.804244	18	count	\N	\N	18	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	ceb8eeae-1562-4c6f-a1c2-f3813ea9d3c2
2023-08-07 15:06:55.724305	2023-08-07 21:09:26.693888	17	count	\N	\N	17	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	d61c35b6-3531-4890-9086-4ec73ad7719d
2023-08-07 11:03:21.69663	2023-08-07 21:10:21.313063	14	count	\N	\N	14	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	77134e16-26dc-471e-a36d-c762acdf2fba
2023-08-07 11:12:08.69698	2023-08-07 21:11:04.625759	15	count	\N	\N	15	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	3825d993-c2b2-4443-9cdc-5d6e3ecb80fa
2023-07-29 22:00:45.121846	2023-08-07 21:13:27.691379	2	count	\N	\N	2	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	02254cc9-7ff1-40a7-a29a-fc7c52e6cdfd
2023-08-08 20:45:12.619767	2023-08-08 20:50:05.002251	19	count	\N	\N	19	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	426a5e18-59f1-4395-a640-b89451897c37
2023-08-08 21:24:38.608076	2023-08-08 21:38:11.090031	20	count	\N	\N	20	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	c7303f5e-eb17-4e96-8da4-712d07b1ae4b
2023-08-08 21:54:50.326418	2023-08-08 21:57:16.015088	21	count	\N	\N	21	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	f7d9f8ff-1a43-4772-93dd-6e1aa6de803a
2023-08-08 21:59:34.092534	2023-08-08 22:03:56.955822	22	count	\N	\N	22	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	2241fe38-c9f3-4714-b215-da66678206ff
2023-08-08 22:01:29.875327	2023-08-08 22:04:58.469146	23	count	\N	\N	23	count(*)	\N	1	1	\N	\N	{"warning_markdown":""}	1da5523d-7edd-4bca-b6b4-70e160bfb682
\.


--
-- Data for Name: sql_observations; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sql_observations (id, dttm, alert_id, value, error_msg) FROM stdin;
\.


--
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sqlatable_user (id, user_id, table_id) FROM stdin;
1	1	1
2	1	2
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
\.


--
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id) FROM stdin;
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra) FROM stdin;
2023-07-29 16:31:04.73169	2023-07-29 16:31:04.731696	1	1	dm_real_time_tx_processing_address	f	t	STRING	t	t	\N	1	1	\N	\N	\N	ad5d7a3e-bdaa-44d4-986f-62ee61774815	\N
2023-07-29 16:31:04.732995	2023-07-29 16:31:04.733	2	1	dm_real_time_tx_processing_swap_maker	f	t	STRING	t	t	\N	1	1	\N	\N	\N	1b506511-4c0b-4362-81ad-cd2246e45c98	\N
2023-07-29 16:31:04.733728	2023-07-29 16:31:04.733732	3	1	dm_real_time_tx_processing_t0_symbol	f	t	STRING	t	t	\N	1	1	\N	\N	\N	a02e9d3b-02ad-422c-bdc7-069459ec0984	\N
2023-07-29 16:31:04.734439	2023-07-29 16:31:04.734443	4	1	dm_real_time_tx_processing_t1_symbol	f	t	STRING	t	t	\N	1	1	\N	\N	\N	56cf43e9-0bcd-4513-858d-f0943d070d27	\N
2023-07-29 16:31:04.735023	2023-07-29 16:31:04.735027	5	1	dm_real_time_tx_processing_t0_amount	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	6aa97906-895b-4c78-8b66-4b48bce07d50	\N
2023-07-29 16:31:04.735606	2023-07-29 16:31:04.73561	6	1	dm_real_time_tx_processing_t1_amount	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	46f0b120-4e6b-444d-af89-4c8264c45625	\N
2023-07-29 16:31:04.736193	2023-07-29 16:31:04.736197	7	1	dm_real_time_tx_processing_swap_side	f	t	STRING	t	t	\N	1	1	\N	\N	\N	60f17326-c698-42e3-b9dc-2b92c78b2114	\N
2023-07-29 16:31:04.736738	2023-07-29 16:31:04.736742	8	1	dm_real_time_tx_processing_tx_hash	f	t	STRING	t	t	\N	1	1	\N	\N	\N	dd2e48c2-35f1-41e8-b5d7-3af2638ead65	\N
2023-07-29 16:31:04.737306	2023-07-29 16:31:04.737311	9	1	dm_real_time_tx_processing_protocol	f	t	STRING	t	t	\N	1	1	\N	\N	\N	a474dfb8-a1ea-4e9b-80b1-6b8b8c0843a2	\N
2023-07-29 16:31:04.737845	2023-07-29 16:31:04.737849	10	1	dm_real_time_tx_processing_blockchain	f	t	STRING	t	t	\N	1	1	\N	\N	\N	1e536ecb-e5a5-4f00-b2af-c5ea97eb51d6	\N
2023-07-29 16:31:04.738437	2023-07-29 16:31:04.738441	11	1	dm_real_time_tx_processing_timestamp	t	t	DATETIME	t	t	\N	1	1	\N	\N	\N	2b29c172-f240-47a5-ab25-f4639d81c737	\N
2023-08-08 21:39:47.38475	2023-08-08 21:52:41.015785	161	20	now()	t	t	DATETIME	t	t	\N	1	1		\N	\N	bd9c4cf6-47b5-4d08-9621-157b399d3065	{}
2023-08-08 21:39:47.399515	2023-08-08 21:52:41.015889	162	20	CHANGE	f	t	FLOAT64	t	t	\N	1	1		\N	\N	b5483e17-f1e7-4159-a887-44c1c9f08024	{}
2023-08-08 21:54:50.313902	2023-08-08 21:57:16.096758	163	21	now()	t	t	DATETIME	t	t	\N	1	1	\N	\N	\N	2e4ed6f7-80e5-4e8e-b045-47e219cfd40f	{}
2023-08-08 21:54:50.319293	2023-08-08 21:57:16.096903	164	21	CHANGE	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	9afea4a2-4eaf-4289-be22-76a3b109878e	{}
2023-08-07 15:56:55.337914	2023-08-07 21:05:41.09047	156	16	BUY	f	t	UINT64	t	t	\N	1	1		\N	\N	57bd8d71-5c45-4899-a279-72b9443f13e4	{}
2023-08-07 15:56:55.349973	2023-08-07 21:05:41.090524	157	16	SELL	f	t	UINT64	t	t	\N	1	1		\N	\N	68a089e7-9b44-45eb-a9dd-ed4958046dba	{}
2023-08-07 15:35:39.48977	2023-08-07 21:08:17.874141	155	18	TOTAL	f	t	UINT64	t	t	\N	1	1	\N	\N	\N	34098240-b19e-48af-81f0-b1a066ae3436	{}
2023-08-07 15:13:01.12845	2023-08-07 21:09:26.763491	154	17	TOTAL	f	t	FLOAT64	t	t	\N	1	1		\N	\N	8c8def4c-5946-46b4-b279-66f02e4e8fef	{}
2023-08-07 14:59:08.866439	2023-08-07 21:10:21.385379	151	14	BUY	f	t	FLOAT64	t	t	\N	1	1		\N	\N	9d74d179-6f31-49bb-8ff5-c20f516f327f	{}
2023-08-07 14:59:08.880602	2023-08-07 21:10:21.385595	152	14	SELL	f	t	FLOAT64	t	t	\N	1	1		\N	\N	ea7e63c5-646d-43c2-99cf-64a6f9f528d6	{}
2023-08-07 11:12:08.692728	2023-08-07 21:11:04.703808	148	15	TOTAL	f	t	UINT64	t	t	\N	1	1	\N	\N	\N	2de26c6b-582c-4926-8a08-a4efc29f51aa	{}
2023-08-06 19:41:10.518621	2023-08-07 21:12:43.287491	133	12	TS	t	\N	DATETIME	t	t	\N	1	1	\N	\N	\N	1e87eee6-3985-47a1-bff6-e1f586cb5620	{}
2023-08-06 19:41:10.52285	2023-08-07 21:12:43.287591	134	12	PRICE	f	\N	FLOAT64	t	t	\N	1	1	\N	\N	\N	05be3621-108c-4081-a125-f0dd5cba3396	{}
2023-08-06 19:41:10.526222	2023-08-07 21:12:43.287617	135	12	POOL	f	\N	STRING	t	t	\N	1	1	\N	\N	\N	a4c603e1-0af8-4f7d-97b9-44cfd8357094	{}
2023-08-06 18:01:26.728744	2023-08-07 21:13:27.769913	117	2	TS	t	t	DATETIME	t	t	\N	1	1		\N	\N	79b7b4d1-2160-4e8b-b8f7-255d924cd4e3	{}
2023-08-06 18:01:26.742671	2023-08-07 21:13:27.770018	118	2	SIDE	f	t	STRING	t	t	\N	1	1		\N	\N	0a60bde6-a6a2-4646-8c53-b7ec0eb3b023	{}
2023-08-06 18:01:26.754805	2023-08-07 21:13:27.77005	119	2	PRICE	f	t	FLOAT64	t	t	\N	1	1		\N	\N	b59c7df7-500f-4c75-baf1-c19d2b098ab8	{}
2023-08-06 18:01:26.770167	2023-08-07 21:13:27.770078	120	2	VOLUME	f	t	FLOAT64	t	t	\N	1	1		\N	\N	315ce807-982f-404f-b3dc-948621349849	{}
2023-08-06 18:01:26.780401	2023-08-07 21:13:27.770107	121	2	MAKER	f	t	STRING	t	t	\N	1	1		\N	\N	9ca81e5f-5938-4a7b-abc5-7eaa7eda6a58	{}
2023-08-06 18:01:26.793624	2023-08-07 21:13:27.770138	122	2	TX HASH	f	t	STRING	t	t	\N	1	1		\N	\N	b8093a26-2355-4fa8-b560-5a0780bc2a82	{}
2023-08-08 20:45:12.609118	2023-08-08 20:50:05.060965	158	19	TS	t	t	DATETIME	t	t	\N	1	1	\N	\N	\N	585518ba-8628-4014-bd68-55604beb8292	{}
2023-08-08 20:45:12.61491	2023-08-08 20:50:05.061061	159	19	PRICE	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	cc593859-9f7a-42e2-9734-14e96b6c3e0a	{}
2023-08-08 21:59:34.106998	2023-08-08 22:03:57.061457	165	22	now()	t	t	DATETIME	t	t	\N	1	1	\N	\N	\N	67120204-dc82-4e44-b461-5b7a78074857	{}
2023-08-08 21:59:34.11855	2023-08-08 22:03:57.061624	166	22	CHANGE	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	8c38bae2-18d4-4f6f-8eea-994220a09bad	{}
2023-08-08 22:01:29.877955	2023-08-08 22:04:58.567861	167	23	now()	t	t	DATETIME	t	t	\N	1	1	\N	\N	\N	219dcfa1-83e8-405c-a6cf-2dc4f47227c2	{}
2023-08-06 22:04:16.341273	2023-08-06 22:09:53.333779	143	13	TS	t	t	DATE	t	t	\N	1	1		\N	\N	769e6a46-b54d-479b-aed3-43a2ccc06d01	{}
2023-08-06 22:04:16.35339	2023-08-06 22:09:53.333875	144	13	BUY	f	t	UINT64	t	t	\N	1	1		\N	\N	da5246be-6a15-4e1c-b487-9d7089267e55	{}
2023-08-06 22:04:16.364196	2023-08-06 22:09:53.333904	145	13	SELL	f	t	UINT64	t	t	\N	1	1		\N	\N	11bae9c3-c6b7-4be6-94dc-4614bd9002f9	{}
2023-08-08 22:01:29.881222	2023-08-08 22:04:58.568019	168	23	CHANGE	f	t	FLOAT64	t	t	\N	1	1	\N	\N	\N	3a9a668f-aa34-4485-baaa-ec983f600f76	{}
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url) FROM stdin;
2023-07-29 16:31:04.696397	2023-07-29 16:31:04.723956	1	dm_real_time_tx_processing	dm_real_time_tx_processing_timestamp	\N	1	1	1	0	\N	f	\N	clickhouse	\N	\N	[ClickHouse].[dm_real_time_tx_processing](id:1)	f	\N	f	\N	[ClickHouse].[clickhouse]	\N	7fbb9b1c-550e-494e-9f8e-9e043d2bc985	f	\N
2023-07-29 22:00:45.027883	2023-08-08 20:02:57.544345	2	dm_real_time_tx_processing.weth.usdc.tx_table 	timestamp	\N	1	1	1	0	\N	f	\N	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  `dm_real_time_tx_processing_swap_side` AS `SIDE`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  ABS(SUM(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/address/', \r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_swap_maker`),\r\n    '</a>'\r\n  ) AS `MAKER`,\r\n  CONCAT(\r\n    '<a href="', \r\n    'https://', \r\n    `dm_real_time_tx_processing_blockchain`, \r\n    '/tx/', \r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '" target="_blank">',\r\n    LOWER(`dm_real_time_tx_processing_tx_hash`),\r\n    '</a>'\r\n  ) AS `TX HASH`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\n  AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n  AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\nGROUP BY\r\n  `TS`,\r\n  `MAKER`,\r\n  `TX HASH`,\r\n  `dm_real_time_tx_processing_swap_side`\r\nORDER BY\r\n  `TS` DESC	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_table ](id:2)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	f84c01fb-955d-40af-a2e8-0e4452d1f57e	f	\N
2023-08-08 20:45:12.56133	2023-08-09 13:03:40.393299	19	dm_real_time_tx_processing.weth.usdc.price_current	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n      `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) AS `PRICE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_current](id:19)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	b5448eeb-5226-4a3d-afa1-eb8042eeab1f	f	\N
2023-08-08 21:24:38.54001	2023-08-09 12:59:23.311585	20	dm_real_time_tx_processing.weth.usdc.price_30s_change	now()	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (\r\n      SELECT \r\n        MAX(`dm_real_time_tx_processing_timestamp`) \r\n      FROM \r\n        `clickhouse`.`dm_real_time_tx_processing`\r\n      WHERE\r\n        `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n        AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n      ) - INTERVAL 30 SECOND\r\n      AND `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_30s_change](id:20)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	46aba692-a32a-4a90-a4cb-5f80e81bc397	f	\N
2023-08-07 13:31:02.806069	2023-08-07 21:30:31.916925	16	dm_real_time_tx_processing.weth.usdc.tx_makers_by_side	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      (groupUniqArrayIf(`dm_real_time_tx_processing_swap_maker`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n    AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n    AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY \r\n    `dm_real_time_tx_processing_swap_maker`\r\n)\r\n\r\nSELECT\r\n  countIf(notEmpty(`BUY`)) AS `BUY`,\r\n  countIf(notEmpty(`SELL`)) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_by_side](id:16)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	1fd7153d-1ccf-42a0-988c-62407acd6f87	f	\N
2023-08-07 11:03:21.645317	2023-08-07 21:29:27.114998	14	dm_real_time_tx_processing.weth.usdc.tx_vol_by_side	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      arraySum(groupArrayIf(ABS(`dm_real_time_tx_processing_t0_amount`), dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      arraySum(groupArrayIf(`dm_real_time_tx_processing_t0_amount`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n    AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n    AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT\r\n  ROUND(SUM(`BUY`), 2) AS `BUY`,\r\n  ROUND(SUM(`SELL`), 2) AS `SELL`\r\nFROM\r\n  `agg_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_by_side](id:14)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	255ed2b3-4909-498a-8150-f73314088722	f	\N
2023-08-06 21:02:16.65124	2023-08-07 21:28:35.433472	13	dm_real_time_tx_processing.weth.usdc.tx_qty_by_side	TS	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n      `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'BUY')) AS `BUY`,\r\n      length(groupArrayIf(`dm_real_time_tx_processing_swap_side`, dm_real_time_tx_processing_swap_side = 'SELL')) AS `SELL`\r\n  FROM \r\n    `dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > NOW() - INTERVAL 24 HOUR\r\n    AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n    AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY \r\n    `TS`\r\n)\r\n\r\nSELECT \r\n  toDate(NOW()) AS `TS`,\r\n  SUM(`BUY`) AS `BUY`,\r\n  SUM(`SELL`) AS `SELL`\r\nFROM \r\n  `agg_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_by_side](id:13)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	89340655-4234-4fae-9d0f-89e8812f5e99	f	\N
2023-08-08 21:59:34.007759	2023-08-09 13:00:06.577016	22	dm_real_time_tx_processing.weth.usdc.price_5m_change	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (\r\n      SELECT \r\n        MAX(`dm_real_time_tx_processing_timestamp`) \r\n      FROM \r\n        `clickhouse`.`dm_real_time_tx_processing`\r\n      WHERE\r\n        `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n        AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n      ) - INTERVAL 5 MINUTE\r\n      AND `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_5m_change](id:22)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	e785c137-03ea-46c0-9a7e-090a2163a9b3	f	\N
2023-08-08 22:01:29.847695	2023-08-09 12:59:46.229364	23	dm_real_time_tx_processing.weth.usdc.price_10m_change	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (\r\n      SELECT \r\n        MAX(`dm_real_time_tx_processing_timestamp`) \r\n      FROM \r\n        `clickhouse`.`dm_real_time_tx_processing`\r\n      WHERE\r\n        `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n        AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n      ) - INTERVAL 10 MINUTE\r\n      AND `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_10m_change](id:23)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	45b20fea-279b-4bb0-934b-ba32f6eb2f07	f	\N
2023-08-06 19:41:10.468533	2023-08-08 20:03:11.821409	12	dm_real_time_tx_processing.weth.usdc.price_chart	\N	\N	1	1	1	0	\N	f	\N	clickhouse	SELECT \r\n  `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n  avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n  CONCAT(\r\n    `dm_real_time_tx_processing_blockchain`,\r\n    ' ',\r\n    `dm_real_time_tx_processing_address`\r\n  ) AS `POOL`\r\nFROM \r\n  `clickhouse`.`dm_real_time_tx_processing`\r\nWHERE\r\n  `TS` > NOW() - INTERVAL 24 HOUR\r\n  AND`dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n  AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\nGROUP BY\r\n  `TS`,\r\n  `POOL`\r\nORDER BY\r\n  `TS` DESC\r\nLIMIT 10000	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_chart](id:12)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	e8f2efb5-ab75-4a5d-bec3-f6b9976ff3f3	f	\N
2023-08-07 11:12:08.643795	2023-08-07 21:28:58.398739	15	dm_real_time_tx_processing.weth.usdc.tx_qty_total	\N	\N	1	1	1	0	\N	f	\N	clickhouse	SELECT\r\n    count(*) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n  AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_qty_total](id:15)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	b31fe020-b863-4d64-ad79-d1b4f6ab8547	f	\N
2023-08-07 15:06:55.65751	2023-08-07 21:29:53.277153	17	dm_real_time_tx_processing.weth.usdc.tx_vol_total	\N	\N	1	1	1	0	\N	f	\N	clickhouse	SELECT\r\n    ROUND(SUM(ABS(`dm_real_time_tx_processing_t0_amount`)), 2) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n  AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_vol_total](id:17)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	3a85aba9-5f71-4d48-8b87-cb65c97d6863	f	\N
2023-08-07 15:35:39.435293	2023-08-07 21:30:11.994713	18	dm_real_time_tx_processing.weth.usdc.tx_makers_total	\N	\N	1	1	1	0	\N	f	\N	clickhouse	SELECT\r\n    COUNT(DISTINCT(`dm_real_time_tx_processing_swap_maker`)) AS `TOTAL`\r\nFROM \r\n  `dm_real_time_tx_processing`\r\nWHERE\r\n  `dm_real_time_tx_processing_timestamp` > NOW() - INTERVAL 24 HOUR\r\n  AND `dm_real_time_tx_processing_t0_symbol` = 'WETH'\r\n  AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.tx_makers_total](id:18)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	be9fbc53-e3c3-49de-86ef-ef60c78a14e0	f	\N
2023-08-08 21:54:50.259513	2023-08-09 13:00:29.451417	21	dm_real_time_tx_processing.weth.usdc.price_1m_change	\N	\N	1	1	1	0	\N	f	\N	clickhouse	WITH `agg_dm_real_time_tx_processing` AS (\r\n  SELECT \r\n    `dm_real_time_tx_processing_timestamp` AS `TS`,\r\n    CONCAT(`dm_real_time_tx_processing_blockchain`, ' ', LOWER(`dm_real_time_tx_processing_address`)) AS `POOL`,\r\n    avgWeighted(ABS(`dm_real_time_tx_processing_swap_quote_price`), ABS(`dm_real_time_tx_processing_t0_amount`)) AS `PRICE`,\r\n    SUM(ABS(`dm_real_time_tx_processing_t0_amount`)) AS `VOLUME`\r\n  FROM \r\n    `clickhouse`.`dm_real_time_tx_processing`\r\n  WHERE\r\n    `TS` > (\r\n      SELECT \r\n        MAX(`dm_real_time_tx_processing_timestamp`) \r\n      FROM \r\n        `clickhouse`.`dm_real_time_tx_processing`\r\n      WHERE\r\n        `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n        AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n      ) - INTERVAL 1 MINUTE\r\n      AND `dm_real_time_tx_processing_t0_symbol` = 'WETH' \r\n      AND `dm_real_time_tx_processing_t1_symbol` = 'USDC'\r\n  GROUP BY\r\n    `TS`,\r\n    `POOL`\r\n  ORDER BY\r\n    `TS` ASC\r\n),\r\n\r\n`grouped_dm_real_time_tx_processing` AS (\r\n  SELECT\r\n    `POOL`,\r\n    first_value(`PRICE`) AS `PREVIOUS_PRICE`,\r\n    first_value(`VOLUME`) AS `PREVIOUS_VOLUME`,\r\n    last_value(`PRICE`) AS `CURRENT_PRICE`,\r\n    last_value(`VOLUME`) AS `CURRENT_VOLUME`\r\n  FROM \r\n    `agg_dm_real_time_tx_processing`\r\n  GROUP BY\r\n    `POOL`\r\n)\r\n\r\nSELECT\r\n  avgWeighted(`CURRENT_PRICE`, `CURRENT_VOLUME`) / avgWeighted(`PREVIOUS_PRICE`, `PREVIOUS_VOLUME`) - 1 AS `CHANGE`\r\nFROM \r\n  `grouped_dm_real_time_tx_processing`	\N	[ClickHouse].[dm_real_time_tx_processing.weth.usdc.price_1m_change](id:21)	f	\N	t	\N	[ClickHouse].[clickhouse]	\N	95c1b292-8a3b-46f5-a6aa-7c41bb4b1fdd	f	\N
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tag (created_on, changed_on, id, name, type, created_by_fk, changed_by_fk) FROM stdin;
2023-07-29 21:47:15.643597	2023-07-29 21:47:15.643621	1	owner:1	owner	1	1
2023-07-29 21:47:15.660281	2023-07-29 21:47:15.660297	2	type:query	type	1	1
\.


--
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tagged_object (created_on, changed_on, id, tag_id, object_id, object_type, created_by_fk, changed_by_fk) FROM stdin;
2023-08-08 20:01:48.265749	2023-08-08 20:01:48.265775	75	1	3	query	1	1
2023-08-08 20:02:24.628163	2023-08-08 20:02:24.628181	76	1	2	query	1	1
2023-08-08 20:26:30.911462	2023-08-08 20:26:30.911484	78	2	10	query	1	1
2023-08-06 17:24:43.341719	2023-08-06 17:24:43.341735	13	2	2	query	1	1
2023-08-08 21:24:12.878136	2023-08-08 21:24:12.878159	82	2	11	query	1	1
2023-08-08 21:54:27.285938	2023-08-08 21:54:27.285963	87	2	12	query	1	1
2023-08-08 21:59:11.299869	2023-08-08 21:59:11.299957	91	2	13	query	1	1
2023-08-08 22:01:13.434882	2023-08-08 22:01:13.434906	94	2	14	query	1	1
2023-08-09 12:28:42.524906	2023-08-09 12:28:42.52494	96	1	11	query	1	1
2023-08-09 12:29:37.722241	2023-08-09 12:29:37.722294	97	1	14	query	1	1
2023-08-09 12:30:15.473094	2023-08-09 12:30:15.473117	98	1	13	query	1	1
2023-08-09 12:30:58.994528	2023-08-09 12:30:58.994555	99	1	12	query	1	1
2023-08-09 13:05:11.544177	2023-08-09 13:05:11.544207	100	1	10	query	1	1
2023-08-06 19:37:47.860703	2023-08-06 19:37:47.860712	36	2	3	query	1	1
2023-08-06 21:16:35.64411	2023-08-06 21:16:35.64412	40	2	4	query	1	1
2023-08-07 11:07:03.393229	2023-08-07 11:07:03.393241	50	2	5	query	1	1
2023-08-07 11:11:52.430645	2023-08-07 11:11:52.43066	52	2	6	query	1	1
2023-08-07 13:30:50.937031	2023-08-07 13:30:50.937049	54	2	7	query	1	1
2023-08-07 15:06:40.912856	2023-08-07 15:06:40.912906	58	2	8	query	1	1
2023-08-07 15:35:18.034814	2023-08-07 15:35:18.034855	61	2	9	query	1	1
2023-08-07 21:18:53.45871	2023-08-07 21:18:53.458761	64	1	7	query	\N	\N
2023-08-07 21:19:20.554401	2023-08-07 21:19:20.554419	65	1	9	query	1	1
2023-08-07 21:20:16.84312	2023-08-07 21:20:16.843131	66	1	8	query	1	1
2023-08-07 21:21:47.742267	2023-08-07 21:21:47.742306	67	1	5	query	1	1
2023-08-07 21:23:52.368132	2023-08-07 21:23:52.368146	68	1	6	query	1	1
2023-08-07 21:24:25.567475	2023-08-07 21:24:25.567501	69	1	4	query	1	1
\.


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.url (created_on, changed_on, id, url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 103, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 293, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 634, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 8, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 135, true);


--
-- Name: access_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.access_request_id_seq', 1, false);


--
-- Name: alert_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.alert_logs_id_seq', 1, false);


--
-- Name: alert_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.alert_owner_id_seq', 1, false);


--
-- Name: alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.alerts_id_seq', 1, false);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.clusters_id_seq', 1, false);


--
-- Name: columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.columns_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_email_schedules_id_seq', 1, false);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 22, true);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 1, true);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 1, true);


--
-- Name: datasources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.datasources_id_seq', 1, false);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.druiddatasource_user_id_seq', 1, false);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, true);


--
-- Name: filter_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.filter_sets_id_seq', 1, false);


--
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.key_value_id_seq', 2, true);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.logs_id_seq', 44765, true);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.query_id_seq', 265, true);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 14, true);


--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slice_email_schedules_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 22, true);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slices_id_seq', 22, true);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 23, true);


--
-- Name: sql_observations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sql_observations_id_seq', 1, false);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 23, true);


--
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, false);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 168, true);


--
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tables_id_seq', 23, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tag_id_seq', 2, true);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 100, true);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: access_request access_request_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: alert_logs alert_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_logs
    ADD CONSTRAINT alert_logs_pkey PRIMARY KEY (id);


--
-- Name: alert_owner alert_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_pkey PRIMARY KEY (id);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: clusters clusters_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_cluster_name_key UNIQUE (cluster_name);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_verbose_name_key UNIQUE (verbose_name);


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_pkey PRIMARY KEY (id);


--
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: datasources datasources_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: druiddatasource_user druiddatasource_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_pkey PRIMARY KEY (id);


--
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: filter_sets filter_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: slice_email_schedules slice_email_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_pkey PRIMARY KEY (id);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: sql_observations sql_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_observations
    ADD CONSTRAINT sql_observations_pkey PRIMARY KEY (id);


--
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- Name: clusters uq_clusters_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT uq_clusters_uuid UNIQUE (uuid);


--
-- Name: columns uq_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_column_name UNIQUE (column_name, datasource_id);


--
-- Name: columns uq_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_uuid UNIQUE (uuid);


--
-- Name: dashboard_email_schedules uq_dashboard_email_schedules_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT uq_dashboard_email_schedules_uuid UNIQUE (uuid);


--
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- Name: datasources uq_datasources_cluster_id; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT uq_datasources_cluster_id UNIQUE (cluster_id, datasource_name);


--
-- Name: datasources uq_datasources_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT uq_datasources_uuid UNIQUE (uuid);


--
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- Name: metrics uq_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT uq_metrics_metric_name UNIQUE (metric_name, datasource_id);


--
-- Name: metrics uq_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT uq_metrics_uuid UNIQUE (uuid);


--
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- Name: slice_email_schedules uq_slice_email_schedules_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT uq_slice_email_schedules_uuid UNIQUE (uuid);


--
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: ix_alerts_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_alerts_active ON public.alerts USING btree (active);


--
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- Name: ix_dashboard_email_schedules_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_dashboard_email_schedules_active ON public.dashboard_email_schedules USING btree (active);


--
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_slice_email_schedules_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_slice_email_schedules_active ON public.slice_email_schedules USING btree (active);


--
-- Name: ix_sql_observations_dttm; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_sql_observations_dttm ON public.sql_observations USING btree (dttm);


--
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alert_logs alert_logs_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_logs
    ADD CONSTRAINT alert_logs_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: alert_owner alert_owner_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: alert_owner alert_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: alerts alerts_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: alerts alerts_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_ibfk_3 FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_ibfk_4 FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: clusters clusters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: clusters clusters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboard_roles dashboard_roles_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_roles dashboard_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: dashboard_slices dashboard_slices_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_slices dashboard_slices_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: dashboard_user dashboard_user_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_user dashboard_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: datasources datasources_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: druiddatasource_user druiddatasource_user_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: druiddatasource_user druiddatasource_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: embedded_dashboards embedded_dashboards_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT embedded_dashboards_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: columns fk_columns_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_columns_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: datasources fk_datasources_cluster_id_clusters; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT fk_datasources_cluster_id_clusters FOREIGN KEY (cluster_id) REFERENCES public.clusters(id);


--
-- Name: metrics fk_metrics_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fk_metrics_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: report_schedule_user report_schedule_user_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule_user report_schedule_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slice_email_schedules slice_email_schedules_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slice_email_schedules slice_email_schedules_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slice_email_schedules slice_email_schedules_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: slice_email_schedules slice_email_schedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slice_user slice_user_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: slice_user slice_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sql_observations sql_observations_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_observations
    ADD CONSTRAINT sql_observations_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: sqlatable_user sqlatable_user_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sqlatable_user sqlatable_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id);


--
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: url url_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: url url_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

