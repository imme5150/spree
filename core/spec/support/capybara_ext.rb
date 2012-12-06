module CapybaraExt
  def page!
    save_and_open_page
  end

  def click_icon(type)
    find(".icon-#{type}").click
  end

  def within_row(num, &block)
    within("table.index tbody tr:nth-child(#{num})", &block)
  end

  def column_text(num)
    find("td:nth-child(#{num})").text
  end

  def select2(within, value)
    # Forced narcolepsy, thanks to JavaScript
    sleep(1)
    page.execute_script "$('#{within} .select2-choice').mousedown();"
    sleep(1)
    page.execute_script "$('.select2-focused').val('foobar').trigger('keyup-change');"
    sleep(1)
    page.execute_script "$('.select2-highlighted').mouseup();"
  end
end

RSpec.configure do |c|
  c.include CapybaraExt
end
