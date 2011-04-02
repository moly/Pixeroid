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
			rotation += 0.1;
		}
		
	}

}