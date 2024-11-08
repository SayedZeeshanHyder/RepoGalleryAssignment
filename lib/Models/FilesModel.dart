class FileModel {
  String? filename;
  String? type;
  String? language;
  String? rawUrl;
  int? size;

  FileModel({this.filename, this.type, this.language, this.rawUrl, this.size});

  FileModel.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    type = json['type'];
    language = json['language'];
    rawUrl = json['raw_url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['type'] = this.type;
    data['language'] = this.language;
    data['raw_url'] = this.rawUrl;
    data['size'] = this.size;
    return data;
  }
}
