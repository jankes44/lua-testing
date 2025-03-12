_G.love = require 'love'
_G.Class = require 'libs.hump.class'
_G.Signal = require 'libs.hump.signal'
_G.Gamestate = require 'libs.hump.gamestate'
_G.Sounds = require 'sfx.sounds'

DrawDebug = false

States = {
    intro = require 'gamestates.intro',
    menu = require 'gamestates.menu',
    game = require 'gamestates.game'
}

function love.load()
    Sounds()
    Gamestate.registerEvents()
    Gamestate.switch(States.intro)
end