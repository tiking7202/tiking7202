PGDMP      +                |            Nongsan    16.2    16.2 /    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    32876    Nongsan    DATABASE     �   CREATE DATABASE "Nongsan" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1258';
    DROP DATABASE "Nongsan";
                postgres    false                        3079    32877 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            U           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    32947    Order    TABLE     E  CREATE TABLE public."Order" (
    orderid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    totalamount numeric,
    estimatedelivery date,
    shippingaddress text,
    orderstatus character varying(20),
    ordercreatetime timestamp without time zone,
    userid uuid,
    orderupdatetime timestamp without time zone
);
    DROP TABLE public."Order";
       public         heap    postgres    false    2            �            1259    32900    User    TABLE     [  CREATE TABLE public."User" (
    userid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    fullname character varying(100) NOT NULL,
    street character varying(255),
    commune character varying(255),
    district character varying(255),
    province character varying(255),
    phonenumber character varying(15),
    indentitycard character varying(255),
    status boolean,
    role character varying(20),
    avatar text,
    refreshtoken text,
    dob date
);
    DROP TABLE public."User";
       public         heap    postgres    false    2            �            1259    32888    admin    TABLE       CREATE TABLE public.admin (
    adminid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    fullname character varying(100) NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false    2            �            1259    32941    cart    TABLE     �   CREATE TABLE public.cart (
    cartid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    userid uuid,
    productid uuid,
    quantity integer
);
    DROP TABLE public.cart;
       public         heap    postgres    false    2            �            1259    32925    category    TABLE     �   CREATE TABLE public.category (
    categoryid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    userid uuid,
    categoryname character varying(100) NOT NULL,
    categoryimage text,
    categorydes text
);
    DROP TABLE public.category;
       public         heap    postgres    false    2            �            1259    32920    crop    TABLE       CREATE TABLE public.crop (
    farmid uuid,
    productid uuid,
    cropname character varying(100) NOT NULL,
    cropdes text,
    plantarea numeric,
    harvestdate date,
    estimatedyield numeric,
    cropstatus character varying(20),
    plantdate date,
    cropimage text
);
    DROP TABLE public.crop;
       public         heap    postgres    false            �            1259    32912    farm    TABLE     �  CREATE TABLE public.farm (
    farmid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    userid uuid,
    farmname character varying(100) NOT NULL,
    farmstreet character varying(255),
    farmcommune character varying(255),
    farmdistrict character varying(255),
    farmprovince character varying(255),
    farmdes text,
    farmimage text,
    farmarea numeric,
    farmtype character varying(255),
    farmlogo text,
    farmphone character varying(20),
    farmemail character varying(50),
    farmproductstotal numeric,
    farmservice text,
    farminvite text,
    farmimage1 text,
    farmimage2 text,
    farmimage3 text
);
    DROP TABLE public.farm;
       public         heap    postgres    false    2            �            1259    32982    message    TABLE     �   CREATE TABLE public.message (
    messageid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    senderid uuid,
    receiverid uuid,
    content text,
    date timestamp without time zone,
    status boolean
);
    DROP TABLE public.message;
       public         heap    postgres    false    2            �            1259    32955 	   orderitem    TABLE     d   CREATE TABLE public.orderitem (
    orderid uuid,
    productid uuid,
    quantityofitem integer
);
    DROP TABLE public.orderitem;
       public         heap    postgres    false            �            1259    32958    payment    TABLE     }  CREATE TABLE public.payment (
    paymentid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    orderid uuid,
    userid uuid,
    paymentmethod character varying(50),
    transactionid character varying(100),
    totalamount numeric,
    paymentcreatetime timestamp without time zone,
    paymentstatus character varying(20),
    paymentupdatetime timestamp without time zone
);
    DROP TABLE public.payment;
       public         heap    postgres    false    2            �            1259    32933    product    TABLE     �  CREATE TABLE public.product (
    productid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    farmid uuid,
    categoryid uuid,
    productname character varying(100) NOT NULL,
    productimage1 text,
    productimage2 text,
    productimage3 text,
    healtbenefit text,
    storagemethod text,
    cookingmethod text,
    overviewdes text,
    productprice numeric,
    productquantity integer,
    expirydate date,
    unitofmeasure character varying(50)
);
    DROP TABLE public.product;
       public         heap    postgres    false    2            �            1259    32974    purchaseshistory    TABLE     �   CREATE TABLE public.purchaseshistory (
    purchasehistoryid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    orderid uuid,
    paymentid uuid,
    purchasedate timestamp without time zone,
    totalamount numeric
);
 $   DROP TABLE public.purchaseshistory;
       public         heap    postgres    false    2            �            1259    32966    review    TABLE     �   CREATE TABLE public.review (
    reviewid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    productid uuid,
    userid uuid,
    rating integer,
    comment text,
    reviewtime timestamp without time zone
);
    DROP TABLE public.review;
       public         heap    postgres    false    2            I          0    32947    Order 
   TABLE DATA           �   COPY public."Order" (orderid, totalamount, estimatedelivery, shippingaddress, orderstatus, ordercreatetime, userid, orderupdatetime) FROM stdin;
    public          postgres    false    223   �<       C          0    32900    User 
   TABLE DATA           �   COPY public."User" (userid, username, email, password, fullname, street, commune, district, province, phonenumber, indentitycard, status, role, avatar, refreshtoken, dob) FROM stdin;
    public          postgres    false    217   �=       B          0    32888    admin 
   TABLE DATA           M   COPY public.admin (adminid, email, username, password, fullname) FROM stdin;
    public          postgres    false    216   �B       H          0    32941    cart 
   TABLE DATA           C   COPY public.cart (cartid, userid, productid, quantity) FROM stdin;
    public          postgres    false    222   �C       F          0    32925    category 
   TABLE DATA           `   COPY public.category (categoryid, userid, categoryname, categoryimage, categorydes) FROM stdin;
    public          postgres    false    220   EE       E          0    32920    crop 
   TABLE DATA           �   COPY public.crop (farmid, productid, cropname, cropdes, plantarea, harvestdate, estimatedyield, cropstatus, plantdate, cropimage) FROM stdin;
    public          postgres    false    219   �I       D          0    32912    farm 
   TABLE DATA             COPY public.farm (farmid, userid, farmname, farmstreet, farmcommune, farmdistrict, farmprovince, farmdes, farmimage, farmarea, farmtype, farmlogo, farmphone, farmemail, farmproductstotal, farmservice, farminvite, farmimage1, farmimage2, farmimage3) FROM stdin;
    public          postgres    false    218   �J       N          0    32982    message 
   TABLE DATA           Y   COPY public.message (messageid, senderid, receiverid, content, date, status) FROM stdin;
    public          postgres    false    228   lO       J          0    32955 	   orderitem 
   TABLE DATA           G   COPY public.orderitem (orderid, productid, quantityofitem) FROM stdin;
    public          postgres    false    224   9P       K          0    32958    payment 
   TABLE DATA           �   COPY public.payment (paymentid, orderid, userid, paymentmethod, transactionid, totalamount, paymentcreatetime, paymentstatus, paymentupdatetime) FROM stdin;
    public          postgres    false    225   Q       G          0    32933    product 
   TABLE DATA           �   COPY public.product (productid, farmid, categoryid, productname, productimage1, productimage2, productimage3, healtbenefit, storagemethod, cookingmethod, overviewdes, productprice, productquantity, expirydate, unitofmeasure) FROM stdin;
    public          postgres    false    221   <R       M          0    32974    purchaseshistory 
   TABLE DATA           l   COPY public.purchaseshistory (purchasehistoryid, orderid, paymentid, purchasedate, totalamount) FROM stdin;
    public          postgres    false    227   Bo       L          0    32966    review 
   TABLE DATA           Z   COPY public.review (reviewid, productid, userid, rating, comment, reviewtime) FROM stdin;
    public          postgres    false    226   ]p       �           2606    32954    Order Order_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (orderid);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    223            �           2606    32911    User User_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
       public            postgres    false    217            �           2606    32907    User User_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (userid);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    217            �           2606    32909    User User_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_username_key";
       public            postgres    false    217            �           2606    32897    admin admin_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_email_key;
       public            postgres    false    216            �           2606    32895    admin admin_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    216            �           2606    32899    admin admin_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_username_key;
       public            postgres    false    216            �           2606    32946    cart cart_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    222            �           2606    32932    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    220            �           2606    32919    farm farm_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.farm
    ADD CONSTRAINT farm_pkey PRIMARY KEY (farmid);
 8   ALTER TABLE ONLY public.farm DROP CONSTRAINT farm_pkey;
       public            postgres    false    218            �           2606    32989    message message_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (messageid);
 >   ALTER TABLE ONLY public.message DROP CONSTRAINT message_pkey;
       public            postgres    false    228            �           2606    32965    payment payment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    225            �           2606    32940    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    32981 &   purchaseshistory purchaseshistory_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.purchaseshistory
    ADD CONSTRAINT purchaseshistory_pkey PRIMARY KEY (purchasehistoryid);
 P   ALTER TABLE ONLY public.purchaseshistory DROP CONSTRAINT purchaseshistory_pkey;
       public            postgres    false    227            �           2606    32973    review review_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (reviewid);
 <   ALTER TABLE ONLY public.review DROP CONSTRAINT review_pkey;
       public            postgres    false    226            I   �   x���1N1E��s ���NbO�D-�=�P���Z�p���-\��0�m(@[ٲ�����d�@�8uu'rO�2ΡhJ)�idH���h�í.��������;[��nlޟ�^������	< M���1`qe/$� ���Tr�YѵS���{6�� wZ�Ȓ	�fj_�z������2Q�T��˟��RKI]���/8��ڱw/m	���<N������x��1~�M��      C   �  x�͖�r�F���S��dע/�t�j*c�6���`\�雐�X<M���R�s�1v���"3I���GݭR�w���4v��	PJ$p$$�a% aX�.�.$��U�V��2��Hx��e�X�0��;w}>�F�$\RA��
Id����!��tx�*�M5���r~�l��yf[=ݘ�qQ��S�mc��qUd�q�r�×�_Z�����[��0�R�!��d]VY�+�������B^j3\���Y�Xi���~��5l��~n��d?��̳�y2kޖ���צ#�C�������V1��ʖ:}��+B���"�!�a�3�t�P JZ�:�BPB4NHB�(����R��B�ǎ�5>G���S��\�ד�(@�N��z��4�9�]��|ڎ����Y�Sή>E̿�1�v��7C�(��Q���!�k  f.1�$.ya�=�CO:@1��C=�Pk���bJ������zm@T�>�|yq�I��t�u���ޠl���zH�����M�Zu��zR]�(o��"|�C��1���F��_��z��F?��Y�f�f:9Bv>�L��b�&br��u��f��bO ��P��>�����H\��:�nw�A�7�l^����Kf�EH��V$����L$Q$�S��i}On"56%�H�������������h���t����.���9\�LU�����;�n��;[�R�����s�;�} T�Kr7��:�+�}��z���qw�>j6��^|��=
U'Oฌ'g����ͮFg��g�>�mk�xv�>���!�^.H=L]��g!l���g���<,2�v ����	���Fy�#�>X)�/��Di+2�j���T\�������L��֪����c��#^��K�bl��ʎ������2���������Lf3�+[����Q��F��F����9�����r������p��)#!������ a�+,�:��Hd-��̄����_A���9��`��ӧ~g��]=�y�����$)�~�Vq<�[Uwp>%��gE4?�G�/�OL` �M�q�W��J��p��zq�k����w�+���q1�%�t7��u�xAm���v��l�=���1�Ө;�_F���_��:�_�{�wM2��R�1`ȕ�I���sbѷ�C��~���+�)�˰�)h/�qUh]5N�v�$u��Չ˪��~pXd�8��ѽ���O�t��w���$�Q���sMmq%�#�A�$|.M��?�-�p�o��#��p�:jW�9��e=>��h������Q      B   �   x�K474J27L�57���51I3׵HL1�5JM345KL1L2L�LL���3tH�H�-�I�K�υ
q�%��dꙦ�G�DEyf�GzVf�x�e�$W���f���Y�8�Z����[�;9�r��P�vt����\�Ffi)���&I�&��ɺ�F)��f)i)�&�[�0bD�C��K+�n�S�8������
G&<ܵ>谝y�\1z\\\ �ca�      H   h  x��Sˑ!<�˅-T�e/���f0�w����?�h�v� :���9��Ӹ�W硹Sx+�1n�O��	�3D|	�<q]'WB�I�-P��E���)���7�FZ��S&C8�S�=&k��q��ɏ��85�ă_��q���;��&NWm���*aJ�S9TMB-�i+���$��Uh(H=C�(�]>!WE���5���a�d�Ag���;/E
�jBOG�� �@qO�&6_�(�6�]i��V��5zcr��,�!��RE����0����m��D[�K�o3�ܽl��a�?Hi��WLO�|Ǝ��	;��g��.`I�V�ԓqY9�7a?���rE�#���fo���|>�?4��      F   r  x���OoE����2�����C$���T�z��ޥ��9"�JD�B�D�**��q�~��&�c'�C�!����3����g�YFb�\L}0S4ÊJ�sM�K�W{.
�uXEB0�a���;�m��~�ᤝ�ȵ���M3�~0�r���iSO�0�u=<
f\N������g�P��s3O�u�zXL����=�Q31�3'�/���Q�`|i�o�ǡz@���[�,���
�ט0�Y:�o��?WC���Cp�f����	����i?�Y�\�|fPs�Ԥ�%<�+�t��:w�8M�Su��F������Q}�-~#�-^T�=Cò=�!_V�i ���#��<�f�C�QSl�&��kI9�;��E=iօ��b^ރE�l�𨕦3Gf�E���[1�@�>)���ኦ���85	O�`|���F����x��j`�<���S�4tS��:4�(?��0����٬��@.�h1H�@����LK]P޻�����3[aG�il�5�RA`s�1��pō��|��- ��J�������N��?KJ^N1�?�+�W�Y���B��N�
��Y�� =:�>bCh�g�\�3�H�)1�����Gր����:d�El�Ә1����Ij!h��;��H��Y��
�[ �R�d-Fq�U��u�2�7Ы?�/g	�m�'%�U�T�+ۯ[<�{LG"�r�[F13�`c�1H��u7>5�}tt����V�2pe�i�8���`�iT��[isãk�0?�ʀ�Ҿ~����$�������ٿ�.y��P�����DlU�n�ِ;�v}�]����j��D��9�
��7nj�����>�����,Wk�vR+��dA�M���eJ��=��R�pb	-��v^o�ծ]{5l�v+�����}O+T�L_$��F��ϴQ�M+堈��*�=�S��ޖNO86"�g^k.� d�� ��O�rq~�¬?�n�" �9x��UC��`bs��`4@a��b\�;�y��+��ρ�M��<fV8l|M��&&�(�Q��݈�|��gQ���`8��x��(��V�]u�.���`�5��~U��4�����*����=�z���^���^P      E     x�Ր�N�0���)��v_S�b(v_�S�&�SԷ�EY�~���m���q�[P�1r#�8�@9����q�5&8�r ?�5���<E��zK=mv9�mp�9���1���$kaHͦ��y��3�㵦5;������^p)1��1��:���q�O�7�����)-)�o��.8�p�a����y�s�V����r��x��e;����w����A
!�Q�@p��Q1��1�R�Z�����֪0�ɟ�x����zAw(�G�޺�m� �]�D      D   m  x��V�o�D>;�p������V� �*������x<�A�k���r@= �8p@HY��jJEB#!�B�����7�e�,�āC����<�}��ͷ$r�[D�#�Tmgf�A���	t�V�`ע�Kl5���j����R�t��M��P������ʕ��G�p����`1��ae��1G�����,Vv*ۼ��TE�����Y�ē�%(��J��bgg�˃���O�^�'�>ʻ�A	%*����+,������B����u���! ��6�����30��j�
R�4��)Cu�8f�i�/N8`�(���z��	K�gw�g�<sH�H*mTw�e˹�i�4��'%`lDе����E�3� 
�R���;mP��P���3�FiE\Ӛ��E�Q\��F�|��O����4ͅ�e]\���ƻ�C��������0���b����7�0���]�چ��@
9�:~Dg��뚣l�����ŵ]ą���z=�0 n>ߴim��zd��mz�lRl9�>�=ױ-�Rb�<��q��L�{��{��Q�6�N��9pڌ��l9p�M��g�.粍��@ ��E�Xw>��]�8�н�[�u)��#ַ���s#ҷ(����`!�>VnI"ə�y�q!>�=9/�l�U���}�es�4egcN��#�<���s�H�+#_�p S�6l���C.�]��ƾ���P�z��F�\ƫ$��t�+Ep�v� �o]zk��)�dtU�X��NݽW-���1KhY���Y��\��8G�ʴ�\;�N�'�\�C���
2|�}�L�F��-�k�l��2k��k�G`Qg��tF\���#�?�ԇ /e��Y�w�G��+��^��������UJV�O�b/e����Bf�k)�;�c��ڶ�65t{�&7
�gY�OB]��R>���L���0-���$g���*�������>��!��P��w���;�!rP�6&R��h���B@��
r]�l��	�g�-s�;�A�FҮ�}	o,�ϙ\��Y*2I�P����O���1J�k��J��!�d��J�J��$N�q*�C��A�v��I�l����	`N����;7In��E1k[[[���      N   �   x���AN1 ��W�{]9���{�
��	�(DBE��S>�zifrM����"A�$B�ƥO9�+�z*@�tV�j}rENV=�����Af�@|��]@�W6���Ӹ\�!��wl�#���ǐ1ܔ�1���H�T4�M�%%#�v���,
;���0����x��=���x=�����
���q۶_�/R�      J   �   x����� г��DDz��_�0��y��F�������̖ cjb�s��B��W�����u��k6��¸p+k���:�����e�y<�,��&P"�ro2�5����3`g.y� �R�@Ro�d_\mFY�|V�Ѵ���U�Yd���|�V�ɀ-r�êZ�ߧ��>�NM      K   +  x��пM1�:7�-�Oq����((i���>����` �e6!H A��ߓ�~6�zȐ((0�b�Pǐ����#߽H<*�� �r��&�f��p�TXS*9k0�Rbn,�b��]���ׇ�קc���뱿�<���xܸ���{�� �E�8����Ҏ~��_�I8�g��N�~�LR�)�4:ђ�1�:K�j��D�^z��w��qw>샐�m�O%�o��|a3��+h���N��ٗ���A��dTQ��&9A� k��� �����&�e���B?����iY�w�ߙ�      G      x��][�#�u~����6�uUu�E�쎝8���~00�[�̒Mz���)��"���Юa--tY�f��?&��?!�Tu7�����j8qv�C�N��:�w.՛�,�,�IL�!�-QTdD�8�<4��؎�ce$�$�#��"��IIjt"Th��f'�r�T�"N"�J"��Hn��D�FН��������f���+/������p69�}�۟L�#+���]=�|��^���v8���tz8��܇������'C{x����r?��r�|Ew�a��+9�}ol�P��lr�ߋc�PH��,"����a$H��2�Y���($���g&�Ět�%*�c��<�M��4�6!�wʘE�K�Sb��$
�&J�!a"�9c���\��[������,����t<�^�~�j/�'#�hY�G�{�^�ׁ�o¯ӻE?��9�'r�g�^�c3,�y����}h4;��O�_/����w�������Apxv�H��lp�ٗ��˽��]��7�������3'K݌��??�����<��h��u�}$�b0<;}{^�x���j�dZ���[���s7+7�mx��qp8Yܟ#������n��?�m�X��(�=Ёr��|�����c/λ3h�
Fg'�Ag�l�B���{N �����8�y����am&A�L܀y�u���w���>�x�^ :A��,p8�j�as��W�[|?���駕���ZzN�����Jp������rB�w�&=���1H�4q}J���S����R��Ƌ'�I�x��7��|���9v��*Psʩ��q�J�q��O�����=�p��=س��'�''�T��_�9;��tE��M0vGa���b�q��/e����礀�qv�a�a��<+?�)iwj?9�:�(c�?;�捛iX�^pG�X��?�~��U@���C���z���!�������	��#�+l{{�x����<X��p���pw'a�p��0%<�y���V�H�R$�!XA��i��Ox��\�+�R������@џ��L���p���1O9���$a,�.����[����
�0��R�IbL.�I�T&��2�ej�u̧� �t��ͬ�2�H�C��+F��Ti�RF3y���Ā3�d�����D@݈�INB-�2Ťno�Nн�ۀ�w{`�N��]���\�c�W��`V
��,8�{7��K@=��{=����c�ف/J�h�²��'��7�aDIoJeU�^��U�t��5�tk�l�/5ܷ��r�%L�r:ux֐�C�>��bs�~�Yy[h��#���� 2�9F����;y<��Jt��Ǧ#�n���� ����C��(��ޝ��}���@IѰ��0��.��Y��n�Uq�,I"�Q�u�%�,ՒjS*��o��?el`�E}7_w;�Ry�&��' 8�2"�X�2 m���k��<1F �4� -�$�A�DG*f��v����s�H�@�����3$��mo��V�3��ş~/���g�1��}=h㸇�ˣys���!ɷ���vP������r��N�Czݩ����e��ٍ	��Q�m�W�ඐ{9Υ�eY��u,���rѰ�)l�?����s��p��p�U�o�!ш֏��%z���v�4��ɂ�}����n�&%X��k���1�$ �M?+Z�9���m�<c��I��Nf��rNr
��\Ӝ^!�4
Nhێb�o��Fq�d�H�r0K)(B*�@"δ�̷��bvc8`4�#��B�[�$ %e�D�S�_���.�,�Q����o�>I9Q)���dR�쵱���
�Kz��n��C��h/���Hؙ��`2�����x,j�,�xx��p��x� v��̙�&*��-cv���cV8Hv�Q�?TV`����I���`lG��m$��N���O��X�sK��|jg-<A/��\~�'���Ɯ� vVi���n����`�f��J ��)A���Gڡst���𽃵#���W�U��XB���a9_	�|�5�j��rTJ#�{�� \K��_O+r�b��ΩS�y���Z	�3OEf�?����7���-������-TVÆ���<������Dx�9L�h�N+f��Ğ��+�q�xp��f �_w�ڵ�t�xx�渞 ?�w���ܝR5�C��e5<��JcxLq�0W��l����R����\0`���8y
.U��,�Ck"S����!�J~�L��������28��aߐc�Y����|A���'C �/�B��,�v���i( r��˂(��QjmEj�Vl���7~@oܺy㦀�{�_���п1�7]�[7�����Q��I2	�mD2\#m.�$������|br(�d��'Dɂ�q z �fhR-#2`�	�PR��1̱��<�a���(<���� v3N�<�Mc����)���*z�-=Op"�s`w[�*��L·%k<�-�R,��%��X���3��:q�U4W���}�x�ӻ�k �l����1R�ݦ����ɞ������n��,�p4)z%� r%+c�!��u��RPҔ�5�ӻ��3�k�_K�pOm�LKjP��B��~,�7�]k'v��kX�G�4	=;:rt�0�Z����U��n���X:��ð�np?���8#�I��p����zf�u��p����'���tK�k ��+�6�� ���_<4���:���iH�4Ɯ�����<Dh��%����a;BC�54z���ЎS¶qo�9�l����,��hS���R�+z��M��5x�"�xgTr���� ���-���Sd%Q�7��(v�8�<'�;�����*�k��839V�<W"��
�O�C����	*E"�ٓc`������\:�l|X�Z�+��ª�:	I��@ujbt(sE������<@�Lzb�/v�gI��NS���d`81I�M�������~f`_�c�7����B�Ӕ�	�|!d��R&H��#"j��6����fϑX+��"��z��m���.�Q��k(�O���'��#\�w��Sg�J*2z �EecF�E���v�W��q9��
���ZjR.�|$}�q����k=Bpۜ`�w~3��`~-�6����F���9�*��������6X<B.P�K��# w������X���t�wʒ.}Y&񧁋	<�W�F@�0x�V^w��9�j��Q��;�"��8u�j�TҊly�����^K\m�������`�{���~��xw��߿�Uc������Hl�x{��`W�������#���W��w���h7� ���b�m<.�/
��%	0�R����A��+������CW`�R���^i%KU7ma�GQؾ,>�.�J�ED�\9���6ವ�]�cnx{D%��x�SbB�e"�y=�l..�6�� �=���`2v1�jD�%�h �M��owF�.'>Q>9��A6v�-��dI�ČQ򋡙`�;�fQv�^k&Qu���.2�G��8���Z�m�8�L�ޠ�k`�S��	���UT�(�8[�+�8�P/�pL��I����r)d6��e1�9���m�y��8)#�wQ���˰��.]�v!鸰�|m��-l[�Z�m��|�� �k��_��f�ᬰ�i48[]����*i�J�dd��d�,����:mR��Kͭ��.13jT� ����r���.jp4�99Z|>0� T��GR]j��;w����vTc=��7^�����_!;����k�Kh�=����{���^��'���n{�u�Z�����r�n2�X�g`�L�KzZ��2.�&���r�bg+�u��B��v����y�q�w0b��G���?����l2��M[�� -�w"�$8�e�c-��մ�H"�g$G�d��\`4�^.�)���`"��k��o?o�#�r�o0�1 c�$�� �  �8����d~�2F��2�t��@s�E,�TE	S��&M�=;������vKJ��h�`Mb
�NbX3d�4<b2���%����!7:%�����^a���¤��[;k؁*z��D�!�<P���9 i�,�1�'���=d*��z�K�d��]"K��!�E@��ױ�i�G�S���������:.��詷F�0�.���H�k;��:\�V���5������ʇߡQ	.�j��m��d*��jP����q�J�2���E@�#�Ȉ,�H�-�k�tdI��H�W�B}I��<���ԟ.~7�n����d/oٿ������F�]�	���9���0i(v3����8�C:k�rp)#	�7R���"g2�AU����h��?��o�SZEp�S���@$��:���R_���u̩�Yfr"�@���,QDG	xHJ�+���A�0w`Ô֥�4��o���ii:���Y�z#s�.:)�#��`���W�c6������@bl�����|�����1g����ε"�k=o6U��^+�Jc�U�kݷ�I>[Lh#/>�����/�����"�PIV���|T.S&�&o\GZ�.�	%V�\P��(�/�ӹlQ㸬uoAO����~!��zᾞ��������|2�����������!��	�P��@ �0ɔ�,�i�a�Y�G��;$�d�Ǒ�$�dT.7`�'�kRí�AZTK�/֝K���-fc��T�B)��63a�l�+�w�����N��/�kl������7���("�&k&�fL�g�kp�]�������t������Z�1}L�!��f�ʺ��c�o]��}�?v�rE�{~�2G||u$���� F���O�<0�]��)`;u�]p=��|zWΑ�U��U�
t�\@���d㍃���������+��ụ)sm��B>���7�Y(��-�+�/��oY?���&sk��]��9ً����^z���v`�%,P�9�yk�t���l��,y9M�9W��|�(k����a�O�5�Lݠ�����{xC9��|%��Z@��ƪ�
����Ѥ<]��P-����[S�+�:�X�+��؀-�^_�����:��\�2♨�^�8Zu'b;[γq�}��V�����T�y�.\���2rV�y�ҫ�����?���U�`%ܩ�ȘU��N��}�+T]����X<���O���������7�z�0~S�����[~�X�܆Ҹ�O�|���WVM�
�[�W�iØ�8	-I)V�(!I��谦2���%�V.���h[�.]@B��jH���+`�pS�D	�l��">��f������l��<QFE-V��%��Ki����)R�bm_�enp�)�R�G� L»@l�{F%2��� ���%4a��8���R�1%	'!0�$�>�L���H�Q
-�8J��� %�$��,+(@SQf93��b�=��~'xl��%����|�y`��Vy�j	J�E�`�<�=\+��~��Ҳ'�>b��tcY�Ź��s�V/Z�J�/+U�>'��.ӂ�5�?W�h)9auj����;��ukݖw]�g�,UP���UV�T�y.{�|S5l�ur��$U{�;�:�%xl(X-a��\� gEo�rW±t����ϲ���ɦ:{�o_��z��:�9�Lנ�yyY�L���l
�L��h�З�J%�
�� +��j���$c�L]%�}�ٗ2�s%:[y��3�f.G�UsD,�IH����6�����,c�J�N��&�m1\b!'�@���Z��J���n_r�$�τ{RfI�fI�E���}�)��2�	�\a��:Cd˛n�Д�p{y�za�,��1��5�1,���	�H��D0LFyF��
��d�j�y��<ueBijo̥	�з�r4iE#�ͩTp�ݕ�l9��m�E�w���L��o1�پx����~]O�\%z>JX~׽�Y�be�_w73p]އ)Ϗ����vje%��C�`@wwh����K��\Ǚ���3	�9O9���zlY�Z�a~��|�gj�J��W���0~�$.�"�
3&C%�`#PRJ�6����C�&�D����冓��3���1��ƕ!)�"+3�ʟv��G�l�$�
�o�GL�c�^�.k���]��J�#ԏ\��zz�[ju�[z���=�o��ܒ�_�O�h�Ug�չ�W\_9��8��v]�j�6�x2�a[ܺE��~���HG��f�����.K��Jk}<yv�utv�ʖO��E�t�"]��ګ�9B�W��ڍZUV9F_ވ����Wh+ǛWjC�v�y>R��,kTjo0RU���c��I��cu�i"��^�,���L2{���++f�O��[k3�+�����f8p�e�3���H�RΥ��VnQo�r��*�a����
W��0�26��S��ǐ�Q�M�Id�*�0R
.8&Ꞃ_�\�M1&_	]_ߎ{�� B/*���|5Tt��V=�+��	��yz�x�OQ�Ӂ���G.�U2�q!tm�d�����\��Z�6*v1��4��[k��fױp}xݮ@��̿K���WU�%ݳQN5n�ܞvH���T�n�j�B��X����W�{�+�����8~�;�;狱Rm'�ywy|���j`�%�M�k�������?p���΍j�r��[E�I�~UQH7��5j�[�����hW�{�}o_=^|^UD㖘��E����ߍ+O���u�"�&x�r�V}�
�����~��� ��z킹��rwo�X��4`u{�buպ��#�n�j�rQJ&q�k�TO%o��\�S�.�a�To�^�����G%�ќ�'�h|jd���5��gH* x�Ra�XH�\���7���*l�Br1���]��1�������B-cBF>_�R"mʈ�y)�4����J�K���VX+#B|T�����f�$�,J�P�.1�SxK�Ւ�Y�S;6�%i��\��e:����y��cpAdq��G�'L��#{ �(�.��J���2ƙ�X�R������q�ͥ��׿�p\}���y�k��O���|��ݥ��w��+T��ܽZ�l������D�f�V�U^�.[9�������c$U�^;��[�cT)�àz����\^��}{&����|[N�yu��VNC�E.Lϕs�*諜�{d��1P�q��(��\�|r�ݷ�nw]t\s.a�dnPQ�t��p�~~�����ӻ�h���8 �{y7ʇVnH�7]V�
�Vs�;���q���d�l���^�_�˞      M     x�]й�e1P[/�I�_lB�biGh�?��=u9\�T�=a
;�8va/�~װ+�	n�� �;A/1̩F'���o;��70����(�{c����#+��?��ӫ�3��{ӎ�+��Aϩ�k@28V*$��"�H���Y<�#�S$cwZ�$���un�ҙX��̸3�u�����L�,��.)�a-���3��ɥ��,��fdy��.���4��/J"[=ѫ鴡�t�Ɂ~i,�2�G_�W�Wn�b���<���iN      L   �  x�����E���hr�Vݿ�����!IUu��H�Yf,!� �" p�hW��/2o���Hh����_�s�,>p�+��)C�^��b�����r���C�@r�P�3t��iM��<�/I���1ؗ
5�)2h�����kd��������z���r$��I��ia�%&�8ve��;�.��%�܊���#����׵]]��~��]�����x$��Q e� �b��O�
���x�o^�����oϦ�����x�G�����������!pK ={�� Fc�*�A[)�D�*��t\�.�UZ�g������T���4�7�d�3�8-k�����L|Y!Q`r4�*��Pz���Bu��Ťm��)�9�8.����6#y�ΏWߩ؋��db���L� K��aD
s�i�Az��&HZmK��h-�%���0�����ͯ{s��u��MpF�q%��%�ECk���60/kc�EmH�N�yK�D�ZLR��zc�;������i�ɻʹ9����|��~�)Z��())A�d�8.P�X~3�Ƃ�="�n7ۿ����"a���[vؗB͝�.�(9�V��ʐ|U�S�6R�'3:Hȑ�<ڠ�u_�#VC����s)�j�����������x������{�.�嶺�n��?A�MFIqA?c���[�0Ah�$[*�b[�Qє�f�������ǻW��ao��~2��n7]n���oO�wov��8Y��_�4�a��s6��M.˛����ie&��p���aI�&t�B4�Qk�5�n���fg��i�T(GF�C[[��j%�� ������Q�6�xv�(����{���dB^�J3���D�,.k�:�R��Ȯ�ʨۇ���Q-�>�fr�o�j[�\�`�Y쵞����U�n�8���y����'�     