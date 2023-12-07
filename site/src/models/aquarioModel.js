var database = require("../database/config");

function buscarPlantacaoPorEmpresa(empresaId) {

  instrucaoSql = `Select * FROM plantacao where fkEmpresa = ${empresaId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(idUsuario, NomePlantacao, QtdAduino) {
  
  instrucaoSql = `insert into plantacao values (null, ${idUsuario}, "${NomePlantacao}", ${QtdAduino})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarPlantacaoPorEmpresa,
  cadastrar
}
