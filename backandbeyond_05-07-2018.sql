--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "user";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "user";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "user";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "user";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "user";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "user";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.blog_posts (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(220) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    likes integer NOT NULL,
    views integer NOT NULL,
    status integer NOT NULL,
    content text,
    uuid uuid NOT NULL
);


ALTER TABLE public.blog_posts OWNER TO "user";

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posts_id_seq OWNER TO "user";

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;


--
-- Name: blog_posttags; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.blog_posttags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public.blog_posttags OWNER TO "user";

--
-- Name: blog_posttags_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.blog_posttags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posttags_id_seq OWNER TO "user";

--
-- Name: blog_posttags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.blog_posttags_id_seq OWNED BY public.blog_posttags.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.blog_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(120) NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public.blog_tag OWNER TO "user";

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO "user";

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.blog_tag_id_seq OWNED BY public.blog_tag.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "user";

--
-- Name: notifications_notifications; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.notifications_notifications (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    message text,
    deadline timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    image character varying(100)
);


ALTER TABLE public.notifications_notifications OWNER TO "user";

--
-- Name: notifications_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.notifications_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notifications_id_seq OWNER TO "user";

--
-- Name: notifications_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.notifications_notifications_id_seq OWNED BY public.notifications_notifications.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_posts id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);


--
-- Name: blog_posttags id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posttags ALTER COLUMN id SET DEFAULT nextval('public.blog_posttags_id_seq'::regclass);


