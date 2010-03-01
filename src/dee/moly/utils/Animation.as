package dee.moly.utils {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * Cycles through a sprite sheet
	 * @author moly
	 */
	
	public class Animation extends BitmapData{
		
		private var sheet:BitmapData;
		
		private var currentCell:int;
		
		private var numFrames:int;
		
		private var cellWidth:int;
		
		private var cellHeight:int;
		
		private var copyRect:Rectangle;
		
		private var repeat:Boolean;
		
		private var done:Boolean;
		
		private static const origin:Point = new Point();
		
		public function Animation(rows:int, columns:int, numFrames:int, sheet:BitmapData, repeat:Boolean = false) {
			
			this.sheet = sheet;
			this.numFrames = numFrames;
			this.repeat = repeat;
			
			cellWidth = sheet.width / columns;
			cellHeight = sheet.height / rows;
			trace(sheet.width + " " + columns);
			copyRect = new Rectangle(0, 0, cellWidth, cellHeight);
			
			super(cellWidth, cellHeight);
			
		}
		
		public function update(dtSeconds:int):void {
			
			if (done == true)
				return;
			
			fillRect(rect, 0xFFFFFFFF);
			copyPixels(sheet, copyRect, origin, null, null, true);
			
			if ((copyRect.x += cellWidth) >= sheet.width){
				copyRect.x = 0;
				copyRect.y += cellHeight;
			}
			
			if (++currentCell >= numFrames) {
				if (repeat == false) {
					done = true;
					return;
				}
				copyRect.x = 0;
				copyRect.y = 0;
				currentCell = 0;
			}
			
		}
		
	}

}