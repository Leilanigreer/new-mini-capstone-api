--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-09-10 02:35:44.579535	2024-09-10 02:35:44.579537
\.


--
-- Data for Name: carted_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carted_products (id, user_id, product_id, product_quantity, status, order_id, purchased_price, created_at, updated_at) FROM stdin;
1	1	3	5	carted	\N	\N	2024-10-09 01:34:34.168892	2024-10-09 19:48:44.510811
24	4	1	177	removed	\N	\N	2024-11-27 18:46:39.290462	2024-11-27 21:02:47.414136
30	4	1	176	removed	\N	\N	2024-11-27 20:34:15.481651	2024-11-27 21:02:48.646529
25	4	5	17	removed	\N	\N	2024-11-27 18:49:41.905107	2024-11-27 21:02:52.339405
26	4	6	10	removed	\N	\N	2024-11-27 19:00:55.515796	2024-11-27 21:02:52.563201
27	4	9	10	removed	\N	\N	2024-11-27 19:01:49.795762	2024-11-27 21:02:52.708678
28	4	14	12	removed	\N	\N	2024-11-27 19:16:43.892428	2024-11-27 21:02:53.120037
6	4	5	5	purchased	6	2.00	2024-10-10 01:46:20.227737	2024-10-11 00:14:44.187363
7	4	2	7	purchased	6	4.00	2024-10-10 01:56:14.943545	2024-10-11 00:14:44.19217
8	4	1	5	purchased	7	2.00	2024-10-12 22:04:03.088746	2024-10-13 00:44:57.215202
10	4	3	5	purchased	7	10.00	2024-10-12 22:05:58.992149	2024-10-13 00:44:57.219317
9	4	1	4	purchased	7	2.00	2024-10-12 22:05:44.906055	2024-10-13 00:44:57.221624
11	4	3	10	purchased	7	10.00	2024-10-12 22:19:10.736585	2024-10-13 00:44:57.222835
12	4	1	5	purchased	7	2.00	2024-10-13 00:13:41.549683	2024-10-13 00:44:57.224472
13	4	1	5	purchased	7	2.00	2024-10-13 00:22:51.599048	2024-10-13 00:44:57.225859
14	4	4	2	purchased	7	20.00	2024-10-13 00:23:34.175385	2024-10-13 00:44:57.227001
15	4	1	5	purchased	7	2.00	2024-10-13 00:44:16.023276	2024-10-13 00:44:57.228443
16	4	16	6	purchased	7	30.00	2024-10-13 00:44:32.411712	2024-10-13 00:44:57.229959
18	4	1	10	removed	\N	\N	2024-11-25 19:55:56.469441	2024-11-25 20:23:38.176928
31	4	4	5	purchased	9	20.00	2024-11-27 21:03:01.531591	2024-11-27 21:58:18.972549
32	4	15	2	purchased	9	7.00	2024-11-27 21:03:05.487182	2024-11-27 21:58:18.974319
20	4	2	1	removed	\N	\N	2024-11-25 22:46:19.342823	2024-11-27 17:56:57.787767
22	4	2	15	removed	\N	\N	2024-11-27 17:49:54.004754	2024-11-27 17:57:00.279562
17	4	1	6	purchased	8	2.00	2024-11-25 19:55:50.267075	2024-11-27 17:57:03.928838
19	4	3	9	purchased	8	10.00	2024-11-25 20:24:45.947219	2024-11-27 17:57:03.932451
21	4	2	10	purchased	8	4.00	2024-11-27 17:49:35.761286	2024-11-27 17:57:03.935349
23	4	2	10	removed	\N	\N	2024-11-27 18:42:31.280985	2024-11-27 20:35:33.947027
29	4	2	12	removed	\N	\N	2024-11-27 19:27:59.067732	2024-11-27 20:36:06.742401
33	4	5	5	purchased	10	2.00	2024-11-27 22:15:02.749249	2024-11-27 22:15:10.549719
3	4	3	5	purchased	1	10.00	2024-10-09 19:01:14.733231	2024-11-27 23:56:57.985392
5	4	6	2	purchased	1	15.00	2024-10-09 19:02:16.094805	2024-11-27 23:57:16.058699
4	4	1	5	purchased	1	2.00	2024-10-09 19:01:25.670627	2024-11-27 23:57:54.759974
2	4	2	5	purchased	1	4.00	2024-10-09 02:08:22.805316	2024-11-27 23:58:07.852873
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Dessert	2024-10-06 16:12:00.667434	2024-10-06 16:12:00.667434
2	Fruit	2024-10-06 16:12:10.149164	2024-10-06 16:12:10.149164
3	Vegetable	2024-10-06 16:13:07.830105	2024-10-06 16:13:07.830105
5	Delish Food	2024-10-06 16:14:28.961176	2024-10-06 16:14:28.961176
4	Healthy Food	2024-10-06 16:13:50.213493	2024-10-06 16:18:25.103617
\.


