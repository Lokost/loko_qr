import 'package:http/http.dart' as http;

class AppRoutes {
  static String splash = "/";
  static String home = "/home";
  static String qrScanner = "/qr-scanner";
  static String result = "/result";
  static String specialResult = "/specialResult";
}

class AppInfo {
  static String creator = "Gabriel Gomes";
  static String version = "v0.1.1";
}

class LokoUtil {
  static Future<Map<String, String>> verifyVersion() async {
    var url = Uri.parse("https://github.com/Lokost/loko_qr/releases/latest");
    var request = http.Request("Get", url)
      ..followRedirects = false;

    http.Client baseClient = http.Client();
    http.StreamedResponse response = await baseClient.send(request);

    String? latest = response.headers['location']?.split("/").last.toString();

    if (AppInfo.version == latest) {
      return {"case": "updated", "msg": "O seu aplicativo está atualizado!"};
    } else if (AppInfo.version != latest) {
      return {
        "case": "update",
        "msg":
            "Há uma atualização disponível!\n\nSua versão: ${AppInfo.version} \nVersão disponível: $latest.\n\nAtualize o seu aplicativo!"
      };
    }
    return {
      "case": "error",
      "msg": "Não foi possível conectar ao servidor",
    };
  }
}
