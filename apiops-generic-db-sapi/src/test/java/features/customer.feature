Feature: Testing the API's

Scenario: Get Subscribed customer details
Given I create a new request with http://localhost:8095/api/ service
And I add the users/registerUser/subscription endpoint to the service
And I send the GET request to the service
Then I get the 200 response code

Scenario: Register Customer 
Given I create a new request with http://localhost:8095/api/ service
And I add the users/registerUser endpoint to the service
And with the following headers
| Content-Type | application/json |
And I send the values of src/test/resources/cucumberResources/registerCustomerInput.json in the request body
And I send the POST request to the service
Then I get the 201 response code
Then I expect the values of src/test/resources/cucumberResources/registerCustomerOutput.json in the response body

Scenario: Test the scheduler part
Given I create a new request with http://localhost:8095/api/ service
And I add the synchronizeUsers endpoint to the service
And I send the GET request to the service
Then I get the 200 response code


Scenario: Get Salesforce Accounts
Given I create a new request with http://apiops-salesforce-sapi-njclabs.us-e2.cloudhub.io/api/ service
And I add the accounts endpoint to the service
And with the following headers
| authorization | Bearer eyJraWQiOiJjQnNKTDh1bmJMT1N6b2x2cXk1eF9SOWxSLTBKb3k3NGRFOTJHV2hmWjJZIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpPODY5dFY3X3BSZUw1blNrY2g2Z2FTUVFqQ3hPYk9kWXlJMVNNa1Y4VnciLCJpc3MiOiJodHRwczovL2Rldi02MjMwODIub2t0YS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNjExMjI0NDk4LCJleHAiOjE2MTEzMTA4OTgsImNpZCI6IjBvYTFsM2VmdmY3VTBwQjUzNHg3Iiwic2NwIjpbIm11bGVzY29wZSJdLCJzdWIiOiIwb2ExbDNlZnZmN1UwcEI1MzR4NyJ9.NHiq2438JYIDK_1mTDKSIpBVFsEA8k0vvK1wrciqKW6DnagYuVTVs1GbkOPRU_evlU1FYl1BER-iia9Lm-Da9ULmLrE2bbMHZAn7CfDfvKfACMDsdOGsisnUIBzvhCjMwvfpVW-JMls1IKrTLSjU9meiIRUbmcbNl9xHrnQmIC1qs_nXNzyGySr88N32YdV2AhS2ZlPJZNh36NLwmTDouyDZNy6-rTf41tykwIrHBkINXYKfoIyKq8QdJEPcc4Wh6TDyqyZT1IMsJIWmLzK_f5eQoMMLl3uXkdmF6FWMMuEXu8zWjJQoITwEx_gl7rZKOzk5RSHk9vNKXsqcmbZfyA |
| Content-Type | application/json |
And I send the GET request to the service
Then I get the 200 response code


Scenario: Create ServiceNow incident
Given I create a new request with http://apios-servicenow-sapi.us-e2.cloudhub.io/api/ service
And I add the incidents endpoint to the service
And I send the values of src/test/resources/cucumberResources/serviceNowIncidentInput.json in the request body
And with the following headers
| Content-Type | application/json |
And I send the POST request to the service
Then I get the 201 response code
