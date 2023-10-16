class Role {
  late String id;
  late String name;
  late List<Module> modules;
  late List<Action> actions;

  Role({
    required this.id,
    required this.name,
    required this.modules,
    required this.actions,
  });

  factory Role.fromJson(Map<String, dynamic> data) {
    return Role(
      id: data['id'],
      name: data['name'],
      modules: List<Module>.from(
        data['modules'].map<Module>((dynamic i) => Module.fromJson(i)),
      ),
      actions: List<Action>.from(
        data['actions'].map<Action>((dynamic i) => Action.fromJson(i)),
      ),
    );
  }

  get code => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'modules': modules.isNotEmpty
          ? List<Map<String, dynamic>>.from(modules.map((e) => e.toJson()))
          : [],
      'actions': actions.isNotEmpty
          ? List<Map<String, dynamic>>.from(actions.map((e) => e.toJson()))
          : [],
    };
  }
}

class Module {
  late String id;
  late String name;
  late String code;
  late String icon;
  late int sequence;
  late List<Page> pages;

  Module({
    required this.id,
    required this.name,
    required this.code,
    required this.icon,
    required this.sequence,
    required this.pages,
  });

  factory Module.fromJson(Map<String, dynamic> data) {
    return Module(
      id: data['id'],
      name: data['name'],
      code: data['code'],
      icon: data['icon'],
      sequence: data['sequence'],
      pages: List<Page>.from(
        data['pages'].map<Page>((dynamic i) => Page.fromJson(i)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'icon': icon,
        'sequence': sequence,
        'pages': pages.isNotEmpty
            ? List<Map<String, dynamic>>.from(pages.map((e) => e.toJson()))
            : [],
      };
}

class Action {
  late String id;
  late String name;
  late String moduleId;
  late String moduleName;
  late String pageId;
  late String pageName;

  Action({
    required this.id,
    required this.name,
    required this.moduleId,
    required this.moduleName,
    required this.pageId,
    required this.pageName,
  });

  factory Action.fromJson(Map<String, dynamic> data) {
    return Action(
      id: data['id'],
      name: data['name'],
      moduleId: data['module_id'],
      moduleName: data['module_name'],
      pageId: data['page_id'],
      pageName: data['page_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'module_id': moduleId,
        'module_name': moduleName,
        'page_id': pageId,
        'page_name': pageName
      };
}

class Page {
  late String id;
  late String name;
  late String code;
  late String path;
  late String icon;
  late int sequence;
  late String groupCode;
  late String groupName;

  Page({
    required this.id,
    required this.name,
    required this.code,
    required this.path,
    required this.icon,
    required this.sequence,
    required this.groupCode,
    required this.groupName,
  });

  factory Page.fromJson(Map<String, dynamic> data) {
    return Page(
      id: data['id'],
      name: data['name'],
      code: data['code'],
      path: data['path'],
      icon: data['icon'],
      sequence: data['sequence'],
      groupCode: data['group_code'],
      groupName: data['group_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'path': path,
        'icon': icon,
        'sequence': sequence,
        'group_code': groupCode,
        'group_name': groupName
      };
}
