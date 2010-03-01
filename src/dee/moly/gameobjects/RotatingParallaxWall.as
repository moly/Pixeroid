package dee.moly.gameobjects {
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * A rotating parallax wall
	 * @author moly
	 */
	
	public class RotatingParallaxWall extends ParallaxWall{
		
		private var matrix:Matrix;
		private var r:Number;
		
		public function RotatingParallaxWall(xpos:int, ypos:int, texture:BitmapData, followObject:GameObject, movement:Number) {
			super(xpos, ypos, texture, followObject, movement);
			matrix = new Matrix();
			r = 0;
		}
		
		override public function update(dtSeconds:int):void {
			super.update(dtSeconds);
			matrix.identity();
			matrix.translate(-texture.width/2, -texture.height/2);
			matrix.rotate(r+=0.1);
			matrix.translate(position.x, position.y);
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point, blendMode:String = ""):void {
			matrix.translate( -cameraPosition.x, -cameraPosition.y);
			canvas.draw(texture, matrix, null, blendMode);
		}
		
	}

}