import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoresprint/models/competition_model.dart';
import 'package:scoresprint/screens/competition_info.dart';
import 'package:scoresprint/widgets/custom_text.dart';

class ListCompetitions extends StatelessWidget {
  const ListCompetitions({super.key,required this.competitions});
  final List<CompetitionModel>competitions;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Padding(
          padding:  EdgeInsets.only(top: 25.h),
          child: CustomText(text: 'Top Competitions',fontWeight: FontWeight.bold,size: 23.sp,),
        ),
        SizedBox(height: 7.h,),
   Expanded(child:  ListView.builder(
        itemCount: competitions.length,
      itemBuilder: (context, index) {
      return  Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w),
        child: Container(height: 80.h,width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFF3A3A3A)))
          ),
        child: _buildcompetitionwidget(competitions[index],context),
        
        ),
      );


    },))
    ],);
    
    
    
  }


Widget  _buildcompetitionwidget(CompetitionModel competition,BuildContext context){
    return InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CompetitionInfo(codeleague: competition.code);
      },));
    },
      child: Row(
        children: [
         CachedNetworkImage(
          fit: BoxFit.cover,
  imageUrl:competition.emblem,
  imageBuilder: (context, imageProvider) => Container(
    height: 35.h,width: 35.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: imageProvider,
          
          )),
    ),
  
  placeholder: (context, url) => const CircularProgressIndicator(),
  // ignore: prefer_const_constructors
  errorWidget: (context, url, error) => CircleAvatar(
     backgroundImage: const AssetImage('assets/image.png'),
  ),
),
       SizedBox(width: 3.w,),
       Padding(
         padding:  EdgeInsets.only(left: 5.w,top: 13.h),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomText(text: competition.area['name'],size: 15.sp,),
          CustomText(text: competition.name,size: 15.sp,),
         ],),
       )
        ],
      ),
    );
  }
}