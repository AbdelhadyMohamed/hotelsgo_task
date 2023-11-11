class CardsModel {
  CardsModel({
    this.cardsList,
  });

  CardsModel.fromJson(dynamic json) {
    if (json['cardsList'] != null) {
      cardsList = [];
      json['cardsList'].forEach((v) {
        cardsList?.add(CardsListItem.fromJson(v));
      });
    }
  }
  List<CardsListItem>? cardsList;
}

class CardsListItem {
  CardsListItem({
    this.name,
    this.starts,
    this.price,
    this.currency,
    this.image,
    this.reviewScore,
    this.review,
    this.address,
  });

  CardsListItem.fromJson(dynamic json) {
    name = json['name'];
    starts = json['starts'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    reviewScore = json['review_score'];
    review = json['review'];
    address = json['address'];
  }
  String? name;
  int? starts;
  int? price;
  String? currency;
  String? image;
  num? reviewScore;
  String? review;
  String? address;
}
