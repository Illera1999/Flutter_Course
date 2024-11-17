void main() async {
  print('Inicio del programa') ;

  try{
    final valute = await httpGet('https://www.api.com/valute');
    print(valute);
  } on Exception catch(error) {
    print('Tenemos una excepción');
    print(error);
  }catch(error) {
    print('Error: $error');
  } finally {
    print('Fin del try y el catch');
  }
  print('Fin del programa') ;
}



Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('No hay parámetros en la URL');
  // throw Exception('Error en la conexión');
  // return 'Respuesta del servidor';
}