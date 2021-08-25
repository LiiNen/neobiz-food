
bool idRegexCheck(String input) {
  return RegExp(r'^(a-z)[0-9a-z]{3,14}').hasMatch(input) && input.length >= 4 && input.length <= 15;
}

bool emailRegexCheck(String input) {
  return RegExp(r'^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$').hasMatch(input);
}

bool phoneRegexCheck(String input) {
  return RegExp(r'^(010)[0-9]{8}').hasMatch(input) && input.length == 11;
}

bool pwRegexCheck(String input) {
  return input.length >= 4;
  // return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(input);
}