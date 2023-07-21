# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Category", driver: :selenium_chrome, type: :feature do
  it "Creating category" do
    visit categories_path
    category_formation
    visit categories_path
    expect(page).to have_content "Computer club"
  end
end
