COPY public.suppliers (id, name, email, phone_number, created_at, updated_at) FROM stdin;
1	Yum Yummy	tastesogood@yummy.com	310-621-0413	2024-09-10 20:23:42.130818	2024-09-10 20:23:42.130818
2	Heathy foods	eathealthy@healthyfood.com	707-326-3010	2024-09-10 20:23:58.52769	2024-09-10 20:26:21.480393
\.

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Dessert	2024-10-06 16:12:00.667434	2024-10-06 16:12:00.667434
2	Fruit	2024-10-06 16:12:10.149164	2024-10-06 16:12:10.149164
3	Vegetable	2024-10-06 16:13:07.830105	2024-10-06 16:13:07.830105
5	Delish Food	2024-10-06 16:14:28.961176	2024-10-06 16:14:28.961176
4	Healthy Food	2024-10-06 16:13:50.213493	2024-10-06 16:18:25.103617
\.


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