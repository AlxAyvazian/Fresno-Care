import { Router, type IRouter } from "express";
import healthRouter from "./health";
import priceFinderRouter from "./priceFinder";

const router: IRouter = Router();

router.use(healthRouter);
router.use(priceFinderRouter);

export default router;
