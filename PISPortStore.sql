PGDMP                      }            PISportStore    17.5    17.5 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    33297    PISportStore    DATABASE     t   CREATE DATABASE "PISportStore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE "PISportStore";
                     postgres    false            �            1259    33319    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome_cliente character varying(100),
    cpf_cliente character varying(11),
    data_nascimento_cliente date,
    data_cadastro date,
    sexo_cliente character(1)
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    33318    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public               postgres    false    222            �           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public               postgres    false    221            �            1259    33299    tb_funcionario    TABLE     �  CREATE TABLE public.tb_funcionario (
    id_funcionario integer NOT NULL,
    nome_funcionario character varying(100),
    cpf_funcionario character varying(11),
    data_nascimento_funcionario date,
    senha_funcionario character varying(100),
    numero_nis_funcionario character varying(11),
    funcionario_ativo character varying(3),
    sexo_funcionario character(1),
    data_cadastro date,
    telefone_funcionario character varying(11)
);
 "   DROP TABLE public.tb_funcionario;
       public         heap r       postgres    false            �            1259    33298    funcionario_id_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.funcionario_id_funcionario_seq;
       public               postgres    false    218            �           0    0    funcionario_id_funcionario_seq    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.tb_funcionario.id_funcionario;
          public               postgres    false    217            �            1259    33308    produtos    TABLE     F  CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    codigo_produto character varying,
    nome_produto character varying(100),
    sexo_produto character(1),
    tamanho_produto character varying(10),
    cor_produto character varying(50),
    quantidade_produto integer,
    preco_produto double precision
);
    DROP TABLE public.produtos;
       public         heap r       postgres    false            �            1259    33307    produtos_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtos_id_produto_seq;
       public               postgres    false    220            �           0    0    produtos_id_produto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;
          public               postgres    false    219            �            1259    33328    vendas    TABLE       CREATE TABLE public.vendas (
    fk_funcionario_id_funcionario integer,
    fk_produtos_id_produto integer,
    fk_clientes_id_cliente integer,
    data_da_venda date,
    id_venda integer NOT NULL,
    quantidade_venda integer,
    preco_total_vendido double precision
);
    DROP TABLE public.vendas;
       public         heap r       postgres    false            �            1259    33327    vendas_id_venda_seq    SEQUENCE     �   CREATE SEQUENCE public.vendas_id_venda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.vendas_id_venda_seq;
       public               postgres    false    224            �           0    0    vendas_id_venda_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.vendas_id_venda_seq OWNED BY public.vendas.id_venda;
          public               postgres    false    223            2           2604    33322    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    222    221    222            1           2604    33311    produtos id_produto    DEFAULT     z   ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);
 B   ALTER TABLE public.produtos ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    220    219    220            0           2604    33302    tb_funcionario id_funcionario    DEFAULT     �   ALTER TABLE ONLY public.tb_funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionario_id_funcionario_seq'::regclass);
 L   ALTER TABLE public.tb_funcionario ALTER COLUMN id_funcionario DROP DEFAULT;
       public               postgres    false    217    218    218            3           2604    33331    vendas id_venda    DEFAULT     r   ALTER TABLE ONLY public.vendas ALTER COLUMN id_venda SET DEFAULT nextval('public.vendas_id_venda_seq'::regclass);
 >   ALTER TABLE public.vendas ALTER COLUMN id_venda DROP DEFAULT;
       public               postgres    false    223    224    224            �          0    33319    clientes 
   TABLE DATA              COPY public.clientes (id_cliente, nome_cliente, cpf_cliente, data_nascimento_cliente, data_cadastro, sexo_cliente) FROM stdin;
    public               postgres    false    222   �0       �          0    33308    produtos 
   TABLE DATA           �   COPY public.produtos (id_produto, codigo_produto, nome_produto, sexo_produto, tamanho_produto, cor_produto, quantidade_produto, preco_produto) FROM stdin;
    public               postgres    false    220   �4       �          0    33299    tb_funcionario 
   TABLE DATA           �   COPY public.tb_funcionario (id_funcionario, nome_funcionario, cpf_funcionario, data_nascimento_funcionario, senha_funcionario, numero_nis_funcionario, funcionario_ativo, sexo_funcionario, data_cadastro, telefone_funcionario) FROM stdin;
    public               postgres    false    218   �6       �          0    33328    vendas 
   TABLE DATA           �   COPY public.vendas (fk_funcionario_id_funcionario, fk_produtos_id_produto, fk_clientes_id_cliente, data_da_venda, id_venda, quantidade_venda, preco_total_vendido) FROM stdin;
    public               postgres    false    224   �;       �           0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, true);
          public               postgres    false    221            �           0    0    funcionario_id_funcionario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.funcionario_id_funcionario_seq', 1, true);
          public               postgres    false    217            �           0    0    produtos_id_produto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.produtos_id_produto_seq', 1, false);
          public               postgres    false    219            �           0    0    vendas_id_venda_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.vendas_id_venda_seq', 17, true);
          public               postgres    false    223            =           2606    33326 !   clientes clientes_cpf_cliente_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_cliente_key UNIQUE (cpf_cliente);
 K   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cpf_cliente_key;
       public                 postgres    false    222            ?           2606    33324    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    222            5           2606    33306 E   tb_funcionario funcionario_cpf_funcionario_numero_nis_funcionario_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.tb_funcionario
    ADD CONSTRAINT funcionario_cpf_funcionario_numero_nis_funcionario_key UNIQUE (cpf_funcionario, numero_nis_funcionario);
 o   ALTER TABLE ONLY public.tb_funcionario DROP CONSTRAINT funcionario_cpf_funcionario_numero_nis_funcionario_key;
       public                 postgres    false    218    218            7           2606    33304    tb_funcionario funcionario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tb_funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);
 I   ALTER TABLE ONLY public.tb_funcionario DROP CONSTRAINT funcionario_pkey;
       public                 postgres    false    218            9           2606    33317 $   produtos produtos_codigo_produto_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_codigo_produto_key UNIQUE (codigo_produto);
 N   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_codigo_produto_key;
       public                 postgres    false    220            ;           2606    33315    produtos produtos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public                 postgres    false    220            A           2606    33333    vendas vendas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id_venda);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public                 postgres    false    224            B           2606    33334    vendas fk_vendas_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_1 FOREIGN KEY (fk_funcionario_id_funcionario) REFERENCES public.tb_funcionario(id_funcionario);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT fk_vendas_1;
       public               postgres    false    4663    218    224            C           2606    33339    vendas fk_vendas_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_2 FOREIGN KEY (fk_produtos_id_produto) REFERENCES public.produtos(id_produto);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT fk_vendas_2;
       public               postgres    false    4667    224    220            D           2606    33344    vendas fk_vendas_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_vendas_3 FOREIGN KEY (fk_clientes_id_cliente) REFERENCES public.clientes(id_cliente);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT fk_vendas_3;
       public               postgres    false    222    4671    224            �   �  x�e��n�6��w��/��?�!�c;Nة13�膞ac��R� ��]e��v^,��F�����9��1�վu=�����qQVu#e���
