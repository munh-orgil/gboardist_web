class Constants {
  Constants._();

  static String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }

  static String formatFileSize(int fileSizeInBytes) {
    if (fileSizeInBytes < 1024) {
      return '$fileSizeInBytes B';
    } else if (fileSizeInBytes < 1024 * 1024) {
      double fileSizeInKB = fileSizeInBytes / 1024;
      return '${fileSizeInKB.toStringAsFixed(2)} KB';
    } else if (fileSizeInBytes < 1024 * 1024 * 1024) {
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
      return '${fileSizeInMB.toStringAsFixed(2)} MB';
    } else {
      double fileSizeInGB = fileSizeInBytes / (1024 * 1024 * 1024);
      return '${fileSizeInGB.toStringAsFixed(2)} GB';
    }
  }

  static String getGender(int gender) {
    // ignore: unnecessary_null_comparison
    if (gender == null || gender == 0) {
      return "Бусад";
    }
    if (gender == 1) {
      return "Эрэгтэй";
    } else if (gender == 2) {
      return "Эмэгтэй";
    } else {
      return "Бусад";
    }
  }
}
