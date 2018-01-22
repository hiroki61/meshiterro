class PostImage < ApplicationRecord
	# 画像アップロードに関しては<%= f.attachment_field :image %>で実装しています。指定するフィールド名はimage_idから_idを除いた名前を指定します。
	# これはrefileのルールです。
	attachment :image#idは含めません）
# PostImageモデルに紐付くのは1つのUserモデルなので単数形になる点に注意してください。
		belongs_to :user

		has_many :post_comments, dependent: :destroy
		has_many :favorites, dependent: :destroy

		validates :shop_name, presence: true
		validates :image, presence: true

		# favorited_byメソッドは引数で渡されたユーザのidがFavoritesテーブル内に含まれているかどうかを調べます。含まれていればTrue、含まれていなければFalseを返すようにしています。
		def favorited_by?(user)
			favorites.where(user_id: user.id).exists?
		end
end
