local enum DrawMode
   "fill"
   "line"
end

global enum KeyConstant
   "s"
   "w"
   "down"
   "up"
   "space"
end

global enum Scancode
end

global enum GamepadButton
   "dpdown"
   "dpup"
   "start"
end

global record Joystick
   isGamepad: function(Joystick): boolean
   isGamepadDown: function(Joystick, button: GamepadButton): boolean
end

global record Source
end

global record love
   load: function()
   draw: function()
   update: function(dt: number)
   keypressed: function(key: KeyConstant, scancode: Scancode, isrepeat: boolean)
   gamepadpressed: function(joystick: Joystick, button: GamepadButton)

   record graphics
      rectangle: function(mode: DrawMode, x: number, y: number, width: number, height: number)
      getWidth: function(): number
      getHeight: function(): number
      print: function(string, integer, integer)
      clear: function(r: number, g: number, b: number, a: number)
      setLineWidth: function(width: number)
      line: function(x1: number, y1: number, x2: number, y2: number)
      newImage: function(filename: string, settings?: table): Image
      draw: function(Image: Image, ...: number)
      setColor: function(number, number, number, number)
   end

   record window
      setMode: function(width: number, height: number)
      setTitle: function(title: string)
   end

   record keyboard
      isDown: function(key: KeyConstant): boolean
   end

   record joystick
      getJoysticks: function(): {Joystick}
   end

   record Image 
       getWidth: function(self): number
       getHeight: function(self): number
   end

   
end
