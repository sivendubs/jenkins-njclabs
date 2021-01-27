%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "insertResponse": {
    "sys_id": "d91437fedbc120105a299444ca961958",
    "number": "INC0010005"
  }
})