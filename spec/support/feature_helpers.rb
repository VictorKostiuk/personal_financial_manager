# frozen_string_literal: true

require "rails_helper"
require "faker"

module FeatureHelpers
  def category_formation
    click_on "New category"
    fill_in "Name", with: "Computer club"
    fill_in "Description", with: "Computer club (user group), a computer users' group"
    click_on "Create Category"
    sleep 1
  end

  def operation_formation
    click_on "New operation"
    fill_in "Amount", with: "100"
    fill_in "Odate", with: Time.now
    fill_in "Description", with: "Computer club (user group), a computer users' group"
    click_on "Create Operation"
    sleep 1
  end
end

