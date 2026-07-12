import { Router, type IRouter } from "express";
import healthRouter from "./health";
import reportsRouter from "./reports";
import adminReportsRouter from "./adminReports";

const router: IRouter = Router();

router.use(healthRouter);
router.use(reportsRouter);
router.use(adminReportsRouter);

export default router;
