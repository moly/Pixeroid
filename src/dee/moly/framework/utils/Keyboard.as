package dee.moly.framework.utils 
{	
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
	
	/**
	 * Manages basic key presses
	 * @author moly
	 */
    
    public final class Keyboard 
	{	
		private var _keys:Array;
		 
		public function Keyboard(stage:Stage)
		{
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
			
			_keys = new Array();
        }
		
        public function isDown(keyCode:int):Boolean 
		{
            return _keys[keyCode];
        }
       
        private function keyPressed(e:KeyboardEvent):void 
		{
            _keys[e.keyCode] = true;
        }
        

        private function keyReleased(e:KeyboardEvent):void 
		{
            _keys[e.keyCode] = false;
        }
        
    }
    
} 