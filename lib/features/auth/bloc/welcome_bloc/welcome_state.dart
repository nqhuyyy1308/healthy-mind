part of 'welcome_bloc.dart';

abstract class WellcomeState extends Equatable {
  const WellcomeState();

  String get image;
  String get title;
  String get desc;

  @override
  List<Object> get props => [image, title, desc];
}

class WellcomeRegisterState extends WellcomeState {
  @override
  String get image => "assets/images/wellcome-screen.png";

  @override
  String get title => "Bạn đã đăng ký thành công!";

  @override
  String get desc =>
      "Ngay bây giờ bạn có thể dễ dàng đặt lịch hẹn với chuyên gia tâm lý và quản lý hồ sơ tư vấn của mình và người thân.";
}

class WellcomeLoginState extends WellcomeState {
  @override
  String get image => "assets/images/wellcome-screen-2.png";

  @override
  String get title => "Bạn đã đăng nhập thành công!";

  @override
  String get desc =>
      "Cập nhật thông tin cá nhân để nhận được những gợi ý chăm sóc sức khỏe tinh thần phù hợp với mong muốn và lối sống của bạn!";
}
