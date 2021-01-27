Feature: Testing the API's

Scenario: Get Subscribed customer details
Given I create a new request with http://localhost:8082/api/ service
And I add the users/registerUser/subscription endpoint to the service
And I send the GET request to the service
Then I get the 200 response code

Scenario: Register Customer 
Given I create a new request with http://localhost:8082/api/ service
And I add the users/registerUser endpoint to the service
And with the following headers
| Content-Type | application/json |
And I send the values of src/test/resources/cucumberResources/registerCustomerInput.json in the request body
And I send the POST request to the service
Then I get the 201 response code
Then I expect the values of src/test/resources/cucumberResources/registerCustomerOutput.json in the response body

Scenario: Test the scheduler part
Given I create a new request with http://localhost:8082/api/ service
And I add the synchronizeUsers endpoint to the service
And I send the GET request to the service
Then I get the 200 response code


Scenario: Get Salesforce Accounts
Given I create a new request with http://acme-salesforce-accounts-api.us-e2.cloudhub.io/api/ service
And I add the accounts endpoint to the service
And with the following headers
| authorization | Bearer eyJraWQiOiItSldKZUhlZVFzWlhSLXRUZHVpeXZLNGRsS3BxWXRKMmR1WmlVdnVRdnd3IiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULmd0TXJaWGlqOWJpc2tkOXNkV2RoZXcxR3hhY3U2dE1TaUw0ZUN6ajVSRXMiLCJpc3MiOiJodHRwczovL2Rldi02MjMwODIub2t0YS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNjA4Mjg3NTc5LCJleHAiOjE2MDgzNzM5NzksImNpZCI6IjBvYTFsM2VmdmY3VTBwQjUzNHg3Iiwic2NwIjpbIm11bGVzY29wZSJdLCJzdWIiOiIwb2ExbDNlZnZmN1UwcEI1MzR4NyJ9.fNoWJJP5CMBzZN-O76X3scnfJlPsMdi5aEKZGE2XIHSuDvGew_LvDDP1UoTVyHDa1mcmF8QlKsjjoGNAn4G_7rpa2-P5VqiczbY79XyqBxlR7axa3ShRm42pZ94Pq39oL4NcG3s-wka2StiF5-gn1jSjuaEVJJXLT0GRhnDbibAzenQUZzbejcIbWZziWa4lglusN1IQ0gN7-o2VF5qtlxAB2e8W3dVvlLFSsFu-CfAmJr0ZDy3V92mcaztuqie2lbTkOJ1QF9MPBxCDlKs0925XHBn4X42hP1i5zyX6Owedfc1rpUn8h2rDSnvphBM29APYvj02khHs1pdaXjotTg |
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
