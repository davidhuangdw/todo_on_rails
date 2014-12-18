class ApplicationAccess
  def self.allow(actions, &condition)
    condition ||= ->(user,record){true}
    Array(actions).each do |action|
      define_method(action,&condition)
    end
  end

  def self.disallow(actions)
    allow(actions){|user,record| false}
  end

  allow %w[index show new create]
  disallow %w[edit update destroy]
end
