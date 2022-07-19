class DeleteColumnAssessmentZoo < ActiveRecord::Migration[6.1]
  def change
    remove_column :zoos, :assessment, :string
  end
end
