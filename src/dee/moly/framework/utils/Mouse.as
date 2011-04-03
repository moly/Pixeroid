package dee.moly.framework.utils 
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	/**
	 * Manages mouse input
	 * @author moly
	 */
	
	public class Mouse
	{
		private var _mouseDown:Boolean;
		public function get mouseDown():Boolean {
			return _mouseDown;
		}
		
		public function Mouse(stage:Stage) 
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			_mouseDown = true;
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			_mouseDown = false;
		}
		
	}

}