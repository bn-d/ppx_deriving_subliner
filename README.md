# [@@deriving subliner] and [%%subliner]
[![OCaml][ocaml-badge]](#)
[![CI][ci-badge]](https://github.com/bn-d/ppx_subliner/actions/workflows/build.yml)
[![GitHub release status][release-badge]](https://github.com/bn-d/ppx_subliner/releases)
[![Coverage Status][coveralls-badge]](https://coveralls.io/github/bn-d/ppx_subliner?branch=main)

[ocaml-badge]: https://img.shields.io/badge/-OCaml-EC6813?logo=ocaml&labelColor=white
[ci-badge]: https://github.com/bn-d/ppx_subliner/actions/workflows/build.yml/badge.svg?branch=master
[release-badge]: https://img.shields.io/github/v/release/bn-d/ppx_subliner
[coveralls-badge]: https://coveralls.io/repos/github/bn-d/ppx_subliner/badge.svg?branch=main

`[@@deriving]` plugin to generate [Cmdliner](cmdliner) sub-command groups, and ppx rewriter to generate [Cmdliner](cmdliner) evaluations.

## Installation

`ppx_subliner` can be installed via [OCaml Package Manager](https://opam.ocaml.org/packages/ppx_subliner/).

```console
$ opam install ppx_subliner
```

## Usage
Please see the [documentation](https://boni.ng/ppx_subliner/ppx_subliner/index.html).

[cmdliner]: https://github.com/dbuenzli/cmdliner

## Example

```ocaml
type params = Foo of { my_arg : string } | Bar [@@deriving subliner]

let handle = function
  | Foo { my_arg } -> print_endline ("Foo " ^ my_arg)
  | Bar -> print_endline "Bar"

(* {eval function}.{type name} <- {function expression> *)
[%%subliner.cmds
eval.params <- handle]
[@@name "foobar"]
[@@version "3.14"]
[@@default Cmdliner.Term.(ret (const (`Error (false, "foobar2000"))))]
(** Some docs *)
```
