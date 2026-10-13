import express from "express";
import { fileURLToPath } from "node:url";
import { router as viewRouter } from "./routes/view_routes.js";
import { router as apiRouter } from "./routes/api_routes.js";
import { mdebug } from "./middlewares/debug_middlewares.js";
import { notFound, errorHandler } from "./middlewares/errors_middlewares.js";
import { mcors } from "./middlewares/mcors_middewares.js";

const app = express();

app.set("view engine", "ejs");
app.set("views", fileURLToPath(new URL("../views/", import.meta.url)));

app.use(mcors);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(fileURLToPath(new URL("../public/", import.meta.url))));
app.use(mdebug);

app.use(viewRouter);
app.use("/api", apiRouter);

app.use(notFound);
app.use(errorHandler);

export default app;
