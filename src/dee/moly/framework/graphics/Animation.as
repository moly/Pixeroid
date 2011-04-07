package dee.moly.framework.graphics 
{	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * Cycles through a sprite sheet
	 * @author moly
	 */
	
	public class Animation extends Graphic
	{
		// Duration of time to show each frame.
		private var _frameTime:Number;
		public function get frameTime():Number{
			return _frameTime;
		}

		private var _repeat:Boolean;
		public function get repeat():Boolean{
			return _repeat;
		}

		public function get frameCount():int{
			return texture.width / frameWidth;
		}

		private var _frameWidth:int;
		public function get frameWidth():int{
			return _frameWidth;
		}

		private var _frameHeight:int;
		public function get frameHeight():int{
			return _frameHeight;
		}

		// Constructs a new animation.
		public function Animation(texture:BitmapData, frameWidth:int, frameHeight:int, frameTime:Number, repeat:Boolean):void
		{
			super(texture);
			
			_frameWidth = frameWidth;
			_frameHeight = frameHeight;
			_frameTime = frameTime;
			_repeat = repeat;
			// TODO: Add support for multirow spread sheets
		}

	}

}