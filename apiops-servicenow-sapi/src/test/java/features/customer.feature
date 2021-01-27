Feature: Testing the API's	

Scenario: Create ServiceNow incident
<<<<<<< HEAD
Given I create a new request with http://apios-servicenow-sapi.us-e2.cloudhub.io/api/ service
=======
Given I create a new request with http://localhost:8095/api/ service
>>>>>>> be269fefde10b3aefea2dd47a8d40ffab55af972
And I add the incidents endpoint to the service
And I send the values of src/test/resources/cucumberResources/serviceNowIncidentInput.json in the request body
And with the following headers
| Content-Type | application/json |
And I send the POST request to the service
Then I get the 201 response code


