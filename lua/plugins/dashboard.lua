return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local dashboard = require('dashboard')
    local pokemon = require('pokemon')

    -- Piplup (#393), Bulbasaur (#1), Charmander (#4), Squirtle (#7), Pikachu (#25), Jigglypuff (#39), Ponyta (#77), Gengar (#94), Cubone (#104), Scyther (#123), Ditto (#132), Eevee (#133), Moltres (#146), Mewtwo (#150), Mew (#151)
    local pokemon_list = { '0393.1', '0001.1', '0004.1', '0007.1', '0025.1', '0039.1', '0077.1', '0094.1', '0104.1',
      '0123.1', '0132.1', '0133.1', '0146.1', '0150.1', '0151.1' }



    -- Function to pick a random Pokémon from the list
    local function pick_random_pokemon()
      math.randomseed(os.time())                      -- Initialize random seed
      return pokemon_list[math.random(#pokemon_list)] -- Pick a random Pokémon from the list
    end

    pokemon.setup({
      number = pick_random_pokemon(), -- Set the random Pokémon number
      size = "large",                 -- Set the size of the Pokémon image
    })

    dashboard.setup {
      config = {
        header = pokemon.header() -- Set the header to the selected Pokémon ASCII art
      }
    }
  end,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', 'ColaMint/pokemon.nvim' }
  }
}
