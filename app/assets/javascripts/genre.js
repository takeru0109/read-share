$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(genre){
    var html = `<option value="${genre.id}" data-category="${genre.id}">${genre.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_genre" name="book[genre_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                        </div>
                      </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_genre').on('change', function(){
    var parentGenre = document.getElementById('parent_genre').value; //選択された親カテゴリーの名前を取得
    if (parentGenre != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/admin/books/genre_children',
        type: 'GET',
        data: { parent_name: parentGenre },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
    }
  });
});