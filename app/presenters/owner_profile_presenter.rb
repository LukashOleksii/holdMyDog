# frozen_string_literal: true

class OwnerProfilePresenter
  def initialize(owner, viewer)
    @owner  = owner
    @viewer = viewer
  end

  def can_edit?
    viewer.id == owner.id
  end

  def can_comment?
    viewer.id != owner.id && Order.find_by(owner: owner, sitter: viewer).status == 'Done'
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

  def orders
    owner.orders
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
      'Small dog'
    elsif weight.between?(11, 20)
      'Medium dog'
    elsif weight.between?(21, 40)
      'Large dog'
    else
      'Giant dog'
    end
  end

  def find_order(owner, sitter)
    Order.find_by(owner: owner, sitter: sitter)
  end

  def able_comment?
    author   = User.find(viewer.id)
    receiver = User.find(owner.id)
    order    = author.is_a?(Owner) ? find_order(author, receiver) : find_order(receiver, author)
    order.present? && order.status == 'Done'
  end

  private

  attr_reader :viewer, :owner
end
