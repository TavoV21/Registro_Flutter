import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
    
     /* home: Scaffold(            
      title: 'Startup Name Generator',            
      home: RandomWords(),            
      appBar: AppBar(            
      title: Text('Welcome to Flutter'),            
      ),            
    body: Center(            
    child: RandomWords(),            
    ),     
    ),            
   );*/

      theme: ThemeData.light(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.lightGreen
      ),
      home: MyHomePage(title: 'CrowdFunding'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
 void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter+=10;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    String _nombres;
    String _email;
    String _password;
    String _compassword;
    String formKey;

    
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(widget.title,style:TextStyle(color:Colors.white)),
        centerTitle: true,
      ),
      drawer: MenuLateral(),
      
      body: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),

      child:Form(
        //key: formKey,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start, 
        
          children: <Widget>[
            Center(
              child:Icon(Icons.person,size: 70.0,color: Colors.blue[800],),    
            ),
          Text('Registro',style:TextStyle(fontSize: 20.0,color:Colors.blue[800])),    
            
           SizedBox(height: 10.0), 
            Divider(
              height: 50.0,
              color: Colors.grey,
            ),

            TextFormField(
              decoration: InputDecoration(
                   labelText: 'Nombre Completo:'
              ),
              validator: (input)=>!input.contains('0') ? 'Campos vacios': null,
              onSaved: (input)=> _nombres=input,
            ),

            TextFormField(
              decoration: InputDecoration(
                   labelText: 'Correo o  documento:'
              ),
              validator: (input)=>!input.contains('0') ? 'No valido': null,
              onSaved: (input)=> _email=input,
            ),

            TextFormField(
              decoration: InputDecoration(
                   labelText: 'Password:'
              ),
              validator: (input)=>input.length < 0 ? 'Tu password es incorrecta': null,
              onSaved: (input)=> _password=input,
              obscureText: true,
            ),
            
            TextFormField(
              decoration: InputDecoration(
                   labelText: 'Comfirmar password:'
              ),
              validator: (input)=>!input.contains('0') ? 'Error al repetir ppassword': null,
              onSaved: (input)=> _compassword=input,
              obscureText: true,

            ),
            SizedBox(height: 10.0), 

            Row(
               mainAxisAlignment: MainAxisAlignment.center, 
               children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                
                  child: RaisedButton(
                    color: Colors.blue[800],
                    textColor: Colors.white,
                    onPressed: _submit,
                    child: Text('Registrarse'),
                  ),
                )


               ],
            )

          ],


     ),
       ),      
   
        ),

        
      ),

    );
 
  }
  void _submit(){
    //if(formkey.curre)

    }
}

class MenuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
     child: ListView(
       children: <Widget>[
        ListTile(
        title: Text('Inicio de Sesion', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0)),
        trailing: Icon(Icons.supervised_user_circle,size:30.0,color: Colors.blue[800],),

        ),
        Divider(
              height: 10.0,
              color: Colors.grey,
            ),

       ],

     ),

    );
  }



}

//**********UTILIDADES**********

//CONTAINERS

/*
body:Row(
  children: <Widget>[
  
Expanded(
child: Image.asset('assets/imagen.jpg'),
flex:3,

),

Expanded(//para expandir
flex:1,
child: Container( 
  padding: EdgeInsets.all(30.0),
  color: Colors.red,
  child: Text('xdxddxxxdxdxdddxd'),
),),

Container(
  padding: EdgeInsets.all(30.0),
  color: Colors.yellow,
  child: Text('xdxddxxxdxdxdddxd'),
),
Container(
  padding: EdgeInsets.all(30.0),
  color: Colors.orange,
  child: Text('xdxddxxxdxdxdddxd'),
),

  ],
),

//AVATARS
body:Padding(
  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Center(
     child: CircleAvatar(
       backgroundImage: AssetImage('assets/imagen.jpg'),
       radius: 40.0,
     ),
    ),
     Divider(
       height: 60.0,
       color: Colors.white,
     ),
    )
  ],


  )
)




//BOTON FLOTANTE

floatingActionButton: FloatingActionButton(
onPressed:(){
print('xd jaja')},
backgroundcolor:Colors.red[600],
),

sizedBox(
  height:10.0
),


//CLASES

class Quote{

String text;
String author;

Quote(String text,String author){

this.text=text;
this.author=author;

}


}

Quote myQuote =Quote(text:'xxxsxdsxdsxds', author:'zzszszszszsz');


List<Quote> quotes=[//arreglo
  Quote(author:'rfeffr',text:'erferffe');
  Quote(author:'rfeffr',text:'erferffe');
  Quote(author:'rfeffr',text:'erferffe');

]

body:Column(
  children:quotes.map((quote)=>Text('${quote.text}-${quote.author}')).toList;//se llama
)

//CARDS

Widget quoteTemplate(quote){
return card(


margin: EdgeInsets.fromLTRB(8.0),
child:padding(
padding:const EdgeInsets.all(8.0)
child:Column(
children <Widget>[
Text(
quote.text,
style: TextStyle(
  fontSize:18.0,
  color:Colors.red,
)
),
SizedBox(height:6.0)
]
),


),



)

),

}

//FLATBUTTON

FlatButton.icon(
onPressedI(){},
label:Text('siuuuuuu'),
icon:Icon(Icons.delete),
),


//ELIMINAR OBJETO DEL MAP
delete:(){
  setState((){
    quotes.remove(quote);
  });
}

//MAPS Y ROUTING

routes:{
(context) => Loading()

FlatButton.icon(
onPressedI(
  Navigator.pushNamed(context,'/locacion')
){},
label:Text('siuuuuuu'),
icon:Icon(Icons.delete),
),



}


//FORMA ASYNCRONA

void getData() async{

  Response response= await get('https://jsonplaceholder.typicode.com/todos/1') 
  print(response.body); o
  print(response.body.userId);
  Map data =jsonDecode(response.body);
  print(data);
}

//WORLD TIME API
void getTime() async{

//get properties from data

String datetime= data['datetime'];
String offset= data['utc_offset'];

print(datetime);
print(offset);

DateTime now = DateTime.parse(datetime);
now.add(Duration(hours: int.parse(Offset)));
print(now);

time=now.toString();

}

floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.monetization_on,color: Colors.black),
      ), 
//IMAGENES

           child: CircleAvatar(
            backgroundImage: AssetImage('assets/users.jpg'),
            radius: 55.0,
             ),

             child:Image(
                image:AssetImage('assets/Moon.jpg'),
              //AssetImage
             ),

































*/