@editor @tiny @editor_tiny @tiny_html @tiny_cloze @javascript
Feature: Test the cloze question editor string compilation

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email               |
      | teacher  | Mark      | Allright | teacher@example.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user    | course | role           |
      | teacher | C1     | editingteacher |
    Given the following "user preferences" exist:
      | user    | preference | value |
      | teacher | htmleditor | tiny  |

  Scenario: Create a MULTICHOICE_H question with 3 answers
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I press "Create a new question ..."
    And I set the field "Embedded answers (Cloze)" to "1"
    And I click on "Add" "button" in the "Choose a question type to add" "dialogue"
    And I set the field "Question name" to "multianswer-001"
    And I click on "Cloze question editor" "button"
    And I set the field "MULTICHOICE_H" to "1"
    And I click on "Select question type" "button"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_answer')]" to "cat"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_feedback')]" to "That is correct"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//select[contains(@class, 'tiny_cloze_fraction')]" to "Correct"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_answer')]" to "dog"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_feedback')]" to "That is not correct"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_answer')]" to "mouse"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_feedback')]" to "That is totally wrong"
    When I click on "Insert question" "button"
    And I click on the "View > Source code" menu item for the "Question text" TinyMCE editor
    Then I should see "<p>{1:MULTICHOICE_H:=cat#That is correct~dog#That is not correct~mouse#That is\n  totally wrong}</p>" source code for the "Question text" TinyMCE editor

  Scenario: Create a MULTICHOICE_H question with 4 answers and percent grades
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I press "Create a new question ..."
    And I set the field "Embedded answers (Cloze)" to "1"
    And I click on "Add" "button" in the "Choose a question type to add" "dialogue"
    And I set the field "Question name" to "multianswer-001"
    And I click on "Cloze question editor" "button"
    And I set the field "MULTICHOICE_H" to "1"
    And I click on "Select question type" "button"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_answer')]" to "cat"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//select[contains(@class, 'tiny_cloze_fraction')]" to "0%"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_answer')]" to "dog"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//select[contains(@class, 'tiny_cloze_fraction')]" to "50%"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_answer')]" to "mouse"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//select[contains(@class, 'tiny_cloze_fraction')]" to "100%"
    And I click on "//form[@name='tiny_cloze_form']//li[3]//a[contains(@class, 'tiny_cloze_add')]" "xpath"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[4]//input[contains(@class, 'tiny_cloze_answer')]" to "lion"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[4]//select[contains(@class, 'tiny_cloze_fraction')]" to "0%"
    When I click on "Insert question" "button"
    And I click on the "View > Source code" menu item for the "Question text" TinyMCE editor
    Then I should see "<p>{1:MULTICHOICE_H:%0%cat~%50%dog~%100%mouse~%0%lion}</p>" source code for the "Question text" TinyMCE editor

  Scenario: Create a MULTICHOICE_V question with 3 answers and custom percent grades
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I press "Create a new question ..."
    And I set the field "Embedded answers (Cloze)" to "1"
    And I click on "Add" "button" in the "Choose a question type to add" "dialogue"
    And I set the field "Question name" to "multianswer-001"
    And I click on "Cloze question editor" "button"
    And I set the field "MULTICHOICE_V" to "1"
    And I click on "Select question type" "button"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_answer')]" to "cat"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//select[contains(@class, 'tiny_cloze_fraction')]" to "0%"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_answer')]" to "dog"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//select[contains(@class, 'tiny_cloze_fraction')]" to "Custom"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_frac_custom')]" to "-22"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_answer')]" to "mouse"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//select[contains(@class, 'tiny_cloze_fraction')]" to "100%"
    When I click on "Insert question" "button"
    And I click on the "View > Source code" menu item for the "Question text" TinyMCE editor
    Then I should see "<p>{1:MULTICHOICE_V:%0%cat~%-22%dog~%100%mouse}</p>" source code for the "Question text" TinyMCE editor

  Scenario: Create a MULTICHOICE_HS question with 3 answers and changing order
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I press "Create a new question ..."
    And I set the field "Embedded answers (Cloze)" to "1"
    And I click on "Add" "button" in the "Choose a question type to add" "dialogue"
    And I set the field "Question name" to "multianswer-001"
    And I click on "Cloze question editor" "button"
    And I set the field "MULTICHOICE_HS" to "1"
    And I click on "Select question type" "button"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_answer')]" to "cat"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//select[contains(@class, 'tiny_cloze_fraction')]" to "Correct"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_answer')]" to "dog"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_answer')]" to "mouse"
    And I click on "//form[@name='tiny_cloze_form']//li[3]//a[contains(@class, 'tiny_cloze_up')]" "xpath"
    And I click on "//form[@name='tiny_cloze_form']//li[1]//a[contains(@class, 'tiny_cloze_down')]" "xpath"
    When I click on "Insert question" "button"
    And I click on the "View > Source code" menu item for the "Question text" TinyMCE editor
    Then I should see "<p>{1:MULTICHOICE_HS:mouse~=cat~dog}</p>" source code for the "Question text" TinyMCE editor

  Scenario: Create a MULTIRESPONSE_S question with 3 answers and deleting an answer
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I press "Create a new question ..."
    And I set the field "Embedded answers (Cloze)" to "1"
    And I click on "Add" "button" in the "Choose a question type to add" "dialogue"
    And I set the field "Question name" to "multianswer-001"
    And I click on "Cloze question editor" "button"
    And I set the field "MULTICHOICE_HS" to "1"
    And I click on "Select question type" "button"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//input[contains(@class, 'tiny_cloze_answer')]" to "cat"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[1]//select[contains(@class, 'tiny_cloze_fraction')]" to "Correct"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[2]//input[contains(@class, 'tiny_cloze_answer')]" to "dog"
    And I set the field with xpath "//form[@name='tiny_cloze_form']//li[3]//input[contains(@class, 'tiny_cloze_answer')]" to "mouse"
    And I click on "//form[@name='tiny_cloze_form']//li[2]//a[contains(@class, 'tiny_cloze_delete')]" "xpath"
    When I click on "Insert question" "button"
    And I click on the "View > Source code" menu item for the "Question text" TinyMCE editor
    Then I should see "<p>{1:MULTICHOICE_HS:=cat~mouse}</p>" source code for the "Question text" TinyMCE editor
