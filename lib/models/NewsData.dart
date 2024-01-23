class Newsd {
  String? id;
  String? title;
  String? author;
  String? content;
  String? tag;
  String? createdAt;
  String? timeAgo;

  Newsd(
      {this.id,
        this.title,
        this.author,
        this.content,
        this.tag,
        this.createdAt,this.timeAgo});

  Newsd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    tag = json['tag'];
    createdAt = json['createdAt'];
    timeAgo=json['timeAgo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['content'] = this.content;
    data['tag'] = this.tag;
    data['createdAt'] = this.createdAt;
    data['timeAgo']=this.timeAgo;
    return data;
  }
}
