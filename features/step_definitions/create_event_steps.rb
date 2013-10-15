require 'honeydew'

tablet = Honeydew::Device.new 'D1OKCT054328'



Given(/^the tablet is unlocked$/) do
  	tablet.wake_up
  	if tablet.has_button? '6 MNO'
  		tablet.click_button('0')
  		tablet.click_button('0')
  		tablet.click_button('0')
  		tablet.click_button('0')
		tablet.click_element 'Enter'
	end
end

When(/^I launch app (.+)$/) do |app|
	tablet.press_back
	tablet.press_back
	tablet.press_back
	tablet.press_back
	tablet.press_back
	tablet.launch_home
  	#tablet.launch_application app
  	tablet.click_element "Apps"
  	tablet.click_text app
end

Then(/^I add an all day event for today$/) do
	tablet.click_element "New event"
	@event_name = 'A new event for today'
	tablet.fill_in_by_label('Event name', with: @event_name)
	tablet.press_enter
	tablet.fill_in_by_label('Location', with: 'The Office')
	tablet.click_element('All day event')
	tablet.click_text('Done')
end

Then(/^I should be taken back to the calendar view$/) do
  	tablet.should have_textview_text "Today"
end	

Given(/^I search for the event I just created$/) do
 	tablet.click_element "More options"
 	tablet.click_text "Search"
 	tablet.click_element "Search query"
 	tablet.fill_in('Search query', with: @event_name)
 	tablet.press_enter

end

Then(/^I should see the event$/) do
  	tablet.should have_textview_text @event_name
end