// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:drug_awareness_nust/configs/themes/app_icons.dart';
// import 'package:drug_awareness_nust/configs/themes/ui_parameters.dart';
// import 'package:drug_awareness_nust/controllers/question_papers/question_paper_controller.dart';
// import 'package:drug_awareness_nust/models/question_paper_model.dart';
// import 'package:drug_awareness_nust/src/app_icon_text.dart';
// import 'package:flutter/material.dart';
// import 'package:fnf_womentorship/src/components/app_icon_text.dart';
// import 'package:get/get.dart';

// class QuestionCard extends GetView<QuestionPaperController> {
//   const QuestionCard({super.key, required this.model});

//   final QuestionPaperModel model;
//   @override
//   Widget build(BuildContext context) {
//     const double _padding =10.0;
//     return  Container(
//       decoration: BoxDecoration(borderRadius: UIParameters.cardBorderRadius, color: Theme.of(context).cardColor),
//       child: InkWell(
//         onTap: () {
//           controller.navigateToQuestions(paper: model, tryAgain: false);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(_padding),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                 ClipRRect(borderRadius: BorderRadius.circular(10),
//                 child: ColoredBox(color: Theme.of(context).primaryColor.withOpacity(0.1),
//                 child: SizedBox(
//                   height: Get.width * 0.15, 
//                   width: Get.width * 0.15, 
//                   child: CachedNetworkImage(imageUrl: model.imageUrl ?? "", placeholder: (context, url) => Container(alignment: Alignment.center, child: const CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => Image.asset("assets/images/Drug Basics.png"),),
//                   ),),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                     Text(model.title),
//                     Padding(
//                                     padding: const EdgeInsets.only(top:10.0, bottom: 15.0),
//                                     child: Text(model.description),
//                                   ),
//                     Row(children: [
//                       AppIconText(icon: Icon(Icons.help_outline_sharp, color: Theme.of(context).primaryColor,), text: Text('${model.questionsCount} questions')),
//                     const SizedBox(width:15),
//                                       AppIconText(icon: Icon(Icons.timer, color: Theme.of(context).primaryColor,), text: Text(model.timeInMinutes()))
        
//                     ],)
                  
//                     ],),
//                 ),
//               ],),
//               Positioned(
//                 bottom: -_padding,
//                 right: -_padding,
//                 child: GestureDetector(child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                   decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(cardBorderRadius), bottomRight: Radius.circular(cardBorderRadius)), color: Theme.of(context).primaryColor),
//                 child: const Icon(AppIcons.trophyOutline),),))
//               ],),
//         ),
//       ),
//     );
//   }
// }