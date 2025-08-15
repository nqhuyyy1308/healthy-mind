import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/TitleWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/features/appointment/bloc/get_doctors_bloc/get_doctors_bloc.dart';
import 'package:healthy_mind_application/features/home/presentation/widgets/CardDoctor.dart';

class ListDoctors extends StatelessWidget {
  const ListDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorsBloc, GetDoctorsState>(
      builder: (context, state) {
        if (state is GetDoctorsSuccess) {
          return Column(
            children: [
              TitleWidget(
                title: "Chuyên gia hàng đầu",
                subButton: true,
                subTitle: "Xem thêm",
                subTitleSize: FontSizeConstants.medium,
                subTitleFontWeight: FontWeightConstants.normal,
                onPressed: () {},
              ),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemCount: state.doctors.length,
              //     itemBuilder: (context, int i) {
              //       return CardDoctor(
              //         name: state.doctors[i].name,
              //         imgUrl: state.doctors[i].img,
              //         jobTitle: state.doctors[i].jobTitle,
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 8),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
