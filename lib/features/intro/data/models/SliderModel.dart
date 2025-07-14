class SliderModel {
  String? image;
  String? title;
  String? description;

  SliderModel({this.image, this.title, this.description});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String? getImage() {
    return image;
  }

  String? getTitle() {
    return title;
  }

  String? getDescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  // Item 1
  sliderModel.setImage("assets/images/onboarding-1.png");
  sliderModel.setTitle("Dịch vụ của chúng tôi");
  sliderModel.setDescription(
    "Healthy Mind là ứng dụng giúp bạn tiếp cận các dịch vụ chăm sóc sức khỏe tinh thần, kết nối với các bác sĩ, chuyên gia tư vấn tâm lý bất cứ lúc nào",
  );
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // Item 2
  sliderModel.setImage("assets/images/onboarding-2.png");
  sliderModel.setTitle("Kết nối dễ dàng");
  sliderModel.setDescription(
    "Giờ đây bạn có thể đặt lịch hẹn trước, nhận tư vấn trực tiếp tại phòng khám hoặc tư vấn online mọi lúc mọi nơi",
  );
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // Item 3
  sliderModel.setImage("assets/images/onboarding-3.png");
  sliderModel.setTitle("Chăm sóc dự phòng và chăm sóc cá nhân hóa");
  sliderModel.setDescription(
    "Healthy Mind cung cấp nguồn thông tin y tế đáng tin cậy, giúp bạn chăm sóc sức khỏe tinh thần chủ động và dự phòng cho cá nhân, người thân",
  );
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
