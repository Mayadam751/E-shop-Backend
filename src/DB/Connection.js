import mysql from 'mysql2'

const connection=mysql.createConnection({
    user: "root",
    password: '',
    host: 'localhost',
    database: 't-shirts-e-shop'
})

export default connection