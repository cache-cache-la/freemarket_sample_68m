$(function () {
  $('#parent__tree__item').each(function(index, element) {

    console.log(index);
    console.log($(element).text());
  })
  // ヘッダーのカテゴリーにマウスを乗せると発火
  // $('js-tree-btn').mouseover(function() {
  //   function buildHTML(category) {
  //     var html =
  //       `<ul class="parent__tree">
  //         ${category_parent.each do |parent|}
  //           <%= link_to category_path(parent.id) %>
  //             <li class="tree__item">
  //               ${parent.name}
  //             </li>
  //         <% end %>
  //         </ul>`

  //   }
  // });
});

// =====

