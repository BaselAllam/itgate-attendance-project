class ScanModel{
     String? brea;
     

     ScanModel({this.brea});
               
  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
       brea: json['brea'] as String,
      );
  }     
               }