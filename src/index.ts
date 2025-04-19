import express from 'express';


const app: express.Application = express();
const port: string | number = process.env.PORT ?? 5000;
const host = process.env.HOST ?? 'localhost';

const startTime = Date.now();


app.get('/', (req: express.Request, res: express.Response) => {
    res.send('Hello World!');
});

app.listen(port, () => {
    const endTime = Date.now();
    const duration = endTime - startTime;
    console.log(`Server is running at http://${host}:${port}`);
    console.log(`Startup time: ${duration}ms`);
});


