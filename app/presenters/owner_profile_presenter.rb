# frozen_string_literal: true

class OwnerProfilePresenter
    def initialize(owner, viewer)
      @owner = owner
      @viewer = viewer
    end
  
    def can_edit?
      viewer.id == owner.id
    end

    def can_comment?
      viewer.id != owner.id &&
        Order.find_by(owner: owner, sitter: viewer)
    end

    def profile
      owner.profile
    end
  
    def full_name
      owner.profile.full_name
    end

    def description 
      owner.profile.description
    end

    def phone
      owner.profile.phone
    end

    def pets
      owner.pets
    end

    def pets_count
      pet = owner.pets

      pet.count > 1 ? "#{pet.count} dogs" : "#{pet.count} dog"
    end

    def comments
      owner.received_comments.order(created_at: :desc)
    end

    def pets_size(weight)
      if weight < 10
        "Small dog"
      elsif weight.between?(11,20)
        "Medium dog"
      elsif weight.between?(21,40)
        "Large dog"
      else
        "Giant dog"
      end
    end
  
    private
  
    attr_reader :viewer, :owner
end
  