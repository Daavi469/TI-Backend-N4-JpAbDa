INSERT INTO categoria
(nome, descricao)
VALUES
('Funko POP', 'Colecionáveis para decoração e coleção.'),
('Mangá', 'Mangás de diversos gêneros e franquias.'),
('Roupas', 'Camisetas e peças com temática geek.'),
('HQ', 'Histórias em quadrinhos e super-heróis.'),
('Filmes', 'Filmes e mídia relacionados à cultura geek.');

INSERT INTO cliente
(nome, email, senha, telefone, endereco)
VALUES
('Davi Angelo', 'davi@email.com', '123456', '88999990001', 'Rua Principal, 100'),
('Joao Pedro', 'joao@email.com', '123456', '88999990002', 'Rua das Flores, 200'),
('Abner Silva', 'abner@email.com', '123456', '88999990003', 'Avenida Central, 300'),
('Carlos Souza', 'carlos@email.com', '123456', '88999990004', 'Rua Brasil, 400'),
('Mariana Lima', 'mariana@email.com', '123456', '88999990005', 'Rua das Palmeiras, 500');

INSERT INTO produto
(nome, descricao, preco, quantidade_estoque, marca, id_categoria)
VALUES
('Funko Homem-Aranha', 'Funko POP do Homem-Aranha', 79.90, 15, 'Funko POP', 1),
('Funko Batman', 'Funko POP do Batman', 79.90, 10, 'Funko POP', 1),
('Mangá Demon Slayer', 'Volume de Kimetsu no Yaiba', 39.90, 8, 'Panini', 2),
('Mangá Naruto', 'Volume de Naruto', 39.90, 6, 'Panini', 2),
('Camiseta Naruto', 'Camiseta com estampa de Naruto', 99.90, 20, 'Nipon', 3),
('Camiseta Dragon Ball', 'Camiseta com estampa de Dragon Ball', 99.90, 12, 'Nipon', 3),
('HQ Homem-Aranha', 'HQ do Homem-Aranha', 49.90, 25, 'Panini', 4),
('HQ Batman', 'HQ do Batman', 49.90, 18, 'Panini', 4),
('Filme Homem-Aranha', 'Filme do Homem-Aranha', 29.90, 14, 'Sony', 5),
('Filme Batman', 'Filme do Batman', 29.90, 30, 'Warner', 5);

INSERT INTO pedido
(data_pedido, status, valor_total, id_cliente)
VALUES
('2026-09-18', 'Pago', 179.80, 1),
('2026-09-18', 'Pendente', 79.80, 2),
('2026-09-19', 'Enviado', 149.70, 3),
('2026-09-20', 'Pago', 109.80, 4),
('2026-09-20', 'Cancelado', 99.90, 5);

INSERT INTO item_pedido
(quantidade, preco_unitario, id_pedido, id_produto)
VALUES
(1, 79.90, 1, 1),
(1, 99.90, 1, 5),
(2, 39.90, 2, 3),
(3, 49.90, 3, 7),
(1, 79.90, 4, 2),
(1, 29.90, 4, 9),
(1, 99.90, 5, 6);

INSERT INTO pagamento
(id_pedido, data_pagamento, valor, status)
VALUES
(1, '2026-09-18', 179.80, 'Aprovado'),
(2, NULL, 79.80, 'Pendente'),
(3, '2026-09-19', 149.70, 'Aprovado'),
(4, '2026-09-20', 109.80, 'Aprovado'),
(5, NULL, 99.90, 'Cancelado');