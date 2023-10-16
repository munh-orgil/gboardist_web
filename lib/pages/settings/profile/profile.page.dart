import 'package:core_control_panel/constants/utility.dart';
import 'package:core_control_panel/helpers/http/http_client.dart';
import 'package:core_control_panel/pages/settings/profile/profile.form.dart';
import 'package:core_control_panel/pages/settings/profile/profile.layout.dart';
import 'package:core_control_panel/pages/settings/profile/profile.model.dart';
import 'package:core_control_panel/widgets/notice/notice.dart';
import 'package:flutter/material.dart';

import '../../../constants/url.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile user = Profile(
      regNo: '', familyName: '', lastName: '', firstName: '', birthDate: '');
  bool phoneNoHover = false;
  bool emailHover = false;
  bool usernameHover = false;
  bool descriptionHover = false;
  bool isUpdate = false;
  TextEditingController identify = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController otp = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void loadData() async {
    dynamic res = await HttpClient(context).send(
      fullUrl: "$URL_ACCOUNT/user/profile",
      method: "get",
    );

    if (res == null) {
      return;
    }
    if (mounted) {
      setState(() {
        user = Profile.fromJson(res);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Хувийн хэрэг',
      color: Colors.black,
      child: ProfileLayout(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20, left: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 85,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 80,
                          foregroundImage: NetworkImage(
                            user.profileImageUrl.toString(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.lastName[0]}. ${user.firstName}",
                              style: const TextStyle(fontSize: 32),
                            ),
                            Text(
                              "@${user.username}",
                              style: const TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            MouseRegion(
                              onHover: (event) => setState(() {
                                descriptionHover = true;
                              }),
                              onExit: (event) => setState(() {
                                descriptionHover = false;
                              }),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 600,
                                    height: 150,
                                    child: Container(
                                      width: 550,
                                      height: 100,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas accumsan sem magna, quis congue ex condimentum id. Sed tincidunt, nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas accumsan sem magna, quis congue ex condimentum id. Sed tincidunt, nibh. "),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: -20,
                                    child: Visibility(
                                      visible: descriptionHover,
                                      child: RawMaterialButton(
                                        onPressed: () => {},
                                        elevation: 5,
                                        fillColor:
                                            Theme.of(context).canvasColor,
                                        padding: const EdgeInsets.all(5),
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(40),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _createField(
                    container: Container(
                      width: 550,
                      height: 500,
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        children: ListTile.divideTiles(
                          tiles: [
                            _createListTile(title: 'Овог', text: user.lastName),
                            _createListTile(title: 'Нэр', text: user.firstName),
                            _createListTile(
                              title: 'Улс',
                              text: user.countryName.toString(),
                            ),
                            _createListTile(
                                title: 'Хүйс',
                                text: Constants.getGender(user.gender!)),
                            _createListTile(
                                title: 'Төрсөн огноо', text: user.birthDate),
                            _createListTile(
                                title: 'Хаяг',
                                text:
                                    "${user.aimagName} / ${user.sumName} / ${user.bagName}"),
                            _createListTile(
                                title: 'Хаягийн дэлгэрэнгүй',
                                text: user.addressDetail.toString()),
                          ],
                          context: context,
                        ).toList(),
                      ),
                    ),
                    title: 'Хувийн мэдээлэл',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _createField(
                        container: Container(
                          width: 550,
                          height: 180,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            children: ListTile.divideTiles(
                              tiles: [
                                MouseRegion(
                                  onHover: (event) => setState(() {
                                    phoneNoHover = true;
                                  }),
                                  onExit: (event) => setState(() {
                                    phoneNoHover = false;
                                  }),
                                  child: ListTile(
                                    title: const Text(
                                      'Утасны дугаар',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    subtitle: Text(user.phoneNo.toString()),
                                    trailing: Visibility(
                                      visible: phoneNoHover,
                                      child: RawMaterialButton(
                                        onPressed: () => {
                                          editIdentifyModal(
                                              type: 'Утасны дугаар')
                                        },
                                        elevation: 2,
                                        fillColor:
                                            Theme.of(context).canvasColor,
                                        padding: const EdgeInsets.all(5),
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  onHover: (event) => setState(() {
                                    emailHover = true;
                                  }),
                                  onExit: (event) => setState(() {
                                    emailHover = false;
                                  }),
                                  child: ListTile(
                                    title: const Text(
                                      'И-мейл',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    subtitle: Text(user.email.toString()),
                                    trailing: Visibility(
                                      visible: emailHover,
                                      child: RawMaterialButton(
                                        onPressed: () =>
                                            {editIdentifyModal(type: 'И-мейл')},
                                        elevation: 2,
                                        fillColor:
                                            Theme.of(context).canvasColor,
                                        padding: const EdgeInsets.all(5),
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              context: context,
                            ).toList(),
                          ),
                        ),
                        title: 'Холбогдох мэдээлэл',
                      ),
                      _createField(
                        container: Container(
                          width: 550,
                          height: 116,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            children: ListTile.divideTiles(
                              tiles: [
                                MouseRegion(
                                  onHover: (event) => setState(() {
                                    usernameHover = true;
                                  }),
                                  onExit: (event) => setState(() {
                                    usernameHover = false;
                                  }),
                                  child: ListTile(
                                    title: const Text(
                                      'Нэвтрэх нэр',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    subtitle: Text(user.username.toString()),
                                    trailing: Visibility(
                                      visible: usernameHover,
                                      child: RawMaterialButton(
                                        onPressed: () => {
                                          editUsernameModal(),
                                        },
                                        elevation: 2,
                                        fillColor:
                                            Theme.of(context).canvasColor,
                                        padding: const EdgeInsets.all(5),
                                        shape: const CircleBorder(),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              context: context,
                            ).toList(),
                          ),
                        ),
                        title: 'Нэвтрэх мэдээлэл',
                      ),
                      _createField(
                        container: Container(
                          width: 550,
                          height: 180,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            children: ListTile.divideTiles(
                              tiles: [
                                _createListTile(
                                  title: 'Баярсконстракшн',
                                  text: "11223344",
                                ),
                                _createListTile(
                                  title: 'Энгүй шийдэл',
                                  text: "11223344",
                                ),
                              ],
                              context: context,
                            ).toList(),
                          ),
                        ),
                        title: 'Бүртгэлтэй байгууллагууд',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile _createListTile({required String title, required String text}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.blue,
        ),
      ),
      subtitle: Text(text),
    );
  }

  Container _createField(
      {required Container container, required String title}) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 0, left: 80),
      child: Stack(
        children: [
          container,
          Positioned(
            left: 50,
            top: 4,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }

  closeModal() {
    identify.text = '';
    username.text = '';
    description.text = '';
    otp.text = '';
    isUpdate = false;
    Navigator.pop(context);
  }

  editIdentifyModal({required String type}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$type солих',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              ProfileForm(
                formkey: formkey,
                textController: identify,
                isUpdate: isUpdate,
                labelName: type,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => closeModal(),
                    child: Text(
                      "Хаах",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 16 / 2,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      sendOTP(),
                    },
                    child: Text(
                      "OTP код авах",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  sendOTP() async {
    dynamic res = await HttpClient(context).send(
      fullUrl: "$URL_ACCOUNT/user/identify?text=${identify.value.text}",
      method: 'get',
    );
    if (res == null) return;

    openOtpModal();
  }

  openOtpModal() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'OTP код баталгаажуулах',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              ProfileForm(
                formkey: formkey,
                textController: otp,
                isUpdate: isUpdate,
                labelName: 'OTP код',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => closeModal(),
                    child: Text(
                      "Хаах",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 16 / 2,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      changeIdentify(),
                    },
                    child: Text(
                      "Баталгаажуулах",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  changeIdentify() async {
    dynamic res = await HttpClient(context).send(
      fullUrl: "$URL_ACCOUNT/user/identify",
      method: 'put',
      data: {
        'otp': int.parse(otp.text),
        "identity": identify.text,
      },
    );

    if (res == null) return;

    loadData();
    closeModal();
    if (context.mounted) Notice(context).success('Амжилттай');
  }

  editUsernameModal() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Нэвтрэх нэр солих',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              ProfileForm(
                formkey: formkey,
                textController: username,
                isUpdate: isUpdate,
                labelName: 'Нэвтрэх нэр',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => closeModal(),
                    child: Text(
                      "Хаах",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    width: 16 / 2,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      changeUsername(),
                    },
                    child: Text(
                      "Солих",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  changeUsername() async {
    dynamic res = await HttpClient(context).send(
      fullUrl: "$URL_ACCOUNT/user/username?text=${username.value.text}",
      method: 'put',
    );

    if (res == null) return;

    loadData();
    closeModal();
    if (context.mounted) Notice(context).success('Амжилттай');
  }
}
