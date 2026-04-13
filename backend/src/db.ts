import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host:     process.env.DB_HOST     || '165.227.82.28',
    user:     process.env.DB_USER     || 'appuser',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME     || 'gamechop',
    waitForConnections: true,
    connectionLimit:    10
});

export default pool;