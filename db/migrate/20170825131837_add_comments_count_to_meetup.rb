class AddCommentsCountToMeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :comments_count, :integer, :default => 0
    Meetup.pluck(:id).each do |i|
      Meetup.reset_counters(i, :comments)
    end
  end
end
