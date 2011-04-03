package dee.moly.framework 
{
	import dee.moly.framework.utils.Input;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Our main class, sets the whole game up
	 * @author moly
	 */
	
	public class Game extends Sprite
	{
		
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Input.init(stage);
		}
		
	}

}