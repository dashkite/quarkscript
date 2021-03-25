import * as t from "@dashkite/genie"
import * as b from "@dashkite/masonry"
import "coffeescript/register"
import {coffee} from "@dashkite/masonry-coffee"

t.define "clean", -> b.rm "build"

t.define "build", "clean", b.start [
  b.glob [ "{src,test}/**/*.coffee" ], "."
  b.read
  b.tr coffee
  b.extension ".js"
  b.write "build"
]

t.define "test", ->
  require "../test"
