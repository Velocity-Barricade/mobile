String validatorName(String val) {
  if (val.length.toInt() == 0) {
    return "Enter Your Name";
  } else {
    return null;
  }
}

String validatorEmail(String val) {
  bool check = false;
  if (val.length.toInt() == 0) {
    return "Please Enter Email";
  } else {
    check = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(val);
    if (!val.contains("nu.edu.pk")){
      print("Not Valid");
      check = false ; 
    }
    
  }
  if (check) {
    return null;
  } else {
    return "invalid Email";
  }
}

String validatorPass(String val) {
  if (val.length.toInt() == 0) {
    return "Please enter Password ";
  } else {
    if (val.length.toInt() > 9) {
      return null;
    } else {
      return "Password is less then 9 Words";
    }
  }
}
