PGDMP      '                }            lojasportstore    17.5    17.5 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24886    lojasportstore    DATABASE     t   CREATE DATABASE lojasportstore WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE lojasportstore;
                     postgres    false            �            1259    24906    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome_cliente character varying(100) NOT NULL,
    cpf_cliente character varying(11) NOT NULL,
    data_nascimento_cliente date NOT NULL,
    data_cadastro date NOT NULL
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    24905    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public               postgres    false    222            �           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public               postgres    false    221            �            1259    24888    funcionario    TABLE     �  CREATE TABLE public.funcionario (
    id_funcionario integer NOT NULL,
    nome_funcionario character varying(100) NOT NULL,
    cpf_funcionario character varying(11) NOT NULL,
    data_nascimento_funcionario date NOT NULL,
    senha_funcionario character varying(100) NOT NULL,
    numero_nis character varying(11) NOT NULL,
    funcionario_ativo character varying(3) NOT NULL,
    sexo character(1) NOT NULL,
    data_de_cadastro date NOT NULL,
    numero_telefone character varying(11) NOT NULL
);
    DROP TABLE public.funcionario;
       public         heap r       postgres    false            �            1259    24887    funcionario_id_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.funcionario_id_funcionario_seq;
       public               postgres    false    218            �           0    0    funcionario_id_funcionario_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.funcionario.id_funcionario;
          public               postgres    false    217            �            1259    24897    produtos    TABLE     �  CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    codigo_produto character varying(20) NOT NULL,
    nome_produto character varying(100) NOT NULL,
    sexo_produto character(1) NOT NULL,
    tamanho_produto character varying(5) NOT NULL,
    cor_produto character varying(20) NOT NULL,
    quantidade_produto integer NOT NULL,
    preco_produto double precision NOT NULL
);
    DROP TABLE public.produtos;
       public         heap r       postgres    false            �            1259    24896    produtos_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtos_id_produto_seq;
       public               postgres    false    220            �           0    0    produtos_id_produto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;
          public               postgres    false    219            �            1259    24915 $   vendas_funcionario_produtos_clientes    TABLE       CREATE TABLE public.vendas_funcionario_produtos_clientes (
    fk_funcionario_id_funcionario integer,
    fk_produtos_id_produto integer,
    fk_clientes_id_cliente integer,
    id_vendas integer NOT NULL,
    quantidade_vendida integer,
    preco_total_vendido double precision
);
 8   DROP TABLE public.vendas_funcionario_produtos_clientes;
       public         heap r       postgres    false            �            1259    24914 2   vendas_funcionario_produtos_clientes_id_vendas_seq    SEQUENCE     �   CREATE SEQUENCE public.vendas_funcionario_produtos_clientes_id_vendas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.vendas_funcionario_produtos_clientes_id_vendas_seq;
       public               postgres    false    224            �           0    0 2   vendas_funcionario_produtos_clientes_id_vendas_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.vendas_funcionario_produtos_clientes_id_vendas_seq OWNED BY public.vendas_funcionario_produtos_clientes.id_vendas;
          public               postgres    false    223            2           2604    24909    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    221    222    222            0           2604    24891    funcionario id_funcionario    DEFAULT     �   ALTER TABLE ONLY public.funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionario_id_funcionario_seq'::regclass);
 I   ALTER TABLE public.funcionario ALTER COLUMN id_funcionario DROP DEFAULT;
       public               postgres    false    217    218    218            1           2604    24900    produtos id_produto    DEFAULT     z   ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);
 B   ALTER TABLE public.produtos ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    219    220    220            3           2604    24918 .   vendas_funcionario_produtos_clientes id_vendas    DEFAULT     �   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes ALTER COLUMN id_vendas SET DEFAULT nextval('public.vendas_funcionario_produtos_clientes_id_vendas_seq'::regclass);
 ]   ALTER TABLE public.vendas_funcionario_produtos_clientes ALTER COLUMN id_vendas DROP DEFAULT;
       public               postgres    false    223    224    224            �          0    24906    clientes 
   TABLE DATA           q   COPY public.clientes (id_cliente, nome_cliente, cpf_cliente, data_nascimento_cliente, data_cadastro) FROM stdin;
    public               postgres    false    222   �5       �          0    24888    funcionario 
   TABLE DATA           �   COPY public.funcionario (id_funcionario, nome_funcionario, cpf_funcionario, data_nascimento_funcionario, senha_funcionario, numero_nis, funcionario_ativo, sexo, data_de_cadastro, numero_telefone) FROM stdin;
    public               postgres    false    218   �5       �          0    24897    produtos 
   TABLE DATA           �   COPY public.produtos (id_produto, codigo_produto, nome_produto, sexo_produto, tamanho_produto, cor_produto, quantidade_produto, preco_produto) FROM stdin;
    public               postgres    false    220   y7       �          0    24915 $   vendas_funcionario_produtos_clientes 
   TABLE DATA           �   COPY public.vendas_funcionario_produtos_clientes (fk_funcionario_id_funcionario, fk_produtos_id_produto, fk_clientes_id_cliente, id_vendas, quantidade_vendida, preco_total_vendido) FROM stdin;
    public               postgres    false    224   �7       �           0    0    clientes_id_cliente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, false);
          public               postgres    false    221            �           0    0    funcionario_id_funcionario_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.funcionario_id_funcionario_seq', 27, true);
          public               postgres    false    217            �           0    0    produtos_id_produto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.produtos_id_produto_seq', 1, false);
          public               postgres    false    219            �           0    0 2   vendas_funcionario_produtos_clientes_id_vendas_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.vendas_funcionario_produtos_clientes_id_vendas_seq', 1, false);
          public               postgres    false    223            =           2606    24913 ,   clientes clientes_id_cliente_cpf_cliente_key 
   CONSTRAINT     z   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_cliente_cpf_cliente_key UNIQUE (id_cliente, cpf_cliente);
 V   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_id_cliente_cpf_cliente_key;
       public                 postgres    false    222    222            ?           2606    24911    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    222            5           2606    24895 :   funcionario funcionario_cpf_funcionario_id_funcionario_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_cpf_funcionario_id_funcionario_key UNIQUE (cpf_funcionario, id_funcionario);
 d   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_cpf_funcionario_id_funcionario_key;
       public                 postgres    false    218    218            7           2606    24893    funcionario funcionario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public                 postgres    false    218            9           2606    24904 $   produtos produtos_codigo_produto_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_codigo_produto_key UNIQUE (codigo_produto);
 N   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_codigo_produto_key;
       public                 postgres    false    220            ;           2606    24902    produtos produtos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public                 postgres    false    220            A           2606    24920 N   vendas_funcionario_produtos_clientes vendas_funcionario_produtos_clientes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes
    ADD CONSTRAINT vendas_funcionario_produtos_clientes_pkey PRIMARY KEY (id_vendas);
 x   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes DROP CONSTRAINT vendas_funcionario_produtos_clientes_pkey;
       public                 postgres    false    224            B           2606    24921 N   vendas_funcionario_produtos_clientes fk_vendas_funcionario_produtos_clientes_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes
    ADD CONSTRAINT fk_vendas_funcionario_produtos_clientes_1 FOREIGN KEY (fk_funcionario_id_funcionario) REFERENCES public.funcionario(id_funcionario);
 x   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes DROP CONSTRAINT fk_vendas_funcionario_produtos_clientes_1;
       public               postgres    false    218    224    4663            C           2606    24926 N   vendas_funcionario_produtos_clientes fk_vendas_funcionario_produtos_clientes_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes
    ADD CONSTRAINT fk_vendas_funcionario_produtos_clientes_2 FOREIGN KEY (fk_produtos_id_produto) REFERENCES public.produtos(id_produto);
 x   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes DROP CONSTRAINT fk_vendas_funcionario_produtos_clientes_2;
       public               postgres    false    4667    220    224            D           2606    24931 N   vendas_funcionario_produtos_clientes fk_vendas_funcionario_produtos_clientes_3    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes
    ADD CONSTRAINT fk_vendas_funcionario_produtos_clientes_3 FOREIGN KEY (fk_clientes_id_cliente) REFERENCES public.clientes(id_cliente);
 x   ALTER TABLE ONLY public.vendas_funcionario_produtos_clientes DROP CONSTRAINT fk_vendas_funcionario_produtos_clientes_3;
       public               postgres    false    224    222    4671            �      x������ � �      �   v  x����n�0�g�)���}��=v�)Yڱ�CB���ҡ��W��5/�s�
N
Y��q��O� ����]U2?��kGD��R�80܂ 	98�5.o��Ny�Q�r�g���T����qM�pN+�-h
dYl�U�,�׏Ͷ�(���Ґ��\
>ӎ�[��FhX�T+�;y=�V�J����(��ֹb�q�@��G�Y\LRE~�Uu�OM�`��"K_]����̫�W�:ø����QW�ׄ4���z�מ4}p�>������%��2������+�N����*�	Z�N��C=��n�����zaX��
ر�X��	v�PrJ_b�S�I�<g$�]�d;�G�K��s��p� 4��޴�8�nCF�0W�fi�ʗJ�/�BU�      �      x������ � �      �      x������ � �     