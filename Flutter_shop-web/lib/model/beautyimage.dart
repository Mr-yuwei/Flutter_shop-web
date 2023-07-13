class BeautyImageModal{
  int width;
  int height;
  String thumb;
  BeautyImageModal({ required  this.height,required this.width,required this.thumb});
  BeautyImageModal.fromJSON(dynamic json):width =  int.parse(json['width'] ),height=int.parse(json['height']),thumb=json['thumb'];
}