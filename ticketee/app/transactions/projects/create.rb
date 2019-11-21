require 'dry-transaction'

module Projects
  class Create
    include Dry::Transaction
    include Ticketee::Import["project_repo"]

    step :validate
    map :persist

    def validate(input)
      validation = ProjectContract.new.(input)
      if validation.success?
        Success(input)
      else
        Failure(validation.errors.to_h)
      end
    end

    def persist(input)
      project_repo.create(input)
    end
  end
end