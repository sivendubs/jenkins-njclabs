Feature: Testing the API's	

Scenario: Get Salesforce Accounts
Given I create a new request with http://localhost:8082/api/ service
And I add the accounts endpoint to the service
And with the following headers
| authorization | Bearer eyJraWQiOiJjQnNKTDh1bmJMT1N6b2x2cXk1eF9SOWxSLTBKb3k3NGRFOTJHV2hmWjJZIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULktOYmFRWjIzX0o0dzQyWVdCM3gxbmE3eWpJVHo2RGRnT1hjWUtGcGRPUEEiLCJpc3MiOiJodHRwczovL2Rldi02MjMwODIub2t0YS5jb20vb2F1dGgyL2RlZmF1bHQiLCJhdWQiOiJhcGk6Ly9kZWZhdWx0IiwiaWF0IjoxNjEwMzI3NjMwLCJleHAiOjE2MTA0MTQwMzAsImNpZCI6IjBvYTFsM2VmdmY3VTBwQjUzNHg3Iiwic2NwIjpbIm11bGVzY29wZSJdLCJzdWIiOiIwb2ExbDNlZnZmN1UwcEI1MzR4NyJ9.YcXR016tKLVbhJojeMjI6Iz1s61gnIvdtJ44isPuqiNrG8mQqZIi1VyiVIwfXOhQ0U6m2CTXcrrsgL5TVTXBuoavhmfBm4kmi5IafUx0Q-BBj1Aby2_9DoNXUBqnQtHTj6TRSmqeH0_xPzAclaGfbyPrFvJtnVgF1mEX5QIUNgVvHL7_tS7LAOWvG9BByAp8NfEogE5xsgMIVlSesaXD2qZssSbPltq7a_b3ZuJJKAfQ5aoKqWir5WTJRnrEYdMfosZ3zviI9DYI7h_TOl665v7-20L7fWN0Dkj-ZXmMcJbrSvH4f2fkDwrGEb3P1BobfOAd4VXZFmm1rBhODtibsw |
| Content-Type | application/json |
And I send the GET request to the service
Then I get the 200 response code


