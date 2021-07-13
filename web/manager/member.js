function Member(id, pw, name) {
    this.userid = id;
    this.pw = pw;
    this.username = name;
}

Member.prototype.makeHtml = function () {
    return '[id:' + this.userid + ' , pw: ' + this.pw + ' , name: ' + this.username + ' ]'
};
