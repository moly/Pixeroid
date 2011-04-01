package dee.moly.gameobjects.items 
{	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import dee.moly.gameobjects.GameSprite;
	
	/**
	 * A rotating parallax wall
	 * @author moly
	 */
	
	public final class RotatingParallaxWall extends ParallaxWall
	{	
		private var r:Number;
		
		public function RotatingParallaxWall(xpos:int, ypos:int, texture:BitmapData, followObject:GameSprite, movement:Number) 
		{
			super(xpos, ypos, texture, followObject, movement);
			r = 0;
		}
		
		override public function update(dtSeconds:int):void 
		{
			super.update(dtSeconds);
			_matrix.identity();
			_matrix.translate(-_texture.width/2, -_texture.height/2);
			_matrix.rotate(r+=0.1);
			_matrix.translate(_position.x, _position.y);
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point):void 
		{
			_matrix.translate( -cameraPosition.x, -cameraPosition.y);
			canvas.draw(_texture, _matrix, null, _blendMode);
		}
		
	}

}