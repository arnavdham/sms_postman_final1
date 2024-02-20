class NewsArticleData {
  Article? article;
  Sentiment? sentiment;

  NewsArticleData({this.article, this.sentiment});

  NewsArticleData.fromJson(Map<String, dynamic> json) {
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
    sentiment = json['sentiment'] != null
        ? new Sentiment.fromJson(json['sentiment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }
    if (this.sentiment != null) {
      data['sentiment'] = this.sentiment!.toJson();
    }
    return data;
  }
}

class Article {
  String? id;
  String? title;
  String? author;
  String? content;
  String? tag;
  String? createdAt;

  Article(
      {this.id,
        this.title,
        this.author,
        this.content,
        this.tag,
        this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    tag = json['tag'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['content'] = this.content;
    data['tag'] = this.tag;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Sentiment {
  Article? article;
  String? user;

  Sentiment({this.article, this.user});
  Sentiment.fromJson(Map<String, dynamic> json) {
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }
    data['user'] = this.user;
    return data;
  }
}
// class Article {
//   int? likeCount;
//   int? dislikeCount;
//
//   Article({this.likeCount, this.dislikeCount});
//
//   Article.fromJson(Map<String, dynamic> json) {
//     likeCount = json['likeCount'];
//     dislikeCount = json['dislikeCount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['likeCount'] = this.likeCount;
//     data['dislikeCount'] = this.dislikeCount;
//     return data;
//   }
// }

