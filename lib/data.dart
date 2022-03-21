class DataInfo {
  final int position;
  final String name;
  final String iconImage;
  final String images;
  //final String url;

  DataInfo(
     this.position,{
     required this.name,
     required this.iconImage,
     required this.images,
    // required this.url
  });
}

List<DataInfo> dataInfo = [
  DataInfo(
     1,
    name: 'Project team',
    iconImage: 'asste/coding12.png',
    images: 'asste/coding12.png',
    //url: ''
  ),
  DataInfo(
   2,
    name: 'HR team',
    iconImage: 'asste/hr.png',
    images: 'asste/hr.png'
  ),
  DataInfo(
   3,
    name: 'GSF team',
    iconImage: 'asste/gsf.png',
    images: 'asste/dia.png',
  ), 
  DataInfo(
     4,
    name: 'PR team',
    iconImage: 'asste/dia.png',
    images: 'asste/dia.png'
  ),
  DataInfo(
     5,
    name: 'team',
    iconImage: 'asste/dia.png',
    images: 'asste/dia.png'
  ),
];
