class ProjectRepository < ROM::Repository::Root
  root :projects

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Projects

  def all
    projects.all.to_a
  end

  def by_id(id)
    projects.by_pk(id).one!
  end
end
