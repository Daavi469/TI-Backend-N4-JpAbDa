// Exemplo de Middleware Global customizado
export const mdebug = (request, response, next) => {
  const now = new Date().toLocaleString("pt-BR", {
    dateStyle: "short",
    timeStyle: "short",
  });
  const body = { ...request.body };
  for (const key of Object.keys(body)) {
    if (/senha|password/i.test(key)) {
      body[key] = "[REDACTED]";
    }
  }

  console.log();
  console.log(`[${now}] IP: ${request.ip}`);
  console.log(`Método HTTP: ${request.method} URL: ${request.url}`);
  console.log("Body:", body);

  next(); // para ir adiante
};