*
V��m
Z��ã�V��Z{6�kX�������o|t�y2>2"�//�Z���4ٻ�M�r�xH��5*x��'�U�r�
 +hU�f-P�Ǳ�En]?hX�:\�)�{�E�7���ɑ�;�hX�&@�z|	[I��m5����aad��'y�VR��j�����F%�+X�Vb���/�qC��;���p�������=!�m�1ƹeY�Y�����L�ï�~6��i(�X����B4Wp��Α��_��L��Q��\	輾���v���Qe4�̤*8�X�ő���7q���:��.��dg��f*&C�a�\eZ�;�q����f$&C�0y�oL���7��Fjfb6��b����˷g��������2�@����u'�ɍ�8C��L�2&^��Yx1�L��ߣ!{�w$�b5K��tѼ'8<�!9q�f��jW�aS�E����1&G���3(vE$��
����Yw&z��tEK��,�6���(.���y�5!xj�?�s��p�&�7��mf*5�F�́�~?b˜�8�E�+��d�ܼ�%ag:=`��6�0�+#x�aXs�,�0��d�/���`FJ>��)\X�L�b�F{�0�"*>(�e�����K���aN*UY�Ԡ�dֺx�w��8��>�0���lx�1�d]l(%�Nw6�aؕE���S�p��ZC-�c�/�06�O�e���Oa��X�����y�DpU%_���<ە�᠓+~�gk<$F�*�B7���I���s���d��i�wKH�l�Qj�""x%&��i>@w�`bUO���Q%[�F�UFIa��"~U�_���-C3����f���a�A      �   N  x�e����0����T�ǆf#U�BI6�����u85$���T=��Ч��:�I�R����|�X�bSE��ͳuC����9�Gx�ֶGP����TP`3�!_���t�`�N�=ɗP9=X��r�}N���z@��]kj�GX޴"�Y�D����6�~h\��4�����8�c(��z�m�7�k��ϗSB�i(J��	Z�(�x�?��.�}}rd+�"򕅢�ڵ�=̀��r���;/$�� �1r��3�ڣo?�?,_�֞�?g*�!�ߴ퀼(�D %>�Z��ИN������*H#&(���IZ`���J��H��x��(����45�X��I���&M��n�n��pr�~*��b!� SL
�~��G@�Y a�1�y����'�RHSF��"����A�oS�K('g���c�39���M�Z���,X�&�Gs��g�,u_74b)mMЋ;�/�uZ_�]���"Jn���ؙs�|uGb�n�P���~��H���u2C�~7d_*P3�$
Krkm=�M��g������e�q����$�^SؐH�;J�F*ۘ�9�G~]Kt���F���c�/;� p      �   �  x��V�n�F<��?����s�8� �1�=�����ŀ�� ��S�����P���:��Ɇ�,VwU�x�nK�øy&!�6�y �Ѓ��H��t0!�c����UAE��U���o�{�@�<�@H�;k���+�7�S�0��$��)�åBA+N18E���4��*sA����n^�)���uA|�oFb���#�N7~LN`��5�u4V#�j%�*�S&C�?���qCsb��6��I�x�䆺AY�2�sdF`rR ��QK]2X+�9����w��R�/󖶙��)}"�"�Ƒ���O%�����2��@AIN撵U`���8���֎g�a����ߕ��3��5�8���2���%���X���%"�TC�I)y��0���{�M�LbE� c�A��h=�\�XL\�����6�����F܏��<�?��$V<l�4Kf�g\�.��z�m�X��P��$](�?����Y۱��h7�'��_��<�24�r �X�)��T
I����lb!��Iy�j'���i�ߦ���'��A#�0�p2�RQEe_cfXb�2��(+8�"��{�Hzq�O�?N���x��]tL+�A������Uf�SQIC�f$y��1Z��Fw%�SՆ�4��"d�@�N�"�va��s�k�b����$2�=���m�L���"��Z�r�!$�
!k���:@���jn�>�m�����1����-s^��`h��D�Sb:��=�d�6�!�-S|�\U{xo����q���9vl�⢞�%rP(J��d�Qc�U9@��R��烕-y�$k�u�����X�'�eS�iI���@�Pt
�'�U	YJ���Ϻ�����[��Z�?���*�e- ��������I��U*��jz�q�ZÐ�V��������X��X򸭬�H;�X�_6���_���eC~��X���qK�O�˘���y��p ���o//��\����b�wts��c�JN��W��uo��x�P';>L4� ��Ar�T9X��p�9���x�c����eG�wc<q_.<ö���J�YO2�d�u�cq�����4}M�EЌ�q���g�>O�u��6]��Y���F�6]f_~� �N��l���ލ[��xb� ��(4C���ѱ �@6y���@�3����e'�{_�q?F�_<�	���,UY��L�}����6P)�Z�՟�Z�
-�_���_�;��      �   |   x�m�A!��_fc#��e�����et�be��AhS�Z\\P����`D��3]=� 7����Mz^��a�x���̘��Q����+M���XF���r��A���~�F�dS���:0-     