import 'package:flutter/material.dart';
import 'package:core_control_panel/helpers/http/http_client.dart';

import '../../constants/url.dart';

class Addresses extends StatefulWidget {
  final String? countryCode;
  final int? aimagId;
  final int? sumId;
  final int? bagId;
  final Function(String countryCode)? changeCountryCode;
  final Function(int aimagId) changeAimagId;
  final Function(int sumId) changeSumId;
  final Function(int sumId) changeBagId;
  final bool? hideCountry;

  const Addresses({
    super.key,
    this.countryCode,
    required this.aimagId,
    required this.sumId,
    required this.bagId,
    this.changeCountryCode,
    required this.changeAimagId,
    required this.changeSumId,
    required this.changeBagId,
    this.hideCountry,
  });

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  List<Country> countries = [];
  List<Common> aimags = [];
  List<Common> sums = [];
  List<Common> bags = [];
  bool isMongolia = false;
  String? countryCode;
  int? aimagId;
  int? sumId;
  int? bagId;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadCountryList();
    loadAimagList();
    if (widget.countryCode != '' && widget.countryCode != null) {
      countryCode = widget.countryCode;
      if (widget.countryCode == 'MNG') {
        isMongolia = true;
      }
    }

    if (widget.aimagId != 0 && widget.aimagId != null) {
      aimagId = widget.aimagId;
      loadSumList(widget.aimagId!);
    }
    if (widget.sumId != 0 && widget.sumId != null) {
      sumId = widget.sumId;
      loadBagList(widget.sumId!);
    }
    if (widget.bagId != 0 && widget.bagId != null) {
      bagId = widget.bagId;
    }
  }

  loadCountryList() async {
    dynamic res = await HttpClient(context).send(
        fullUrl: "$URL_CORE/common/countries?page_size=300&page_number=1",
        method: "get");
    if (mounted) {
      setState(() {
        countries = List<Country>.from(
          res['items'].map<Country>((dynamic i) => Country.fromJson(i)),
        );
      });
    }
  }

  loadAimagList() async {
    dynamic res = await HttpClient(context).send(
        fullUrl: "$URL_CORE/common/addresses?level=1&parent_id=0",
        method: "get");
    if (mounted) {
      setState(() {
        aimags = List<Common>.from(
          res.map<Common>((dynamic i) => Common.fromJson(i)),
        );
      });
    }
  }

  loadSumList(int id) async {
    dynamic res = await HttpClient(context).send(
        fullUrl: "$URL_CORE/common/addresses?level=2&parent_id=$id",
        method: "get");
    if (mounted) {
      setState(() {
        sums = List<Common>.from(
          res.map<Common>((dynamic i) => Common.fromJson(i)),
        );
      });
    }
  }

  loadBagList(int id) async {
    dynamic res = await HttpClient(context).send(
        fullUrl: "$URL_CORE/common/addresses?level=3&parent_id=$id",
        method: "get");
    if (mounted) {
      setState(() {
        bags = List<Common>.from(
          res.map<Common>((dynamic i) => Common.fromJson(i)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hideCountry == true
              ? const SizedBox()
              : DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Улс'),
                  value: countryCode,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        if (value == 'MNG') {
                          isMongolia = true;
                        } else {
                          isMongolia = false;
                        }
                        aimagId = null;
                        sums = [];
                        sumId = null;
                        bags = [];
                        bagId = null;
                      });
                    }
                    if (widget.changeCountryCode != null) {
                      widget.changeCountryCode!(value!);
                    }
                  },
                  items: countries
                      .map((e) => DropdownMenuItem(
                            value: e.code,
                            child: Text(
                              e.commonName.length > 30
                                  ? '${e.commonName.substring(0, 10)}...'
                                  : e.commonName,
                            ),
                          ))
                      .toList(),
                ),
          Visibility(
            visible: isMongolia,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.hideCountry == true ? 0 : 16,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Аймаг/хот'),
                  value: aimagId,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        aimagId = value;
                        sums = [];
                        sumId = null;
                        bags = [];
                        bagId = null;
                      });
                    }
                    widget.changeAimagId(value!);
                    loadSumList(value);
                  },
                  items: aimags
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Сум/дүүрэг'),
                  value: sumId,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        sumId = value;
                        bags = [];
                        bagId = null;
                      });
                    }
                    widget.changeSumId(value!);
                    loadBagList(value);
                  },
                  items: sums
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Баг/хороо'),
                  value: bagId,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        bagId = value;
                      });
                    }
                    widget.changeBagId(value!);
                  },
                  items: bags
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Common {
  final int id;
  final String name;

  Common({required this.id, required this.name});

  factory Common.fromJson(Map<String, dynamic> json) {
    return Common(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Country {
  final String code;
  final String isoAlphaCode2;
  final String commonName;
  final String fullName;
  final String enName;

  Country({
    required this.code,
    required this.isoAlphaCode2,
    required this.commonName,
    required this.fullName,
    required this.enName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'],
      isoAlphaCode2: json['iso_alpha_code_2'],
      commonName: json['common_name'],
      fullName: json['full_name'],
      enName: json['en_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['iso_alpha_code_2'] = isoAlphaCode2;
    data['common_name'] = commonName;
    data['full_name'] = fullName;
    data['en_name'] = enName;
    return data;
  }
}
