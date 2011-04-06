package dee.moly.framework.graphics 
{	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * Cycles through a sprite sheet
	 * @author moly
	 */
	
	public final class Animation extends BitmapData
	{	
		private var sheet:BitmapData;
		
		private var _currentFrame:int;
		public function get currentFrame():int {
			return _currentFrame;
		}
		
		private var _numFrames:int;
		public function get numFrames():int {
			return _numFrames;
		}
		
		private var frameWidth:int;
		
		private var frameHeight:int;
		
		private var copyRect:Rectangle;
		
		private var repeat:Boolean;
		
		private var done:Boolean;
		
		private static const origin:Point = new Point();
		
		public function Animation(rows:int, columns:int, numFrames:int, sheet:BitmapData, repeat:Boolean = false) 
		{	
			this.sheet = sheet;
			this._numFrames = numFrames;
			this.repeat = repeat;
			
			frameWidth = sheet.width / columns;
			frameHeight = sheet.height / rows;
			
			copyRect = new Rectangle(0, 0, frameWidth, frameHeight);
			
			super(frameWidth, frameHeight);
			
			copyPixels(sheet, copyRect, origin, null, null, true);
			copyRect.x += frameWidth;	
		}
		
		public function update(dtSeconds:int):void
		{	
			if (done == true)
				return;
			
			fillRect(rect, 0x00FFFFFF);
			copyPixels(sheet, copyRect, origin, null, null, true);
			
			if ((copyRect.x += frameWidth) >= sheet.width)
			{
				copyRect.x = 0;
				copyRect.y += frameHeight;
			}
			
			if (++_currentFrame >= _numFrames) 
			{
				if (repeat == false) 
				{
					done = true;
				}
				else
				{
					copyRect.x = 0;
					copyRect.y = 0;
					_currentFrame = 0;
				}
			}
		}
		
	}

}