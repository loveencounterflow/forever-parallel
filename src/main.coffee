





############################################################################################################
CND                       = require 'cnd'
rpr                       = CND.rpr
badge                     = 'ASYNC-MINIMAL'
debug                     = CND.get_logger 'debug',     badge
#...........................................................................................................
# { step, }                 = require 'coffeenode-suspend'
#...........................................................................................................
# require '../interim/node_modules/async.util.ensureasync'
# require '../interim/node_modules/async.util.noop'
# require '../interim/node_modules/async.util.onlyonce'
# require '../interim/node_modules/async.util.restparam'
# require '../interim/node_modules/async.util.setimmediate'
@forever        = '../interim/node_modules/async.forever'
parallel_limit  = '../interim/node_modules/run-parallel-limit'

#-----------------------------------------------------------------------------------------------------------
@series = ( tasks, handler ) -> @parallel tasks, 1, handler

#-----------------------------------------------------------------------------------------------------------
@parallel = ( tasks, limit, handler ) ->
  switch arity = arguments.length
    when 2 then [ limit, handler, ] = [ Infinity, limit, ]
    when 3 then null
    else throw new Error "expected 2 or 3 arguments, got #{arity}"
  #.........................................................................................................
  return parallel_limit tasks, limit, handler


