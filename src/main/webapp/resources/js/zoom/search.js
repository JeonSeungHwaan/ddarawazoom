
function valueCheck(){
	if($('#search-category').val() == ''){
		alert("카테고리를 선택하세요.");
		return false;
	}

	if($('#search-input').val() == ''){
		alert("검색어를 입력하세요.");
		return false;
	}
}
