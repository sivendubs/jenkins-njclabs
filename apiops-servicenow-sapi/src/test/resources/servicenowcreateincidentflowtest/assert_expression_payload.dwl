%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "insertResponse": {
    "sys_id": "1cd5b732db0520105a299444ca961990",
    "number": "INC0010006"
  }
})