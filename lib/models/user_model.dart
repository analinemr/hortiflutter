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

} 