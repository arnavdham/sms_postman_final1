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
  String? image;
  String? createdAt;

  Article(
      {this.id,
        this.title,
        this.author,
        this.content,
        this.tag,
        this.image,
        this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    content = json['content'];
    tag = json['tag'];
    image = json['image'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['content'] = this.content;
    data['tag'] = this.tag;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Sentiment {
  OverallSentiment? overallSentiment;
  String? userSentiment;

  Sentiment({this.overallSentiment, this.userSentiment});

  Sentiment.fromJson(Map<String, dynamic> json) {
    overallSentiment = json['overallSentiment'] != null
        ? new OverallSentiment.fromJson(json['overallSentiment'])
        : null;
    userSentiment = json['userSentiment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overallSentiment != null) {
      data['overallSentiment'] = this.overallSentiment!.toJson();
    }
    data['userSentiment'] = this.userSentiment;
    return data;
  }
}

class OverallSentiment {
  int? likeCount;
  int? dislikeCount;

  OverallSentiment({this.likeCount, this.dislikeCount});

  OverallSentiment.fromJson(Map<String, dynamic> json) {
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likeCount'] = this.likeCount;
    data['dislikeCount'] = this.dislikeCount;
    return data;
  }
}
