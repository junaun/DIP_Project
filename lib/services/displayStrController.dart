class DisplayStrController {
  String userQn = '';
  String userAns = '';

  displayStrController(String userQuestion, String userAns) {
    this.userAns = userAns;
    this.userQn = userQuestion;
  }

  void setUserAns(var userAns) {
    this.userAns = userAns;
  }

  void setUserQn(var userQn) {
    this.userQn = userQn;
  }

  String getUserQn() {
    return userQn;
  }

  String getUserAns() {
    return userAns;
  }

  void clearInput() {
    setUserQn("");
  }

  void clearOutput() {
    setUserAns("");
  }

  void appendQn(String newKey) {
    setUserQn(userQn + newKey);
  }

  void removeQn() {
    userQn.trimRight();
  }
}
