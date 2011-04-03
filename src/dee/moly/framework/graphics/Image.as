package dee.moly.framework.graphics 
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	
	/**
	 * A basic 2D graphic
	 * @author moly
	 */
	
	public class Image extends Graphic
	{
		
		public function Image() 
		{
			
		}
		
		override public function draw(canvas:BitmapData):void 
		{
			if (_blendMode == BlendMode.NORMAL)
			{
				canvas.copyPixels(_texture, _texture.rect, _position.subtract(cameraPosition), null, null, true);
			}
			else
			{
				_matrix.identity();
				_matrix.translate( -width / 2, -height / 2);
				_matrix.rotate(rotation);
				_matrix.translate(width / 2, height / 2);
				_matrix.translate(_position.x - cameraPosition.x, _position.y - cameraPosition.y)
				canvas.draw(_texture, _matrix, null, _blendMode);
			}
		}
		
	}

}