--
-- Name: blog_tag id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_tag ALTER COLUMN id SET DEFAULT nextval('public.blog_tag_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: notifications_notifications id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications_notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_notifications_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add tag	7	add_tag
20	Can change tag	7	change_tag
21	Can delete tag	7	delete_tag
22	Can add posts	8	add_posts
23	Can change posts	8	change_posts
24	Can delete posts	8	delete_posts
25	Can add post tags	9	add_posttags
26	Can change post tags	9	change_posttags
27	Can delete post tags	9	delete_posttags
28	Can add notifications	10	add_notifications
29	Can change notifications	10	change_notifications
30	Can delete notifications	10	delete_notifications
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 30, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$2a3Xl86ht5pP$D44n/Sq99RVBs1oUJXVV0XwDsaTwkWqlntCDfzkUQIs=	2018-07-05 22:21:19.032689+00	t	pedro			pedro.miguel@live.co.uk	t	t	2018-06-24 00:27:21.376377+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.blog_posts (id, title, slug, date_created, last_updated, likes, views, status, content, uuid) FROM stdin;
1	Postgres	postgres	2015-12-20 12:27:13+00	2017-08-10 19:50:14+00	0	0	1	<h4>Change a User's Password</h4>\n<pre><code>ALTER USER davide WITH PASSWORD 'hu8jmn3';\n</code></pre>	9b2a3cf2-bd0f-4c11-a3b5-a0764a694d5d
2	How to assign a new HTTP port to Jenkins	how-to-assign-a-new-http-port-to-jenkins	2015-12-22 08:55:55+00	2017-08-10 19:50:14+00	0	0	2	<p>To give Jenkins a new port edit the file at:</p>\n<div class="codehilite"><pre>/etc/default/jenkins\n</pre></div>\n\n\n<p>and add the port number you want to the <code>HTTP_PORT VARIABLE</code>:</p>\n<div class="codehilite"><pre><span class="c"># port for HTTP connector (default 8080; disable with -1)</span>\n<span class="nv">HTTP_PORT</span><span class="o">=</span>9090\n</pre></div>\n\n\n<p>Then you should restart Jenkins with <code>sudo service jenkins restart</code>.</p>	02934873-5c89-4e66-9bdf-6ff86beb3ba1
3	Changing the default Git remote 'push to' default	changing-the-default-git-remote-push-to-default	2015-12-24 19:51:21+00	2017-08-10 19:50:14+00	0	0	2	<p>To change which upstream remote is "wired" to your branch, use the git branch command with the upstream configuration flag. Ensure the remote exists first:</p>\n<div class="codehilite"><pre>git remote -v\n</pre></div>\n\n\n<p>Set the preferred remote for the current (checked out) branch:</p>\n<div class="codehilite"><pre>git branch --set-upstream-to &lt;remote-name&gt;\n</pre></div>\n\n\n<p>Validate the branch is setup with the correct upstream remote:</p>\n<div class="codehilite"><pre>git branch -vv\n</pre></div>	875c2730-45f9-4c72-a659-b020794e1a87
4	Install MySQL in Ubuntu	install-mysql-in-ubuntu	2015-12-30 08:52:30+00	2017-08-10 19:50:14+00	0	0	2	<p>First update your system:</p>\n<div class="codehilite"><pre>sudo apt-get update\nsudo apt-get upgrade\n</pre></div>\n\n\n<p>Next install MySQL:</p>\n<div class="codehilite"><pre>sudo apt-get install mysql-server\n</pre></div>\n\n\n<p>During the installation process, you will be prompted to set a password for the MySQL root user as shown below. Choose a strong password and keep it in a safe place for future reference.</p>\n<p>MySQL will bind to localhost (127.0.0.1) by default. </p>\n<p>Run the mysql_secure_installation script to address several security concerns in a default MySQL installation.</p>\n<div class="codehilite"><pre>sudo mysql_secure_installation\n</pre></div>\n\n\n<p>You will be given the choice to change the MySQL root password, remove anonymous user accounts, disable root logins outside of localhost, and remove test databases. It is recommended that you answer yes to these options. You can read more about the script in in the <a href="https://dev.mysql.com/doc/refman/5.5/en/mysql-secure-installation.html">MySQL Reference Manual</a>.</p>	03f2efdb-f403-4c5d-b022-b679874027a8
5	Get the first and last day of the month function in Python	get-the-first-and-last-day-of-the-month-function-in-python	2016-01-04 08:45:56+00	2017-08-10 19:50:14+00	0	0	2	<div class="codehilite"><pre><span class="kn">import</span> <span class="nn">datetime</span>\n\n<span class="c"># requires python-dateutil (http://labix.org/python-dateutil)</span>\n<span class="kn">from</span> <span class="nn">dateutil.relativedelta</span> <span class="kn">import</span> <span class="n">relativedelta</span>\n\n<span class="k">def</span> <span class="nf">get_month_day_range</span><span class="p">(</span><span class="n">date</span><span class="p">):</span>\n    <span class="sd">&quot;&quot;&quot;</span>\n<span class="sd">    For a date &#39;date&#39; returns the start and end date for the month of &#39;date&#39;.</span>\n<span class="sd">    Month with 31 days:</span>\n<span class="sd">    &gt;&gt;&gt; date = datetime.date(2011, 7, 27)</span>\n<span class="sd">    &gt;&gt;&gt; get_month_day_range(date)</span>\n<span class="sd">    (datetime.date(2011, 7, 1), datetime.date(2011, 7, 31))</span>\n<span class="sd">    Month with 28 days:</span>\n<span class="sd">    &gt;&gt;&gt; date = datetime.date(2011, 2, 15)</span>\n<span class="sd">    &gt;&gt;&gt; get_month_day_range(date)</span>\n<span class="sd">    (datetime.date(2011, 2, 1), datetime.date(2011, 2, 28))</span>\n<span class="sd">    &quot;&quot;&quot;</span>\n    <span class="n">last_day</span> <span class="o">=</span> <span class="n">date</span> <span class="o">+</span> <span class="n">relativedelta</span><span class="p">(</span><span class="n">day</span><span class="o">=</span><span class="mi">1</span><span class="p">,</span> <span class="n">months</span><span class="o">=+</span><span class="mi">1</span><span class="p">,</span> <span class="n">days</span><span class="o">=-</span><span class="mi">1</span><span class="p">)</span>\n    <span class="n">first_day</span> <span class="o">=</span> <span class="n">date</span> <span class="o">+</span> <span class="n">relativedelta</span><span class="p">(</span><span class="n">day</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span>\n    <span class="k">return</span> <span class="n">first_day</span><span class="p">,</span> <span class="n">last_day</span>\n\n<span class="k">if</span> <span class="n">__name__</span> <span class="o">==</span> <span class="s">&quot;__main__&quot;</span><span class="p">:</span>\n    <span class="kn">import</span> <span class="nn">doctest</span>\n    <span class="n">doctest</span><span class="o">.</span><span class="n">testmod</span><span class="p">()</span>\n</pre></div>\n\n\n<p>See original <a href="https://gist.github.com/waynemoore/1109153">here</a></p>	eb734652-df88-4c09-8a67-82cf09850a51
6	Ubuntu	ubuntu	2016-01-04 09:20:47+00	2017-08-10 19:50:14+00	0	0	1	<h4>How to disable overlay scrollbars</h4>\n<p>Install Ubuntu tweak from Ubuntu Software Center, click on Scrolling and select Legacy other than Overlay.</p>	4de64acd-b352-40e4-853e-7cfe602870da
7	Login to MySQL as a root user	login-to-mysql-as-a-root-user	2016-01-10 22:15:23+00	2017-08-10 19:50:14+00	0	0	2	<p>To log in to MySQL as the root user:</p>\n<div class="codehilite"><pre>mysql -u root -p\n</pre></div>\n\n\n<p>When prompted, enter the root password you assigned when the mysql_secure_installation script was run.</p>	9fe9aff4-baa7-44a4-8faa-3fc53137ff23
8	Create a Database and a Database User in MySql	create-a-database-and-a-database-user-in-mysql	2016-01-10 22:16:31+00	2017-08-10 19:50:14+00	0	0	2	<p>In the example below, <code>myprojectdb</code> is the name of the database, <code>myprojectuser</code> is the user, and <code>password</code> is the user’s password.</p>\n<div class="codehilite"><pre><span class="k">CREATE</span> <span class="k">DATABASE</span> <span class="n">myprojectdb</span><span class="p">;</span>\n<span class="k">CREATE</span> <span class="n">USER</span> <span class="n">myprojectuser</span><span class="o">@</span><span class="n">localhost</span> <span class="n">IDENTIFIED</span> <span class="k">BY</span> <span class="s1">&#39;password&#39;</span><span class="p">;</span>\n</pre></div>\n\n\n<p>Give our database user, access rights to the database created:</p>\n<div class="codehilite"><pre><span class="k">GRANT</span> <span class="k">ALL</span> <span class="n">PRIVILEGES</span> <span class="k">ON</span> <span class="n">myprojectdb</span><span class="p">.</span><span class="o">*</span> <span class="k">TO</span> <span class="n">myprojectuser</span><span class="o">@</span><span class="n">localhost</span><span class="p">;</span>\n</pre></div>\n\n\n<p>Flush the changes so that they will be available during the current session:</p>\n<div class="codehilite"><pre><span class="n">FLUSH</span> <span class="n">PRIVILEGES</span><span class="p">;</span>\n</pre></div>\n\n\n<p>Exit the SQL prompt to get back to your regular shell session:</p>\n<div class="codehilite"><pre><span class="k">exit</span>\n</pre></div>	2b7a3051-ebf3-42c6-a32d-62a96d958dde
9	How to re-Install MySQL	how-to-re-install-mysql	2016-01-10 22:18:09+00	2017-08-10 19:50:14+00	0	0	2	<p>First remove MySQL:</p>\n<div class="codehilite"><pre>sudo apt-get remove --purge mysql-server mysql-client mysql-common\nsudo apt-get autoremove\nsudo apt-get autoclean\n</pre></div>\n\n\n<p>Then re-install:</p>\n<div class="codehilite"><pre>sudo apt-get update\nsudo apt-get install mysql-server\nsudo mysql_install_db\nsudo /usr/bin/mysql_secure_installation\n</pre></div>	28e0864e-217b-4ec1-8bf3-e2649f31f7c1
10	Update database user name	update-database-user-name	2016-01-10 22:19:34+00	2017-08-10 19:50:14+00	0	0	1	<div class="codehilite"><pre><span class="k">UPDATE</span> <span class="n">mysql</span><span class="p">.</span><span class="n">user</span> <span class="kt">SET</span> <span class="n">user</span><span class="o">=</span><span class="s1">&#39;newusername&#39;</span> <span class="k">WHERE</span> <span class="n">user</span><span class="o">=</span><span class="s1">&#39;root&#39;</span><span class="p">;</span>\n<span class="n">FLUSH</span> <span class="n">PRIVILEGES</span><span class="p">;</span>\n</pre></div>	b44bf9c2-9cfb-45fc-97e4-08279c93eaf7
11	Display all users that can access database 'X'	display-all-users-that-can-access-database-x	2016-01-10 22:20:29+00	2017-08-10 19:50:14+00	0	0	2	<p>Connect to the MySQL instance as a root/admin user and enter the following command:</p>\n<div class="codehilite"><pre><span class="k">SELECT</span> <span class="n">user</span> <span class="k">FROM</span> <span class="n">mysql</span><span class="p">.</span><span class="n">db</span> <span class="k">WHERE</span> <span class="n">db</span><span class="o">=</span><span class="s1">&#39;database_name&#39;</span><span class="p">;</span>\n</pre></div>	3b905bf8-dbe8-4ed0-a484-9a3268d6bffe
12	Display the structure of a MySQL table	display-the-structure-of-a-mysql-table	2016-01-10 22:21:16+00	2017-08-10 19:50:14+00	0	0	2	<p>If you If you want to find out about the structure of a table, the <code>DESCRIBE</code> statement is useful; it displays information about each of a table's columns:</p>\n<div class="codehilite"><pre><span class="k">DESCRIBE</span> <span class="n">tablename</span><span class="p">;</span>\n</pre></div>\n\n\n<p>For more information see <a href="http://dev.mysql.com/doc/refman/5.7/en/getting-information.html">here</a></p>	8f350c6f-2e27-4eca-a37b-09d1124daa0b
13	Get database table sizes	get-database-table-sizes	2016-01-10 22:22:05+00	2017-08-10 19:50:14+00	0	0	2	<p>Here is a super simple SQL query to determine the size of all tables in a given database:</p>\n<div class="codehilite"><pre><span class="k">SELECT</span> <span class="n">TABLE_NAME</span> <span class="k">as</span> <span class="ss">`TABLE`</span><span class="p">,</span> <span class="nf">round</span><span class="p">(((</span><span class="n">data_length</span> <span class="o">+</span> <span class="n">index_length</span><span class="p">)</span> <span class="o">/</span> <span class="mi">1024</span> <span class="o">/</span> <span class="mi">1024</span><span class="p">),</span> <span class="mi">2</span><span class="p">)</span> <span class="ss">`Size in MB`</span> \n<span class="k">FROM</span> <span class="n">information_schema</span><span class="p">.</span><span class="kp">TABLES</span> \n<span class="k">WHERE</span> <span class="n">table_schema</span> <span class="o">=</span> <span class="s2">&quot;my_database_name&quot;</span> \n<span class="k">AND</span> <span class="n">table_name</span> <span class="o">=</span> <span class="s2">&quot;my_table_name&quot;</span><span class="p">;</span>\n</pre></div>	3ca11542-3048-49b7-ad0a-28de2289813b
15	How to upgrade Jenkins in Ubuntu	how-to-upgrade-jenkins-in-ubuntu	2016-01-10 22:31:27+00	2017-08-10 19:50:14+00	0	0	2	<p>Once installed, you can upgrade to the later version of Jenkins by running:</p>\n<div class="codehilite"><pre>sudo apt-get update\nsudo apt-get install jenkins\n</pre></div>	ac2762bd-001c-4ae5-952a-2ef8dca2f03a
17	Function execution duration	function-execution-duration	2016-01-13 17:01:13+00	2017-08-10 19:50:14+00	0	0	2	<p>Here is a little example on how to print the time it took for a function to execute/complete.</p>\n<div class="codehilite"><pre><span class="kn">import</span> <span class="nn">time</span>\n\n\n<span class="k">def</span> <span class="nf">how_long</span><span class="p">(</span><span class="n">x</span><span class="p">):</span>\n    <span class="n">t0</span> <span class="o">=</span> <span class="n">time</span><span class="o">.</span><span class="n">time</span><span class="p">()</span>\n    <span class="k">for</span> <span class="n">n</span> <span class="ow">in</span> <span class="nb">range</span><span class="p">(</span><span class="n">x</span><span class="p">):</span>\n        <span class="n">j</span> <span class="o">=</span> <span class="n">n</span> <span class="o">*</span> <span class="n">x</span>\n    <span class="k">print</span> <span class="s">&#39;Total time: {} sec&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="nb">str</span><span class="p">(</span><span class="n">time</span><span class="o">.</span><span class="n">time</span><span class="p">()</span> <span class="o">-</span> <span class="n">t0</span><span class="p">))</span>\n\n<span class="n">how_long</span><span class="p">(</span><span class="mi">100000</span><span class="p">)</span>\n</pre></div>	bc939938-f281-4684-9f9b-631884e3fad8
18	Reload Unity Panel in Ubuntu Without Restarting	reload-unity-panel-in-ubuntu-without-restarting	2016-01-13 22:07:09+00	2017-08-10 19:50:14+00	0	0	2	<p>Here is a command to reload the unity desktop notification panel, in Ubuntu, without restarting the entire system:</p>\n<div class="codehilite"><pre>killall unity-panel-service\n</pre></div>\n\n\n<p>As soon as the process is killed, a new one will be spawned, refreshing the notification panel. This is useful if you have duplicate icons from frozen apps in the panel.</p>	f5dd2ca2-97d1-44a2-96f9-3374662aff6a
19	Remove all .pyc file in the current folder and sub-folders	remove-all-pyc-file-in-the-current-folder-and-sub-folders	2016-01-14 13:36:32+00	2017-08-10 19:50:14+00	0	0	2	<p>To recursively remove all those pesky .pyc files from  your folder and sub-folders, run this command:</p>\n<div class="codehilite"><pre>find . -name <span class="s2">&quot;*.pyc&quot;</span> -exec rm -f <span class="o">{}</span> <span class="se">\\;</span>\n</pre></div>\n\n\n<p>or </p>\n<div class="codehilite"><pre>find . -name <span class="s2">&quot;*.pyc&quot;</span> -delete\n</pre></div>	d0f9aa06-fd21-4bf2-9db1-6b7f8317f5e1
20	What to do when my Pull Request does not merge automatically in master	what-to-do-when-my-pull-request-does-not-merge-automatically-in-master	2016-01-21 09:23:07+00	2017-08-10 19:50:14+00	0	0	2	<p>The problem is that both in master and in your branch some files have been changed, and their going in different directions.</p>\n<p>The content of the file in master is different from the one in your feature_branch, and git does not know which one to pick, or how to integrate them.</p>\n<p>To solve this, you need to:</p>\n<ol>\n<li>Get the latest upstream/master</li>\n</ol>\n<div class="codehilite"><pre>git fetch upstream\n</pre></div>\n\n\n<ol>\n<li>Switch to your master</li>\n</ol>\n<div class="codehilite"><pre>git checkout master\n</pre></div>\n\n\n<ol>\n<li>Merge the latest master in your master (Never develop in master, always develop in a feature branch)</li>\n</ol>\n<div class="codehilite"><pre>git merge upstream/master\n</pre></div>\n\n\n<ol>\n<li>Switch to your feature branch</li>\n</ol>\n<div class="codehilite"><pre>git checkout my_feature_branch\n</pre></div>\n\n\n<ol>\n<li>Merge master in your feature branch</li>\n</ol>\n<div class="codehilite"><pre>git merge master\n</pre></div>\n\n\n<ol>\n<li>Solve all the conflicts: this is where you decide how to integrate the conflicting files, and this can be done only by you because you know what you did, you can figure out what happened in master, and pick the best way to integrate them.</li>\n</ol>\n<div class="codehilite"><pre>git mergetool\n</pre></div>\n\n\n<ol>\n<li>Commit all the changes, after all the conflicts are solved</li>\n</ol>\n<div class="codehilite"><pre>git commit -m <span class="s2">&quot;Decent commit message&quot;</span>\n</pre></div>\n\n\n<ol>\n<li>Push your feature branch to your origin: the Pull Request will automatically update</li>\n</ol>\n<div class="codehilite"><pre>git push origin my_feature_branch\n</pre></div>\n\n\n<p>All this information was taken from <a href="http://blog.michelemattioni.me/2013/01/29/what-do-i-do-when-my-pull-request-does-not-merge-automatically-in-master/">http://blog.michelemattioni.me/</a></p>	525261cf-bb04-4ee1-a67d-07988a3fd0c9
21	Login to Jenkins Box	login-to-jenkins-box	2016-01-24 22:59:24+00	2017-08-10 19:50:14+00	0	0	2	<div class="codehilite"><pre>sudo su - jenkins\n</pre></div>\n\n\n<p>Switches you to Jenkins home directory <code>/var/lib/jenkins</code></p>	ddbfefee-0007-458b-9f55-432c269932aa
22	Github webhook mechanism	github-webhook-mechanism	2016-02-07 20:22:19+00	2017-08-10 19:50:14+00	0	0	3	<p>If you trying to get Github to send build triggers to your local Jenkins, the first thing you need to know is that Github webhook mechanism relies on a public IP or DNS to work.</p>\n<p>So if you use http://localhost:8080/github-webhook or http://127.0.0.1:8080/github-webhook it won't work, simply because Github will treat either localhost:8080 and 127.0.0.1 to itself and not the local Jenkins server. </p>\n<p>In other words it won't be able to find where your Jenkins is.</p>\n<p>See <a href="http://stackoverflow.com/questions/30816627/jenkins-github-build-maven-project-when-change-is-pushed-doesnt-work">StackOverflow Answer here</a></p>	76dcc2f2-5815-4630-9460-aff79d0b4ef0
23	SQLAlchemy equivalent of Django's get_or_create	sqlalchemy-equivalent-of-djangos-get_or_create	2016-02-07 20:37:23+00	2017-08-10 19:50:14+00	0	0	2	<p>Get the object from the database if it already exists (based on provided parameters) or create it if it does not.</p>\n<div class="codehilite"><pre><span class="k">def</span>  <span class="nf">get_or_create</span><span class="p">(</span><span class="n">session</span><span class="p">,</span> <span class="n">model</span><span class="p">,</span> <span class="o">**</span><span class="n">kwargs</span><span class="p">):</span>\n    <span class="n">instance</span> <span class="o">=</span> <span class="n">session</span><span class="o">.</span><span class="n">query</span><span class="p">(</span><span class="n">model</span><span class="p">)</span><span class="o">.</span><span class="n">filter_by</span><span class="p">(</span><span class="o">**</span><span class="n">kwargs</span><span class="p">)</span><span class="o">.</span><span class="n">first</span><span class="p">()</span>\n    <span class="k">if</span> <span class="n">instance</span><span class="p">:</span>\n        <span class="k">return</span> <span class="n">instance</span>\n    <span class="k">else</span><span class="p">:</span>\n        <span class="n">instance</span> <span class="o">=</span> <span class="n">model</span><span class="p">(</span><span class="o">**</span><span class="n">kwargs</span><span class="p">)</span>\n        <span class="n">session</span><span class="o">.</span><span class="n">add</span><span class="p">(</span><span class="n">instance</span><span class="p">)</span>\n        <span class="n">session</span><span class="o">.</span><span class="n">commit</span><span class="p">()</span>\n        <span class="k">return</span> <span class="n">instance</span>\n</pre></div>\n\n\n<p>with the code above you are now able to get_or_create any object of your model, for example lets suppose you have a model object like:</p>\n<div class="codehilite"><pre><span class="k">class</span> <span class="nc">Country</span><span class="p">(</span><span class="n">Base</span><span class="p">):</span>\n    <span class="n">__tablename__</span> <span class="o">=</span> <span class="s">&#39;countries&#39;</span>\n    <span class="nb">id</span> <span class="o">=</span> <span class="n">Column</span><span class="p">(</span><span class="n">Integer</span><span class="p">,</span> <span class="n">primary_key</span><span class="o">=</span><span class="bp">True</span><span class="p">)</span>\n    <span class="n">name</span> <span class="o">=</span> <span class="n">Column</span><span class="p">(</span><span class="n">String</span><span class="p">,</span> <span class="n">unique</span><span class="o">=</span><span class="bp">True</span><span class="p">)</span>\n</pre></div>\n\n\n<p>so to get_or_create your object all you have to do is:</p>\n<div class="codehilite"><pre><span class="n">my_country</span> <span class="o">=</span> <span class="n">get_or_create</span><span class="p">(</span><span class="n">session</span><span class="p">,</span> <span class="n">Country</span><span class="p">,</span> <span class="n">name</span><span class="o">=</span><span class="s">&#39;Portugal&#39;</span><span class="p">)</span>\n</pre></div>	a3d77879-329a-4400-bf26-ca44a80a3140
24	Find current directory and file's directory	find-current-directory-and-files-directory	2016-02-07 20:50:26+00	2017-08-10 19:50:14+00	0	0	2	<p>To find the path for the directory of a given file you can do:</p>\n<div class="codehilite"><pre><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">dirname</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">realpath</span><span class="p">(</span><span class="n">__file__</span><span class="p">))</span>\n</pre></div>\n\n\n<p>To get the working directory use <code>os.getcwd()</code>. <code>realpath()</code> returns the canonical path of a specified file name. For a full list of <code>os.path</code> functions visit the <a href="https://docs.python.org/2/library/os.path.html">manual</a>.</p>\n<p>Additionally you may find the template below useful as a reference:</p>\n<div class="codehilite"><pre><span class="kn">import</span> <span class="nn">os</span>\n\n<span class="k">print</span> <span class="p">(</span><span class="s">&quot;Path at terminal when executing this file&quot;</span><span class="p">)</span>\n<span class="k">print</span> <span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">getcwd</span><span class="p">()</span> <span class="o">+</span> <span class="s">&quot;</span><span class="se">\\n</span><span class="s">&quot;</span><span class="p">)</span>\n\n<span class="k">print</span> <span class="p">(</span><span class="s">&quot;This file path, relative to os.getcwd()&quot;</span><span class="p">)</span>\n<span class="k">print</span> <span class="p">(</span><span class="n">__file__</span> <span class="o">+</span> <span class="s">&quot;</span><span class="se">\\n</span><span class="s">&quot;</span><span class="p">)</span>\n\n<span class="k">print</span> <span class="p">(</span><span class="s">&quot;This file full path (following symlinks)&quot;</span><span class="p">)</span>\n<span class="n">full_path</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">realpath</span><span class="p">(</span><span class="n">__file__</span><span class="p">)</span>\n<span class="k">print</span> <span class="p">(</span><span class="n">full_path</span> <span class="o">+</span> <span class="s">&quot;</span><span class="se">\\n</span><span class="s">&quot;</span><span class="p">)</span>\n\n<span class="k">print</span> <span class="p">(</span><span class="s">&quot;This file directory and name&quot;</span><span class="p">)</span>\n<span class="n">path</span><span class="p">,</span> <span class="n">filename</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="n">full_path</span><span class="p">)</span>\n<span class="k">print</span> <span class="p">(</span><span class="n">path</span> <span class="o">+</span> <span class="s">&#39; --&gt; &#39;</span> <span class="o">+</span> <span class="n">filename</span> <span class="o">+</span> <span class="s">&quot;</span><span class="se">\\n</span><span class="s">&quot;</span><span class="p">)</span>\n\n<span class="k">print</span> <span class="p">(</span><span class="s">&quot;This file directory only&quot;</span><span class="p">)</span>\n<span class="k">print</span> <span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">dirname</span><span class="p">(</span><span class="n">full_path</span><span class="p">))</span>\n</pre></div>	5e5b222a-c9a3-4f8a-8f3d-70760601732b
25	WIP Jenkins installation/configuration	wip-jenkins-installationconfiguration	2016-02-08 09:18:42+00	2017-08-10 19:50:14+00	0	0	1	<p>Jenkins installation:</p>\n<div class="codehilite"><pre>1 <span class="o">-</span> <span class="n">download</span> <span class="n">Jenkins</span> <span class="k">for</span> <span class="n">your</span> <span class="n">Operating</span> <span class="n">System</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">wiki</span><span class="p">.</span><span class="n">jenkins</span><span class="o">-</span><span class="n">ci</span><span class="p">.</span><span class="n">org</span><span class="o">/</span><span class="n">display</span><span class="o">/</span><span class="n">JENKINS</span><span class="o">/</span><span class="n">Installing</span><span class="o">+</span><span class="n">Jenkins</span><span class="o">+</span><span class="n">on</span><span class="o">+</span><span class="n">Ubuntu</span>\n</pre></div>\n\n\n<p>Jenkins configuration</p>\n<div class="codehilite"><pre><span class="n">The</span> <span class="s">&#39;jenkins&#39;</span> <span class="n">user</span> <span class="n">is</span> <span class="n">created</span> <span class="n">to</span> <span class="n">run</span> <span class="n">this</span> <span class="n">service</span><span class="p">.</span>\n<span class="n">Jenkins</span> <span class="n">stores</span> <span class="n">all</span> <span class="n">the</span> <span class="n">settings</span><span class="p">,</span> <span class="n">logs</span> <span class="n">and</span> <span class="n">build</span> <span class="n">artifacts</span> <span class="n">in</span> <span class="n">its</span> <span class="n">home</span> <span class="n">directory</span><span class="p">.</span> <span class="n">The</span> <span class="n">default</span> <span class="n">installation</span> <span class="n">directory</span> <span class="n">is</span> <span class="o">/</span><span class="n">var</span><span class="o">/</span><span class="n">lib</span><span class="o">/</span><span class="n">jenkins</span> <span class="n">under</span> <span class="n">Ubuntu</span><span class="p">.</span>\n<span class="n">This</span> <span class="n">creates</span> <span class="n">a</span> <span class="o">/</span><span class="n">etc</span><span class="o">/</span><span class="n">init</span><span class="p">.</span><span class="n">d</span><span class="o">/</span><span class="n">jenkins</span> <span class="n">start</span> <span class="n">script</span> <span class="n">which</span> <span class="n">starts</span> <span class="n">Jenkins</span> <span class="n">automatically</span> <span class="n">at</span> <span class="n">boot</span> <span class="n">time</span><span class="p">.</span> <span class="n">If</span> <span class="n">you</span> <span class="n">installed</span> <span class="n">Jenkins</span> <span class="n">locally</span><span class="p">,</span> <span class="n">you</span> <span class="nb">find</span> <span class="n">it</span> <span class="n">running</span> <span class="n">under</span> <span class="n">the</span> <span class="n">following</span> <span class="n">URL</span><span class="p">:</span> <span class="n">http</span><span class="p">:</span><span class="o">//</span><span class="n">localhost</span><span class="p">:</span>8080<span class="o">/</span>\n<span class="n">Log</span> <span class="n">file</span> <span class="n">will</span> <span class="n">be</span> <span class="n">placed</span> <span class="n">in</span> <span class="o">/</span><span class="n">var</span><span class="o">/</span><span class="nb">log</span><span class="o">/</span><span class="n">jenkins</span><span class="o">/</span><span class="n">jenkins</span><span class="p">.</span><span class="nb">log</span><span class="p">.</span>\n<span class="o">/</span><span class="n">etc</span><span class="o">/</span><span class="n">default</span><span class="o">/</span><span class="n">jenkins</span> <span class="n">will</span> <span class="n">capture</span> <span class="n">configuration</span> <span class="n">parameters</span> <span class="k">for</span> <span class="n">the</span> <span class="n">launch</span> <span class="n">like</span> <span class="n">e</span><span class="p">.</span><span class="n">g</span> <span class="n">JENKINS_HOME</span><span class="p">.</span>\n<span class="n">By</span> <span class="n">default</span> <span class="n">jenkins</span> <span class="n">listen</span> <span class="n">on</span> <span class="n">port</span><span class="p">:</span>8080<span class="p">.</span> <span class="n">Access</span> <span class="n">this</span> <span class="n">port</span> <span class="n">with</span> <span class="n">your</span> <span class="n">browser</span> <span class="n">to</span> <span class="n">start</span> <span class="n">configuration</span><span class="p">.</span>\n\n<span class="n">To</span> <span class="n">restart</span> <span class="n">jenkins</span> <span class="n">using</span> <span class="n">terminal</span><span class="p">:</span>\n    <span class="n">sudo</span> <span class="o">/</span><span class="n">etc</span><span class="o">/</span><span class="n">init</span><span class="p">.</span><span class="n">d</span><span class="o">/</span><span class="n">jenkins</span> <span class="n">restart</span>\n\n<span class="n">You</span> <span class="n">can</span> <span class="n">also</span> <span class="n">make</span> <span class="n">use</span> <span class="n">of</span> <span class="n">your</span> <span class="n">browser</span> <span class="n">to</span> <span class="n">restart</span> <span class="n">jenkins</span>\n    <span class="p">(</span><span class="n">jenkins_url</span><span class="p">)</span><span class="o">/</span><span class="n">safeRestart</span> <span class="o">-</span> <span class="n">Allows</span> <span class="n">all</span> <span class="n">running</span> <span class="n">jobs</span> <span class="n">to</span> <span class="n">complete</span><span class="p">.</span> <span class="n">New</span> <span class="n">jobs</span> <span class="n">will</span> <span class="n">remain</span> <span class="n">in</span> <span class="n">the</span> <span class="n">queue</span> <span class="n">to</span> <span class="n">run</span> <span class="n">after</span> <span class="n">the</span> <span class="n">restart</span> <span class="n">is</span> <span class="n">complete</span><span class="p">.</span>\n\n    <span class="p">(</span><span class="n">jenkins_url</span><span class="p">)</span><span class="o">/</span><span class="n">restart</span> <span class="o">-</span> <span class="n">Forces</span> <span class="n">a</span> <span class="n">restart</span> <span class="n">without</span> <span class="n">waiting</span> <span class="k">for</span> <span class="n">builds</span> <span class="n">to</span> <span class="n">complete</span><span class="p">.</span>\n\n<span class="n">Configure</span> <span class="n">the</span> <span class="n">JDK</span> <span class="n">location</span>\n    <span class="n">Before</span> <span class="n">using</span> <span class="n">Jenkins</span> <span class="n">to</span> <span class="n">build</span> <span class="n">your</span> <span class="n">jobs</span><span class="p">,</span> <span class="n">you</span> <span class="n">need</span> <span class="n">to</span> <span class="n">tell</span> <span class="n">it</span> <span class="n">where</span> <span class="n">to</span> <span class="nb">find</span> <span class="n">the</span> <span class="n">JDK</span> <span class="n">installation</span><span class="p">.</span> <span class="n">Select</span> <span class="n">Manage</span> <span class="n">Jenkins</span> <span class="n">and</span> <span class="n">afterwards</span> <span class="n">Configure</span> <span class="n">System</span><span class="p">.</span>\n\n    <span class="n">Enter</span> <span class="n">the</span> <span class="n">correct</span> <span class="n">path</span> <span class="n">to</span> <span class="n">your</span> <span class="n">JDK</span><span class="p">,</span> <span class="n">Apache</span> <span class="n">Ant</span> <span class="n">and</span> <span class="n">Maven</span> <span class="n">and</span> <span class="n">press</span> <span class="n">the</span> <span class="n">Save</span> <span class="n">button</span> <span class="n">below</span><span class="p">.</span> <span class="n">Jenkins</span> <span class="n">can</span> <span class="n">also</span> <span class="n">install</span> <span class="n">these</span> <span class="k">for</span> <span class="n">your</span> <span class="n">automatically</span><span class="p">.</span>\n\n<span class="n">Generate</span> <span class="n">ssh</span> <span class="n">key</span> <span class="k">for</span> <span class="n">Jenkins</span> <span class="n">user</span>\n    <span class="n">If</span> <span class="n">you</span> <span class="n">want</span> <span class="n">to</span> <span class="n">access</span> <span class="n">private</span> <span class="n">Git</span> <span class="n">repo</span><span class="p">,</span> <span class="n">you</span> <span class="n">need</span> <span class="n">to</span> <span class="n">generate</span> <span class="n">an</span> <span class="n">ssh</span> <span class="n">key</span><span class="o">-</span><span class="n">pair</span><span class="p">.</span> <span class="n">Create</span> <span class="n">a</span> <span class="n">ssh</span> <span class="n">key</span> <span class="k">for</span> <span class="n">the</span> <span class="n">user</span> <span class="n">Jenkins</span> <span class="n">with</span> <span class="n">the</span> <span class="n">following</span> <span class="n">command</span><span class="p">:</span>\n        <span class="n">sudo</span> <span class="o">-</span><span class="n">u</span> <span class="n">jenkins</span> <span class="n">ssh</span><span class="o">-</span><span class="n">keygen</span>\n        <span class="n">DO</span> <span class="n">NOT</span> <span class="n">SET</span> <span class="n">THE</span> <span class="n">PASSWORD</span><span class="p">,</span> <span class="k">otherwise</span> <span class="n">jenkins</span> <span class="n">user</span> <span class="n">will</span> <span class="n">not</span> <span class="n">be</span> <span class="n">able</span> <span class="n">to</span> <span class="n">connect</span> <span class="n">to</span> <span class="n">the</span> <span class="n">git</span> <span class="n">repo</span> <span class="n">in</span> <span class="n">an</span> <span class="n">automated</span> <span class="n">way</span><span class="p">.</span>\n        <span class="n">This</span> <span class="n">command</span> <span class="n">will</span> <span class="n">save</span> <span class="n">the</span> <span class="n">public</span> <span class="n">key</span> <span class="n">in</span> <span class="o">/</span><span class="n">var</span><span class="o">/</span><span class="n">lib</span><span class="o">/</span><span class="n">jenkins</span><span class="o">/</span><span class="p">.</span><span class="n">ssh</span><span class="o">/</span><span class="n">id_rsa</span><span class="p">.</span><span class="n">pub</span>\n    <span class="n">Add</span> <span class="n">the</span> <span class="n">public</span> <span class="n">key</span> <span class="n">to</span> <span class="n">your</span> <span class="n">Git</span> <span class="n">repo</span> <span class="p">(</span><span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">github</span><span class="p">.</span><span class="n">com</span><span class="o">/</span><span class="n">settings</span><span class="o">/</span><span class="n">ssh</span><span class="p">)</span>\n</pre></div>\n\n\n<p>Jenkins upgrade:</p>\n<div class="codehilite"><pre><span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">wiki</span><span class="p">.</span><span class="n">jenkins</span><span class="o">-</span><span class="n">ci</span><span class="p">.</span><span class="n">org</span><span class="o">/</span><span class="n">display</span><span class="o">/</span><span class="n">JENKINS</span><span class="o">/</span><span class="n">Installing</span><span class="o">+</span><span class="n">Jenkins</span><span class="o">+</span><span class="n">on</span><span class="o">+</span><span class="n">Ubuntu</span>\n</pre></div>\n\n\n<p>View list of keys in your system (Ubuntu tested only):\n    open terminal and type:\n    apt-key list</p>	06e73148-e59e-42ba-b3df-eaed1f7889a8
26	MySQL backup and restore database	mysql-backup-and-restore-database	2016-02-10 13:04:01+00	2017-08-10 19:50:14+00	0	0	2	<p>To dump (backup) your database data into a <code>.sql</code> file, run:</p>\n<div class="codehilite"><pre>mysqldump -u root -p database_name &gt; database_dump_file.sql\n<span class="c"># you will be asked to provide the root password</span>\n</pre></div>\n\n\n<p>Back up your MySQL Database with Compress</p>\n<p>If your mysql database is very big, you might want to compress the output of mysqldump. Just use the mysql backup command below and pipe the output to gzip, then you will get the output as gzip file.</p>\n<div class="codehilite"><pre>mysqldump -u root -p database_name | gzip -9 &gt; database_backup_file.sql.gz\n</pre></div>\n\n\n<p>To restore your database from a <code>.sql</code> file:</p>\n<ol>\n<li>Create an appropriately named database on the target machine;</li>\n<li>Load the file using the mysql command;</li>\n</ol>\n<div class="codehilite"><pre>mysql -u root -p database_name &lt; database_backup_file.sql\n</pre></div>\n\n\n<p>To restore compressed backup files you can do the following:</p>\n<div class="codehilite"><pre>gunzip &lt; backup_file.sql.gz | mysql -u root -p database_name\n</pre></div>\n\n\n<p>If you need to restore a database that already exists, you'll need to use mysqlimport command. The syntax for mysqlimport is as follows:</p>\n<div class="codehilite"><pre>mysqlimport -u root -p database_name backup_database_file.sql\n</pre></div>	ebb32247-a66a-492d-aa37-f121a9cf42fe
27	Git show diff between the stashed changes and the original parent	git-show-diff-between-the-stashed-changes-and-the-original-parent	2016-02-11 15:50:21+00	2017-08-10 19:50:14+00	0	0	2	<p>From the <code>man git-stash</code> page:</p>\n<p>Show the changes recorded in the stash as a diff between the stashed state and its original parent. When no <stash> is given, shows the latest one. </p>\n<p>By default, the command shows the diffstat, but it will accept any format known to git diff (e.g., <code>git stash show -p stash@{1}</code> to view the second most recent stash in patch form).</p>\n<p>To view the content of an arbitrary stash, run something like</p>\n<div class="codehilite"><pre>git stash show -p stash@<span class="o">{</span>1<span class="o">}</span>\n</pre></div>	664bd193-74d6-4857-918f-fe73198a0bf8
28	Installing/Uninstalling Ruby using RVM on Ubuntu	installinguninstalling-ruby-using-rvm-on-ubuntu	2016-02-22 09:15:06+00	2017-08-10 19:50:14+00	0	0	2	<p>RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.</p>\n<p>Remove/uninstall rvm:</p>\n<div class="codehilite"><pre>rvm implode\n</pre></div>\n\n\n<p>Download and run the Ruby Version Manager (rvm) installation script:</p>\n<div class="codehilite"><pre><span class="se">\\c</span>url -sSL https://get.rvm.io | bash -s stable --ruby --autolibs<span class="o">=</span><span class="nb">enable</span>\n</pre></div>\n\n\n<p>The “--ruby” flag will install the newest version of Ruby.</p>\n<p>Reload shell configuration &amp; test:</p>\n<div class="codehilite"><pre><span class="nb">source</span> ~/.rvm/scripts/rvm\n</pre></div>\n\n\n<p>RVM includes an <code>autolibs</code> option to identify and install system software needed for your operating system.\nIf you already have rvm installed, update it to the latest version:</p>\n<div class="codehilite"><pre>rvm get stable --autolibs<span class="o">=</span><span class="nb">enable</span>\n</pre></div>\n\n\n<p>If installation and configuration were successful, RVM should now load whenever you open a new shell. This can be tested by executing the following command which should output rvm is a function as shown below.</p>\n<div class="codehilite"><pre><span class="nb">type </span>rvm | head -n 1\nrvm is a <span class="k">function</span>\n</pre></div>\n\n\n<p>NOTE: Before reporting problems check <code>rvm notes</code> as it might contain important information.</p>\n<h3>Install Ruby</h3>\n<div class="codehilite"><pre>rvm install ruby\n<span class="c"># select default version to use</span>\nrvm use ruby 2.3.0 --default\n<span class="c"># check ruby version</span>\nruby -v\n</pre></div>\n\n\n<p>display a list of all known rubies:</p>\n<div class="codehilite"><pre>rvm list known\n</pre></div>\n\n\n<h3>Install Node.js</h3>\n<p>Since Rails 3.1, a JavaScript runtime has been needed for development on Ubuntu Linux. The JavaScript runtime is required to compile code for the Rails asset pipeline. For development on Ubuntu Linux it is best to install the Node.js server-side JavaScript environment.</p>\n<div class="codehilite"><pre>sudo apt-get install nodejs\n</pre></div>\n\n\n<h3>Check the Gem Manager</h3>\n<p>RubyGems is the gem manager in Ruby (RubyGems is pip version of ruby).\nCheck the installed gem manager version:</p>\n<div class="codehilite"><pre>gem -v\n2.3.0\n</pre></div>\n\n\n<p>To upgrade the gem manager use:</p>\n<div class="codehilite"><pre>gem update --system\n</pre></div>\n\n\n<h3>RVM Gemsets</h3>\n<p>A gemset is just a container you can use to keep gems separate from each other (gemsets are ruby equivelent of python virtual environments).\nDisplay a list of all gemsets:</p>\n<div class="codehilite"><pre>rvm gemset list\n\ngemsets <span class="k">for </span>ruby-2.3.0\n<span class="o">=</span>&gt; <span class="o">(</span>default<span class="o">)</span>\n   global\n</pre></div>\n\n\n<p>Only the <code>default</code> and <code>global</code> gemsets are pre-installed.</p>\n<p>To get a list of outdated gems:</p>\n<div class="codehilite"><pre>gem outdated\n</pre></div>\n\n\n<p>To update all outdated gems:</p>\n<div class="codehilite"><pre>gem update\n</pre></div>	d64ca9be-9b45-46eb-b167-e72995d953bb
29	How to install OpenJDK on Ubuntu	how-to-install-openjdk-on-ubuntu	2016-02-26 08:26:57+00	2017-08-10 19:50:14+00	0	0	2	<p>Add the webupd8 repo to your system:</p>\n<div class="codehilite"><pre>sudo add-apt-repository ppa:webupd8team/java\nsudo apt-get update\n</pre></div>\n\n\n<p>Install your preferred version of jdk (avoid java 9 preview version):</p>\n<div class="codehilite"><pre>sudo apt-get install oracle-java8-installer\n</pre></div>\n\n\n<p>Answer from <a href="http://stackoverflow.com/a/32944272">StackOverflow</a></p>	9799aac2-102c-487f-9c4e-a4ea079d1232
30	Reset local branch to an exact match of the remote branch	reset-local-branch-to-an-exact-match-of-the-remote-branch	2016-03-08 14:14:56+00	2017-08-10 19:50:14+00	0	0	2	<p>Setting your branch to an exact match of the remote branch can be done in two steps:</p>\n<div class="codehilite"><pre>git fetch origin\ngit reset --hard origin/branch_name\n<span class="c"># followed by </span>\ngit clean -d -f \n<span class="c"># removes local untracked directories and files</span>\n</pre></div>	9621e980-5036-4910-ae05-50c620838696
31	Alembic can't locate revision	alembic-cant-locate-revision	2016-03-17 10:13:48+00	2017-08-10 19:50:14+00	0	0	2	<p>I'm trying to use alembic to handle local migrations on my project. It worked the first time, but them I needed to delete the folder and restart. I'm following this tutorial and I run the command:    </p>\n<p><code>python manage.py db migrate</code>    </p>\n<p>I'm getting this error:    </p>\n<p><code>alembic.util.CommandError: Can't locate revision identified by '31b8ab83c7d'</code>    </p>\n<p>Alembic stores the version history in your database. Hence it is using the value stored in your database to search for the revision. The version number for my personal database is stored in the table alembic_version:</p>\n<div class="codehilite"><pre>mysql&gt; SELECT * FROM alembic_version;\n+-------------+\n| version_num |\n+-------------+\n| c8ad125e063 |\n+-------------+\n1 row in <span class="nb">set</span> <span class="o">(</span>0.00 sec<span class="o">)</span>\n</pre></div>\n\n\n<p>Hint: Use the command SHOW TABLES if it's a SQL based database to see the tables.</p>\n<p>To solve your problem simply use the command:</p>\n<p>DROP TABLE alembic_version;\nOr whatever the name of database version table is. And then you need to re-init the migration folder using the command:</p>\n<p>python manage.py db init\nAnd then creating a new migration:</p>\n<p>python manage.py db migrate\nAnd then you should be good to go with working migrations in alembic.</p>\n<p>for more info check <a href="http://stackoverflow.com/a/32356600">stackoverflow</a></p>	95b1e997-7bf8-45ee-9bf2-dc0e77f62eb3
32	Remove all packages installed by pip	remove-all-packages-installed-by-pip	2016-03-17 10:18:51+00	2017-08-10 19:50:14+00	0	0	2	<p>To remove all packages you have installed in your virtualenv or virtualenvwrapper, execute:</p>\n<div class="codehilite"><pre>pip freeze | xargs pip uninstall -y\n</pre></div>\n\n\n<p>If you now check the packages installed with <code>pip freeze</code> you will see that you have nothing installed.</p>\n<p>For more info check <a href="http://stackoverflow.com/a/11250821">stackoverflow</a></p>	09c3c8a2-8982-43a8-8528-077af7840d51
33	Flask production and development configuration	flask-production-and-development-configuration	2016-03-29 08:12:34+00	2017-08-10 19:50:14+00	0	0	1	<p><strong>init</strong>.py</p>\n<div class="codehilite"><pre><span class="k">def</span> <span class="nf">create_app</span><span class="p">(</span><span class="n">config_setting</span><span class="p">):</span>\n    <span class="n">app</span> <span class="o">=</span> <span class="n">Flask</span><span class="p">(</span><span class="n">__name__</span><span class="p">)</span>\n    <span class="n">app</span><span class="o">.</span><span class="n">config</span><span class="o">.</span><span class="n">from_object</span><span class="p">(</span><span class="n">config</span><span class="p">[</span><span class="n">config_setting</span><span class="p">])</span>\n    <span class="n">admin</span> <span class="o">=</span> <span class="n">Admin</span><span class="p">(</span><span class="n">app</span><span class="p">,</span> <span class="n">template_mode</span><span class="o">=</span><span class="s">&#39;bootstrap3&#39;</span><span class="p">)</span>\n\n    <span class="n">convention</span> <span class="o">=</span> <span class="p">{</span>\n        <span class="s">&quot;ix&quot;</span><span class="p">:</span> <span class="s">&quot;ix_</span><span class="si">%(column_0_label)s</span><span class="s">&quot;</span><span class="p">,</span>\n        <span class="s">&quot;uq&quot;</span><span class="p">:</span> <span class="s">&quot;uq_</span><span class="si">%(table_name)s</span><span class="s">_</span><span class="si">%(column_0_name)s</span><span class="s">&quot;</span><span class="p">,</span>\n        <span class="s">&quot;ck&quot;</span><span class="p">:</span> <span class="s">&quot;ck_</span><span class="si">%(table_name)s</span><span class="s">_</span><span class="si">%(constraint_name)s</span><span class="s">&quot;</span><span class="p">,</span>\n        <span class="s">&quot;fk&quot;</span><span class="p">:</span> <span class="s">&quot;fk_</span><span class="si">%(table_name)s</span><span class="s">_</span><span class="si">%(column_0_name)s</span><span class="s">_</span><span class="si">%(referred_table_name)s</span><span class="s">&quot;</span><span class="p">,</span>\n        <span class="s">&quot;pk&quot;</span><span class="p">:</span> <span class="s">&quot;pk_</span><span class="si">%(table_name)s</span><span class="s">&quot;</span><span class="p">,</span>\n    <span class="p">}</span>\n    <span class="n">metadata</span> <span class="o">=</span> <span class="n">MetaData</span><span class="p">(</span><span class="n">naming_convention</span><span class="o">=</span><span class="n">convention</span><span class="p">)</span>\n    <span class="n">db</span> <span class="o">=</span> <span class="n">SQLAlchemy</span><span class="p">(</span><span class="n">app</span><span class="p">,</span> <span class="n">metadata</span><span class="o">=</span><span class="n">metadata</span><span class="p">)</span>\n\n<span class="n">create_app</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">getenv</span><span class="p">(</span><span class="s">&#39;PRODCONFIG&#39;</span> <span class="ow">or</span> <span class="s">&#39;default&#39;</span><span class="p">)</span>\n</pre></div>\n\n\n<p>config.py</p>\n<div class="codehilite"><pre><span class="n">config</span> <span class="o">=</span> <span class="p">{</span>\n    <span class="s">&#39;development&#39;</span><span class="p">:</span> <span class="n">DevelopmentConfig</span><span class="p">,</span>\n    <span class="s">&#39;production&#39;</span><span class="p">:</span> <span class="n">ProductionConfig</span><span class="p">,</span>\n    <span class="s">&#39;testing&#39;</span><span class="p">:</span> <span class="n">TestingConfig</span><span class="p">,</span>\n    <span class="s">&#39;default&#39;</span><span class="p">:</span> <span class="n">DefaultConfig</span>\n<span class="p">}</span>\n</pre></div>	d4ea30cb-89de-49dd-b5d0-e04b4f79eeba
34	How to get file permissions in octal mode	how-to-get-file-permissions-in-octal-mode	2016-04-04 07:53:16+00	2017-08-10 19:50:14+00	0	0	1	<p>Try:</p>\n<div class="codehilite"><pre>stat -c <span class="s2">&quot;%a %n&quot;</span> *\n</pre></div>\n\n\n<p>Replace * with the relevant directory or the exact filename that you want to examine.</p>\n<div class="codehilite"><pre>-c  --format<span class="o">=</span>FORMAT\n          use  the  specified  FORMAT instead of the default; output a newline after\n          each use of FORMAT\n%a     Access rights in octal\n%n     File name\n</pre></div>	34930ffb-5da9-4149-b40e-234128e1977c
35	Monitoring Processes with Supervisor	monitoring-processes-with-supervisor	2016-04-05 13:22:39+00	2017-08-10 19:50:14+00	0	0	2	<p>At some point you will likely find yourself writing a script that needs to run all the time in the background.</p>\n<p>To accomplish this, we need something to watch these scripts. Such tools are process watchers. They watch processes and restart them if they fail, and ensure they start on system boot.</p>\n<h3>Example Script</h3>\n<p>As an example lets assume we have an executable shell script we wish to keep persistently running that we have saved at <code>/home/user/current_date.sh</code> and looks like the following:</p>\n<div class="codehilite"><pre><span class="c">#!/bin/bash</span>\n<span class="k">while </span><span class="nb">true</span>\n<span class="k">do</span> \n    <span class="c"># Echo current date to stdout</span>\n    <span class="nb">echo</span> <span class="s1">&#39;Hello, the current date is:&#39;</span> <span class="sb">`</span>date<span class="sb">`</span>\n    <span class="c"># Echo &#39;error!&#39; to stderr</span>\n    <span class="nb">echo</span> <span class="s1">&#39;Ops an error ocurred!&#39;</span> &gt;&amp;2\n    sleep 1\n<span class="k">done</span>\n</pre></div>\n\n\n<p>If the script is not executable, make it executable with:</p>\n<div class="codehilite"><pre>chmod +x /home/user/current_date.sh\n</pre></div>\n\n\n<h3>Supervisor Installation</h3>\n<p>To install Supervisor, you can simply run the following:</p>\n<div class="codehilite"><pre>sudo apt-get install supervisor\n</pre></div>\n\n\n<p>Installing it as a package gives the ability to treat it as a service:</p>\n<div class="codehilite"><pre>sudo service supervisor start  <span class="c"># options: force-reload, force-stop, reload, restart, start, status, stop</span>\n</pre></div>\n\n\n<h3>Configuration</h3>\n<p>Configuration for Supervisor is found in <code>/etc/supervisor</code>. If you look at the configuration file <code>/etc/supervisord/supervisord.conf</code>, you'll see at the following at the bottom:</p>\n<div class="codehilite"><pre><span class="o">[</span>include<span class="o">]</span>\n<span class="nv">files</span> <span class="o">=</span> /etc/supervisor/conf.d/*.conf\n</pre></div>\n\n\n<p>This means that any files found in <code>/etc/supervisor/conf.d</code> and ending in <code>.conf</code> will be included. This is where we can add configurations for our services.</p>\n<p>So now you need to tell Supervisor how to run and monitor the <code>long.sh</code> script. To do this you need to create a configuration file (let's name it <code>currentdate.conf</code>) and place it, at <code>/etc/supervisor/conf.d/</code>:</p>\n<div class="codehilite"><pre>; <span class="o">===================</span>\n; currentdate  celery\n; <span class="o">===================</span>\n\n<span class="o">[</span>program:currentdate_celery<span class="o">]</span>\n\n; Set full path to celery program <span class="k">if </span>using virtualenv, runs celery with celerybeat\n<span class="nb">command</span><span class="o">=</span>/home/user/.virtualenv/projectname/bin/celery worker -A scriptname -B\n\n<span class="nv">directory</span><span class="o">=</span>/home/user/development/projectname/app\n\n<span class="nv">user</span><span class="o">=</span>user\n\n<span class="nv">numprocs</span><span class="o">=</span>1\n\n<span class="nv">stdout_logfile</span><span class="o">=</span>/var/log/projectname/nodebook_celery.out.log\n<span class="nv">stderr_logfile</span><span class="o">=</span>/var/log/projectname/nodebook_celery.err.log\n\n<span class="nv">environment</span><span class="o">=</span><span class="nv">SECRET_KEY</span><span class="o">=</span><span class="s1">&#39;some secret key&#39;</span>,SC_DIR<span class="o">=</span><span class="s1">&#39;/home/user/Documents/&#39;</span>\n\n<span class="nv">autostart</span><span class="o">=</span><span class="nb">true</span>\n<span class="nv">autorestart</span><span class="o">=</span><span class="nb">true</span>\n\n; Set Celery priority higher than default <span class="o">(</span>999<span class="o">)</span>\n; so, <span class="k">if </span>rabbitmq is supervised, it will start first.\n<span class="nv">priority</span><span class="o">=</span>1000\n</pre></div>\n\n\n<p>As usual, we'll cover the options set here:</p>\n<ul>\n<li><code>[program:nodehook]</code> - Define the program to monitor. We'll call it "nodehook".</li>\n<li><code>command</code> - This is the command to run that kicks off the monitored process. We use "node" and run the "http.js" file. If you needed to pass any command line arguments or other data, you could do so here.</li>\n<li><code>directory</code> - Set a directory for Supervisord to "cd" into for before running the process, useful for cases where the process assumes a directory structure relative to the location of the executed script.</li>\n<li><code>autostart</code> - Setting this "true" means the process will start when Supervisord starts (essentially on system boot).</li>\n<li><code>autorestart</code> - If this is "true", the program will be restarted if it exits unexpectedly.</li>\n<li><code>startretries</code> - The number of retries to do before the process is considered "failed"</li>\n<li><code>stderr_logfile</code> - The file to write any errors output.</li>\n<li><code>stdout_logfile</code> - The file to write any regular output.</li>\n<li><code>user</code> - The user the process is run as.</li>\n<li><code>environment</code> - Environment variables to pass to the process.</li>\n</ul>\n<p>Note that we've specified some log files to be created inside of the /var/log/webhook directory. </p>\n<p>Supervisord won't create a directory for logs if they do not exist; We need to create them before running Supervisord:</p>\n<div class="codehilite"><pre>sudo mkdir /var/log/webhook\n</pre></div>\n\n\n<h3>Controlling Processes</h3>\n<p>Now that we've configured Supervisord to monitor our Node process, we can read the configuration in and then reload Supervisord, using the supervisorctl tool:</p>\n<div class="codehilite"><pre>supervisorctl reread\nsupervisorctl update\n</pre></div>\n\n\n<p>Our Node process should be running now. We can check this by simply running supervisorctl:</p>\n<div class="codehilite"><pre>sudo supervisorctl\nnodehook               RUNNING    pid 444, uptime 0:02:45\n</pre></div>\n\n\n<p>We can double check this with the ps command:</p>\n<div class="codehilite"><pre>ps aux | grep node\nuser   444  0.0  2.0 659620 10520 ?  Sl   00:57   0:00 /usr/bin/node /srv/http.js\n</pre></div>\n\n\n<p>There's other things we can do with <code>supervisorctl</code> as well. Enter the controlling tool using <code>sudo supervisorctl</code>:</p>\n<div class="codehilite"><pre>supervisorctl\nnodehook     RUNNING    pid 444, uptime 0:15:42\n</pre></div>\n\n\n<p>Get a menu of available commands:</p>\n<div class="codehilite"><pre>supervisor&gt; <span class="nb">help</span>\n<span class="c"># Available commands output here</span>\n</pre></div>\n\n\n<p>More info at <a href="https://serversforhackers.com/monitoring-processes-with-supervisord">ServersForHackers</a>.</p>	8a83671d-ff22-4dfe-a4b5-c53a7c4ea22d
36	Querying Many to Many Relationship in SQLAlchemy with Flask	querying-many-to-many-relationship-in-sqlalchemy-with-flask	2016-04-07 12:11:08+00	2017-08-10 19:50:14+00	0	0	1	<div class="codehilite"><pre><span class="n">reports</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Table</span><span class="p">(</span><span class="s">&#39;reports&#39;</span><span class="p">,</span>\n    <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="s">&#39;report_id&#39;</span><span class="p">,</span> <span class="n">db</span><span class="o">.</span><span class="n">Integer</span><span class="p">,</span> <span class="n">db</span><span class="o">.</span><span class="n">ForeignKey</span><span class="p">(</span><span class="s">&#39;report_period.id&#39;</span><span class="p">)),</span>\n    <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="s">&#39;client_id&#39;</span><span class="p">,</span> <span class="n">db</span><span class="o">.</span><span class="n">Integer</span><span class="p">,</span> <span class="n">db</span><span class="o">.</span><span class="n">ForeignKey</span><span class="p">(</span><span class="s">&#39;clients.id&#39;</span><span class="p">)),</span>\n<span class="p">)</span>\n\n<span class="k">class</span> <span class="nc">Clients</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">Model</span><span class="p">):</span>\n    <span class="nb">id</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">Integer</span><span class="p">,</span> <span class="n">primary_key</span><span class="o">=</span><span class="bp">True</span><span class="p">)</span>\n    <span class="n">name</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">String</span><span class="p">(</span><span class="mi">255</span><span class="p">),</span> <span class="n">unique</span><span class="o">=</span><span class="bp">True</span><span class="p">)</span>\n    <span class="n">reports</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">relationship</span><span class="p">(</span><span class="s">&#39;ReportPeriod&#39;</span><span class="p">,</span> <span class="n">secondary</span><span class="o">=</span><span class="n">reports</span><span class="p">,</span> <span class="n">backref</span><span class="o">=</span><span class="n">db</span><span class="o">.</span><span class="n">backref</span><span class="p">(</span><span class="s">&#39;clients&#39;</span><span class="p">,</span> <span class="n">lazy</span><span class="o">=</span><span class="s">&#39;dynamic&#39;</span><span class="p">))</span>\n\n\n<span class="k">class</span> <span class="nc">ReportPeriod</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">Model</span><span class="p">):</span>\n    <span class="nb">id</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">Integer</span><span class="p">,</span> <span class="n">primary_key</span><span class="o">=</span><span class="bp">True</span><span class="p">)</span>\n    <span class="n">frequency</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">String</span><span class="p">(</span><span class="mi">100</span><span class="p">),</span> <span class="n">nullable</span><span class="o">=</span><span class="bp">False</span><span class="p">)</span>\n    <span class="n">description</span> <span class="o">=</span> <span class="n">db</span><span class="o">.</span><span class="n">Column</span><span class="p">(</span><span class="n">db</span><span class="o">.</span><span class="n">Text</span><span class="p">)</span>\n</pre></div>\n\n\n<p>To retrieve all the clients for a given period you can do:</p>\n<div class="codehilite"><pre><span class="n">clients</span> <span class="o">=</span> <span class="n">ReportPeriod</span><span class="o">.</span><span class="n">query</span><span class="o">.</span><span class="n">filter</span><span class="p">(</span><span class="n">ReportPeriod</span><span class="o">.</span><span class="n">clients</span><span class="o">.</span><span class="n">any</span><span class="p">(</span><span class="n">name</span><span class="o">=</span><span class="n">name</span><span class="p">))</span><span class="o">.</span><span class="n">all</span><span class="p">()</span>\n</pre></div>\n\n\n<p>Ref: <a href="http://stackoverflow.com/questions/12593421/sqlalchemy-and-flask-how-to-query-many-to-many-relationship">StackOverflow</a></p>	5e7433ad-6583-4048-a402-060971970366
37	Difference between the current branch and the master branch	difference-between-the-current-branch-and-the-master-branch	2016-04-11 07:50:29+00	2017-08-10 19:50:14+00	0	0	2	<p>To get the difference between the current branch and the master branch run:</p>\n<div class="codehilite"><pre>git diff master branch_name\n</pre></div>	59fe70fd-40e8-49d3-a906-58697bd74e23
38	Renaming branches	renaming-branches	2016-04-11 08:22:18+00	2018-01-16 14:28:48+00	0	0	2	To rename the current working branch run:</p>\r\n\r\n```\r\n:::bash\r\ngit branch -m new_branch_name\r\n```\r\n\r\nYou can also re-name a different branch from the one you are currently in with:\r\n\r\n```\r\n:::bash\r\ngit branch -m old_branch_name new_branch_name\r\n```\r\n\r\nOnce done, delete the old branch on remote with:\r\n\r\n```\r\n:::bash\r\ngit push origin :old_branch_name\r\n```\r\n\r\nNow push the new branch to the remote with:\r\n```\r\n:::bash\r\ngit push origin new_branch_name:refs/heads/new_branch_name\r\n```	4f53be06-d3d0-4a9a-99c7-1a268730e3dc
39	Set password for current user	set-password-for-current-user	2016-04-11 08:32:48+00	2017-08-10 19:50:14+00	0	0	2	<p>To set the password for the current use in MySQL, run:</p>\n<div class="codehilite"><pre><span class="o">&gt;</span><span class="n">mysql</span><span class="o">&gt;</span> <span class="kt">SET</span> <span class="n">PASSWORD</span> <span class="o">=</span> <span class="nf">PASSWORD</span><span class="p">(</span><span class="s1">&#39;this_is_the_password&#39;</span><span class="p">)</span>\n</pre></div>	66277471-9053-4d92-896f-033edc729ee9
40	Abstract classes in python	abstract-classes-in-python	2016-04-11 09:07:10+00	2017-08-10 19:50:14+00	0	0	2	<p>An abstract class is a kind of 'model' for other classes to be defined. It is not designed to construct instances, but can be sub-classed by regular classes.</p>\n<p>Abstract classes can define the interface, or methods that must be implemented by its subclasses.</p>\n<div class="codehilite"><pre><span class="c">#!/usr/bin/python</span>\n\n<span class="kn">import</span> <span class="nn">abc</span>\n\n<span class="kn">from</span> <span class="nn">datetime</span> <span class="kn">import</span> <span class="n">datetime</span>\n\n<span class="k">class</span> <span class="nc">WriteFile</span><span class="p">(</span><span class="nb">object</span><span class="p">):</span>\n    <span class="n">__metaclass__</span> <span class="o">=</span> <span class="n">abc</span><span class="o">.</span><span class="n">ABCMeta</span>\n\n    <span class="k">def</span> <span class="nf">__init__</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">file_name</span><span class="p">):</span>\n        <span class="bp">self</span><span class="o">.</span><span class="n">filename</span> <span class="o">=</span> <span class="n">file_name</span>\n\n    <span class="nd">@abc.abstractmethod</span>\n    <span class="k">def</span> <span class="nf">write</span><span class="p">(</span><span class="bp">self</span><span class="p">):</span>\n        <span class="k">return</span>\n\n    <span class="k">def</span> <span class="nf">write_line</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">data</span><span class="p">):</span>\n        <span class="n">f</span> <span class="o">=</span> <span class="nb">open</span><span class="p">(</span><span class="bp">self</span><span class="o">.</span><span class="n">filename</span><span class="p">,</span> <span class="s">&#39;a&#39;</span><span class="p">)</span>\n        <span class="n">f</span><span class="o">.</span><span class="n">write</span><span class="p">(</span><span class="n">data</span> <span class="o">+</span> <span class="s">&#39;</span><span class="se">\\n</span><span class="s">&#39;</span><span class="p">)</span>\n        <span class="n">f</span><span class="o">.</span><span class="n">close</span><span class="p">()</span>\n\n\n<span class="k">class</span> <span class="nc">LogFile</span><span class="p">(</span><span class="n">WriteFile</span><span class="p">):</span>\n    <span class="k">def</span> <span class="nf">write</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">data</span><span class="p">):</span>\n        <span class="n">dt_str</span> <span class="o">=</span> <span class="n">datetime</span><span class="o">.</span><span class="n">now</span><span class="p">()</span><span class="o">.</span><span class="n">strftime</span><span class="p">(</span><span class="s">&#39;%Y-%m-</span><span class="si">%d</span><span class="s"> %H.%M&#39;</span><span class="p">)</span>\n        <span class="bp">self</span><span class="o">.</span><span class="n">write_line</span><span class="p">(</span><span class="s">&#39;{}    {}&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">dt_str</span><span class="p">,</span> <span class="n">data</span><span class="p">))</span>\n\n\n<span class="k">class</span> <span class="nc">DelimFile</span><span class="p">(</span><span class="n">WriteFile</span><span class="p">):</span>\n    <span class="k">def</span> <span class="nf">__init__</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">delim_file</span><span class="p">,</span> <span class="n">delimiter</span><span class="p">):</span>\n        <span class="nb">super</span><span class="p">(</span><span class="n">DelimFile</span><span class="p">,</span> <span class="bp">self</span><span class="p">)</span><span class="o">.</span><span class="n">__init__</span><span class="p">(</span><span class="n">delim_file</span><span class="p">)</span>\n        <span class="bp">self</span><span class="o">.</span><span class="n">delimiter</span> <span class="o">=</span> <span class="n">delimiter</span>\n\n    <span class="k">def</span> <span class="nf">write</span><span class="p">(</span><span class="bp">self</span><span class="p">,</span> <span class="n">data</span><span class="p">):</span>\n        <span class="n">line</span> <span class="o">=</span> <span class="bp">self</span><span class="o">.</span><span class="n">delimiter</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">data</span><span class="p">)</span>\n        <span class="bp">self</span><span class="o">.</span><span class="n">write_line</span><span class="p">(</span><span class="n">line</span><span class="p">)</span>\n\n\n<span class="n">log</span> <span class="o">=</span> <span class="n">LogFile</span><span class="p">(</span><span class="s">&#39;log.txt&#39;</span><span class="p">)</span>\n<span class="n">log</span><span class="o">.</span><span class="n">write</span><span class="p">(</span><span class="s">&#39;This is a log message.&#39;</span><span class="p">)</span>\n<span class="n">log</span><span class="o">.</span><span class="n">write</span><span class="p">(</span><span class="s">&#39;This is another log message.&#39;</span><span class="p">)</span>\n\n<span class="n">csv_text</span> <span class="o">=</span> <span class="n">DelimFile</span><span class="p">(</span><span class="s">&#39;text.csv&#39;</span><span class="p">,</span> <span class="s">&#39;,&#39;</span><span class="p">)</span>\n<span class="n">csv_text</span><span class="o">.</span><span class="n">write</span><span class="p">([</span><span class="s">&#39;a&#39;</span><span class="p">,</span> <span class="s">&#39;b&#39;</span><span class="p">,</span> <span class="s">&#39;c&#39;</span><span class="p">,</span> <span class="s">&#39;d&#39;</span><span class="p">])</span>\n<span class="n">csv_text</span><span class="o">.</span><span class="n">write</span><span class="p">([</span><span class="s">&#39;1&#39;</span><span class="p">,</span> <span class="s">&#39;2&#39;</span><span class="p">,</span> <span class="s">&#39;3&#39;</span><span class="p">,</span> <span class="s">&#39;4&#39;</span><span class="p">])</span>\n</pre></div>	20010495-d9d3-4b62-b450-8f4e64ca0aa9
41	Pip installing external packages	pip-installing-external-packages	2016-04-14 14:14:40+00	2017-08-10 19:50:14+00	0	0	2	<p>--allow-external\nand \n--allow-unverified</p>\n<p>Are now deprecated (2016). Installing packages external to PyPi using pip is no longer supported: http://legacy.python.org/dev/peps/pep-0470/</p>\n<p>As an alternative, when you really need to install that external package, you can download the source code and run its setup.py. For example, for PIL 1.1.7, download (to your project enviroment (/user/virtual_environments/environment_name/lib/python2.7/site-packages) from http://www.pythonware.com/products/pil/,then:</p>\n<div class="codehilite"><pre><span class="n">tar</span> <span class="n">xvfz</span> <span class="n">Imaging</span><span class="o">-</span>1<span class="p">.</span>1<span class="p">.</span>7<span class="p">.</span><span class="n">tar</span><span class="p">.</span><span class="n">gz</span>\n<span class="n">cd</span> <span class="n">Imaging</span><span class="o">-</span>1<span class="p">.</span>1<span class="p">.</span>7\n<span class="n">python</span> <span class="n">setup</span><span class="p">.</span><span class="n">py</span> <span class="n">install</span>\n</pre></div>	6950ac2c-1c4e-4078-b99c-76e24bcf2796
93	How to duplicate a row in SQL	how-to-duplicate-a-row-in-sql	2018-03-20 13:24:09+00	2018-03-20 13:28:43+00	0	0	2	Lets say you have a table called `users` and you wish to create another row with the same information as the first row.\r\n\r\nHere's how you can achieve that:\r\n\r\n```\r\n:::sql\r\nINSERT INTO users (password, email, name)\r\nSELECT password, 'worker@mail.com' as email, name\r\nFROM users\r\nWHERE id = 1;\r\n```\r\n\r\n**References:**\r\n\r\n* [postgreSQL: how to duplicate a row](https://stackoverflow.com/questions/15429756/postgresql-how-to-duplicate-a-row)	3b9f01da-78e4-42ba-ab21-95fce7709cec
42	Error altering Postgres table columns with South	error-altering-postgres-table-columns-with-south	2016-04-15 09:27:11+00	2017-08-10 19:50:14+00	0	0	2	<h3>Problem</h3>\n<p>You're using Postgres with Django.</p>\n<p>You change a field type of one of your models, generate an --auto South migration and attempt to run it. However, South chokes on the new migration complaining that the data in the column cannot be cast to the new type.</p>\n<p>For instance, I recently changed a CharField to a TimeField but the corresponding migration lead to:</p>\n<div class="codehilite"><pre> Running migrations <span class="k">for </span>accounts:\n - Migrating backwards to just after 0003_auto__add_field_account_last_4_digits__add_field_account_stripe_custom.\n &lt; accounts:0004_auto__chg_field_account_stripe_customer_id\nFATAL ERROR - The following SQL query failed: ALTER TABLE <span class="s2">&quot;accounts_account&quot;</span> ALTER COLUMN <span class="s2">&quot;stripe_customer_id&quot;</span> TYPE integer, ALTER COLUMN <span class="s2">&quot;stripe_customer_id&quot;</span> SET NOT NULL, ALTER COLUMN <span class="s2">&quot;stripe_customer_id&quot;</span> DROP DEFAULT;\nThe error was: column <span class="s2">&quot;stripe_customer_id&quot;</span> cannot be cast automatically to <span class="nb">type </span>integer\nHINT:  You might need to specify <span class="s2">&quot;USING stripe_customer_id::integer&quot;</span>.\n</pre></div>\n\n\n<p>Postgres did not know how to convert my text data to times.</p>\n<h3>Solution</h3>\n<p>Write the ALTER TABLE SQL by hand, making use of the USING clause to specify how to compute the new value from the old.</p>\n<p>For the above example, the correct SQL to use is:</p>\n<div class="codehilite"><pre>    <span class="k">ALTER</span> <span class="k">TABLE</span> <span class="s2">&quot;accounts_account&quot;</span><span class="p">,</span>\n    <span class="k">ALTER</span> <span class="k">COLUMN</span> <span class="s2">&quot;stripe_customer_id&quot;</span> <span class="n">TYPE</span> <span class="kt">INTEGER</span><span class="p">,</span>\n    <span class="k">ALTER</span> <span class="k">COLUMN</span> <span class="s2">&quot;stripe_customer_id&quot;</span> <span class="kt">SET</span> <span class="k">NOT</span> <span class="no">NULL</span><span class="p">,</span>\n    <span class="k">ALTER</span> <span class="k">COLUMN</span> <span class="s2">&quot;stripe_customer_id&quot;</span> <span class="k">DROP</span> <span class="k">DEFAULT</span><span class="p">;</span>\n</pre></div>\n\n\n<p>We need to modify the migration file to execute raw SQL with db.execute instead of using db.alter_table to generate the SQL. So we change:</p>\n<div class="codehilite"><pre><span class="n">db</span><span class="o">.</span><span class="n">alter_column</span><span class="p">(</span><span class="s">&#39;accounts_account&#39;</span><span class="p">,</span> <span class="s">&#39;stripe_customer_id&#39;</span><span class="p">,</span> <span class="bp">self</span><span class="o">.</span><span class="n">gf</span><span class="p">(</span><span class="s">&#39;django.db.models.fields.IntegerField&#39;</span><span class="p">)())</span>\n</pre></div>\n\n\n<p>to:</p>\n<div class="codehilite"><pre><span class="n">db</span><span class="o">.</span><span class="n">execute</span><span class="p">(</span>\n    <span class="s">&#39;ALTER TABLE &quot;accounts_account&quot; &#39;</span>\n    <span class="s">&#39;ALTER COLUMN &quot;stripe_customer_id&quot; TYPE INTEGER USING stripe_customer_id::integer, &#39;</span>\n    <span class="s">&#39;ALTER COLUMN &quot;stripe_customer_id&quot; SET NOT NULL, &#39;</span>\n    <span class="s">&#39;ALTER COLUMN &quot;stripe_customer_id&quot; DROP DEFAULT &#39;</span>\n<span class="p">)</span>\n</pre></div>\n\n\n<p>and all is well.</p>\n<p>A similar technique can be used wherever Postgres refuses to run a migration due to casting issues. See the <a href="http://www.postgresql.org/docs/9.1/static/sql-altertable.html">Postgres documentation</a> for more examples of the USING clause.</p>	213b6a44-7bb5-4f27-ab2b-5a82a1a0ad27
43	PostgreSQL command line cheat sheet	postgresql-command-line-cheat-sheet	2016-04-15 09:55:41+00	2017-12-12 09:29:48+00	0	0	2	###List databases\r\n```\r\n:::psql\r\n\\list  # or \\l\r\n```\r\n\r\n###Connect to database\r\n```\r\n:::psql\r\n\\connect <database_name>  # or \\c <database_name>\r\n```\r\n\r\n```\r\n:::psql\r\n-- List tables in current database\r\n\\dt\r\n\r\n-- Switch databases\r\n\\connect <database_name>\r\n\r\n-- Display table schema\r\n\\d+ <table_name>\r\n\r\n-- Drop table\r\nDROP TABLE <table_name>\r\n\r\n-- List user roles\r\n\\du\r\n\r\n-- Create a database\r\nCREATE DATABASE <database_name>\r\n\r\n-- Create a user and grant database access\r\nCREATE USER <user_name> WITH PASSWORD 'user_password'\r\nGRANT ALL PRIVILEGES ON DATABASE <database_name> TO <user_name>\r\n\r\n-- Drop database\r\nDROP DATABASE [IF EXISTS] <database_name>\r\n\r\n-- Drop user\r\nDROP USER [IF EXISTS] <user_name>\r\n\r\n-- Delete from table\r\nDELETE FROM <table_name> WHERE id=123\r\n\r\n-- Count table rows\r\nSELECT COUNT(*) FROM <table_name>\r\n\r\n-- Export postgres table to csv with headings\r\n\\COPY (SELECT id, name FROM <table_name>) TO '/path/file_name.csv' DELIMITER ',' CSV HEADER\r\n\r\n-- Update field in table\r\nUPDATE <table_name> SET <column_name> = <new_value> WHERE <condition>;\r\n\r\n```	1e571ed1-ad84-42af-9f51-500766e7b476
44	Alembic migrations	alembic-migrations	2016-04-20 07:16:37+00	2017-08-10 19:50:14+00	0	0	2	### Relative Migration Identifiers\r\n\r\nRelative upgrades/downgrades are also supported. To move two versions from the current, a decimal value “+N” can be supplied:\r\n\r\n```\r\n:::bash\r\n\r\nalembic upgrade +2\r\n```\r\n\r\nNegative values are accepted for downgrades:\r\n\r\n```\r\n:::bash\r\n\r\nalembic downgrade -3\r\n```\r\n\r\nNegative values are accepted for downgrades:\r\n\r\n```\r\n:::bash\r\n\r\nalembic downgrade -1\r\n```\r\n\r\nTo upgrade to revision ae1027a6acf plus two additional steps:\r\n\r\n```\r\n:::bash\r\n\r\nalembic upgrade ae10+2\r\n```\r\n\r\n### Getting Information\r\n\r\nTo view the current revision, run:\r\n\r\n```\r\n:::bash\r\nalembic current\r\n```\r\n\r\nReturns:\r\n\r\n```\r\n:::bash\r\n\r\nINFO  [alembic.context] Context class PostgresqlContext.\r\nINFO  [alembic.context] Will assume transactional DDL.\r\nCurrent revision for postgresql://scott:XXXXX@localhost/test: 1975ea83b712 -> ae1027a6acf (head), Add a column\r\n```\r\n\r\n`head` is displayed only if the revision identifier for this database matches the head revision.\r\n\r\nWe can also view history with alembic history; the –verbose option (accepted by several commands, including history, current, heads and branches) will show us full information about each revision:\r\n\r\n```\r\n:::bash\r\n\r\nalembic history --verbose\r\n```\r\n\r\nReturns:\r\n\r\n```\r\n:::bash\r\n\r\nRev: ae1027a6acf (head)\r\nParent: 1975ea83b712\r\nPath: /path/to/yourproject/alembic/versions/ae1027a6acf_add_a_column.py\r\n\r\n    add a column\r\n\r\n    Revision ID: ae1027a6acf\r\n    Revises: 1975ea83b712\r\n    Create Date: 2014-11-20 13:02:54.849677\r\n\r\nRev: 1975ea83b712\r\nParent: <base>\r\nPath: /path/to/yourproject/alembic/versions/1975ea83b712_add_account_table.py\r\n\r\n    create account table\r\n\r\n    Revision ID: 1975ea83b712\r\n    Revises:\r\n    Create Date: 2014-11-20 13:02:46.257104\r\n```\r\n\r\n### Downgrading\r\n\r\nTo downgrade alembic to the beginning you run:\r\n\r\n```\r\n:::bash\r\n\r\nalembic downgrade base\r\n```\r\n\r\nReturns:\r\n\r\n```\r\n:::bash\r\n\r\nINFO  [alembic.context] Context class PostgresqlContext.\r\nINFO  [alembic.context] Will assume transactional DDL.\r\nINFO  [alembic.context] Running downgrade ae1027a6acf -> 1975ea83b712\r\nINFO  [alembic.context] Running downgrade 1975ea83b712 -> None\r\n```	bfe538ec-0059-4ad1-b51e-806a227ee774
45	Celery debugging tasks	celery-debugging-tasks	2016-04-20 08:19:55+00	2017-07-09 21:30:20+00	0	0	2	`celery.contrib.rdb` is an extended version of `pdb` that enables remote debugging of processes that does not have terminal access.\r\n\r\nExample usage:\r\n\r\n```\r\n:::python\r\n\r\nfrom celery import task\r\nfrom celery.contrib import rdb\r\n\r\n@task()\r\ndef add(x, y):\r\n    result = x + y\r\n    rdb.set_trace()  # <- set breakpoint\r\n    return result\r\n```\r\n\r\n`set_trace()` sets a breakpoint at the current location and creates a socket you can telnet into to remotely debug your task.\r\n\r\nWhen the worker encounters your breakpoint it will log the following information:\r\n\r\n```\r\n:::bash\r\n\r\n[INFO/MainProcess] Received task:\r\n    tasks.add[d7261c71-4962-47e5-b342-2448bedd20e8]\r\n[WARNING/PoolWorker-1] Remote Debugger:6900:\r\n    Please telnet 127.0.0.1 6900.  Type `exit` in session to continue.\r\n[2011-01-18 14:25:44,119: WARNING/PoolWorker-1] Remote Debugger:6900:\r\n    Waiting for client...\r\n```\r\n\r\nOpen a new terminal tab or window and if telnet into the port specified you will be presented with a pdb shell:\r\n\r\n```\r\n:::bash\r\n\r\n$ telnet localhost 6900\r\nConnected to localhost.\r\nEscape character is '^]'.\r\n> /opt/devel/demoapp/tasks.py(128)add()\r\n-> return result\r\n(Pdb)\r\n```\r\n\r\nEnter help to get a list of available commands, It may be a good idea to read the [Python Debugger Manual] if you have never used pdb before.\r\n\r\n  [Python Debugger Manual]: http://docs.python.org/library/pdb.html	6f118dfc-10c0-4d5b-b795-276c5662bbb2
46	Mount a Remote Directory With SSHFS on a Linux	mount-a-remote-directory-with-sshfs-on-a-linux	2016-05-04 08:26:45+00	2017-08-10 19:50:14+00	0	0	2	SSH is a secure protocol and you can use it to mount a directory on a remote server or local laptop with the help of the SSHF service. With SSHFS you can mount remote server file system to your local development workstation/laptop powered by Linux.\r\n\r\nSSHFS is a filesystem based on the SSH file transfer protocol. It is used on a client system i.e. you need to install SSHFS package on your local computer/laptop. No need to install anything on server.\r\n\r\n### Installing SSHFS\r\n\r\n```\r\n:::bash\r\n\r\nsudo apt-get install sshfs\r\n```\r\n\r\n### Mounting the remote file system\r\n\r\nThe syntax is as follow:\r\n\r\n```\r\n:::bash\r\n\r\nsshfs user@server /path/to/mountpoint\r\nsshfs user@server /path/to/mountpoint options\r\n```\r\n\r\nFirst, create the directory where you want to mount the remote file system\r\n\r\n```\r\n:::bash\r\n\r\nsudo mkdir ~/development/SERVER1\r\n```\r\n\r\nThen mount the file system using the server\\_user@host\\_name\\_or\\_ip\\_address followed by the path to the directory you have just created:\r\n\r\n```\r\n:::bash\r\n\r\nsudo sshfs -o allow_other root@192.168.1.142:/ /home/username/development/SERVER1\r\n```\r\n\r\nenter the password for the remote server\r\n\r\n```\r\n:::bash\r\n\r\nroot@192.168.1.142's password:\r\n```\r\n\r\nyou can check if the remote file system was mounted successfully with:\r\n\r\n```\r\n:::bash\r\n\r\nsudo df -h\r\n```\r\n\r\n### Unmount the remote file system\r\n\r\n```\r\n:::bash\r\nsudo umount /mnt/server1\r\n```\r\n\r\nyou can check if the remote file system was unmounted successfully with:\r\n\r\n```\r\n:::bash\r\n\r\nsudo df -h\r\n```	a0a1068c-fcb3-41f9-bb2c-e19e19007be3
47	South Dependencies	south-dependencies	2016-05-11 08:13:07+00	2017-08-10 19:50:14+00	0	0	2	Migrations for apps are nice ‘n all, but when you start writing a large project, with a lot of apps, you realise you have foreign key relationships between apps and working out what order migrations would need to be applied in for each app is just painful.\r\n\r\nLuckily, we also had this problem, so South has a dependency system. Inside a migration, you can declare that it depends on having another app having run a certain migration first; for example, if my app “forum” depends on the “accounts” app having created its user profile table, we can do:\r\n\r\n```\r\n:::python\r\n\r\n# forum/migrations/0002_post.py\r\nclass Migration:\r\n\r\n    depends_on = (\r\n        ("accounts", "0003_add_user_profile"),\r\n    )\r\n\r\n    def forwards(self):\r\n        ...\r\n```\r\n\r\nThen, if you try and migrate to or beyond 0002\\_post in the forum app, it will first make sure accounts is migrated at least up to `0003_add_user_profile`, and if not will migrate it for you.\r\n\r\nDependencies also work in reverse; South knows not to undo that `0003_add_user_profile` migration until it has undone the `0002_post migration`.\r\n\r\n### Reverse Dependencies\r\n\r\nSouth also supports “reverse dependencies” - a dependecy where you say your migration must be run before another, rather than vice-versa. This is useful if you’re trying to run a migration before another in a separate, third-party (or unchangeable) code.\r\n\r\nDeclaring these is just like the other kind, except you use `needed_by`:\r\n\r\n```\r\n:::python\r\nclass Migration:\r\n\r\n    needed_by = (\r\n        ("accounts", "0005_make_fks"),\r\n    )\r\n\r\n    def forwards(self):\r\n        ...\r\n```\r\n\r\nSource:  \r\n  [south.readthedocs]    \r\n\r\n  [south.readthedocs]: http://south.readthedocs.io/en/0.7.6/dependencies.html	5480aaa2-33dc-46c3-b1a9-a54177fed48e
48	Managing fab output	managing-fab-output	2016-05-11 08:26:37+00	2017-08-10 19:50:14+00	0	0	2	The fab tool is very verbose by default and prints out almost everything it can, including the remote end’s stderr and stdout streams, the command strings being executed, and so forth. While this is necessary in many cases in order to know just what’s going on, any nontrivial Fabric task will quickly become difficult to follow as it runs.\r\n\r\n### Hiding and/or showing output levels\r\n\r\nYou may toggle any of Fabric’s output levels by using a context managers `hide` or `show`.\r\n\r\n`fabric.context_managers.hide(*groups)` sets the given output groups to False. `groups` must be one or more strings naming the output groups defined in `output`.\r\n\r\nThe given groups will be set to False for the duration of the enclosed block, and restored to their previous value afterwards.\r\n\r\nFor example, to hide the “`[hostname] run:`” status lines, as well as preventing printout of stdout and stderr, one might use `hide` as follows:\r\n\r\n```\r\n:::python\r\nfrom fabric.api import hide, run\r\n\r\ndef my_task():\r\n    with hide('running', 'stdout', 'stderr'):\r\n        run('ls /var/www')\r\n```\r\n\r\nSources: \r\n\r\n  [Stackoverflow suppress Fabric output]    \r\n  [Fabric context managers hide]\r\n\r\n  [Stackoverflow suppress Fabric output]: http://stackoverflow.com/a/9621835\r\n  [Fabric context managers hide]: http://docs.fabfile.org/en/1.4.0/api/core/context_managers.html#fabric.context_managers.hide	81b93ba9-e817-4add-a51c-08993507b86e
49	Deploying Flask with NGINX, Supervisor and Gunicorn	deploying-flask-with-nginx-supervisor-and-gunicorn	2016-05-11 09:11:00+00	2017-08-10 19:50:14+00	0	0	2	### Flask\r\n\r\nCreate a WSGI file to start your web application `touch ~/dev/queryclick/magpie/wsgi.py`\r\n\r\n```\r\n:::python\r\n\r\n# project_name/\r\n#        app/\r\n#                __init__.py\r\n#                views.py\r\n#        wsgi.py\r\nfrom app import app\r\n\r\nif __name__ == "__main__":\r\n    app.run()\r\n```\r\n\r\n### NGINX\r\n\r\n-   NGINX files location: `/etc/nginx`\r\n-   NGINX log files location: `/var/log/nginx`\r\n-   Checking NGINX configuration files: `sudo nginx -t`\r\n-   Restarting NGINX: `sudo service nginx restart      # options: [start, status, stop, restart]`\r\n-   Removing NGINX:\r\n    -   Removing all but configuration files: `sudo apt-get remove nginx nginx-common`\r\n    -   Remove all nginx files: `sudo apt-get purge nginx nginx-common`\r\n-   Installing NGINX: `sudo apt-get install nginx`\r\n\r\nFor our next trick we’ll be configuring Nginx to work with our setup. We use Nginx as our routing manager, serving static files and reverse proxying to Gunicorn for our Flask views.\r\n\r\nOut of the box nginx initializes with a sample website configuration to tell you it installed correctly. So we can actually already visit our site in the browser and we’ll see the “Welcome to nginx!” boilerplate. But now we’re going to remove this sample config and write our own.\r\n\r\n```\r\n:::bash\r\n\r\nserver {\r\n    listen 80;\r\n    server_name 162.209.111.93;\r\n\r\n    root /home/deploy/sites/flaskdeploy;\r\n\r\n    access_log /home/pedrocurado/dev/queryclick/magpie/logs/nginx/access.log;\r\n    error_log /home/pedrocurado/dev/queryclick/magpie/logs/nginx/error.log;\r\n\r\n    location / {\r\n        proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;\r\n        proxy_set_header Host $http_host;\r\n        proxy_redirect off;\r\n        if (!-f $request_filename) {\r\n            proxy_pass http://127.0.0.1:8000;\r\n            break;\r\n        }\r\n    }\r\n\r\n    location /static {\r\n        alias  /home/deploy/sites/flaskdeploy/static/;\r\n        autoindex on;\r\n    }\r\n}\r\n```\r\n\r\nCreate the directory for your nginx logs with: `mkdir -p ~/dev/queryclick/magpie/logs/nginx`\r\n\r\nEnable the site (by creating a symlink), test our configuration and restart to allow the changes to take place.\r\n\r\n```\r\n:::bash\r\n\r\nsudo ln -s /etc/nginx/sites-enabled/flaskdeploy /etc/nginx/sites-available/\r\n# check if the configuration has no errors\r\nsudo nginx -t\r\n# restart nginx\r\nsudo service nginx restart\r\n```\r\n\r\n### Gunicorn\r\n\r\nWe use gunicorn to serve all of our flask views. The development server is not suited for production website for many reasons, including security and performance concerns. Here we could use any number of solutions including Tornado or mod\\_wsgi for Apache. I’ve chosen to use gunicorn so this is the configuration I’ll show.\r\n\r\nYou can install Gunicorn with: `pip install gunicorn`\r\n\r\nOnce installed, you can run the following in the root of our site’s directory to activate the gunicorn web server:\r\n\r\n```\r\n:::bash\r\n# bind ip address\r\ngunicorn -b 162.209.111.93:5000 wsgi:app\r\n```\r\n\r\n### Supervisor\r\n\r\nWe have to make our web application controllable by a monitoring program. Should the web application crash for some reason, it has to be restarted. Also in the case of a server reboot, it must be started. Supervisor does the job.\r\n\r\nSources:\r\n\r\n-   [Deploy Flask with NGINX, Gunicorn and Supervisor];\r\n-   [Deploying a Flask application];\r\n-   http://stackoverflow.com/questions/15293801/supervisor-not-working-with-gunicorn-flask;\r\n-   http://serverfault.com/questions/211525/supervisor-not-loading-new-configuration-files;\r\n-   http://serverfault.com/questions/211525/supervisor-not-loading-new-configuration-files\r\n\r\n  [Deploy Flask with NGINX, Gunicorn and Supervisor]: http://alexandersimoes.com/hints/2015/10/28/deploying-flask-with-nginx-gunicorn-supervisor-virtualenv-on-ubuntu.html\r\n  [Deploying a Flask application]: http://www.michielovertoom.com/freebsd/flask-gunicorn-nginx-supervisord/	9b3aa7b3-e5bc-42b0-bb7c-071c63137284
50	Kill process in Linux	kill-process-in-linux	2016-05-11 09:40:15+00	2017-08-10 19:50:14+00	0	0	2	Linux and Unix-like operating system come with the kill command to terminates stalled or unwanted processes without having to log out or restart the server.\r\n\r\n-   SIGHUP (1) – Hangup detected on controlling terminal or death of controlling process. Use SIGHUP to reload configuration files and open/close log files.\r\n-   SIGKILL (9) – Kill signal. Use SIGKILL as a last resort to kill process. This will not save data or cleaning kill the process.\r\n-   SIGTERM (15) – Termination signal. This is the default and safest way to kill process.\r\n\r\n### What is a PID?\r\n\r\nA Linux or Unix process is running instance of a program. For example, Firefox is a running process if you are browsing the Internet. Each time you start Firefox browser, the system is automatically assigned a unique process identification number (PID). A PID is automatically assigned to each process when it is created on the system. To find out PID of firefox or httpd process use the following command:\r\n\r\n```\r\n:::bash\r\n    \r\npidof httpd\r\npidof apache2\r\npidof firefox\r\n\r\n# or use the combination of `ps` command and `grep` command\r\n\r\nps aux | grep httpd\r\nps aux | grep apache2\r\nps aux | grep  supervisord\r\n```\r\n\r\nSample outputs:\r\n\r\n```\r\n:::bash\r\n\r\nroot      2934  0.0  0.0  58100 14248 ?        Ss   May10   0:14 /usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf\r\npedrocu+ 19455  0.0  0.0  15956  2228 pts/1    S+   10:57   0:00 grep --color=auto supervisor\r\n```\r\n\r\nAnd the PID is 2503\r\n\r\n### kill command syntax\r\n\r\n```\r\n:::bash\r\n    \r\nkill [signal] PID\r\nkill -15 PID\r\nkill -9 PID\r\nkill -SIGTERM PID\r\n```\r\n\r\nSources: [Kill process in Linux system]\r\n\r\n  [Kill process in Linux system]: http://www.cyberciti.biz/faq/kill-process-in-linux-or-terminate-a-process-in-unix-or-linux-systems/	efd25ef7-b951-42ea-bfc1-d176095479f1
51	Revert and redo a commit	revert-and-redo-a-commit	2016-05-19 08:16:10+00	2017-07-25 09:37:51+00	0	0	2	This is what you want to undo This is most often done when you remembered what you just committed is incomplete, or you misspelled your commit message1, or both. Leaves working tree as it was before git commit.\r\n\r\n```\r\n:::bash\r\ngit commit -m "Something terribly misguided"\r\ngit reset --soft HEAD~\r\n```\r\n\r\nMake corrections to working tree files. git add whatever changes you want to include in your new commit.\r\n\r\n```\r\n:::bash\r\ngit add ...\r\n```\r\n\r\nCommit the changes, reusing the old commit message. reset copied the old head to .git/ORIG\\_HEAD; commit with -c ORIG\\_HEAD will open an editor, which initially contains the log message from the old commit and allows you to edit it. If you do not need to edit the message, you could use the -C option instead.\r\n\r\n```\r\n:::bash\r\ngit commit -c ORIG_HEAD\r\n```\r\n\r\nIf you aren’t totally sure what you mean by “uncommit” and don’t know if you want to use git reset, please see Revert to a previous Git commit.\r\n\r\nIf you’re trying to understand git reset better, please see Can you explain what “git reset” does in plain English?\r\n\r\nIf you know you want to use git reset, it still depends what you mean by “uncommit”. If all you want to do is undo the act of committing, leaving everything else intact, use:\r\n\r\ngit reset –soft HEAD^ If you want to undo the act of committing and everything you’d staged, but leave the work tree (your files intact):\r\n\r\ngit reset HEAD^ And if you actually want to completely undo it, throwing away all uncommitted changes, resetting everything to the previous commit (as the original question asked):\r\n\r\ngit reset –hard HEAD^ The original question also asked it’s HEAD^ not HEAD. HEAD refers to the current commit - generally, the tip of the currently checked-out branch. The ^ is a notation which can be attached to any commit specifier, and means “the commit before”. So, HEAD^ is the commit before the current one, just as master^ is the commit before the tip of the master branch.\r\n\r\nHere’s the portion of the git-rev-parse documentation describing all of the ways to specify commits (^ is just a basic one among many).\r\n\r\nReferences: [Stackoverflow uncommit last commit][] [Stackoverflow undo last commit]\r\n\r\n  [Stackoverflow uncommit last commit]: http://stackoverflow.com/a/2846154\r\n  [Stackoverflow undo last commit]: http://stackoverflow.com/a/927386	7e637ff3-b41b-4e69-8fee-534566171cee
94	How to modify a specified commit in git?	how-to-modify-a-specified-commit-in-git	2018-04-20 10:45:49+00	2018-04-20 10:45:49+00	0	0	2	You can use git rebase, for example, if you want to modify back to commit bbc643cd, run\r\n\r\n```\r\n:::bash\r\n$ git rebase --interactive 'bbc643cd^'\r\n```\r\n\r\nIn the default editor, modify pick to edit in the line whose commit you want to modify. Make your changes and then commit them with the same message you had before:\r\n\r\n\r\n```\r\n:::bash\r\n$ git commit --all --amend --no-edit\r\n```\r\n\r\nto modify the commit, and after that\r\n\r\n```\r\n:::bash\r\n$ git rebase --continue\r\n```\r\n\r\nto return back to the previous head commit.\r\n\r\nWARNING: Note that this will change the SHA-1 of that commit as well as all children -- in other words, this rewrites the history from that point forward. You can break repos doing this if you push using the command git push --force	dec7218a-6f31-4b52-9fcf-5ae11e0c970c
52	Updating form with many to many field	updating-form-with-many-to-many-field	2016-06-29 12:22:54+00	2017-08-10 19:50:14+00	0	0	2	Imagine you have two models `Tags` and `Posts` where each post has a many to many relationship to the `Tags` model (each post can have 1 or more tags, each tag can be associated with 1 or more posts).\r\n\r\n### So how do you update posts using a form?\r\n\r\nI you are using a Django version =&gt; 1.9 then you can make use of the `set(objs, bulk=True, clear=False)` method.\r\n\r\nFor instance:\r\n\r\n```\r\n:::python\r\nclass EditPost(UpdateView):\r\n    ...\r\n    def post(self, request, *args, **kwargs):\r\n        ...\r\n        if form.is_valid():\r\n            posts.save()\r\n\r\n            for tag in list_of_tags:\r\n                tag_object, created = Tags.objects.get_or_create(name=tag)\r\n                list_of_tags.append(tag_object)\r\n            posts.tags.set(list_of_tags)\r\n            return redirect('app:view-name')\r\n```\r\n\r\nReference:\r\n<https://docs.djangoproject.com/en/1.9/ref/models/relations/#django.db.models.fields.related.RelatedManager.set>\r\n\r\nSo what do you do when comes the time where you need to edit and update your post? If you are using a Django version previous to 1.9 then one possible solution\r\n\r\n```\r\n:::bash\r\ndef post(self, request, *args, **kwargs):\r\n    ...\r\n    if form.is_valid():\r\n        report = form.save(commit=False)\r\n        report.account = account\r\n        report.save()\r\n\r\n        report.domains.clear()  # disassociates all objects from the related object set\r\n        for domain in list_of_domains:\r\n            domain_object, created = Domain.objects.get_or_create(url=domain_value)\r\n            report.domains.add(domain_object)\r\n        return redirect('app:view-name')\r\n```	de733321-1365-484b-9896-bc120958d500
53	Asynchronous Tasks with Django and Celery	asynchronous-tasks-with-django-and-celery	2016-07-01 13:33:23+00	2017-08-10 19:50:14+00	0	0	2	Celery is a powerful asynchronous job queue used for running tasks in the background.\r\n\r\n### Why is this useful then?\r\n\r\n-   Think of all the times you have had to run a certain task in the future. Perhaps you needed to access an API every hour. Or maybe you needed to send a batch of emails at the end of the day. Large or small, Celery makes scheduling such periodic tasks easy.\r\n\r\n-   You never want end users to have to wait unnecessarily for pages to load or actions to complete. If a long process is part of your application’s workflow, you can use Celery to execute that process in the background, as resources become available, so that your application can continue to respond to client requests. This keeps the task out of the application’s context.\r\n\r\n1 - Assuming you already have django setup, install celery with:\r\n\r\n```\r\n:::bash\r\npip install celery\r\n```\r\n\r\n2 - Create a file called `celery.py` in your projects directory, example:\r\n\r\n```\r\n:::bash\r\nproject/\r\n |--- manage.py\r\n |--- project/\r\n |    |--- __init__.py\r\n |    |--- celery.py\r\n |    |--- settings.py\r\n |    ---- urls.py\r\n ---- requirements.txt\r\n```\r\n\r\n3 - Install RabbitAMQ as a Celery “Broker” Celery uses “brokers” to pass messages between a Django Project and the Celery workers.\r\n\r\nSource: <https://realpython.com/blog/python/asynchronous-tasks-with-django-and-celery/>	b3386b60-02c2-427e-b8ce-0436f3044155
54	How to view the content of log files in real time	how-to-view-the-content-of-log-files-in-real-time	2016-07-04 13:24:54+00	2017-08-10 19:50:14+00	0	0	2	At some point you will want to see the logs being stored in the log files in real time. The best way to achieve this is by using the `tail` command. The following approach works for any linux operating system:\r\n\r\n```\r\n:::bash\r\ntail -f /path/to/file.log\r\n```\r\n\r\nThis will give you a scrolling view of the logfile. As new lines are added to the end, they will show up in your console screen.\r\n\r\nTo stop it use `Ctr+C`.\r\n\r\nFor more info regarding the `tail` command check the manual pages using the command line (`man tail`) or check the [manual page online].\r\n\r\n  [manual page online]: http://manpages.ubuntu.com/manpages/wily/man1/tail.1.html	99850962-5e80-487c-8d9f-99e4468413a1
55	How to empty the contents of a file	how-to-empty-the-contents-of-a-file	2016-07-04 13:29:49+00	2017-08-10 19:50:14+00	0	0	2	At some point you will want to flush all content from a file without actually deleting it, to do this simply run:\r\n\r\n```\r\n:::bash\r\n> filename.txt\r\n```	ed155dae-27f4-4aac-bdb0-8021cf27d4d7
56	Specify Celery not to configure logging	specify-celery-not-to-configure-logging	2016-07-07 14:56:39+00	2017-08-10 19:50:14+00	0	0	1	<p>on <code>celery.py</code> specify celery not to configure logging with:</p>\n<div class="codehilite"><pre><span class="kn">from</span> <span class="nn">celery</span> <span class="kn">import</span> <span class="n">signals</span>\n\n<span class="nd">@signals.setup_logging.connect</span>\n<span class="k">def</span> <span class="nf">setup_celery_logging</span><span class="p">(</span><span class="o">**</span><span class="n">kwargs</span><span class="p">):</span>\n    <span class="k">pass</span>\n</pre></div>\n\n\n<p>Source: <a href="https://github.com/celery/celery/issues/2509">https://github.com/celery/celery/issues/2509</a></p>	607a7c28-bc9a-4c20-ba8a-56afefc341c2
57	Docker cheat sheet	docker-cheat-sheet	2016-07-10 23:14:38+00	2017-12-15 10:50:44+00	0	0	2	Dockerfiles: plain text instructions to automatically make images.\r\n\r\nDocker containers: the active, running parts of Docker that do something.\r\n\r\nDocker images: pre-built environments and instructions that tell a container what to do.\r\n\r\n### Check if a docker container is running\r\n\r\n```\r\n:::bash\r\ndocker inspect -f {{.State.Running}} container_id\r\n```\r\n\r\n### To list all Docker containers you can use one of the following commands:\r\n\r\n```\r\n:::bash\r\ndocker ps -as\r\ndocker ps -aq\r\ndocker ps -a\r\n```\r\n\r\n### List all Docker images:\r\n\r\n\r\n```\r\n:::bash\r\ndocker images ps\r\ndocker images -a\r\n```\r\n\r\n### Remove a specific docker container\r\n```\r\n:::bash\r\ndocker rm <container_id>\r\n```\r\n\r\n### Force remove all Docker containers\r\n\r\n```\r\n:::bash\r\ndocker rm -f $(docker ps -a -q)\r\n```\r\n\r\n### Remove a specific Docker image\r\n\r\n```\r\n:::bash\r\ndocker rmi <image_id>\r\n```\r\n\r\n### Force remove all Docker images\r\n\r\n\r\n```\r\n:::bash\r\ndocker rmi -f $(docker images -q)\r\n```\r\n\r\n```\r\n:::bash\r\n# Running docker with auto remove containers\r\ndocker run --rm <image_name> <CMD>\r\n\r\n# Execute shell in Docker container\r\ndocker exec -it <container_id> /bin/bash\r\n\r\n# Execute shell in container using Docker Compose\r\ndocker-compose exec <service_name> /bin/bash\r\n\r\n# Dockerfile example\r\nFROM r-base:latest  # for python 2.7 (FROM python:2.7)\r\n# Set a default user. Available via runtime flag `--user docker`;\r\n# Add user to 'staff' group, granting them write\r\n# privileges to /usr/local/lib/R/site.library;\r\n#\r\n# User should also have & own a home directory.\r\nRUN useradd docker \\\r\n    && mkdir /home/docker \\\r\n    && chown docker:docker /home/docker \\\r\n    && addgroup docker staff\r\n\r\nRUN apt-get update && apt-get install vim -y\r\nRUN pip install matplotlib\r\nRUN pip install ipython\r\n\r\nCOPY . /src\r\nCMD ["R", "/src/read_data.R"]\r\n```\r\n\r\n### Sharing data between the host system and a docker container\r\n\r\nThe easiest way to share a data between a Docker container and the host system is to use docker’s volumes. To do this simply run your docker container using the `-v` option to mount a local host system directory e.g: `data` to the container’s directory `/home/user/data`.\r\n\r\nPlease note that if the destination does not exists it will be created by the the docker command. Furthermore, docker only accepts a full path to a local host system directory and from this reason we need to prefix the `data` directory with $PWD/ environmental variable which returns a full path to a current working directory:\r\n\r\n    # PWD=/home/user/data\r\n    docker run -v $PWD:/home/user/data -it image_name /bin/bash\r\n    root@29b320e5ebbf:/#\r\n\r\nAdditionally, docker containers run as the root user, this means that any files created or modified by the container will thus become owned by the root user, even if you are sharing a volume or even after quitting the container. To avoid this problem, it is necessary to run the container using a non-root user.\r\n\r\nTo create a user in your container simply add the following to your Dockerfile:\r\n\r\n    # Set a default user. Available via runtime flag `--user docker`;\r\n    # Add user to 'staff' group;\r\n    #\r\n    # User should also have & own a home directory.\r\n    RUN useradd docker \\\r\n        && mkdir /home/docker \\\r\n        && chown docker:docker /home/docker \\\r\n        && addgroup docker staff\r\n\r\nOnce done, to run the container a that user execute:\r\n\r\n    docker run --rm -it -v $PWD:/home/$USER/ -u docker python script_name.py	57fa928e-d4f1-45a2-af24-09ca95352dd4
95	Disable STDOUT in Nose Tests	disable-stdout-in-nose-tests	2018-06-12 12:02:47+00	2018-06-12 12:02:47+00	0	0	2	Capturing STDOUT breaks debugging tools like `pdb`, `ipdb`, etc., and can be disabled using the `--nocapture` or `-s` flag.\r\n\r\n* References:\r\n    * [Python testing with nose](https://testing-cookbook.18f.gov/python/nose/)	07f7963e-f2d1-4eae-a161-727598f64eb4
58	Celery cheat sheet	celery-cheat-sheet	2016-07-15 09:29:47+00	2017-08-10 19:50:13+00	0	0	2	### Starting the Scheduler\r\n\r\nTo start the celery beat service:\r\n\r\n```\r\n:::bash\r\ncelery -A proj beat\r\n```\r\n\r\nYou can also start embed beat inside the worker by enabling workers -B option, this is convenient if you will never run more than one worker node, but it’s not commonly used and for that reason is not recommended for production use:\r\n\r\n```\r\n:::bash\r\ncelery -A proj worker -B\r\n```\r\n\r\nBeat needs to store the last run times of the tasks in a local database file (named celerybeat-schedule by default), so it needs access to write in the current directory, or alternatively you can specify a custom location for this file:\r\n\r\n```\r\n:::bash\r\ncelery -A proj beat -s /home/celery/var/run/celerybeat-schedule\r\n```\r\n\r\n### Retrieve list of tasks in queue\r\n\r\nIf you are using rabbitMQ you can get a list of tasks in a queue with the `rabbitmqctl list_queues` command.\r\n\r\n### Deleting all pending tasks\r\n\r\nTo delete all pending tasks you can use the celery purge command to purge all configured task queues:\r\n\r\n```\r\n:::bash\r\ncelery -A proj purge\r\n```\r\n\r\nor programatically:\r\n\r\n```\r\n:::python\r\n>>> from proj.celery import app\r\n>>> app.control.purge()\r\n1753\r\n```\r\n\r\nSources:\r\n\r\n[Celery docs - Inspecting Queues]   \r\n[Celery docs - How do I purge all waiting tasks]\r\n\r\n[Celery docs - Inspecting Queues]: http://docs.celeryproject.org/en/latest/userguide/monitoring.html#inspecting-queues  \r\n[Celery docs - How do I purge all waiting tasks]: http://docs.celeryproject.org/en/latest/faq.html?highlight=purge#how-do-i-purge-all-waiting-tasks	734161fb-5069-4737-9e01-932b595768cf
59	Update requirements file with pip	update-requirements-file-with-pip	2016-07-28 13:18:52+00	2017-08-10 19:50:13+00	0	0	1	<p>To update your project requirements after installing a new package with pip, simply do:</p>\n<div class="codehilite"><pre>pip freeze &gt; requirements.txt  <span class="c"># or /path/to/requirements.txt</span>\n</pre></div>	7cd009c5-5587-4db4-9517-d95a55bf0fd0
60	Adding and removing paths from PYTHONPATH while on virtualenv	adding-and-removing-paths-from-pythonpath-while-on-virtualenv	2016-08-02 14:07:46+00	2017-08-10 19:50:13+00	0	0	2	If you want to add a path to the `PYTHONPATH` while in a virtualenv, you can add the following line to your virtualenv `bin/postactivate`\r\n\r\n```\r\n:::bash\r\nexport PYTHONPATH="/the/path/you/want"  # the.path.to.a.python.module\r\n```\r\n\r\nTo have it restored to its original value on deactivate, you could add:\r\n\r\n```\r\n:::bash\r\nexport OLD_PYTHONPATH="$PYTHONPATH"\r\n```\r\n\r\nbefore the previously mentioned line, and add the following to your `bin/postdeactivate`\r\n\r\n```\r\n:::bash\r\nexport PYTHONPATH="$OLD_PYTHONPATH"\r\n```\r\n\r\nSource: [Stackoverflow - How do you set your pythonpath in an already-created virtualenv?]\r\n\r\n  [Stackoverflow - How do you set your pythonpath in an already-created virtualenv?]: http://stackoverflow.com/a/4758351	912b3c61-cc3c-4af7-9983-eb5632e9732c
61	Scrapy, scrapyd and scrapyd-client	scrapy-scrapyd-and-scrapyd-client	2016-08-03 08:53:09+00	2017-08-10 19:50:13+00	0	0	1	<h3>Scrapy</h3>\n<p>Scrapy is an application framework for crawling websites and extracting structured data which can be used for a wide range of applications, like data mining.</p>\n<p>Even though Scrapy was originally designed for web scraping, it can also be used to extract data using API's.</p>\n<h3>Installation</h3>\n<div class="codehilite"><pre>pip install Scrapy\n</pre></div>\n\n\n<h3>Start new project</h3>\n<div class="codehilite"><pre>scrapy startproject projectname\n</pre></div>\n\n\n<h3>scrapyd</h3>\n<p>Scrapyd can manage multiple projects and each project can have multiple versions uploaded, but only the latest one will be used for launching new spiders.</p>\n<h3>How does scrapyd works?</h3>\n<p>Scrapyd is an application (typically run as a daemon) that listens to requests for spiders to run and spawns a process for each one, which basically executes:</p>\n<div class="codehilite"><pre>scrapy crawl myspidername\n</pre></div>\n\n\n<h3>scrapyd-client</h3>\n<p>Scrapyd-client is a client for scrapyd. It provides the scrapyd-deploy utility which allows you to deploy your project to a Scrapyd server.</p>\n<h3>How does scrapyd-client works</h3>\n<p>Deploying your project to a Scrapyd server typically involves two steps:</p>\n<ul>\n<li>Eggifying your project. You'll need to install setuptools for this. See Egg Caveats below.</li>\n<li>Uploading the egg to the Scrapyd server through the addversion.json endpoint.</li>\n</ul>\n<p>The scrapyd-deploy tool automates the process of building the egg and pushing it to the target Scrapyd server.</p>	ad0dd4e7-ca26-425b-9376-738124d6a2de
62	Disabling celery logging	disabling-celery-logging	2016-08-05 12:51:39+00	2017-08-10 19:50:13+00	0	0	1	<div class="codehilite"><pre><span class="kn">from</span> <span class="nn">celery</span> <span class="kn">import</span> <span class="n">Celery</span><span class="p">,</span> <span class="n">signals</span>\n<span class="kn">import</span> <span class="nn">logging</span>\n\n<span class="n">app</span> <span class="o">=</span> <span class="n">Celery</span><span class="p">()</span>\n<span class="n">app</span><span class="o">.</span><span class="n">config_from_object</span><span class="p">(</span><span class="s">&#39;lib.celery_settings&#39;</span><span class="p">)</span>\n\n<span class="c"># XXX: Here it doesn&#39;t work</span>\n<span class="c"># app.log.setup()</span>\n\n<span class="nd">@signals.setup_logging.connect</span>\n<span class="k">def</span> <span class="nf">setup_celery_logging</span><span class="p">(</span><span class="o">**</span><span class="n">kwargs</span><span class="p">):</span>\n    <span class="k">print</span> <span class="s">&quot;something&quot;</span>\n    <span class="k">pass</span>\n\n<span class="c"># Moving the call here works</span>\n<span class="n">app</span><span class="o">.</span><span class="n">log</span><span class="o">.</span><span class="n">setup</span><span class="p">()</span>\n</pre></div>\n\n\n<p>Sources: <a href="https://github.com/celery/celery/issues/2509">Configure celery to not log</a></p>	6d20d6df-e143-446e-a94a-913478dccfaa
63	What does the MySQL “max_allowed_packet” setting actually do?	what-does-the-mysql-max_allowed_packet-setting-actually-do	2016-08-11 08:15:25+00	2017-08-10 19:50:13+00	0	0	2	According to the [page 99 of “Understanding MySQL Internals” (ISBN 0-596-00957-7)], here are paragraphs 1-3 explaining it:\r\n\r\nMySQL network communication code was written under the assumption that queries are always reasonably short, and therefore can be sent to and processed by the server in one chunk, which is called a packet in MySQL terminology.\r\n\r\nThe server allocates the memory for a temporary buffer to store the packet, and it requests enough to fit it entirely. This architecture requires a precaution to avoid having the server run out of memory—a cap on the size of the packet, which this option accomplishes.\r\n\r\nThe code of interest in relation to this option is found in sql/net\\_serv.cc. Take a look at my\\_net\\_read(), then follow the call to my\\_real\\_read() and pay particular attention to net\\_realloc().\r\n\r\nThis variable also limits the length of a result of many string functons. See sql/field.cc and sql/intem\\_strfunc.cc for details.\r\n\r\nSource:\r\n\r\n- [StackOverflow - What does the MySQL "max_allowed_packet" setting actually control?]\r\n- [Understanding MySQL Internals][page 99 of “Understanding MySQL Internals” (ISBN 0-596-00957-7)]\r\n\r\n  [StackOverflow - What does the MySQL "max_allowed_packet" setting actually control?]: http://superuser.com/a/273833\r\n  [page 99 of “Understanding MySQL Internals” (ISBN 0-596-00957-7)]: http://rads.stackoverflow.com/amzn/click/0596009577	bbea651c-d3ae-4c15-baaf-b76554e97465
64	Configuring max_allowed_packet for AWS	configuring-max_allowed_packet-for-aws	2016-08-11 08:23:09+00	2017-08-10 19:50:13+00	0	0	2	You can adjust `max_allowed_packet` for modifying an existing, or create\r\na new RDS Parameter Group.\r\n\r\nIf you haven’t touched parameter groups before, you’ll likely find that\r\nyours is named default.mysql5.6 (or your version equivalent) and you\r\nwill need to create a new one to customize your own settings.\r\n\r\nYou can create a new parameter group from the:\r\n\r\n-   AWS Console ("[Working with parameter groups]" describes the\r\n    creation of parameter groups and modification of individual\r\n    settings)\r\n-   CLI (docs: [create-db-parameter-group])\r\n-   API (docs: [CreateDBParameterGroup])\r\n\r\nYou can modify settings from the:\r\n\r\n-   AWS Console (See above.)\r\n-   CLI (docs: [modify-db-parameter-group])\r\n-   API (docs: [ModifyDBParameterGroup])\r\n\r\nWhen you change from the default parameter group to a custom parameter\r\ngroup, you will need to reboot the RDS instance for the switch to take\r\neffect. After that, you will only need to reboot for individual settings\r\nif they have the “static” parameter type. max\\_allowed\\_packet is a\r\ndynamic parameter type, which means that the change will take effect\r\nimmediately once you make it.\r\n\r\nSource:\r\n\r\n  [Working with parameter groups]: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html\r\n  [create-db-parameter-group]: http://docs.aws.amazon.com/cli/latest/reference/rds/create-db-parameter-group.html\r\n  [CreateDBParameterGroup]: http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBParameterGroup.html\r\n  [modify-db-parameter-group]: http://docs.aws.amazon.com/cli/latest/reference/rds/modify-db-parameter-group.html\r\n  [ModifyDBParameterGroup]: http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ModifyDBParameterGroup.html\r\n  [StackOverflow - configuring max\\_allowed\\_packet for Confluence on\r\n  AWS](http://stackoverflow.com/a/26346048)	926f5803-d75e-4a46-86f6-161238e77ff4
65	What is a User-Agent	what-is-a-user-agent	2016-08-29 10:05:26+00	2017-08-10 19:50:13+00	0	0	2	Your web-browser will send what is known as a "User-Agent" for every page you access. This is a string to tell the server what kind of device you are accessing the page with.	c3080e96-f35c-4006-993d-8f764d2cb780
66	How to view the contents of .sqlite files	how-to-view-the-contents-of-sqlite-files	2016-10-14 08:20:58+00	2017-08-10 19:50:13+00	0	0	2	To view the contents of `.sqlite` files you can use the GUI tool\r\n`sqlitebrowser`.\r\n\r\n### Installation\r\n\r\n```\r\n:::bash\r\nsudo apt install sqlitebrowser\r\n```\r\n\r\nyou can run it from the application menu or command line using the\r\nfollowing command:\r\n\r\n```\r\n:::bash\r\nsqlitebrowser\r\n```\r\n\r\nIn the main window you can click `Open database` to open your `*.sqlite`\r\nfile. It will then display something like this (here displaying the\r\ndatabase of a Firefox add-on for applying user styles)\r\n\r\nResources:\r\n\r\n[Stackoverflow: View sqlite files](http://askubuntu.com/questions/805219/how-to-properly-view-a-sqlite-file-using-sqlite)	fb455074-ae17-4658-be70-f8bb1d57897b
67	Django ORM Bulk Update and Bulk Create	django-orm-bulk-update-and-bulk-create	2017-01-12 13:34:36+00	2017-08-10 19:50:13+00	0	0	2	It’s not unusual the need to do bulk update/create in django\r\napplications, but if you don’t use the right approach your views will\r\nincrease the load time to unacceptable values.\r\n\r\nHere is the common example where people starts out:\r\n\r\n```\r\n:::python\r\n# took 37 seconds\r\ndef auto_transaction():\r\n    for i in range(10000):\r\n        name="String number %s" %i\r\n        Record.objects.create(name=name)\r\n```\r\n\r\nBefore django 1.4 we didn’t have the built-in bulk\\_create, so the\r\ncommon way to do a bulk insertion was disabling the auto transaction in\r\nthe beginning of operation and do it only once in the end:\r\n\r\n```\r\n:::python\r\nfrom django.db import transaction\r\n\r\n# took 2.65 seconds\r\n@transaction.commit_manually\r\ndef manual_transaction():\r\n    for i in range(10000):\r\n        name="String number %s" %i\r\n        Record.objects.create(name=name)\r\n    transaction.commit()\r\n```\r\n\r\nBut since Django 1.4 and the bulk\\_create built-in, insertions got a lot\r\nfaster:\r\n\r\n```\r\n:::python\r\n# took 0.47 seconds\r\ndef builtin():\r\n    insert_list = []\r\n    for i in range(10000):\r\n        name="String number %s" %i\r\n        insert_list.append(Record(name=name))\r\n    Record.objects.bulk_create(insert_list)\r\n```\r\n\r\nA similar effect happens to update operation The next examples are also executed against 10000 records\r\n\r\nIterating over each record and manually updating the desired field:\r\n\r\n```\r\n:::python\r\n# took 72 seconds\r\ndef auto_transaction():\r\n    for record in Record.objects.all():\r\n        record.name = "String without number"\r\n        record.save()\r\n```\r\n\r\nDisabling transactions and committing only once in the end of process:\r\n\r\n```\r\n:::python\r\nfrom django.db import transaction\r\n\r\n# took 17 seconds\r\n@transaction.commit_manually\r\ndef manual_transaction():\r\n    for record in Record.objects.all():\r\n        record.name = "String without number"\r\n        record.save()\r\n    transaction.commit()\r\n```\r\n\r\nUpdate using the django built-in update()\r\n\r\n```\r\n:::python\r\n\r\n# took 0.03 seconds\r\ndef builtin():\r\n    Record.objects.all().update(name="String without number");\r\n```\r\n\r\nWARNING! Each method described here has it own particularity, and may not fit for your use case. Before you try any of them you should read the docs.\r\n\r\nReferences:\r\n\r\n[Doing bulk update and bulk create with django orm](http://voorloopnul.com/blog/doing-bulk-update-and-bulk-create-with-django-orm/)\r\n\r\n[Django Bulk Create](https://docs.djangoproject.com/en/dev/ref/models/querysets/#bulk-create)	d95c3cac-a2eb-4cec-9b07-66a20b4f2638
68	How to add class, id, placeholder attributes to a field in django model forms	how-to-add-class-id-placeholder-attributes-to-a-field-in-django-model-forms	2017-02-22 09:14:57+00	2017-08-10 19:50:13+00	0	0	2	To add classes, id’s, and placeholder attributes to a HTML field you can\r\ndo the following:\r\n\r\n```\r\n:::python\r\n#forms.py\r\nclass ProductForm(ModelForm):\r\n    class Meta:\r\n        model = Product\r\n        exclude = ('updated', 'created')\r\n\r\n    def __init__(self, *args, **kwargs):\r\n        super(ProductForm, self).__init__(*args, **kwargs)\r\n        self.fields['description'].widget = TextInput(attrs={\r\n            'id': 'myCustomId',\r\n            'class': 'myCustomClass',\r\n            'name': 'myCustomName',\r\n            'placeholder': 'myCustomPlaceholder'})\r\n```\r\n\r\nReferences:\r\n\r\n[How to add class, id, placeholder attributes to a field in django\r\n  model forms](http://stackoverflow.com/a/19489965)	a22925b0-b983-45a2-9eca-dae5719de107
69	Read-only Model Form Base Class	read-only-model-form-base-class	2017-02-22 09:30:08+00	2017-08-10 19:50:13+00	0	0	2	The simplest way of displaying a “details” table about any model, is to\r\nshow a ModelFrom with all fields readonly or (selects) disabled.\r\n\r\nAlso, the labels are preferably translatable, not just capitalized names\r\nof the column tables in your models. So the constructor translates the\r\nfield labels as well.\r\n\r\n```\r\n:::python\r\nfrom django import forms\r\n\r\nclass ReadOnlyForm(forms.ModelForm):\r\n    """Base class for making a form readonly."""\r\n    def __init__(self, *args, **kwargs):\r\n        from django.utils.translation import ugettext as _\r\n        from django.forms.widgets import Select\r\n        super(ReadOnlyForm, self).__init__(*args, **kwargs)\r\n        for f in self.fields:\r\n            self.fields[f].label = _(self.fields[f].label)\r\n            if isinstance(self.fields[f].widget, Select):\r\n                self.fields[f].widget.attrs['disabled'] = 'disabled'\r\n            else:\r\n                self.fields[f].widget.attrs['readonly'] = 'readonly'\r\n```	1eee235d-6bac-4a5e-ac21-96d79e4698d4
70	Django DateTimeField on ModelForm	django-datetimefield-on-modelform	2017-02-23 08:45:56+00	2017-08-10 19:50:13+00	0	0	2	```\r\n:::python\r\nclass TrainingForm(forms.ModelForm):\r\n    start_date = forms.DateTimeField(\r\n        widget=DateTimeInput(\r\n            format='%d/%m/%Y %H:%M',\r\n            attrs={'placeholder': 'DD/MM/YYYY HH:MM'}),\r\n        input_formats=('%d/%m/%Y %H:%M',)\r\n    )\r\n```\r\n\r\nReferences: [Django DateTimeInput]\r\n\r\n  [Django DateTimeInput]: https://docs.djangoproject.com/en/1.10/ref/forms/widgets/#datetimeinput	4650eb74-7a67-4efd-b4af-d3013cbbeacc
71	Django required read only form fields	django-required-read-only-form-fields	2017-02-24 12:19:16+00	2017-08-09 14:16:39+00	0	0	2	```\r\n:::python\r\nclass TrainingSessionForm(forms.ModelForm):\r\n    start_date = forms.DateTimeField(\r\n        widget=DateTimeInput(\r\n            format='%d/%m/%Y %H:%M',\r\n            attrs={'placeholder': 'DD/MM/YYYY HH:MM'}),\r\n        input_formats=['%d/%m/%Y %H:%M']\r\n\r\n    )\r\n\r\n    def __init__(self, data=None, company=None, *args, **kwargs):\r\n        super(TrainingSessionForm, self).__init__(data, *args, **kwargs)\r\n        instance = getattr(self, 'instance', None)\r\n\r\n        if instance and instance.id:\r\n            self.fields['start_date'].widget.attrs['readonly'] = True\r\n\r\n    def clean_start_date(self):\r\n        if self.instance.start_date:\r\n            return self.instance.start_date.strftime('%Y-%m-%d %H:%M')\r\n        else:\r\n            return self.cleaned_data['start_date']\r\n```	8b22d12e-2953-4458-955c-4c91bcf26dba
72	How to update several objects at once using Django	how-to-update-several-objects-at-once-using-django	2017-03-23 10:23:51+00	2017-08-08 20:20:09+00	0	0	2	Suppose you have a list of ids that was submitted on POST by a checkbox\r\nfield, and you would like to update a specific field in all the\r\ncorresponded objects to achieve this you can do:\r\n\r\n```\r\n:::python\r\nif request.method == 'POST':\r\n    id_list = request.POST.get('user_ids')\r\n    # convert string ids to int\r\n    id_list = list(map(int, id_list))\r\n    MyModel.objects.filter(id__in=id_list).update(myattribute=True)\r\n```	0c59f2b2-ec54-428b-a616-cfe0b8fdd548
73	Port Already In Use	port-already-in-use	2017-04-11 13:35:28+00	2017-08-14 10:11:23+00	0	0	2	If when restarting your django server locally you get the message\r\n`Error: That port is already in use.` All you have to do is kill all the\r\nprocesses associated with the port in question.\r\n\r\nTo do that simply type on your terminal:\r\n\r\n```\r\n:::bash\r\nsudo fuser -k 8000/tcp  # this command will kill all processes associated with port 8000\r\n```\r\n\r\nYou can also use the command line network utility tool `netstat` to kill the process associated with the port Django is running on.\r\n\r\n```\r\n:::bash\r\nnetstat -ntlp\r\n```\r\n\r\nIt should display something like this:\r\n\r\n```\r\n:::bash\r\n(Not all processes could be identified, non-owned process info\r\n will not be shown, you would have to be root to see it all.)\r\nActive Internet connections (only servers)\r\nProto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name         \r\ntcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      6599/python                  \r\ntcp        0      0 0.0.0.0:5432            0.0.0.0:*               LISTEN      -                   \r\ntcp        0      0 127.0.0.1:4381          0.0.0.0:*               LISTEN      31806/spotify       \r\ntcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      30491/ssh           \r\ntcp        0      0 0.0.0.0:5355            0.0.0.0:*               LISTEN      -                   \r\ntcp        0      0 127.0.0.1:9485          0.0.0.0:*               LISTEN      30493/ssh \r\n\r\n```\r\n\r\nSo now you can just close the port in which Django is running by killing the process associated with it.\r\n\r\n```\r\n:::bash\r\nkill -9 <PID> # in this case: kill -9 6599\r\n```	63b2c24d-feaf-4b5b-8961-552335861736
74	Grant User Permissions in MySQL	grant-user-permissions-in-mysql	2017-04-19 08:49:40+00	2017-08-10 19:50:13+00	0	0	2	```\r\n:::mysql\r\nGRANT ALL PRIVILEGES ON *.* TO 'newuser'@'localhost';\r\n```\r\n\r\nThe asterisks in this command refer to the database and table\r\n(respectively) that they can access—this specific command allows to the\r\nuser to read, edit, execute and perform all tasks across all the\r\ndatabases and tables.\r\n\r\nOnce you have finalized the permissions that you want to set up for your\r\nnew users, always be sure to reload all the privileges.\r\n\r\n```\r\n:::mysql\r\nFLUSH PRIVILEGES;\r\n```\r\n\r\nYour changes will now be in effect.\r\n\r\n#### Granting different user permissions\r\n\r\nHere is a short list of other available permissions:\r\n\r\n-   `ALL PRIVILEGES` - Allows a MySQL user all access to a designated\r\n    database (or if no database is selected, across the system);\r\n-   `CREATE` - Allows a MySQL user to create new tables or databases;\r\n-   `DROP` - Allows a MySQL user to delete tables or databases;\r\n-   `DELETE` - Allows a MySQL user to delete rows from tables;\r\n-   `INSERT` - Allows a MySQL user to insert rows into tables;\r\n-   `SELECT` - Allows a MySQL user to use the `SELECT` command to read\r\n    through the database;\r\n-   `UPDATE` - Allows a MySQL user to update table rows;\r\n-   `GRANT OPTION` - Allows a MySQL user to grant or remove other user’s\r\n    privileges\r\n\r\nReferences: [How to create a new user and grant permissions in mysql]\r\n\r\n  [How to create a new user and grant permissions in mysql]: https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql	d564fb92-80d2-4d8f-9f9e-c5f9d018d5fd
75	How to drop a PostgreSQL database if there are active connections to it	how-to-drop-a-postgresql-database-if-there-are-active-connections-to-it	2017-06-05 21:17:30+00	2017-08-10 19:50:13+00	0	0	2	When you are trying to drop a PostgreSQL DB e.g `target_db` and you find error as below\r\n\r\n```\r\n:::psql\r\npostgres=# DROP DATABASE target_db;\r\nERROR:  database "target_db" is being accessed by other users\r\nDETAIL:  There is 1 other session using the database.\r\npostgres=#\r\n```\r\n\r\nIf you get above error then there 1 active connection opened to target_db, so it cannot delete the selected database until the active connection is closed. So to delete the selected database first we need to close all existing connections to the selected database. This can be done with query as below\r\n\r\nPostgreSQL 9.2 and above:\r\n\r\n```\r\n:::psql\r\nSELECT pg_terminate_backend(pg_stat_activity.pid)\r\nFROM pg_stat_activity\r\nWHERE pg_stat_activity.datname = 'target_db'\r\nAND pid <> pg_backend_pid();\r\n```\r\n\r\nOnce above query is executed. We can drop the target db with out any error by executing below query\r\n\r\n```\r\n:::psql\r\nDROP DATABASE target_db\r\n```	2a36b621-ef28-4311-a8e8-54b12ee6acfc
76	How to start PostgreSQL	how-to-start-postgresql	2017-07-08 18:35:56+00	2017-12-12 09:23:08+00	0	0	2	```\r\n:::bash\r\n# Start PostgreSQL (Ubuntu)\r\nsudo -u postgres psql\r\n\r\n# Start PostgreSQL (Server)\r\npsql -h <host_id> -p <port_number> -U <username> <database_name>\r\n```	80e41a6f-bd97-43cf-859b-d5c1f6396b95
77	How to download a file/folder from openshift to your local machine	how-to-download-a-filefolder-from-openshift-to-your-local-machine	2017-07-08 18:41:43+00	2017-07-08 22:17:42+00	0	0	2	First, `tar` and `gzip` your folder on the server within a ssh session, the syntax is:\r\n\r\n```\r\n:::bash\r\nrhc ssh <app_name>\r\ntar czf <name_of_new_file>.tar.gz <name_of_directory>\r\n```\r\n\r\nSecond, after you have disconnected from the openshift server (with `CTRL-D`), download this file to your local system:\r\n\r\n```\r\n:::bash\r\nrhc scp <app_name> download <local_destination> <absolute_path_to_remote_file>\r\n```\r\n\r\nThen on your local machine you can extract the file and perform your actions.	5d9864ed-1972-4817-8bfd-41d38fa9fb1e
78	How to verify you have Java installed	how-to-verify-you-have-java-installed	2017-07-09 17:18:03+00	2017-07-09 17:18:03+00	0	0	2	To verify that you have Java installed simply open your terminal and type:\r\n\r\n```\r\n:::bash\r\njava -version\r\n```\r\n\r\nShould output something like:\r\n\r\n```\r\n:::bash\r\njava version "1.8.0_72"\r\nJava(TM) SE Runtime Environment (build 1.8.0_72-b15)\r\nJava HotSpot(TM) 64-Bit Server VM (build 25.72-b15, mixed mode)\r\n```\r\n\r\nThe output will tell you if you have Java installed as well as which Java version you have.	5810fc99-6420-4c3c-82c6-da09a6c42b19
79	Git cheat sheet	git-cheat-sheet	2017-07-21 08:03:42+00	2017-09-28 14:36:00+00	0	0	2	### Stashing only one of multiple changed files changed:\r\n\r\n`git stash -p`\r\n\r\nThis command allows you to select which hunks should be added to stash, whole files can be selected as well.\r\n\r\nYou'll be prompted with a few actions for each hunk:\r\n\r\n```\r\n:::bash\r\ny - stash this hunk\r\nn - do not stash this hunk\r\nq - quit; do not stash this hunk or any of the remaining ones\r\na - stash this hunk and all later hunks in the file\r\nd - do not stash this hunk or any of the later hunks in the file\r\ng - select a hunk to go to\r\n/ - search for a hunk matching the given regex\r\nj - leave this hunk undecided, see next undecided hunk\r\nJ - leave this hunk undecided, see next hunk\r\nk - leave this hunk undecided, see previous undecided hunk\r\nK - leave this hunk undecided, see previous hunk\r\ns - split the current hunk into smaller hunks\r\ne - manually edit the current hunk\r\n? - print help\r\n```\r\n\r\n### Renaming current branch\r\n\r\n```\r\n:::bash\r\ngit branch -m new_branch_name\r\n# you can also re-name a different branch from the one you are currently in with\r\n# git branch -m old_branch_name new_branch_name\r\n```\r\n\r\nOnce done, delete the old branch on remote with:\r\n\r\n```\r\n:::bash\r\ngit push origin :old_branch_name\r\n```\r\n\r\nNow push the new branch to the remote with:\r\n\r\n```\r\n:::bash\r\ngit push origin new_branch_name:refs/heads/new_branch_name\r\n```\r\n\r\n### Check the difference between the current branch and the master branch\r\n\r\n```\r\n:::bash\r\ngit diff master branch_name`\r\n```	a725b926-3b62-4758-88fa-66319e22558b
80	Vertical display output in PostgreSQL	vertical-display-output-in-postgresql	2017-07-21 09:57:21+00	2017-07-21 09:57:21+00	0	0	2	`select * from manyColumns;`\r\n\r\n`\\x`	31de3398-4b6c-468c-9789-f00862bb9f9c
82	Django Autocomplete for Foreign Keys In the Django Admin	django-autocomplete-for-foreign-keys-in-the-django-admin	2017-08-14 08:49:22+00	2017-08-14 09:53:34+00	0	0	2	If you have an application which is represented in the django admin with a select drop-down for foreign keys, you probably noticed by now that as the drop-down gets bigger it will become a usability issue.\r\n\r\nOne solution is to use the `django-extensions` class `ForeignKeyAutocompleteAdmin` which will convert the select drop-down with foreign keys into an autocomplete text input.\r\n\r\nTo use the `ForeignKeyAutoCompleteAdmin` first install `django-extensions`:\r\n\r\n```\r\n:::bash\r\npip install django-extensions\r\n```\r\n\r\nThen in your application `admin.py` module add the following code:\r\n\r\n```\r\n:::python\r\nfrom django.contrib import admin\r\nfrom foo.models import Permission\r\nfrom django_extensions.admin import ForeignKeyAutocompleteAdmin\r\n\r\n\r\nclass PermissionAdmin(ForeignKeyAutocompleteAdmin):\r\n    # User is your FK attribute in your model\r\n    # first_name and email are attributes to search for in the FK model\r\n    related_search_fields = {\r\n       'user': ('first_name', 'email'),\r\n    }\r\n\r\n    fields = ('user', 'avatar', 'is_active')\r\n\r\n    ...\r\n\r\nadmin.site.register(Permission, PermissionAdmin)\r\n```\r\n\r\nResources:\r\n\r\n[Django-extensions - Current Admin Extensions](http://django-extensions.readthedocs.io/en/latest/admin_extensions.html)	3203dbb3-84ee-4658-ba59-de2732e90d09
83	Heroku how to run Django commands locally	heroku-how-to-run-django-commands-locally	2017-09-24 16:03:12+00	2018-01-01 14:10:10+00	0	0	2	Heroku Local lets you easily run Django commands locally, for example:\r\n\r\n```\r\n:::bash\r\nheroku local:run python manage.py <command>\r\n```\r\n\r\nReferences:\r\n\r\n[Heroku local:run](https://devcenter.heroku.com/articles/heroku-local#run-your-app-locally-using-the-heroku-local-command-line-tool-run-a-one-off-command-locally target="_blank")	0149bfc2-4fd2-475a-bd63-a8f9dd41b758
84	Reset cache between tests	reset-cache-between-tests	2017-11-20 16:43:16+00	2017-11-29 22:04:11+00	0	0	3	I don't understand why the cache is accumulated between the tests. I thought one of the axioms of unit testing is that the tests should not affect each other.\r\n\r\nCouldn't find anything that explains why it's done this way but it seems a bit strange. Anybody know if there's a reason or is this a reason for me to upload a patch to Django code?\r\n\r\n```\r\n:::python \r\nfrom django.test import TestCase\r\nfrom django.core.cache import cache\r\nfrom django.conf import settings\r\n\r\nclass MyTests(TestCase):\r\n    def tearDown(self):\r\n        [cache.delete(key) for key in cache._cache.keys()]  # cache.clear() for newer versions of Django\r\n```\r\n\r\nReferences:\r\n\r\n[Reset cache between tests](https://djangosnippets.org/snippets/1789/)	5add66ae-93e1-4670-893d-d1994012c1ad
85	Backup and restore postgres database into a custom format	backup-and-restore-postgres-database-into-a-custom-format	2017-12-12 14:01:57+00	2018-01-03 09:26:58+00	0	0	2	In order to backup your postgres database into a custom format (`.dump`) you can simply execute:\r\n\r\n```\r\n:::bash\r\npg_dump --format=c -U <username> <database_name> > <backup_file>.dump\r\n```\r\n\r\nAnd to restore the backup:\r\n\r\n```\r\n:::bash\r\npg_restore -v -U <username> -d <databse_name> <backup_file>.dump\r\n```\r\n\r\nResources:\r\n\r\n* [Postgres pg_dump](http://www.postgresql.org/docs/current/interactive/app-pgdump.html)\r\n* [Postgres pg_restore](http://www.postgresql.org/docs/9.2/static/app-pgrestore.html)	9e3b7ebf-74c2-4126-a908-375b846c8e2e
86	How to query your postgres database from within a docker container	how-to-query-your-postgres-database-from-within-a-docker-container	2018-01-02 14:08:57+00	2018-01-02 14:43:01+00	0	0	2	If you have a docker container with postgres installed, you might have wondered how would you query your postgres database from within the container.\r\n\r\nTo do this you can simply execute the container shell in an interactive mode by executing the following command.\r\n\r\n```\r\n:::bash\r\ndocker exec -it <container_name> /bin/bash\r\n```\r\n\r\nOnce you inside the container you can execute postgres.\r\n\r\n```\r\n:::bash\r\npsql -U <username>  # default is `postgres`\r\n```	832dc8a8-e99a-417a-aa4c-c2b1cc67c2b4
87	How to copy files from your host machine into your docker container	how-to-copy-files-from-your-host-machine-into-your-docker-container	2018-01-02 14:17:39+00	2018-01-02 14:21:44+00	0	0	2	To copy a file from your host machine to your docker container\r\n\r\nThe docker cp utility copies the contents of SRC_PATH to the DEST_PATH. You can copy from the container’s file system to the local machine or the reverse, from the local filesystem to the container. If - is specified for either the SRC_PATH or DEST_PATH, you can also stream a tar archive from STDIN or to STDOUT. The CONTAINER can be a running or stopped container. The SRC_PATH or DEST_PATH can be a file or directory.\r\n\r\nFrom your host machine into your container\r\n```\r\n:::bash\r\ndocker cp /path/file.txt <container_name>:/file.txt\r\n```\r\n\r\nFrom your container to your host machine\r\n```\r\n:::bash\r\ndocker cp <container_name>:/file.txt /path/file.txt\r\n```	201a3bba-fd14-40e7-97fd-7294c982dfc5
88	Docker container logs	docker-container-logs	2018-01-03 11:28:45+00	2018-01-03 11:28:45+00	0	0	2	To fetch the logs of a container simply execute:\r\n\r\n```\r\n:::bash\r\ndocker container logs <container_name>\r\n```\r\n\r\nReferences:\r\n\r\n* [Docker Container Logs](https://docs.docker.com/engine/reference/commandline/container_logs/)	5c1ed0d5-6eed-4088-9dab-3f368f196e36
89	How to undo a git commit	how-to-undo-a-git-commit	2018-01-10 09:46:44+00	2018-01-10 09:46:44+00	0	0	2	If you want to undo a git commit on your local branch you can simply execute:\r\n\r\n```\r\n:::bash\r\ngit reset --hard HEAD~1\r\n```\r\n\r\nOnce done you can just push your changes to your remote branch with:\r\n\r\n```\r\n:::bash\r\ngit push origin <branch_name>\r\n```\r\n\r\nHowever if you need to undo the commits you made to your remote branch, you can simply execute on your local branch:\r\n\r\n```\r\n:::bash\r\ngit reset --hard HEAD~2\r\n```\r\n\r\nThen in order to update your remote branch you need to `force` push your changes with:\r\n\r\n```\r\n:::bash\r\ngit push origin <branch_name> -f\r\n```	f6e9830b-6db1-4eb2-b7c3-e1830276090f
90	Format output of docker ps	format-output-of-docker-ps	2018-01-15 13:32:27+00	2018-01-15 13:32:27+00	0	0	2	In order to format which columns are displayed when executing `docker ps` you can simply use the `--format` parameter, e.g:\r\n\r\n```\r\n:::bash\r\ndocker ps --format="table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}"\r\n```\r\n\r\nAnother alternative is to place the command above into an alias in your `.bashrc`, e.g:\r\n\r\n```\r\n:::bash\r\nalias dps='docker ps --format="table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}"'\r\n```	06b9a4e0-fb21-4443-af16-65f58354498b
91	Python OOP 3 Main principles	python-oop-3-main-principles	2018-01-15 16:14:04+00	2018-03-14 16:52:53+00	0	0	2	## Encapsulation\r\n\r\nThe facility by which we can store data into an object and provide for data integrity by using `getter` and `setter` methods.\r\n\r\n## Inheritance\r\n\r\nThe ability to have one class inherit the attributes of another class.\r\n\r\n## Polymorphism\r\n\r\nPolymorphism means many shapes, this refers to a design in which objects of the similar types can be treated in the same matter. More spcifically refers to two classes that have methods of the same name.	394288ef-4926-4483-ae88-938974923ca2
92	3 Different ways to update sqlalchemy objects	3-different-ways-to-update-sqlalchemy-objects	2018-02-12 14:40:59+00	2018-02-12 14:40:59+00	0	0	2	### Update an object\r\n\r\n```\r\n:::python\r\n# 1 \r\nsession.query(User).filter_by(email='admin@mail.com').update(dict(email='superadmin@mail.com'))\r\nsession.commit()\r\n\r\n# 2\r\nconn = engine.connect()\r\nstmt = User.update().values(no_of_logins=(User.no_of_logins + 1)).where(User.username == form.username.data)\r\nconn.execute(stmt)\r\n\r\n# 3\r\nsetattr(user, 'no_of_logins', user.no_of_logins+1)\r\nsession.commit()\r\n```	b3a07666-07ad-49e0-a9c8-56e03674ede9
\.


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.blog_posts_id_seq', 95, true);


--
-- Data for Name: blog_posttags; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.blog_posttags (id, post_id, tag_id, uuid) FROM stdin;
1	1	1	54f42b6f-00a8-4dea-8854-7d48c7c92edb
2	2	4	0c4d617e-6e7c-43cf-be7a-a2961f94c038
3	3	2	ea8ab92e-3e61-463d-90b8-70a9bdb69e20
4	4	3	c6eaf52e-fa3b-4106-a0e2-9a2215cad0bc
5	5	5	0a235bfc-c8d4-4759-aa66-ad7c14c01c9b
6	6	6	4c61f75d-3b4b-455f-9cb3-37c9d309fe4b
7	4	6	186b71b8-9216-4ec3-887d-beb58fe870dd
8	7	3	08b0d2cf-1a24-461f-a708-6845ead9f8e4
9	8	3	7ff8352e-3c23-48c7-8d0a-c48d1e6e982b
10	9	3	2941b076-f60f-4b00-87ed-88b8c5ea3977
11	10	3	e3597a87-9f7d-4b68-a5fd-023ee3d9a920
12	11	3	a2fdc5b8-1fce-4d58-ab9f-a40098f7701f
13	12	3	8ef3cfdf-71c1-47b0-b5d6-6c1650d46bf0
14	13	3	6cdd8832-90e7-406a-9a38-a573bf93cdc5
16	15	4	7eca0761-baa6-437e-aa7c-cec243253ba9
17	15	6	8045859f-f3c6-4358-9ded-211c6e4c4b37
19	17	5	f7306aa9-4975-4c22-9586-e11713ff57f8
20	18	6	b5cc563c-095d-49c2-aaa1-e15c9907fd51
22	20	2	d5293384-4aee-4974-80b2-98180d775518
23	21	4	11f24e43-0640-4d90-b7cb-ee6852bfd4ba
24	22	4	1403796c-cd19-48c9-a930-6088b0dbb5df
25	22	2	8b6b2bd5-d4f0-4e47-afbf-38a6f61fe02d
26	23	7	ce203e07-58a3-4c5e-b10c-7141f64634c3
27	23	5	c3c174d1-ce33-4384-b54d-b62f6e230d18
28	24	5	dca83659-3e20-4f67-86b7-d7f86ab17d4c
29	26	3	40e97a4b-fc1c-4abf-a67b-f8b34c2def50
30	26	8	84fe1aaf-1d62-4c37-8296-3a58232acb44
31	27	2	9b592e2b-1c6a-426a-9114-9fdb08fd84d1
32	28	9	36e505fa-94c1-4999-aa45-d0e9ab5b628b
33	28	6	606cc6fe-b10f-41fb-82ed-06be9400662e
34	28	10	c82cf8c0-519f-43fa-9cac-05c52db34cac
35	29	6	dff27237-b23b-49bc-b86a-f26da8fcea2e
36	29	11	424456ce-c8ef-4a5d-9f10-a20d3fffb5e7
37	30	2	352bea25-3e77-4c9b-acfa-a251bbe6b26b
38	31	12	578158ef-823a-4d15-8d13-ff356bdcec21
39	31	13	e05355e3-690f-43ac-9211-7c39d99f9679
40	31	3	4834a6ac-705c-4884-b484-9dc8f71cae3d
42	32	14	1bcc758a-f263-40ea-80c8-bf6eae907475
43	33	5	9e6c28ca-6135-453f-ae00-475a82f43822
44	33	13	f56b137a-d5cb-49f6-8f4d-4693da785a80
45	34	6	47925c86-22c3-46b2-9f0c-10ce9932b8bb
46	34	8	ad94b4df-28a7-4a5a-b456-78b5c14109c9
47	35	8	2300f71d-5cdc-4eff-988a-129251ffe07e
48	35	13	928f9574-46b8-4e61-b8ad-afcaeb9b1050
49	35	15	3ae76e43-51ca-4f38-a882-bbfde05b74ce
50	35	6	bf397f57-aead-4550-af34-dce92c9c7d02
51	36	7	b8990012-5486-4f57-ba3f-a72afbe8342f
52	36	5	dbe36c89-ac96-40a4-a43c-cccb281022d5
53	36	13	2c8bbbf9-88ed-4005-a25f-dd620253fbc1
54	37	2	debe11a7-03c9-45ec-ab4b-f89dca553dfd
56	39	3	9f2e4fe3-9028-408d-a6f5-cef9f8e52252
57	40	5	11267169-25a9-487a-b434-c575070312e9
58	41	14	54115125-77f4-446f-bdb2-92329f52f175
59	41	16	167cb3d5-48b4-4a38-b3fd-a53bcb9f420c
60	42	1	dee31bb9-b264-44f6-9387-c09cac3e0be5
61	42	5	004d12a8-aea9-4ecf-85c4-8c5023a9d338
62	42	17	367f2647-a094-4f09-99f2-7dfece149956
63	42	18	342e57bf-b86f-4e1b-8a3f-b9a7fe290fb7
71	32	16	23e4180b-1793-450a-90b2-6fcd1d36061e
102	56	19	59390691-d02d-4868-bdef-a69c187498c4
131	59	8	9ae2dcef-fb24-4440-bbec-067fa69152a7
145	61	28	c8aefa82-476a-4c5f-9969-5e3812ece94e
146	61	29	df21d0c9-c0f5-4522-b0b3-5c36a400c997
147	61	30	40c83af6-5aab-43e0-ac8a-39ac8e7ce8da
148	19	5	17281f59-1bc2-43f4-8f23-cc1cfe8b65dd
150	62	19	7cd5fad9-40a7-4fc3-9c68-490732c29f36
221	74	3	cb2e0491-ae57-4196-b74b-c1c2887f268a
224	72	17	2ff0daef-bfb8-4104-bbc8-34d3f970c0ed
225	72	5	5605b967-fafe-44c9-a545-071ceb1d2ef3
230	71	17	a6316a57-9858-4b67-9fb5-555a956bf24e
231	71	5	1595de9b-6b19-42ef-bc9a-6633eaf823c0
232	70	17	2bca9d1c-26e0-48d1-9f31-065ab7b0154e
233	70	5	3ed9078e-c3af-48f2-ba75-e4aaeacba3bb
236	69	17	3b2c95ba-8027-4728-8aaf-b348eb863676
237	69	5	735db549-2ae0-4809-a16f-f0160336e6cf
244	68	17	9e820098-48d3-45dc-a91e-1fcdb180d5c5
245	68	5	1fe6240e-d8dd-473e-a910-0cf1dff12c12
246	67	17	13434840-d096-4be0-8556-2dae0c984c68
247	67	5	1cf1d492-5e3e-4994-8938-840594ceafb3
248	66	33	bc25164a-a996-4788-bc8d-b348086a37ac
249	66	6	5c539401-6ede-4b0c-a760-db634fa05e8a
250	65	32	df158351-0a89-4689-a1c3-7e86cda89b7d
253	64	31	c72ab153-c185-4e6f-b7e9-65ee2797a3ff
296	63	31	39a279fb-dd0e-4017-abed-e861191d7a5f
297	63	3	83e45b61-7aa1-4a97-9579-c713d806b3e0
301	60	5	eee96d3a-63f0-4bcf-8cf6-222ad80daf66
302	60	6	eaeb0aa7-8876-4534-8235-c7d8c99ea5f7
303	60	14	c02522f3-50e4-43e7-921d-d23f91d5e228
310	58	19	c175ecf8-a03b-4a95-950e-f4a5c42ff899
314	55	8	60ea2881-c8ff-4df7-8fde-f561fd60dff6
315	55	6	51a63175-08c8-4270-b872-e8fee86c507d
316	54	8	2f8da4b4-cdff-4ebe-81db-406cad52a90c
317	54	6	4ffb03e1-b1fe-4dec-a7dd-dd518581821f
318	53	19	b7675ab6-3007-4735-b844-8cb537a3421e
319	53	17	13656c7d-6012-458e-8037-7b57dd0916cd
320	52	17	7713af1b-cb55-4639-bfa2-88123ba77adb
321	52	5	53d50b58-630d-4aed-86bb-fbeca6a3c868
322	51	2	0ad5da0c-047d-4ef8-a01b-ad3f5bef8086
329	50	8	9cecd7af-ef52-4e78-86ba-50e704962093
330	50	6	7c6d1563-29a8-4e63-ac1e-6a21209176a7
331	49	13	e5b7bce9-6751-4a52-bb10-aecd59f06164
332	49	22	01343397-3fbe-40bc-91cc-57adfcc69641
333	49	23	5bd925ab-6e7b-4502-a3b4-b5b5c4714d77
334	49	15	e0227164-ee57-470a-a9d3-ee97f37ce36c
336	48	21	044fabc5-0e8c-45d2-adf6-2fc653040fa3
339	47	18	3ebeb7a0-a0f0-4178-86df-f0cbe4ff6d99
340	46	6	b3e79ae4-ac4d-44c2-a1f4-0e8713576e30
341	45	19	62f43e29-f373-47b0-b1e4-f0ffd6f84a1b
342	45	13	9708d313-e1c8-4a43-b381-803f221c0478
343	45	20	f246d88f-d9a2-4839-bd38-24fd1eb43a7d
344	44	12	ab6570d8-469a-4f47-8d30-24861a9ec7e3
347	75	1	a7fdb92d-04ca-4675-9744-2c7c61421ebc
366	77	36	9b203ee8-70a9-4920-9edc-a48163bb2716
367	78	37	ac377b06-5493-4690-bb98-04614269ca80
371	80	1	e553db40-f6e5-4ea5-b5a3-47933601d45f
388	82	17	18a2637c-fd2c-4b4c-a4de-a1a84316af88
393	73	17	fb1873db-a58e-42e1-8c6d-aaf45b63f386
394	73	6	316f59e6-5bcb-467f-bdeb-630ea9ea4f2c
405	79	2	f8af815a-0c17-4021-94cf-e9482a0ab8ab
412	84	17	d8a08abe-8b92-4152-8837-d7169c9c829f
415	76	1	1dcbe3d8-5cbc-430f-81ce-38ce32d43352
422	43	1	802dc3f5-6c4f-4960-a03b-11b805973d3e
423	43	6	ce09674e-9e08-431c-829a-c93205f4f5d1
429	57	27	6fe549ee-95d8-4ab8-9ceb-04ddda05270b
430	83	17	d1e6ad73-bcf3-430a-97bf-a88e2792084c
431	83	38	014c276e-6fa8-441e-a966-2409c47bf354
436	87	27	7539f9bd-a5f3-4e55-97d5-0f8f9ae267b4
438	86	27	6631456e-cfa6-44e7-87e8-b048744825bd
441	85	1	0c515b09-73b7-4fa5-a93d-768ad96ea1e0
442	88	27	9c4cc54f-dff7-4b95-adf2-dc03b1ff4442
443	89	2	a8836fa0-2528-428f-beb5-a26bd9acdf59
444	90	27	3605d98c-ccff-4483-b1f9-6fd1e1d3deab
446	38	2	5b2e7a75-081d-4cc9-b46f-d44d067db5ba
447	92	13	aabfa239-8c6f-4ae3-94d2-8767c7f96ff7
448	92	5	a3608cc6-7c5a-42f4-bc5b-7103f102dcb4
449	92	7	314d50a7-7294-47e7-8a8e-739b8b138df7
450	91	5	faa02b97-a0fc-4a90-a315-de773868ebc5
483	93	3	90ce7911-0de8-4b74-b360-1dca577a1632
484	93	1	fb9618b1-b90a-4320-b209-9dbeb723c41f
485	93	7	4f0d2b99-cb2b-4e15-983c-015964e6d81d
486	93	33	28042195-c8b5-4217-b9ca-5119be5775a1
487	94	2	7e0912d6-d40c-49e9-b4a5-2700955a7c23
488	95	20	1a53498e-1d56-41c8-83de-f97500705648
489	95	5	d649e26c-be20-44b7-b78b-14a00cb32f98
\.


--
-- Name: blog_posttags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.blog_posttags_id_seq', 489, true);


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.blog_tag (id, name, slug, uuid) FROM stdin;
1	Postgres	postgres	31120950-a0d7-437d-aabe-33656cf82e77
2	Git	git	2babcad5-8b81-4b7d-a74e-bb153579beb6
3	MySQL	mysql	4f212340-c2b9-4780-93b7-a3cad9ddee3f
4	Jenkins CI	jenkins-ci	e0b3ecf9-a884-4d0f-883d-4aaacc491337
5	Python	python	62429e8a-531a-45b6-9912-cf75a5e50c36
6	Ubuntu	ubuntu	4f92d352-dc39-4763-a01a-958e55ed672a
7	SQLAlchemy	sqlalchemy	81845c69-f10e-443e-b237-19232e93714b
8	Bash Scripting	bash-scripting	c09e10e9-2c95-40ce-a831-152ccab5ee0c
9	Ruby	ruby	ab557365-e5fe-4d4d-b58b-36833ddbd3f8
10	RVM	rvm	731e4f55-5708-4a63-a36b-73efdea653d0
11	OpenJDK	openjdk	997e6544-2a97-408a-8e30-f51b9f590c3d
12	Alembic	alembic	c3e5caf2-eef8-4a8b-8dc5-662759e1fba4
13	Flask	flask	14474d04-76df-4f48-8af9-895f5d29696d
14	Virtualenvwrapper	virtualenvwrapper	f6636bd9-6b4b-4104-a50a-66a84e2f2f9e
15	Supervisor	supervisor	606a47ff-251e-4da8-a58e-f9d1fb73c352
16	Pip	pip	7622135e-131a-45b2-baef-5edee98f1d7d
17	Django	django	967952c7-7652-403a-8ce0-a1a7d3db468f
18	South	south	89d9d2d0-beef-4542-b8fd-3b3caef33676
19	Celery	celery	3b4cef69-5eed-4dcc-8946-1d2ce0218f49
20	PDB	pdb	a2497094-c480-4c09-a209-e0176e5f8987
21	Fabric	fabric	3d8c3371-fb87-4693-a4e8-59941851cb1a
22	Gunicorn	gunicorn	0c97a849-9044-4b1e-8b9a-d1ea88526e66
23	NGINX	nginx	c299f101-b72d-459c-8be8-ab36d5cf9cb3
24	Keyphrase	keyphrase	b0536e9d-8a0d-4b59-88ee-7a1ccd588bc2
25	Keyphrase Set	keyphrase-set	56b68969-b9cb-4010-809b-d90700233afc
26	Pedro Test Report	pedro-test-report	3a11ed42-072c-4669-a8c5-e8294fbfa8b8
27	Docker	docker	63a39225-8a8a-48a7-aa4f-09d3a7cb9a16
28	Scrapy	scrapy	f61396d9-514d-443f-9a98-420dad3cf840
29	scrapyd	scrapyd	c99681a4-f347-41e4-86ee-88d85d869d21
30	scrapyd-client	scrapyd-client	8c111528-c44e-4153-9506-b8b94f44e305
31	AWS	aws	8147b2fe-a730-4f3d-b7d8-ccfe2a07cb37
32	Web-Browsers	web-browsers	e17727e5-b1c4-4a08-b064-c38f258f7bf3
33	SQLite	sqlite	1ea616a9-feeb-4f04-964d-77916bf7c805
34	Programmer	programmer	9a1de18a-e34f-4543-9d91-b619ef8417df
35	JavaScript	javascript	867a2729-585a-4707-ac05-dc15dd254778
36	Openshift	openshift	a012a677-579f-4846-98f6-30d5b87af45b
37	Java	java	11ba2ee4-899e-417e-8f95-120d5f7f9ba0
38	Heroku	heroku	d4067616-e01b-4aed-8b18-0da886423038
39	TDD	tdd	7df7f7aa-111b-4755-847a-992a9cfba31a
\.


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.blog_tag_id_seq', 39, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blog	tag
8	blog	posts
9	blog	posttags
10	notifications	notifications
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-24 00:25:20.985958+00
2	auth	0001_initial	2018-06-24 00:25:21.220477+00
3	admin	0001_initial	2018-06-24 00:25:21.278747+00
4	admin	0002_logentry_remove_auto_add	2018-06-24 00:25:21.294035+00
5	contenttypes	0002_remove_content_type_name	2018-06-24 00:25:21.327981+00
6	auth	0002_alter_permission_name_max_length	2018-06-24 00:25:21.342685+00
7	auth	0003_alter_user_email_max_length	2018-06-24 00:25:21.357427+00
8	auth	0004_alter_user_username_opts	2018-06-24 00:25:21.379234+00
9	auth	0005_alter_user_last_login_null	2018-06-24 00:25:21.401073+00
10	auth	0006_require_contenttypes_0002	2018-06-24 00:25:21.405085+00
11	auth	0007_alter_validators_add_error_messages	2018-06-24 00:25:21.416806+00
12	blog	0001_initial	2018-06-24 00:25:21.560489+00
13	blog	0002_auto_20151220_2103	2018-06-24 00:25:21.802215+00
14	blog	0003_posts_status	2018-06-24 00:25:21.849658+00
15	blog	0004_auto_20170418_1756	2018-06-24 00:25:21.861597+00
16	blog	0005_auto_20170504_0638	2018-06-24 00:25:21.89541+00
17	blog	0006_auto_20170702_2038	2018-06-24 00:25:21.913961+00
18	blog	0007_auto_20170810_2010	2018-06-24 00:25:21.928105+00
19	blog	0008_auto_20180615_2353	2018-06-24 00:25:21.935664+00
20	blog	0009_auto_20180620_1523	2018-06-24 00:25:22.092569+00
21	notifications	0001_initial	2018-06-24 00:25:22.156439+00
22	notifications	0002_auto_20170523_2119	2018-06-24 00:25:22.226124+00
23	notifications	0003_notifications_image	2018-06-24 00:25:22.235003+00
24	notifications	0004_auto_20180615_2353	2018-06-24 00:25:22.242153+00
25	sessions	0001_initial	2018-06-24 00:25:22.287981+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n1rf35qxq3r610gnq9tb5vkx0gdtzbnf	NTBlYmI5Zjg0Nzc3MDAzMmY4NWZjYzI0MmY5ZWI1NmYxOTA2YzFkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDQ5ODAxZjBkMWVkN2RjOWJmNTU3NjYyZjg5ZTMyNzIxNGFhYTMxIn0=	2018-07-08 00:27:30.216488+00
9k32qhxgk8ajn7ogb2npcuiap5pdykkd	NTBlYmI5Zjg0Nzc3MDAzMmY4NWZjYzI0MmY5ZWI1NmYxOTA2YzFkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDQ5ODAxZjBkMWVkN2RjOWJmNTU3NjYyZjg5ZTMyNzIxNGFhYTMxIn0=	2018-07-10 00:05:52.138675+00
vxwqt3w3hs6f4h961sii31ykn8khkm1s	NTBlYmI5Zjg0Nzc3MDAzMmY4NWZjYzI0MmY5ZWI1NmYxOTA2YzFkMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDQ5ODAxZjBkMWVkN2RjOWJmNTU3NjYyZjg5ZTMyNzIxNGFhYTMxIn0=	2018-07-19 22:21:19.037662+00
\.


--
-- Data for Name: notifications_notifications; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.notifications_notifications (id, title, message, deadline, last_updated, image) FROM stdin;
\.


--
-- Name: notifications_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.notifications_notifications_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_slug_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_slug_key UNIQUE (slug);


--
-- Name: blog_posts blog_posts_title_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_title_key UNIQUE (title);


--
-- Name: blog_posttags blog_posttags_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posttags
    ADD CONSTRAINT blog_posttags_pkey PRIMARY KEY (id);


--
-- Name: blog_tag blog_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_name_key UNIQUE (name);


--
-- Name: blog_tag blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: blog_tag blog_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notifications_notifications notifications_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications_notifications
    ADD CONSTRAINT notifications_notifications_pkey PRIMARY KEY (id);


--
-- Name: notifications_notifications notifications_notifications_title_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.notifications_notifications
    ADD CONSTRAINT notifications_notifications_title_key UNIQUE (title);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_posts_slug_93227477_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_posts_slug_93227477_like ON public.blog_posts USING btree (slug varchar_pattern_ops);


--
-- Name: blog_posts_title_407ee447_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_posts_title_407ee447_like ON public.blog_posts USING btree (title varchar_pattern_ops);


--
-- Name: blog_posttags_76f094bc; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_posttags_76f094bc ON public.blog_posttags USING btree (tag_id);


--
-- Name: blog_posttags_f3aa1999; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_posttags_f3aa1999 ON public.blog_posttags USING btree (post_id);


--
-- Name: blog_tag_name_c5718cc8_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_tag_name_c5718cc8_like ON public.blog_tag USING btree (name varchar_pattern_ops);


--
-- Name: blog_tag_slug_01068d0e_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX blog_tag_slug_01068d0e_like ON public.blog_tag USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notifications_notifications_title_94e8565c_like; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX notifications_notifications_title_94e8565c_like ON public.notifications_notifications USING btree (title varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_posttags blog_posttags_post_id_b8e6a637_fk_blog_posts_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posttags
    ADD CONSTRAINT blog_posttags_post_id_b8e6a637_fk_blog_posts_id FOREIGN KEY (post_id) REFERENCES public.blog_posts(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_posttags blog_posttags_tag_id_f5b51a9d_fk_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blog_posttags
    ADD CONSTRAINT blog_posttags_tag_id_f5b51a9d_fk_blog_tag_id FOREIGN KEY (tag_id) REFERENCES public.blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

