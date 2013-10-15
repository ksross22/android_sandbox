Feature: Practicing using Honeydew
Background: Tablet is unlocked 
	Given the tablet is unlocked

Scenario: Add event using Calendar
    When I launch app Calendar
    Then I add an all day event for today
    And I should be taken back to the calendar view

Scenario: Search event in Calendar app
	Given I search for the event I just created
	Then I should see the event
