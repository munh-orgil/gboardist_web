import 'package:core_control_panel/pages/settings/settings/settings.layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/common.dart';
import '../../auth/login.model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? orgName = 'Тодорхойгүй';
  late List<SelectOrganizationModel> organizations = [];

  @override
  void initState() {
    super.initState();
    _getSelectedOrgName();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Тохиргоо',
      color: Colors.black,
      child: SettingsLayout(
        child: Column(
          children: [
            //
            SizedBox(
              width: 860,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Ерөнхий тохиргоо",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  _organizationChangerUI(context),
                  //
                  const SizedBox(
                    height: 16,
                  ),
                  //
                  _isTaxerUI(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _isTaxerUI(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Татвар төлөгч эсэх",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "Тийм",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 24.0,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Row _organizationChangerUI(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "Байгууллага",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Text(
            orgName!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                size: 24.0,
                color: Colors.blue,
              ),
              onPressed: () {
                _getOrgTokenData();
              },
            ),
          ),
        ),
      ],
    );
  }

  _getOrgTokenData() async {
    Map<String, dynamic> tokenBody = await tokenParser();
    setState(() {
      organizations = List<SelectOrganizationModel>.from(
        (tokenBody["data"]["organizations"] ?? []).map<SelectOrganizationModel>(
          (dynamic i) => SelectOrganizationModel.fromJson(i),
        ),
      );
    });
    if (tokenBody["data"]["organizations"] != null) {
      _selectOrgDialog();
    }
  }

  _getSelectedOrgName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      orgName = prefs.getString('selected_org_name');
    });
  }

  Future<void> _selectOrgDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Байгууллага сонгоно уу!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: SizedBox(
            width: 380,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: organizations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(organizations[index].name),
                  onTap: () async {
                    await setOrgValues(organizations[index]);
                    _getSelectedOrgName();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop(organizations[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
