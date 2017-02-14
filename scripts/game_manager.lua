local game_manager = {}

function game_manager:start_game()

  local exists = sol.game.exists("save1.dat")
  local game = sol.game.load("save1.dat")
  if not exists then
    -- Initialize a new savegame.
    game:set_max_life(12)
    game:set_life(game:get_max_life())
    game:set_ability("lift", 2)
    game:set_ability("sword", 1)
    game:set_starting_location("first_map") -- Starting location.
  end

  function game:on_started()
    -- HUD menu.
    local hud = require("scripts/menus/hud")
    sol.menu.start(game, hud)
    hud:create(game)

    -- Mouse control.
    local mouse_control = require("scripts/menus/mouse_control")
    sol.menu.start(game, mouse_control)
    mouse_control:create(game, hud)

    local hero = game:get_hero()
    hero:set_tunic_sprite_id("main_heroes/eldran")
    hero1:set_tunic_sprite_id("main_heroes/player")--needs fix
  end


  game:start()
end

return game_manager

