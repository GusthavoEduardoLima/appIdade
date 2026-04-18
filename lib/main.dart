import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return MaterialApp(
      home: BirthdayPage()
      );
    
    
    
  }
}

class BirthdayPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BirthdayPageState();
    
  }
  

}
class _BirthdayPageState extends State<BirthdayPage>{
  TextEditingController _dateControler = TextEditingController();
  String _resultado = "";
  void _calcular(String res){
    List<String> partes = res.split("/");
    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);
    DateTime hoje = DateTime.now();
    DateTime nascimento = DateTime(ano,mes,dia);
    int idade = hoje.year - nascimento.year;
    List<String> meses = ["Janeiro", "Fevereiro", "Março", "Abril", 
    "Maio", "Junho", "Julho", "Agosto", 
    "Setembro", "Outubro", "Novembro", "Dezembro"];
    if(nascimento.month>hoje.month){
      idade--;
    }else if(nascimento.month==hoje.month && nascimento.day>hoje.day){
      idade--;
    }
    String mesNome = meses[nascimento.month-1];
    List<String> diasDaSemana = ["Segunda Feira","Terça Feira",
    "Quarta Feira","Quinta Feira", "Sexta Feira", "Sabado", "Domingo"];
    String diaNascimento = diasDaSemana[nascimento.weekday-1];
    DateTime proximoAniversario = DateTime(hoje.year, nascimento.month, nascimento.day);
    int diasParaProximoAniversario = proximoAniversario.difference(hoje).inDays;
    if (proximoAniversario.isBefore(hoje)){ 
      proximoAniversario = DateTime(hoje.year+1,nascimento.month,nascimento.day);
      diasParaProximoAniversario = proximoAniversario.difference(hoje).inDays;


    }

    setState(() {
      _resultado = "Idade: $idade anos\n Mês de nascimento: $mesNome\nDia da Semana em que nasceu: $diaNascimento\n Dias para proximo aniversario: $diasParaProximoAniversario ";

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        
        appBar: AppBar(
          title: Text("Bomdia!!!"),
        ),
        body: Column(
          children: [TextField(controller: _dateControler,), 
          ElevatedButton(onPressed: (){
            _calcular(_dateControler.text);
          }, 
          child:Text("Pressione") ),
          Text(_resultado)
          ],
        )

      );
    
    
  }

}