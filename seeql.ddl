--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO bruncky;

--
-- Name: collaborators; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.collaborators (
    id bigint NOT NULL,
    project_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.collaborators OWNER TO bruncky;

--
-- Name: collaborators_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.collaborators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collaborators_id_seq OWNER TO bruncky;

--
-- Name: collaborators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.collaborators_id_seq OWNED BY public.collaborators.id;


--
-- Name: columns; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.columns (
    id bigint NOT NULL,
    table_id bigint,
    name character varying,
    data_type integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.columns OWNER TO bruncky;

--
-- Name: columns_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.columns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.columns_id_seq OWNER TO bruncky;

--
-- Name: columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.columns_id_seq OWNED BY public.columns.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    table_id bigint,
    column_id bigint,
    user_id bigint,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO bruncky;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO bruncky;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: databases; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.databases (
    id bigint NOT NULL,
    user_id bigint,
    name character varying,
    schema_file text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.databases OWNER TO bruncky;

--
-- Name: databases_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.databases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.databases_id_seq OWNER TO bruncky;

--
-- Name: databases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.databases_id_seq OWNED BY public.databases.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    database_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO bruncky;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO bruncky;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bruncky;

--
-- Name: tables; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.tables (
    id bigint NOT NULL,
    database_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tables OWNER TO bruncky;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO bruncky;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bruncky
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO bruncky;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bruncky
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bruncky;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bruncky
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: collaborators id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.collaborators ALTER COLUMN id SET DEFAULT nextval('public.collaborators_id_seq'::regclass);


--
-- Name: columns id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.columns ALTER COLUMN id SET DEFAULT nextval('public.columns_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: databases id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.databases ALTER COLUMN id SET DEFAULT nextval('public.databases_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: collaborators collaborators_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.collaborators
    ADD CONSTRAINT collaborators_pkey PRIMARY KEY (id);


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: databases databases_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.databases
    ADD CONSTRAINT databases_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_collaborators_on_project_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_collaborators_on_project_id ON public.collaborators USING btree (project_id);


--
-- Name: index_collaborators_on_user_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_collaborators_on_user_id ON public.collaborators USING btree (user_id);


--
-- Name: index_columns_on_table_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_columns_on_table_id ON public.columns USING btree (table_id);


--
-- Name: index_comments_on_column_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_comments_on_column_id ON public.comments USING btree (column_id);


--
-- Name: index_comments_on_table_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_comments_on_table_id ON public.comments USING btree (table_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_databases_on_user_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_databases_on_user_id ON public.databases USING btree (user_id);


--
-- Name: index_projects_on_database_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_projects_on_database_id ON public.projects USING btree (database_id);


--
-- Name: index_tables_on_database_id; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE INDEX index_tables_on_database_id ON public.tables USING btree (database_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: bruncky
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_32289df854; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_32289df854 FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: collaborators fk_rails_3d4aaacbb1; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.collaborators
    ADD CONSTRAINT fk_rails_3d4aaacbb1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: projects fk_rails_4c3ba36d96; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_4c3ba36d96 FOREIGN KEY (database_id) REFERENCES public.databases(id);


--
-- Name: collaborators fk_rails_5f612daf06; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.collaborators
    ADD CONSTRAINT fk_rails_5f612daf06 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: tables fk_rails_61b495ab80; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT fk_rails_61b495ab80 FOREIGN KEY (database_id) REFERENCES public.databases(id);


--
-- Name: columns fk_rails_8dd6d1aa4d; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_rails_8dd6d1aa4d FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: databases fk_rails_9b2144bf2b; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.databases
    ADD CONSTRAINT fk_rails_9b2144bf2b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_d236a70144; Type: FK CONSTRAINT; Schema: public; Owner: bruncky
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_d236a70144 FOREIGN KEY (column_id) REFERENCES public.columns(id);


--
-- PostgreSQL database dump complete
--

