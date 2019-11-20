require 'dry-validation'

module Projects
  class ProjectContract < Dry::Validation::Contract
    schema do
      required(:name).filled
    end
  end
end