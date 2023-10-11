// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoresprint/models/team_stand.dart';

import 'package:scoresprint/utulities/constances.dart';
import 'package:scoresprint/widgets/custom_text.dart';

class TeamsStandings extends StatelessWidget {
  const TeamsStandings({
    Key? key,
    required this.teams,required this.data
  }) : super(key: key);
final List<TeamStand> teams;
final dynamic data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
           SizedBox(height: 15.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
           children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              },
               icon:const Icon(Icons.arrow_back,)),
               SizedBox(width: 95.w,),

               CustomText(text: 'Competition',size: 19.sp,fontWeight: FontWeight.bold,),
              

            


          
           ],



          ),

          SizedBox(height: 10.h,),

       CachedNetworkImage(
  imageUrl:data['competition']['emblem'],
  imageBuilder: (context, imageProvider) => Container(
    height: 50.h,width: 50.w,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          )),
    ),
  
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const CircleAvatar(
     backgroundImage: AssetImage('assets/image.png'),
  ),
),
//  Text(state.data['standings'][0]['table'].toString())

    SizedBox(height: 7.h,),
    CustomText(text: data['competition']['name'],fontWeight: FontWeight.bold,
    size: 18.sp,
    ),
    SizedBox(height: 7.h,),
    Expanded(child: Container(color: const Color(0xFF1E1E1E),
      child: Padding(padding: EdgeInsets.only(left: 7.w,right: 7.w,top: 13.h),
        child: Column(children: [
          Row(children: [
             CustomText(text: 'Club',size: 15.sp,color:mygreycolor ,) ,
             SizedBox(width: 80.w,),
             _buildtitlecompetition('PL'),
             _buildtitlecompetition('W'),
             _buildtitlecompetition('D'),
             _buildtitlecompetition('L'),
           
              _buildtitlecompetition('GD'),
                SizedBox(width: 22.w,),
               _buildtitlecompetition('PTS')
      
          ]),
          SizedBox(height: 4.h,),
         const  Divider(color: mygreycolor,),

         Expanded(child: 
         ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, index) {
            final String teamname=teams[index].team['name'];
           return Padding(
             padding:  EdgeInsets.only(bottom: 10.h),
             child: Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,width: 20.w,child: 
                CustomText(text: teams[index].position.toString(),size: 15.sp,fontWeight: FontWeight.bold,
           
                ),),
           
                SizedBox(width: 10.w,),
                   SizedBox(width: 80.w,height: 30.h,
                     child: CustomText(
              text: teamname.trim(),
              size: 15.sp,
                     ),
                   ),
           
                   SizedBox(width:3.w ,),
                   _buildteamstat( teams[index].playedGames,Colors.white),
                   _buildteamstat( teams[index].won,Colors.white),
                    _buildteamstat( teams[index].draw,Colors.white),
                     _buildteamstat( teams[index].lost,Colors.white),
              _buildteamstat( teams[index].goalDifference,Colors.white),
                    
                _buildteamstat( teams[index].points,const Color(0xFFF63D68)),
           
           
                   
              ],
             )),
           );
         },))
      
      
      
        ]),
      ),
    
    
    
    
    
    
    ),)
           



        ],));
  }
   Widget _buildtitlecompetition(String title){
   return    Padding(
     padding:  EdgeInsets.only(left: 15.w),
     child: CustomText(text: title,size: 13.sp,color:mygreycolor ,),
   );
  }
 Widget _buildteamstat(int stat,Color color){
  return Padding(padding: EdgeInsets.only(left: 19.w),
    child: SizedBox(height: 20.h,width: 15.w,
      child: CustomText(
              text: stat.toString(),size: 17.sp,
              color: color,fontWeight: FontWeight.bold,
            ),
    ),
  );
  }
}
