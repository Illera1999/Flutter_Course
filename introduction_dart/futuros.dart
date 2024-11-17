void main(List<String> args) {
  print('Inicio del programa') ;

  httpGet('https://www.prueba.com')
  .then((value) {
    print(value);
  })
  .catchError((error){
    print('Error: $error');

  });

  print('Fin del programa') ;
}



Future<String> httpGet(String url) async {

  return Future.delayed(Duration(seconds: 1), () {
    throw Exception('Error en la petición http');
    // return 'Respuesta de la petición http';
  });

}