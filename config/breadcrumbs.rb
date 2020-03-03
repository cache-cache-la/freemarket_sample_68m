crumb :root do
  link "トップページ", root_path
end

crumb :categories do
  link "カテゴリー", categories_path
  parent :root
end

crumb :mypages do
  link "マイページ", mypages_index_path
  parent :root
end

crumb :logout do
  link "ログアウト", mypages_logout_path
  parent :mypages
end

crumb :user_edit do
  link "発送元・お届け先住所変更", edit_user_registration_path
  parent :mypages
end

crumb :cards do
  link "お支払い方法", new_card_path
  parent :mypages
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).