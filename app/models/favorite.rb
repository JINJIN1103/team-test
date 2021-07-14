class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # belongs_to :book_comment
  # コメント機能にもいいね付けたくアソシエーションしたが、いいねする際に「コメントが空白のためエラー」が発生し、いいねがsaveされなかったためコメントアウト
  # 上のエラーちょっと意味が違うかも、favoritesテーブルのbook_comment_idがブランクになってしまうから保存できないという意味か？
end
