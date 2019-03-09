# Command Pattern
# Date: 16-Sep-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva

# File: control.rb

# A class that models the RemoteControlWithUndo instance
class RemoteControlWithUndo
  
  #Creates the instance of RemoteControlWithUndo class
  def initialize
    @on_commands = []
    @off_commands = []
    no_command = NoCommand.new
    7.times do
      @on_commands << no_command
      @off_commands << no_command
    end
    @undo_command = no_command
  end
  
  #sets the commands for the RemoteControlWithUndo
  #params slot, on_command, off_command
  def set_command(slot, on_command, off_command)
    @on_commands[slot] = on_command
    @off_commands[slot] = off_command
  end
  
  #sets the action released on button pushed for the RemoteControlWithUndo
  #params slot
  def on_button_was_pushed(slot)
    @on_commands[slot].execute
    @undo_command = @on_commands[slot]
  end
  
  #sets the action released off button pushed for the RemoteControlWithUndo
  #params slot
  def off_button_was_pushed(slot)
    @off_commands[slot].execute
    @undo_command = @off_commands[slot]
  end

  #sets the action released undo button push for the RemoteControlWithUndo
  def undo_button_was_pushed()
    @undo_command.undo
  end

  #inspects the RemoteControlWithUndo instance
  def inspect
    string_buff = ["\n------ Remote Control -------\n"]
    @on_commands.zip(@off_commands) \
        .each_with_index do |commands, i|
      on_command, off_command = commands
      string_buff << \
      "[slot #{i}] #{on_command.class}  " \
        "#{off_command.class}\n"
    end
    string_buff << "[undo] #{@undo_command.class}\n"
    string_buff.join
  end

end

# A class that models the NoCommand instance
class NoCommand
  
  #execute action
  def execute
  end
  
  #undo action
  def undo
  end

end

# A class that models the Light instance
class Light
  #getter for level
  attr_reader :level
  
  #initialize the instances
  #params: location
  def initialize(location)
    @location = location
    @level = 0
  end

  #action when on button is pushed
  def on
    @level = 100
    puts "Light is on"
  end

  #action when off button is pushed
  def off
    @level = 0
    puts "Light is off"
  end
  
  #action when dime button is pushed
  #params: level
  def dim(level)
    @level = level
    if level == 0
      off
    else
      puts "Light is dimmed to #{@level}%"
    end
  end

end

# A class that models the CeilingFan instance
class CeilingFan

  # Access these constants from outside this class as
  # CeilingFan::HIGH, CeilingFan::MEDIUM, and so on.
 
  #High speed
  HIGH   = 3
  #Medium speed
  MEDIUM = 2 
  #Low speed
  LOW    = 1 
  #Off speed
  OFF    = 0 
  
  #getter for speed
  attr_reader :speed
  
  #initialize the instances
  #params: location
  def initialize(location)
    @location = location
    @speed = OFF
  end
  
  #action when high button is pushed
  def high
    @speed = HIGH
    puts "#{@location} ceiling fan is on high"
  end
  
  #action when medium button is pushed
  def medium
    @speed = MEDIUM
    puts "#{@location} ceiling fan is on medium"
  end
  
  #action when low button is pushed
  def low
    @speed = LOW
    puts "#{@location} ceiling fan is on low"
  end
  
  #action when off button is pushed
  def off
    @speed = OFF
    puts "#{@location} ceiling fan is off"
  end

end

# A class that models the CeilingFanMediumCommand instance
class CeilingFanMediumCommand < CeilingFan
  
  #initialize the instances
  #params: fan
  def initialize(fan)
    @fan = fan
    @undo = nil
  end
  
  #execute action. Invokes father class action
  def execute
    @undo = @fan.speed
    @fan.medium
  end
  
  #undo the action and invokes the previous action
  def undo
    if(@undo == CeilingFan::HIGH)
      @fan.high
    elsif(@undo == CeilingFan::MEDIUM)
      @fan.medium
    elsif(@undo == CeilingFan::LOW)
      @fan.low
    elsif(@undo == CeilingFan::OFF)
      @fan.off
    end
  end
end

# A class that models the CeilingFanHighCommand instance
class CeilingFanHighCommand < CeilingFan
  
  #initialize the instances
  #params: fan
  def initialize(fan)
    @fan = fan
    @undo = nil
  end
  
  #execute action. Invokes father class action
  def execute
    @undo = @fan.speed
    @fan.high
  end
  
  #undo the action and invokes the previous action
  def undo
    if(@undo == CeilingFan::HIGH)
      @fan.high
    elsif(@undo == CeilingFan::MEDIUM)
      @fan.medium
    elsif(@undo == CeilingFan::LOW)
      @fan.low
    elsif(@undo == CeilingFan::OFF)
      @fan.off
    end
  end
end

# A class that models the CeilingFanOffCommand instance
class CeilingFanOffCommand < CeilingFan
  
  #initialize the instances
  #params: fan
  def initialize(fan)
    @fan = fan
    @undo = nil
  end
    
  #execute action. Invokes father class action
  def execute
    @undo = @fan.speed
    @fan.off
  end
  
  #undo the action and invokes the previous action
  def undo
    if(@undo == CeilingFan::HIGH)
      @fan.high
    elsif(@undo == CeilingFan::MEDIUM)
      @fan.medium
    elsif(@undo == CeilingFan::LOW)
      @fan.low
    elsif(@undo == CeilingFan::OFF)
      @fan.off
    end
  end
end

# A class that models the LightOnCommand instance
class LightOnCommand < Light
  ON = 100
  OFF = 0
  
  #initialize the instances
  #params: light
  def initialize(light)
    @light = light
    @undo = nil
  end
  
  #execute action. Invokes father class action
  def execute
    @undo = @light.level
    @light.on
  end
  
  #undo the action and invokes the previous action
  def undo
    if(@undo == ON)
      @light.on
    elsif(@undo == OFF)
      @light.off
    end
  end
  
end

# A class that models the LightOffCommand instance
class LightOffCommand < Light
  ON = 100
  OFF = 0
  
  #initialize the instances
  #params: light
  def initialize(light)
    @light = light
    @undo = nil
  end
  
  #execute action. Invokes father class action
  def execute
    @undo = @light.level
    @light.off
  end
  
  #undo the action and invokes the previous action
  def undo
    if(@undo == ON)
      @light.on
    elsif(@undo == OFF)
      @light.off
    end
  end
  
end