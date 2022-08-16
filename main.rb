class Bagbom
  attr_reader :name, :life

  def initialize(name)
    @name = name
    @life = 100
  end

  def status
    puts("Name: #{@name}")
    puts("Life: #{@life}")
  end

  def attack
    
    rand(11)
  end

  def defend(damage)
    if @life - damage <= 0
      @life = 0
    else
      @life -= damage
    end
  end
end

def battle
  bagmons = %w[Voara Pequemico Capi Varacapi Caralata]

  puts("\nChooice the Bagmons for the battle!")
  bagmons.each_with_index do |bagmon, index|
    puts("#{index + 1} - #{bagmon}")
  end

  loop do
    puts("\nSelect the PLAYER 1: ")
    id_player_1 = gets.chomp.to_i
    if id_player_1 <= bagmons.length
      player_1 = Bagbom.new(bagmons[id_player_1 - 1])

      loop do
        puts("\nSelect the PLAYER 2: ")
        id_player_2 = gets.chomp.to_i
        if id_player_2 <= bagmons.length && id_player_2 != id_player_1
          player_2 = Bagbom.new(bagmons[id_player_2 - 1])

          
          puts("\nBagmons selected successfully!")
  
          puts("\nPLAYER 1")
          player_1.status
          
          puts("\nPLAYER 2")
          player_2.status
          
          first_player = rand(2)
          current_player = first_player
          current_round = 0
          puts("\n\n==========BATTLE START==========")
          
          loop do
            if current_player == first_player
              puts("\n------ Round #{current_round + 1} ------")
              current_round += 1
            end
          
            if current_player == 0
              damage = player_1.attack
              player_2.defend(damage)
              puts("- #{player_1.name} attack #{player_2.name} and dealt #{damage} damage!")
              if current_player != first_player
                puts("\n")
                player_1.status
                player_2.status
                if player_1.life > 0 && player_2.life > 0
                  puts("\nPress ENTER to next ROUND")
                  gets.chomp
                end
              end
              current_player = 1
            elsif current_player == 1
              damage = player_2.attack
              player_1.defend(damage)
              puts("- #{player_2.name} attack #{player_1.name} and dealt #{damage} damage!")
              if current_player != first_player
                puts("\n")
                player_1.status
                player_2.status
                if(player_1.life > 0 && player_2.life > 0)
                  puts("\nPress ENTER to next ROUND")
                  gets.chomp
                end
              end
              current_player = 0
            end
          
            if player_1.life == 0
              puts("- #{player_2.name} kill #{player_1.name}")
              puts("\n ======> #{player_2.name}(Player 2) WON <======")
              break
            elsif player_2.life == 0
              puts("- #{player_1.name} kill #{player_2.name}")
              puts("\n ======> #{player_1.name}(Player 1) WON <======")
              break
            end
          end
          break
        else
          puts("\n Invalid choice. Please, try again.")
        end
      end
    break
    else 
      puts("\n Invalid choice. Please, try again.")
    end
  end
end
def main

  loop do
    puts("\n\n--------- MENU --------- \n\n")
    puts('1 - Começar nova batalha')
    puts('2 - Sair')
    puts("\nChooice a action: ")
    menu_option = gets.chomp.to_i
  
    if menu_option == 1
      battle
    elsif menu_option == 2
      puts("\nSaindo do programa...")
      break
    else
      puts("\nInvalid option. Please, try again!")
    end
  end
end
main
