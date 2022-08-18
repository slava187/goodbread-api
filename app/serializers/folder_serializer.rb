class FolderSerializer < ActiveModel::Serializer
  attributes :id

  def initialize (folder)
    @folder = folder
  end

  def serialized_json
    options = {
      include: {
        recipe: {
          only: [:id, :title]
        },
        sub_folder: {
          only: [:id, :title]
        }
      },
      except: [:created_at, :updated_at]
    }

    @folder.to_json(options)
  end
end
