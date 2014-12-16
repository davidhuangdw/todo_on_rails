class Team
  module MemberManagement
    MEMBERSHIP_TYPES = Membership::ROLES.map(&:pluralize).map(&:to_sym)
    def non_members
      members.empty? ? User.all : User.where('id not in (?)',members.map(&:id))
    end

    def membership_groups
      @membership_groups ||= memberships.group_by(&:role)
    end
    def memberships_on(role)
      membership_groups[role] ||= []
    end

    def add_member(user, role:'participant')
      memberships.create!(user:user,role:role)
      self
    end
    def members_to_select
      members.map{|u| {u.id => u.username} }.reduce({nil=>'nobody'},:merge!)
    end
  end
end