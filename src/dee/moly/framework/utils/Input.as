package dee.moly.framework.utils 
{
	import flash.display.Stage;
	
	/**
	 * Provides access to all input devices
	 * @author moly
	 */
	
	public class Input
	{
		private static var _keyboard:Keyboard;
		public static function get keyboard():Keyboard {
			return _keyboard;
		}
		
		private static var _mouse:Mouse;
		public static function get mouse():Mouse {
			return _mouse;
		}
		
		public function Input()
		{
			throw new Error("Cannot instantiate static class Input.");
		}
		
		public static function init(stage:Stage):void
		{
			_keyboard = new Keyboard(stage);
			_mouse = new Mouse(stage);
		}
		
	}

}