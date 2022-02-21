class AttendModel{ 
  String? id;
String?  goin;
String? goout;
String? brea;
String? user_id;
String? date;
AttendModel({this.id,this.goin,this.goout,this.brea,this.user_id,this.date});
   factory AttendModel.fromJson( Map<String,dynamic> album)=>
  AttendModel( id: album['id'],
              goin: album['goin'],
               goout:album['goout'] ,
              brea:album['brea'] ,
             user_id:album['user_id'] ,
             date:album['date']
             ) ;     
         
         
         
         }