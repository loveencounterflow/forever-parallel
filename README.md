
# { forever, parallel, }

<center>![Forever Parallel](https://raw.githubusercontent.com/loveencounterflow/forever-parallel/master/art/forever-parallel.jpeg)</center>

Essential asynchronous methods (`forever` and `parallel`; you get `parallel-limit` and `series` for free)

Built with

* [async.util.ensureasync](https://github.com/async-js/async.util)
* [async.util.noop](https://github.com/async-js/async.util)
* [async.util.onlyonce](https://github.com/async-js/async.util)
* [async.util.restparam](https://github.com/async-js/async.util)
* [async.util.setimmediate](https://github.com/async-js/async.util)
* [async.forever](https://www.npmjs.com/package/async.forever)
* [run-parallel-limit](https://github.com/feross/run-parallel-limit)


```coffee
loop_instead_of_forever = ( done ) ->
  app       = KB.new_app()
  settings  =
    protocol:   'http'
    host:       '0.0.0.0'
    port:       8080
    roaming:    yes
  step ( resume ) ->
    loop
      { protocol, host, port, } = settings
      help "trying to start server at #{protocol}://#{host}:#{port}"
      reply = yield U.serve settings, app, resume
      break unless reply is false
      settings[ 'port' ] += +1
    done()
```













