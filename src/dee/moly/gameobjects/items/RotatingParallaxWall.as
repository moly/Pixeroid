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
		public function RotatingParallaxWall(texture:BitmapData, x:int, y:int, followObject:GameSprite, movement:Number) 
		{
			super(texture, x, y, followObject, movement);
		}
		
		override public function update(dtSeconds:int):void 
		{
			super.update(dtSeconds);
			//_matrix.identity();
			//_matrix.translate(-_texture.width/2, -_texture.height/2);
			//_matrix.rotate(r+=0.1);
			//_matrix.translate(_position.x, _position.y);
			rotation += 0.1;
		}
		
		/*
		override public function draw(canvas:BitmapData, cameraPosition:Point):void 
		{
			_matrix.translate( -cameraPosition.x, -cameraPosition.y);
			canvas.draw(_texture, _matrix, null, _blendMode);
		}
		*/
	}

}