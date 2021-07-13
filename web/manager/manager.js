var members = [];

var idRegex = /^([a-zA-Z0-9_-]+)@([a-zA-Z.]+)\.([a-zA-Z]{2,6})$/;
var pwRegex = /^[a-zA-Z0-9]{5,20}$/;
var nameRegex = /^[가-힣]+$/;

$(document).ready(function () {
  if (localStorage.getItem('members') == null) {
    localStorage.setItem('members', JSON.stringify(members));
  } else {
    members = JSON.parse(localStorage.getItem('members'));
    console.log(members);
    setList();
  }

  var id = $('#userId');
  var pw = $('#pw');
  var repw = $('#repw');
  var name = $('#userName');

  $('#regForm').submit(function () {
    if (id.val().trim().length < 1) {
      $('#userId + div.msg').css('display', 'block').html('필수항목입니다.');
      return false;
    }

    if (!idRegex.test(id.val())) {
      $('#userId+div.msg').css('display', 'block').html('이메일 형식으로 입력해주세요');
      return false;
    }

    if (pw.val().trim().length < 1) {
      $('#pw + div.msg').css('display', 'block').html('필수항목입니다.');
      return false;
    }

    if (!pwRegex.test(pw.val())) {
      $('#pw + div.msg').css('display', 'block').html('5~20이내의 영문자와 숫자만을 입력해주세요.');
      return false;
    }

    if (repw.val().trim().length < 1) {
      $('#repw + div.msg').css('display', 'block').html('필수항목입니다.');
      return false;
    }

    if (pw.val().trim() != repw.val().trim()) {
      $('#repw + div.msg').css('display', 'block').html('비밀번호가 일치하지 않습니다.');
      return false;
    }

    if (name.val().trim() < 1) {
      $('#userName + div.msg').css('display', 'block').html('필수항목입니다.');
      return false;
    }

    if (!nameRegex.test(name.val())) {
      $('#userName + div.msg').css('display', 'block').html('한글로 입력해주세요');
      return false;
    }

    members.push(new Member(id.val(), pw.val(), name.val()));
    localStorage.setItem('members', JSON.stringify(members));
    alert('등록되었습니다.');
    console.log('회원 리스트', members);
    this.reset();
    setList();

    return false;
  });

  $(id).focus(function () {
    $('#userId + div.msg').css('display', 'none').html('');
  });

  $(pw).focus(function () {
    $('#pw + div.msg').css('display', 'none').html('');
  });

  $(repw).focus(function () {
    $('#repw + div.msg').css('display', 'none').html('');
    repw.val('');
  });

  $(name).focus(function () {
    $('#userName + div.msg').css('display', 'none').html('');
  });
});

function setList() {
  var tbody = '<tr>';
  tbody += '  <th>순번(index)</th>';
  tbody += '  <th>아이디</th>';
  tbody += '  <th>비밀번호</th>';
  tbody += '  <th>이름</th>';
  tbody += '  <th>관리</th>';
  tbody += '</tr>';

  if (members.length < 1) {
    tbody += '<tr>';
    tbody += '<td colspan="5">데이터가 존재하지 않습니다.</td>';
    tbody += '</tr>';
  } else {
    for (var i = 0; i < members.length; i++) {
      tbody += '<tr>';
      tbody += '  <td>' + i + '</td>';
      tbody += '  <td>' + members[i].userid + '</td>';
      tbody += '  <td>' + members[i].pw + '</td>';
      tbody += '  <td>' + members[i].username + '</td>';
      tbody += '  <td> <a href="javascript:editMember(' + i + ')">수정</a> |' + '<a href="javascript:deleteMember(' + i + ')">삭제</a></td>';
      tbody += '</tr>';
    }
  }
  $(list).html(tbody);
}

function deleteMember(index) {
  if (confirm('삭제하시겠습니까?')) {
    members.splice(index, 1);
    alert('삭제되었습니다.');
    localStorage.setItem('members', JSON.stringify(members));
    setList();
  }
}

function editMember(index) {
  $('#editFormArea').css('display', 'block');

  $('#editId').val(members[index].userid);
  $('#editPw').val(members[index].pw);
  $('#editRepw').val(members[index].pw);
  $('#editName').val(members[index].username);
  $('#editIdx').val(index);

  $('#editForm').submit(function () {
    if (!pwRegex.test($('#editPw').val())) {
      alert('5~20이내의 영문자와 숫자만을 입력해주세요.');
      return false;
    }

    if ($('#editPw').val() != $('#editRepw').val()) {
      alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
      return false;
    }

    if (!nameRegex.test($('#editName').val())) {
      alert('한글로 입력해주세요');
      return false;
    }

    if (!confirm('수정하시겠습니까?')) {
      return false;
    }

    members[$('#editIdx').val()].pw = $('#editPw').val();
    members[$('#editIdx').val()].username = $('#editName').val();

    localStorage.setItem('members', JSON.stringify(members));
    alert('수정되었습니다.');
    setList();
    editMemberClose();
    return false;
  });
}

function editMemberClose() {
  $('#editFormArea').css('display', 'none');
}