class HoliModel{ 
  String? id;
String?  user_id;
String? mes;
String? state;
String? date;
String? hist;
String? replay;
//String date;
HoliModel({this.id,this.user_id,this.mes,this.state,this.date,this.hist,this.replay});
   factory HoliModel.fromJson( Map<String,dynamic> album)=>
 HoliModel( id: album['id'],
             user_id: album['user_id'],
              mes:album['mes'] ,
              state:album['state'] ,
             date:album['date'],
             hist: album['hist'],
             replay:album['replay']
             ) ;     
         
         
         
         }