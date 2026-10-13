import { Router } from "express";
import database from "../database.js";

const router = Router();

const productQuery = `
  SELECT
    produto.id_produto AS id,
    produto.nome,
    produto.descricao,
    produto.preco,
    produto.quantidade_estoque AS estoque,
    categoria.nome AS categoria_nome
  FROM produto
  LEFT JOIN categoria ON categoria.id_categoria = produto.id_categoria
`;

const getProducts = database.prepare(`${productQuery} ORDER BY produto.nome`);
const getProductById = database.prepare(
  `${productQuery} WHERE produto.id_produto = ?`,
);
const getCategories = database.prepare(`
  SELECT id_categoria AS id, nome, descricao
  FROM categoria
  ORDER BY nome
`);

router.get("/", (req, res) => {
  res.render("index", { produtos: getProducts.all().slice(0, 4) });
});

router.get("/produtos", (req, res) => {
  const search =
    typeof req.query.busca === "string" ? req.query.busca.trim() : "";
  const categoryId = Number.parseInt(req.query.categoria_id, 10) || 0;
  const products = database
    .prepare(
      `
      ${productQuery}
      WHERE (? = '' OR produto.nome LIKE ? OR COALESCE(produto.descricao, '') LIKE ?)
        AND (? = 0 OR produto.id_categoria = ?)
      ORDER BY produto.nome
    `,
    )
    .all(search, `%${search}%`, `%${search}%`, categoryId, categoryId);

  res.render("produtos", { produtos: products, busca: search });
});

router.get("/produtos/:id", (req, res) => {
  const productId = Number.parseInt(req.params.id, 10);
  const product = Number.isInteger(productId)
    ? getProductById.get(productId)
    : null;

  if (!product) {
    return res.status(404).send("Produto não encontrado.");
  }

  return res.render("produto-detalhe", { produto: product });
});

router.get("/categorias", (req, res) => {
  res.render("categorias", { categorias: getCategories.all() });
});

router.get("/login", (req, res) => {
  res.render("login", { erro: null });
});

router.get("/cadastro", (req, res) => {
  res.render("cadastro", { erro: null });
});

router.get("/carrinho", (req, res) => {
  res.render("carrinho", { itens: [], total: 0 });
});

export { router };
