class AddForeignKey < ActiveRecord::Migration
  def change
		add_column :archives, :user_id, :integer
		add_column :contents, :archive_id, :integer
  end
end
