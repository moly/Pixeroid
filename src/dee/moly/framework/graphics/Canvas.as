package dee.moly.framework.graphics 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Stage;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author moly
	 */
	
	public class Canvas
	{
		private var _bitmapData:BitmapData;
	
		private var _matrix:Matrix;
		
		private static const _point:Point = new Point();
		
		public function Canvas(stage:Stage, width:int, height:int) 
		{
			_bitmapData = new BitmapData(width, height, false);
			stage.addChild(new Bitmap(_bitmapData));
			
			_matrix = new Matrix();
		}
		
		public function begin():void
		{
			_bitmapData.lock();
		}
		
		public function end():void
		{
			_bitmapData.unlock();
		}
		
		public function draw(texture:BitmapData, sourceRect:Rectangle, position:Point, blendMode:String = BlendMode.NORMAL, rotation:Number = 0, origin:Point = null):void
		{			
			if (blendMode == BlendMode.NORMAL && rotation == 0)
			{
				_bitmapData.copyPixels(texture, sourceRect, position, null, null, true);
			}
			else
			{
				if (origin == null)
					origin = _point;
					
				_matrix.identity();
				_matrix.translate(-origin.x, -origin.y);
				_matrix.rotate(rotation);
				_matrix.translate(origin.x, origin.y);
				_matrix.translate(position.x - sourceRect.x, position.y - sourceRect.y);
				
				var rect:Rectangle = new Rectangle(position.x, position.y, sourceRect.width, sourceRect.height);
				_bitmapData.draw(texture, _matrix, null, blendMode, rect);
			}
		}
		
	}

}