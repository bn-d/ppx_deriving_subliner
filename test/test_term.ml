open Ppxlib

let loc = Location.none

module Conv = struct
  module T = Ppx_subliner.Term.Conv

  let t = Alcotest.testable (fun _ _ -> ()) ( = )

  let test name (ct : core_type) (expected : T.complex) =
    let f () = T.of_core_type ct |> snd |> Alcotest.check t name expected in
    Alcotest.test_case name `Quick f

  let test_raises name (ct : core_type) expected =
    Utils.test_raises name expected (fun () -> T.of_core_type ct)

  let test_set =
    [
      test "bool" [%type: bool] (T.Value Bool);
      test "char" [%type: char] (T.Value Char);
      test "int" [%type: int] (T.Value Int);
      test "nativeint" [%type: nativeint] (T.Value Nativeint);
      test "int32" [%type: int32] (T.Value Int32);
      test "int64" [%type: int64] (T.Value Int64);
      test "float" [%type: float] (T.Value Float);
      test "string" [%type: string] (T.Value String);
      test "option" [%type: int option] (T.Option Int);
      test "list" [%type: int list] (T.List (None, Int));
      test "array" [%type: int array] (T.Array (None, Int));
      test_raises "invalid_1" [%type: int seq] "unsupported field type";
      test_raises "invalid_2" [%type: unit] "unsupported field type";
    ]
end

let test_set = []
