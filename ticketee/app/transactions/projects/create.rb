require 'dry-transaction'

module Projects
  class Create
    include Dry::Transaction

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

    private

    def project_repo
      ProjectRepository.new(ROM.env)
    end
  end
end