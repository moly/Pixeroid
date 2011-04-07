package dee.moly.framework.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	/**
	 * Base class for all graphics
	 * @author moly
	 */
	
	public class Graphic
	{
		protected var _texture:BitmapData;
		public function get texture():BitmapData {
			return _texture;
		}
		
		protected var _rect:Rectangle;
		public function get rect():Rectangle {
			return _rect;
		}
		
		public function Graphic(texture:BitmapData) 
		{
			_texture = texture;
			_rect = _texture.rect;
		}
		
		public function update(dtSeconds:int):void
		{
			
		}
		
	}

}