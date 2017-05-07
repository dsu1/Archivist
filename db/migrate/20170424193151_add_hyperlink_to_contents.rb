class AddHyperlinkToContents < ActiveRecord::Migration
  def change
		add_column :contents, :link, :string
		change_column_null :contents, :title, false
  end
end
