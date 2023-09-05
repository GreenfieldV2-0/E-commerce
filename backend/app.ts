import express, { Express, json, urlencoded } from 'express';
import cors from 'cors';

//import routeProd from '../backend/routes/product'
const app: Express = express();

app.use(cors());
app.use(json());
app.use(urlencoded({ extended: true }));
// Import products route

//app.use('/api/orders',routeOrder)

// use path for controller methods

export default app;