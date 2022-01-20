class Participant {
  final String? id;
  final String? name;
  final String? imgUrl;
  final String? pickedUserName;
  final String? pickedUserImgUrl;
  final String? giftStatus;

  Participant({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.pickedUserImgUrl = null,
    this.pickedUserName = null,
    this.giftStatus = 'Not sent',
  });
}
