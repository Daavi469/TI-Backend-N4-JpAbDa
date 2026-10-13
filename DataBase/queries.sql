SELECT * FROM produto;

SELECT * FROM pagamento;

SELECT * FROM item_pedido;

SELECT * FROM cliente;

SELECT * FROM pedido;

SELECT * FROM produto
WHERE preco >= 50;

SELECT * FROM produto
ORDER BY preco DESC;

SELECT
    cliente.nome AS cliente,
    pedido.id_pedido,
    pedido.data_pedido,
    pedido.status,
    pedido.valor_total
FROM cliente
INNER JOIN pedido
    ON pedido.id_cliente = cliente.id_cliente
ORDER BY pedido.data_pedido;

SELECT
    pedido.id_pedido,
    produto.nome AS produto,
    item_pedido.quantidade,
    item_pedido.preco_unitario,
    item_pedido.quantidade * item_pedido.preco_unitario AS subtotal
FROM pedido
INNER JOIN item_pedido
    ON item_pedido.id_pedido = pedido.id_pedido
INNER JOIN produto
    ON produto.id_produto = item_pedido.id_produto
ORDER BY pedido.id_pedido;

SELECT
    categoria.nome AS categoria,
    COUNT(produto.id_produto) AS quantidade_produtos
FROM categoria
LEFT JOIN produto
    ON produto.id_categoria = categoria.id_categoria
GROUP BY categoria.id_categoria, categoria.nome
ORDER BY quantidade_produtos DESC;