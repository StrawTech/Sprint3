var database = require("../database/config");

function buscarPlantacaoPorEmpresa(empresaId) {

  instrucaoSql = `SELECT
  endereco.bairro AS Bairro,
  endereco.cidade AS Cidade,
  plantacao.nome AS NomePlantacao,
  endereco.rua AS Rua,
  endereco.numero AS Numero
FROM
  endereco
JOIN
  plantacao ON endereco.fkPlantacao = plantacao.idPlantacao
WHERE
  plantacao.fkEmpresa = ${empresaId}`;

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
