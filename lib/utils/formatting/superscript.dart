const Map<String, String> map = {
  "0": "\u2070",
  "1": "\u00B9",
  "2": "\u00B2",
  "3": "\u00B3",
  "4": "\u2074",
  "5": "\u2075",
  "6": "\u2076",
  "7": "\u2077",
  "8": "\u2078",
  "9": "\u2079",
  " ": "\u2009",
  "+": "\u207A",
  "-": "\u207B",
  "n": "\u207F"
};

var thing = "".makeSuper();

extension Superscript on String {
  String makeSuper() {
    String superscript = "";
    for (int i = 0; i < this.length; i++) {
      String char = this[i];
      if (map.containsKey(char)) {
        superscript += map[char];
      } else {
        throw Exception("Please implement $char superscript character");
      }
    }
    return superscript;
  }
}
