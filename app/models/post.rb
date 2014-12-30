class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_one :postvote
  after_create do
    Postvote.create(post_id: self.id, up_count: 0, down_count: 0)
  end
  after_destroy do
    Postvote.find_by(post_id: self.id).destroy
  end
  scope :ordered_by_postvote_upcount, -> { joins(:postvote).order('postvotes.up_count DESC') }
  scope :ordered_by_postvote_downcount, -> { joins(:postvote).order('postvotes.down_count DESC') }

  def self.order_by(order)
    case order
    when "recent"
      posts = Post.all.order('created_at DESC')
    when "old"
      posts = Post.all.order('created_at')
    when "upvote"
      posts = Post.ordered_by_postvote_upcount
    when "downvote"
      posts = Post.ordered_by_postvote_downcount
    end
    posts
  end
end
