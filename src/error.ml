open Ppxlib

let unsupported_type ~loc type_ { txt = name; loc = _ } =
  Location.raise_errorf ~loc "%s %s cannot be derived" type_ name

let attribute_name ~loc name =
  Location.raise_errorf ~loc "unexpected attribute name: %s" name

let attribute_payload ~loc =
  Location.raise_errorf ~loc "payload of this attribute of is not supported"
