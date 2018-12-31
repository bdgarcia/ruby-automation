# frozen_string_literal: true

module PageObjects
  # pageObject for google home page
  class Home < SitePrism::Page
    element :searchbox, '.gLFyf'
    element :searchbutton, "input[name='btnK']:nth-of-type(1)"
    element :luckybutton, "input[name='btnI']:nrh-of-type(1)"
  end
end
