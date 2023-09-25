=begin

Double Dispatch
    a design pattern used to handle multiple variants and multiple arguments
    by making decisions based on the types of two objects, rather than just one

=end

class Character
    def collide(other)
        other.collide_with_character(self)
    end

    def collide_with_character(character)
        puts "#{self.class} collided with #{character.class}"
    end
end

class Player < Character
    def collide_with_character(character)
        puts "#{self.class} collided with #{character.class}"
        # Implemenet player-specific collision logic here
    end
end

class Enemy < Character
    def collide_with_character(character)
        puts "#{self.class} collided with #{character.class}"
        # Implemenet player-specific collision logic here
    end
end

#usage
player = Player.new
enemy = Enemy.new

player.collide(enemy)  # Output: Player collided with Enemy
enemy.collide(player)  # Output: Enemy collided with Player

        





