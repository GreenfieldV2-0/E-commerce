import mysql, {Connection} from "mysql2";
const db = {
  host: 'localhost',
  user: 'root',
  password:'root',
  database:'zara',
};

const connection: Connection = mysql.createConnection(db);
connection.connect((error) => {
  if (error) {
    console.error("Failed to connect to database:", error);
    return;
  }
  console.log("Database connected successfully!");
});

export default connection;