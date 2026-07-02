//criação de variável de conexão 
const mysql = require('mysql2');
const db = mysql.createConnection({
    host:'localhost',
    user: 'root',
    senha: '',
    database: 'sistema_login'
});

db.connect((err)=>{
    if(err){
        console.log("Erro ao conectar", err);
    }else{
        console.log('Conectado ao MyQL');
    }
});

module.exports = db;