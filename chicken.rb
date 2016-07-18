class Chicken
    include Mongoid::Document
    field :name, type: String
    field :color, type: String
end

# p Chicken.new