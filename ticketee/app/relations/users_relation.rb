class UsersRelation < ROM::Relation[:sql]
  gateway :default

  schema(:users, infer: true)

  def contributors_for_project(project_id)
    distinct(:id)
      .inner_join(:tickets, user_id: :id)
      .where(project_id: project_id)
  end
  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end
