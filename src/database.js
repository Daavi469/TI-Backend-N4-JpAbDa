import Database from "better-sqlite3";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const databasePath = fileURLToPath(
  new URL("../DataBase/geek-store.db", import.meta.url),
);
const database = new Database(databasePath);

database.pragma("foreign_keys = ON");

const hasTables = database
  .prepare("SELECT 1 FROM sqlite_master WHERE type = 'table' LIMIT 1")
  .get();

if (!hasTables) {
  const schema = readFileSync(
    new URL("../DataBase/create_tables.sql", import.meta.url),
    "utf8",
  );
  const seedData = readFileSync(
    new URL("../DataBase/insert_data.sql", import.meta.url),
    "utf8",
  );

  database.exec(schema);
  database.exec(seedData);
}

export default database;
