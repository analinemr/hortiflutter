class UserModel {
  String login;
  String senha;
  String nome; 
  String cpf;
  String email;
  String dataNascimento;
  String ?foto;

  UserModel({
    required this.login, //this. para encapsular a informação e utilizar posteriormente
    required this.senha,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.dataNascimento,
    this.foto,
  });

//Enviar para API
Map<String, dynamic> toJson(){
  return{
    "login":login,
    "senha":senha,
    "nome":nome,
    "cpf":cpf,
    "email":email,
    "data_nascimento":dataNascimento,
    "foto":foto
  };
}

//Recebe dados da API
factory UserModel.fromJson(Map<String, dynamic> json){
  return UserModel(
    login: json["login"], 
    senha: json["senha"], 
    nome: json["nome"], 
    cpf: json["cpf"], 
    email: json["email"], 
    dataNascimento: json["dataNascimento"],
    foto: json["foto"],
    );
}

} 