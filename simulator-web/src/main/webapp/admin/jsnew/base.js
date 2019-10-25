function isNull(val) {
    if (val != null && val != "null" && val != undefined && val != "") {
        return false;
    } else {
        return true;
    }
}
