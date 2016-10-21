

############################################################################################################
CND                       = require 'cnd'
rpr                       = CND.rpr.bind CND
badge                     = 'FOREVER-PARALLEL'
log                       = CND.get_logger 'plain',     badge
info                      = CND.get_logger 'info',      badge
whisper                   = CND.get_logger 'whisper',   badge
alert                     = CND.get_logger 'alert',     badge
debug                     = CND.get_logger 'debug',     badge
warn                      = CND.get_logger 'warn',      badge
help                      = CND.get_logger 'help',      badge
urge                      = CND.get_logger 'urge',      badge
echo                      = CND.echo.bind CND
#...........................................................................................................
test                      = require 'guy-test'
{ forever, parallel, }    = require '..'


#===========================================================================================================
# HELPERS
#-----------------------------------------------------------------------------------------------------------
@_prune = ->
  for name, value of @
    continue if name.startsWith '_'
    delete @[ name ] unless name in include
  return null

#-----------------------------------------------------------------------------------------------------------
@_main = ->
  test @, 'timeout': 3000


#===========================================================================================================
#
#-----------------------------------------------------------------------------------------------------------
@[ "forever (1)" ] = ( T, done ) ->
  #.........................................................................................................
  after = ( t, handler ) ->
    whisper "sleeping for #{t} seconds"
    setTimeout handler, t * 1000
  #.........................................................................................................
  get_context = ( handler ) ->
    count = 10
    #.......................................................................................................
    task = ( next ) ->
      count += -1
      help count
      after 0.25, ( error ) ->
        if count > 0
          return next()
        warn 'over'
        handler()
    #.......................................................................................................
    forever task
    return null
  #.........................................................................................................
  get_context ( error, result ) ->
    warn error if error?
    help rpr result
    done()


############################################################################################################
unless module.parent?
  include = [
    "forever (1)"
    ]
  @_prune()
  @_main()

  # CND.run => @_main()
  # CND.run => @[ "spawn reports errors, doesn't throw (1)" ]()
  # CND.run => @[ "spawn reports errors, doesn't throw (2)" ]()

  # debug '5562', JSON.stringify key for key in Object.keys @

  # @[ "(v4) $select (demo)" ] null, -> warn "not tested"

