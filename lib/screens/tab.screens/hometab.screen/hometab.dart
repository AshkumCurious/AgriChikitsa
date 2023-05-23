import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jobchecklist/res/color.dart';
import 'package:provider/provider.dart';
import '../../../services/socket_io.dart';
import '../../../widgets/Input.widgets/input.dart';
import '../../../widgets/button.widgets/elevated_button.dart';
import '../../../widgets/button.widgets/outlined_button.dart';
import '../../../widgets/text.widgets/text.dart';
import 'hometab_view_model.dart';

class HomeTabScreen extends HookWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useViewModel = useMemoized(
        () => Provider.of<HomeTabScreenViewModel>(context, listen: false));
    final useSocketService =
        useMemoized(() => Provider.of<SocketService>(context, listen: true));
    useEffect(() {
      useSocketService.connect();
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Card(
              //   color: AppColor.lightColor,
              //   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              //   elevation: 4,
              //   child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           const Text("Start Task"),
              //           Switch(
              //             value: true,
              //             onChanged: (value) {}
              //            ),
              //         ],
              //       ),
              //       // const Text("Go online for to receive Task"),
              //     ],
              //   ),
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              //  Card(
              //   child: Padding(padding:const EdgeInsets.all(16),
              //   child: SizedBox(height: 200,
              //   child: Column(
              //     children: [
              //       const Center(
              //     child: Text("Today Task"),
              //   ),
              //   useSocketService.assignedTask != null
              //       ? Text(useSocketService.assignedTask["groupName"])
              //       : const Text(""),
              //   useSocketService.assignedTask != null
              //       ? Text(useSocketService.assignedTask["vehicleID"])
              //       : const Text("No assigned task yet!"),
              //   useSocketService.assignedTask != null
              //       ? Text('status ${useSocketService.assignedTask["status"]}')
              //       : const Text(""),
              //        useSocketService.assignedTask != null
              //       ? Text('Task details: ${useSocketService.assignedTask["descripation"]}')
              //       : const Text(""),
              //     ],
              //   ),),
              //   ),
              //  ),
              CustomElevatedButton(
                onPress: () {},
                title: "Verifying",
                loading: true,
                width: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomOutlinedButton(
                onPress: () {},
                title: "Login",
                loading: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const HeadingText("Heading Text"),
              const SizedBox(
                height: 16,
              ),
              const SubHeadingText("Sub Heading Text"),
              const SizedBox(
                height: 16,
              ),
              const ParagraphHeadingText("Paragraph Heading Text"),
              const SizedBox(
                height: 16,
              ),
              const ParagraphText("Paragraph  Text"),
              Form(child: Column(children: [
 Input()
              ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
