import express from 'express'
import { indexRouter } from './src/index.router.js'
import connection from './src/DB/Connection.js'



const app= express()
const port = 5000

indexRouter(app,express)
app.listen(port,()=>{
    console.log(`Server is running ${port}`);
})

connection.connect((error)=>{
    if (error){
        console.log(error);
    } else {
        console.log('mySQL connected..');
    }
})