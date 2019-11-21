class TicketRepository < ROM::Repository::Root
  root :tickets

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace Projects

  def by_id(id)
    tickets.by_pk(id).one!
  end
end
