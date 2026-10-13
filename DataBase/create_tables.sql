PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS pagamento;
DROP TABLE IF EXISTS item_pedido;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    telefone TEXT,
    endereco TEXT
);

CREATE TABLE produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INTEGER NOT NULL,
    marca TEXT,
    id_categoria INTEGER NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    data_pedido DATE NOT NULL,
    status TEXT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);

CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL UNIQUE,
    data_pagamento DATE,
    valor DECIMAL(10,2) NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
);