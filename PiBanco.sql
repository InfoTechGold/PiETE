PGDMP  3    !                }            PISport    17.5    17.5 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24982    PISport    DATABASE     o   CREATE DATABASE "PISport" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE "PISport";
                     postgres    false            �            1259    24983    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome_cliente character varying(70),
    sexo_cliente character(1),
    data_nasc date,
    cpf character varying(11)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    24986    compra    TABLE     �   CREATE TABLE public.compra (
    fk_cliente_id_cliente integer,
    fk_produto_id_produto integer,
    id_compra integer NOT NULL
);
    DROP TABLE public.compra;
       public         heap r       postgres    false            �            1259    24989    produto    TABLE       CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    quantidade_produto integer,
    tamanho_produto character varying(3),
    sexo_produto character(1),
    cor_produto character varying(20),
    valor_produto integer,
    codigo_produto character varying(14)
);
    DROP TABLE public.produto;
       public         heap r       postgres    false            �            1259    24992    usuario    TABLE     �  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome_usuario character varying(70),
    cpf_usuario character varying(11),
    senha_usuario character varying(100),
    data_nascimento_usuario date,
    numero_nis_usuario character varying(11),
    data_cadastrado date,
    funcionario_ativo character varying(3),
    sexo_usuario character(1),
    telefone_usuario character varying(11)
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    25029    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome_usuario character varying(70),
    cpf_usuario character varying(11),
    senha_usuario character varying(100),
    data_nascimento_usuario date,
    numero_nis_usuario character varying(11),
    data_cadastrado date,
    funcionario_ativo character varying(3),
    sexo_usuario character(1),
    telefone_usuario character varying(11)
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    25028    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public               postgres    false    223            �           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public               postgres    false    222            �            1259    24995    vendas    TABLE     �   CREATE TABLE public.vendas (
    fk_usuario_id_usuario integer,
    fk_produto_id_produto integer,
    id_venda integer NOT NULL,
    quantidade_vendido integer,
    data_venda timestamp without time zone,
    codigo_produto character varying(14)
);
    DROP TABLE public.vendas;
       public         heap r       postgres    false            5           2604    25032    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public               postgres    false    223    222    223            �          0    24983    cliente 
   TABLE DATA           Y   COPY public.cliente (id_cliente, nome_cliente, sexo_cliente, data_nasc, cpf) FROM stdin;
    public               postgres    false    217   $*       �          0    24986    compra 
   TABLE DATA           Y   COPY public.compra (fk_cliente_id_cliente, fk_produto_id_produto, id_compra) FROM stdin;
    public               postgres    false    218   n+       �          0    24989    produto 
   TABLE DATA           �   COPY public.produto (id_produto, quantidade_produto, tamanho_produto, sexo_produto, cor_produto, valor_produto, codigo_produto) FROM stdin;
    public               postgres    false    219   �+       �          0    24992    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, nome_usuario, cpf_usuario, senha_usuario, data_nascimento_usuario, numero_nis_usuario, data_cadastrado, funcionario_ativo, sexo_usuario, telefone_usuario) FROM stdin;
    public               postgres    false    220   <,       �          0    25029    usuarios 
   TABLE DATA           �   COPY public.usuarios (id_usuario, nome_usuario, cpf_usuario, senha_usuario, data_nascimento_usuario, numero_nis_usuario, data_cadastrado, funcionario_ativo, sexo_usuario, telefone_usuario) FROM stdin;
    public               postgres    false    223   �.       �          0    24995    vendas 
   TABLE DATA           �   COPY public.vendas (fk_usuario_id_usuario, fk_produto_id_produto, id_venda, quantidade_vendido, data_venda, codigo_produto) FROM stdin;
    public               postgres    false    221   }1       �           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 19, true);
          public               postgres    false    222            7           2606    24999    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    217            9           2606    25001    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public                 postgres    false    218            A           2606    25040    usuarios cpf_unico 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT cpf_unico UNIQUE (cpf_usuario);
 <   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT cpf_unico;
       public                 postgres    false    223            C           2606    25042    usuarios numero_nis_unico 
   CONSTRAINT     b   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT numero_nis_unico UNIQUE (numero_nis_usuario);
 C   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT numero_nis_unico;
       public                 postgres    false    223            ;           2606    25003    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    219            E           2606    25044    usuarios telefone_unico 
   CONSTRAINT     ^   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT telefone_unico UNIQUE (telefone_usuario);
 A   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT telefone_unico;
       public                 postgres    false    223            =           2606    25005    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    220            G           2606    25034    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    223            ?           2606    25007    vendas vendas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id_venda);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public                 postgres    false    221            H           2606    25008    compra fk_compra_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_2 FOREIGN KEY (fk_cliente_id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT fk_compra_2;
       public               postgres    false    217    4663    218            I           2606    25013    compra fk_compra_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_3 FOREIGN KEY (fk_produto_id_produto) REFERENCES public.produto(id_produto) ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT fk_compra_3;
       public               postgres    false    218    219    4667            J           2606    25018    vendas fk_vendas_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_2 FOREIGN KEY (fk_usuario_id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT fk_vendas_2;
       public               postgres    false    221    220    4669            K           2606    25023    vendas fk_vendas_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_3 FOREIGN KEY (fk_produto_id_produto) REFERENCES public.produto(id_produto) ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT fk_vendas_3;
       public               postgres    false    219    4667    221            �   :  x�=�KN�0���S��l�e/KKx�T���L�XJmp�.�G�b����������ėE����i�B�QV UQVu��L�m�}୍Ѻ4��#A�x�Q�d\JV��␰0v�dW(,dT)V���}��� �2��!e+!
�R@Ƌ�Up��{�k:��w'��E�RC�˒����}Z����8��t�7eJO�Bƫ�5pO��l�u>�w6:4(����k�����f�W�F�?���<5
�RA曆xi{*肟Rx������$T�Ґ�f�O���䲛BL�����D�R�'@�a�7��?�Dz�      �      x������ � �      �   �   x�E��
�0E�w>Ff�hӥ
vU(Bwn����� �z'v���Adtz�����0��9xF���3��ܑG`�����O����/��FE��N��}\2��H\Ը�|���eT�b�Z����(s��>4��A�
6)hHwL+�I�|� a���J3�      �   y  x�M�K��@���)r� ����4 � b�l\/���Yp֜����DJ�^�Z�����6���u�;�ls0�y
"4�{o��56s�BĈ�w6�50)҄n2���h݄f2��Ox �r �,<�e�������p�{)L���K.�e�(�8`%L8!O��]�d̄t��no48�&]�i|h�ڮ�sJɔщ����\.=�HF��&�έ��&��Ym�40�����m����{�r�_�|�Q�
b���=yo]a)�e�7���Z����7�~��Z�냛ց�����2~m������E`ghMQ���ZK�;g�C�Z��Q��	Ӂ�5�Ohu�[Q��M���4��x�.g���I�بSj��1��R���⤬�s���a���o�&���A#7��;�������/��; ��Ű�Mk]�Q怎\�nU{s������-��w���~2~[��d��`�(�KJ5�Wk��Xc�X�]K�[������X�y���N�UÐ������2�<��+�dTUz0�;a�����`Cbv�n�4���t��6Jگ2i�&~������[f���;� Ƙ��A���,S�E��;G�W�i=_Ů�c����������?���      �   �  x�]��N1��٧�����$��� B�2�?�J+���:]���X�w�r͝������C8{����{���XG��B���j��5����y��m���!�I�	5���(���fR8�����ep]4|���ro���N�)���]k�ZN��C�<�h<���nRf��q�W��PyW���
\��E��|a�(�TL�a昸9�%�H�]�H*v}zR~R�w��"��E���.��_�x]�~��f!�TB�D�d1�9���Rwy<!NF�F�����]�I��`���5>���&�/�xRN2H>�lZ��S!o���T������0����V?Y�]��n�ɹ���)��x^��:�#l@�h�vN�DS$#n�SU�&gr'��=Ю��y�H2�F5x�����ǯ�}=�F��̉l#k�"ג�ޑ���f��w��� u5Ѭ"}/�I�T:�q7�ź�;���6 C���Y&ab2̕��u�YR�g�a����ȵ8��
���op�;��f�w6^����
Z�T:Hq�����G�:����H�yo��m�0��� ������2���Ӎ��P��4Vc����m���+U�@�֨��[��{��ϱƨCX�č����?�2^������1��f�+�]P��O��Gi�,y%P��%���s�|i�~X~|��$�$�      �      x������ � �     