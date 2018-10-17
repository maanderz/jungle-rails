require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "can click the 'Add to Cart' button for a product on the home page and in doing so cart increases by one" do
    # ACT
    visit root_path 

    first('article.product').find_button('Add').click

    sleep 3
    # DEBUG / VERIFY
    save_screenshot
    
  end

end