--
-- Data for Name: category_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category_products (id, product_id, category_id, created_at, updated_at) FROM stdin;
1	3	1	2024-10-06 16:22:49.52232	2024-10-06 16:22:49.52232
2	10	1	2024-10-06 16:23:21.122366	2024-10-06 16:23:21.122366
3	4	1	2024-10-06 16:23:36.258606	2024-10-06 16:23:36.258606
4	1	2	2024-10-06 16:24:01.661888	2024-10-06 16:24:01.661888
5	2	2	2024-10-06 16:24:09.309825	2024-10-06 16:24:09.309825
6	5	3	2024-10-06 16:25:39.824685	2024-10-06 16:25:39.824685
7	1	4	2024-10-06 16:26:45.580989	2024-10-06 16:26:45.580989
8	2	4	2024-10-06 16:26:56.154039	2024-10-06 16:26:56.154039
9	5	4	2024-10-06 16:27:13.93235	2024-10-06 16:27:13.93235
10	6	4	2024-10-06 16:27:16.69542	2024-10-06 16:27:16.69542
11	4	5	2024-10-06 16:27:54.86005	2024-10-06 16:27:54.86005
12	10	5	2024-10-06 16:27:57.916896	2024-10-06 16:27:57.916896
13	9	5	2024-10-06 16:28:05.370998	2024-10-06 16:28:05.370998
14	6	5	2024-10-06 16:28:38.602554	2024-10-06 16:28:38.602554
15	3	5	2024-10-06 16:28:56.93839	2024-10-06 16:28:56.93839
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.images (id, url, created_at, updated_at, product_id) FROM stdin;
4	https://domf5oio6qrcr.cloudfront.net/medialibrary/6372/202ebeef-6657-44ec-8fff-28352e1f5999.jpg	2024-09-10 23:09:27.778677	2024-09-10 23:09:27.778677	1
5	https://cdn.britannica.com/92/13192-050-6644F8C3/bananas-bunch.jpg	2024-09-10 23:09:55.24187	2024-09-10 23:09:55.24187	1
6	https://walnutcreekfarmtexas.com/wp-content/uploads/2021/08/AdobeStock_76361909-scaled-1.jpeg	2024-09-10 23:10:22.311686	2024-09-10 23:10:22.311686	2
7	https://pastrieslikeapro.com/wp-content/uploads/2022/09/angel-food-cake.jpg	2024-09-10 23:10:57.279995	2024-09-10 23:10:57.279995	4
8	https://www.allrecipes.com/thmb/TdELejPed52E26sKAIcbAcIXMiQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/7324-AngelFoodCake1-mfs-Step-3X4-0077-ee1ad82aa5df484c8b6c31761dfc95f4.jpg	2024-09-10 23:11:28.150202	2024-09-10 23:11:28.150202	4
10	https://extension.usu.edu/nutrition/images/carrot-head.png	2024-11-26 22:55:35.895463	2024-11-26 22:55:35.895463	5
11	https://orchardfruit.com/cdn/shop/files/Carrots-Bunch-The-Orchard-Fruit-72146086.jpg?crop=center&height=1200&v=1722937936&width=1200	2024-11-26 22:55:35.911382	2024-11-26 22:55:35.911382	5
15	https://www.recipetineats.com/tachyon/2022/11/Apple-Pie_8.jpg	2024-11-26 22:58:10.953104	2024-11-26 22:58:10.953104	3
16	https://www.inspiredtaste.net/wp-content/uploads/2022/11/Apple-Pie-Recipe-Video.jpg	2024-11-26 22:58:10.956404	2024-11-26 22:58:10.956404	3
17	https://sweetlycakes.com/wp-content/uploads/2019/12/Apple-Pie-8blog.jpg	2024-11-26 22:58:10.958919	2024-11-26 22:58:10.958919	3
19	https://recipe30.com/wp-content/uploads/2020/05/Fried-chicken.jpg	2024-11-26 23:03:11.334773	2024-11-26 23:03:11.334773	9
20	https://cosori.com/cdn/shop/articles/Air_Fryer_Fried_Chicken_add19ef5-aa72-49b7-8485-15f031b073c3.jpg?v=1719423536	2024-11-26 23:03:11.342035	2024-11-26 23:03:11.342035	9
21	https://www.simplyrecipes.com/thmb/6NhQKyjhBOmu4y0RXXHipugv0Q8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Easy-Banana-Bread-LEAD-2-66837beab63c495292d89743c6767171.jpg	2024-11-26 23:03:55.616586	2024-11-26 23:03:55.616586	12
24	https://www.dinneratthezoo.com/wp-content/uploads/2018/05/ground-beef-tacos-2.jpg	2024-11-26 23:06:08.954989	2024-11-26 23:06:08.954989	13
25	https://feelgoodfoodie.net/wp-content/uploads/2024/04/Ground-Beef-Tacos-TIMG.jpg	2024-11-26 23:06:08.961077	2024-11-26 23:06:08.961077	13
26	https://chefsmandala.com/wp-content/uploads/2018/03/Plum-600x338.jpg	2024-11-26 23:07:16.963378	2024-11-26 23:07:16.963378	14
27	https://www.kesargrocery.com/images/P/Plum.jpg	2024-11-26 23:07:16.970353	2024-11-26 23:07:16.970353	14
28	https://www.chandigarhayurvedcentre.com/wp-content/uploads/2024/05/natural-fresh-plum-fruits-305.jpg	2024-11-26 23:07:16.983029	2024-11-26 23:07:16.983029	14
29	https://www.watermelon.org/wp-content/uploads/2020/07/Seeded-Wedge-scaled.jpg	2024-11-26 23:08:03.01431	2024-11-26 23:08:03.01431	15
30	https://amoretti.com/cdn/shop/products/champagne_a21f3bf1-109f-48fb-a370-a4e7ed208721_700x700.jpg?v=1522432696	2024-11-26 23:11:32.435163	2024-11-26 23:11:32.435163	16
32	https://www.applesfromny.com/wp-content/uploads/2020/05/20Ounce_NYAS-Apples2.png	2024-11-26 23:12:29.814424	2024-11-26 23:12:29.814424	18
33	https://i5.walmartimages.com/asr/35257a70-6d96-40fc-94e4-5e27b2dd4195.ea3985d9f7a6579b2e01329dff80e27f.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF	2024-11-26 23:12:29.817448	2024-11-26 23:12:29.817448	18
34	https://www.kroger.com/product/images/large/front/0000848100829	2024-11-26 23:13:31.047995	2024-11-26 23:13:31.047995	19
35	https://www.allrecipes.com/thmb/ytnCq3jVoAyGzGxm_oZxqGI-HCU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/18290-garlic-mashed-potatoes-ddmfs-beauty2-4x3-0327-2-47384a10cded40ae90e574bc7fdb9433.jpg	2024-11-26 23:14:37.14923	2024-11-26 23:14:37.14923	17
36	https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg?quality=90&resize=556,505	2024-11-26 23:15:54.909636	2024-11-26 23:15:54.909636	20
37	https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/8/28/0/FNK_SKILLET-CHICKEN-TORTELLINI-ALFREDO-H_s4x3.jpg.rend.hgtvcom.1280.960.suffix/1503928454027.webp	2024-11-26 23:16:32.268805	2024-11-26 23:16:32.268805	22
38	https://www.lobels.com/images/thumbs/0001598_usda-prime-dry-aged-t-bone-steak_882.jpeg	2024-11-26 23:17:00.675903	2024-11-26 23:17:00.675903	23
39	https://www.sherwoodbrewing.com/wp-content/uploads/2021/05/screw-top-gettyimages-85210965.jpg	2024-11-26 23:17:34.137397	2024-11-26 23:17:34.137397	24
40	https://beverages2u.com/wp-content/uploads/2020/01/san-pellegrino-33-oz-bottle-scaled.jpg	2024-11-26 23:18:22.614003	2024-11-26 23:18:22.614003	25
41	https://www.thespruceeats.com/thmb/ab5Ah9pdp9Ks6dY_9wOYPyLloOQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/dark_chocolate1-e58737b8bcbe4e4092f62d42c3c19fe0.jpg	2024-11-26 23:18:58.008933	2024-11-26 23:18:58.008933	10
42	https://www.inspiredtaste.net/wp-content/uploads/2022/11/Vegetable-Soup-Recipe-Video.jpg	2024-11-26 23:25:57.655586	2024-11-26 23:25:57.655586	26
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, user_id, subtotal, tax, total, payment_method, created_at, updated_at) FROM stdin;
1	4	110.00	9.90	119.90	\N	2024-10-09 22:33:59.143894	2024-10-09 22:33:59.143894
6	4	38.00	3.42	41.42	\N	2024-10-11 00:14:44.181768	2024-10-11 00:14:44.181768
7	4	418.00	37.62	455.62	\N	2024-10-13 00:44:57.205601	2024-10-13 00:44:57.205601
8	4	142.00	12.78	154.78	\N	2024-11-27 17:57:03.918671	2024-11-27 17:57:03.918671
9	4	114.00	10.26	124.26	\N	2024-11-27 21:58:18.956385	2024-11-27 21:58:18.956385
10	4	10.00	0.90	10.90	\N	2024-11-27 22:15:10.521591	2024-11-27 22:15:10.521591
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, price, description, created_at, updated_at, inventory, supplier_id, status, is_seed_data) FROM stdin;
1	Banana	2.00	Yellow and green with lots of potasium	2024-09-10 02:42:03.491328	2024-09-10 20:42:36.141436	\N	2	active	t
2	Mango	4.00	multiple warm colors with a orange/yellow flesh	2024-09-10 02:43:39.951774	2024-09-10 20:43:10.569776	\N	2	active	t
5	Carrots	2.00	orange, long, crunchy	2024-09-10 02:48:22.791371	2024-09-10 20:43:54.737336	\N	2	active	t
6	Leilani's Salad	15.00	Very hearty and healthy salad	2024-09-10 03:43:50.800846	2024-09-10 20:44:24.420602	\N	1	active	t
9	Karls Fried Chicken	10.00	Chicken battered and fried to perfection	2024-09-10 19:06:24.530246	2024-09-10 20:44:55.123389	\N	1	active	t
4	Angel Food Cake	20.00	Yum	2024-09-10 02:46:32.355987	2024-09-27 17:50:20.232661	\N	1	active	t
12	Banana Bread	20.00	Bananas, flour, love, sugar	2024-10-11 23:12:14.732745	2024-10-11 23:12:14.732745	\N	1	active	t
14	Plum	3.00	purple, sweet, juicy	2024-10-12 00:22:39.068221	2024-10-12 00:22:39.068221	\N	2	active	t
15	Watermelon	7.00	Green on the outside, pink on the inside, sweet, juicy, large, seeds or seedless	2024-10-12 00:26:59.39542	2024-10-12 00:26:59.39542	\N	2	active	t
18	Apple	1.00	Apple a day keeps the dr away	2024-10-12 01:02:58.579276	2024-10-12 01:02:58.579276	\N	2	active	t
20	Milk	6.00	White, from cows, has calcium	2024-10-12 01:10:58.488846	2024-10-12 01:10:58.488846	\N	2	active	t
21	Wine	23.00	made from grapes, contains alcohol	2024-10-12 01:12:47.771774	2024-10-12 01:12:47.771774	\N	1	active	t
22	Skillet Chicken Tortellini Alfredo	30.00	Chicken, cream, Tortellini, butter, parm	2024-10-13 00:07:57.331033	2024-10-13 00:07:57.331033	\N	1	active	t
23	T-Bone Steak	22.00	Beef from Cow	2024-10-13 00:46:14.89713	2024-10-13 00:46:14.89713	\N	2	active	t
3	Apple Pie	10.00	Just like your grandma made, fresh apples and a flaky crust	2024-09-10 02:45:24.203292	2024-11-26 22:58:10.93614	\N	1	active	t
13	Tacos	15.00	beans, cilantro, beef, black olives, cheese	2024-10-12 00:18:37.864042	2024-11-26 23:06:08.933108	\N	1	active	t
16	Champange	30.00	Bottle of bubbles with 2 glasses. 	2024-10-12 00:38:52.546305	2024-11-26 23:11:32.427956	\N	1	active	t
19	Kale	3.00	Green, leafy, healthy for you	2024-10-12 01:08:42.888292	2024-11-26 23:13:31.032255	\N	2	active	t
17	Mash Potatoes	10.00	Potatoes, butter, cream, salt, pepper, sour cream, garlic	2024-10-12 00:49:24.007509	2024-11-26 23:14:37.134602	\N	1	active	t
24	Bottled Water	2.50	water in a bottle	2024-10-30 00:49:37.9827	2024-11-26 23:17:34.128293	\N	1	active	t
25	Pellegrino	5.00	Sparking Natural Mineral Water	2024-10-30 00:50:48.925406	2024-11-26 23:18:22.602613	\N	1	active	t
10	Dark Chocolate	7.50	Made from cacao beans? 	2024-09-27 02:22:56.589762	2024-11-26 23:18:57.997729	\N	1	active	t
26	Vegetable Soup	7.00	Vegetables, tomatoes, herb, broth	2024-11-26 23:25:57.633049	2024-11-26 23:25:57.633049	\N	1	active	t
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20240910023507
20240910191835
20240910192226
20240910192548
20240910202007
20240910202849
20240910223425
20240910223747
20240910223843
20240911013845
20240912014410
20241006160647
20241006160751
20241009004211
20241009004423
20241009005721
20241125213802
20241127231546
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.suppliers (id, name, email, phone_number, created_at, updated_at) FROM stdin;
1	Yum Yummy	tastesogood@yummy.com	310-621-0413	2024-09-10 20:23:42.130818	2024-09-10 20:23:42.130818
2	Heathy foods	eathealthy@healthyfood.com	707-326-3010	2024-09-10 20:23:58.52769	2024-09-10 20:26:21.480393
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password_digest, created_at, updated_at, role) FROM stdin;
1	bob	bob@bob.com	$2a$12$ptddTz655ntsLkc/OMsC/.xAFRKt.CDBOtecOXNhLJWpjxDaBKJQy	2024-09-11 02:26:48.736222	2024-09-11 02:26:48.736222	0
2	Linda	Linda@Love.com	$2a$12$cj64S8MZsRHhx0/.T0UOTO5ZW.5B5Z18bDdW3V0b0pqGgVz1K.4Xi	2024-09-11 02:27:13.46253	2024-09-11 02:27:13.46253	0
3	Hello	hello@gmail.com	$2a$12$F/a16ytrK7wT99GhGAtGw.aV2wasbkYDGPOrYcZ2XjqvLyYMJFDju	2024-09-27 01:48:48.211125	2024-09-27 01:48:48.211125	0
4	leilani	leilani@test.com	$2a$12$btNiK1DjlJjscD7YX1VZgOLr/t5YcOZNTWoAL4YUUVzGDEmJiLiS6	2024-10-09 01:57:52.763896	2024-10-09 01:57:52.763896	0
5	Admin Leilani	leilani+admin@test.com	$2a$12$vGQQSFQmvSBwz2nDnfNy2ehiAwbWj9WCjKIBpnyCeTWosuWSi8dxO	2024-11-25 23:28:48.882164	2024-11-25 23:28:48.882164	1
6	Duke	duke@test.com	$2a$12$a4wsV6s8KLk7gWcUhRseuevubo91k1W2VSAZeh2NtX5HVdkb38836	2024-11-27 22:37:35.543286	2024-11-27 22:37:35.543286	0
7	Karl	karl@test.com	$2a$12$IUhZKCF5cDjmrOLdFqyoGORrAN3M9do3WmKI6gqRpCEw6yeKMOf0e	2024-11-27 22:50:08.959651	2024-11-27 22:50:08.959651	0
\.


--
-- Name: carted_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carted_products_id_seq', 33, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_products_id_seq', 15, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.images_id_seq', 42, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 26, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- PostgreSQL database dump complete
--

