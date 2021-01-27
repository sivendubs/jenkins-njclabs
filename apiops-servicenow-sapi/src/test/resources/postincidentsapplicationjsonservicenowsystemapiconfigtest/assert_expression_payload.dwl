%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "insertResponse": {
    "sys_id": "5a72b3bedbc120105a299444ca961990",
    "number": "INC0010004"
  }
})