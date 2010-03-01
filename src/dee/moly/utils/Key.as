package dee.moly.utils {
	
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
	
	/**
	 * Manages basic key presses
	 * @author moly
	 */
    
    public class Key {
		
        private static var keys:Array;
		
        public static function initialise(stage:Stage):void {	
           
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
			
			keys = new Array();
			
        }
        
		
        public static function isDown(keyCode:int):Boolean {
            return keys[keyCode];
        }
       
        private static function keyPressed(event:KeyboardEvent):void {
            keys[event.keyCode] = true;
        }
        

        private static function keyReleased(event:KeyboardEvent):void {
            keys[event.keyCode] = false;
        }
        
    }
    
} 