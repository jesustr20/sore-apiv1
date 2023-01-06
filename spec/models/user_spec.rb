require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validaction del modelo user' do
    subject { build(:owner) }
    it 'Validar si el email esta presente' do
      should validate_presence_of(:email)
    end

    it 'Validar si el password esta presente' do
      should validate_presence_of(:password_digest)
    end

    it 'Validar si el type esta presente' do
      should validate_presence_of(:type)
    end

    it 'Validar si el age esta presente' do
      should validate_presence_of(:age)
    end
    it 'Validar si el correo es unico' do
      should validate_uniqueness_of(:email)
    end
    it 'Validar que no acepte correos incorrecos' do
      should_not allow_value('test').for(:email)
    end
    it 'Validar si age es un numero entero' do
      should validate_numericality_of(:age).only_integer
    end
    it 'Validar si la edad es mayor o igual a 18' do
      should validate_numericality_of(:age).is_greater_than_or_equal_to(18)
    end
    it 'Validar si la edad es mayor o igual a 100' do
      should validate_numericality_of(:age).is_less_than_or_equal_to(100)
    end
    it 'Validar si solo se pueden crear empleados o propietarios' do
      should validate_inclusion_of(:type).in_array(%w[Employee Owner])
    end
    it 'Validar si existe relacion con store' do
      should belong_to(:store)
    end
  end
end
