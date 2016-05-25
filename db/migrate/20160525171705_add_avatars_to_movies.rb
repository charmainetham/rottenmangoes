class AddAvatarsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :avatar, :string
  end
end
