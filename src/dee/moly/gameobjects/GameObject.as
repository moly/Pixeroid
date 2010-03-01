package dee.moly.gameobjects {
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * A base class for game objects
	 * Don't instantiate directly
	 * @author moly
	 */
	
	public class GameObject{
		
		protected var texture:BitmapData
		
		protected var position:Point;
		public function get x():int {
			return position.x;
		}
		public function set x(value:int):void {
			position.x = value;
		}
		public function get y():int {
			return position.y;
		}
		public function set y(value:int):void {
			position.y = value;
		}
		
		public function get width():int {
			return texture.width;
		}
		
		public function get height():int {
			return texture.height;
		}
		
		protected var collisionTestPoints:Vector.<Point>;
		
		protected var velocity:Point;
		
		public function GameObject() {
			position = new Point(0, 0);
			velocity = new Point(0, 0);
		}
		
		public function update(dtSeconds:int):void {
			
		}
		
		public function draw(canvas:BitmapData, cameraPosition:Point, blendMode:String = ""):void {
		
			if(blendMode == "")
				canvas.copyPixels(texture, texture.rect, position.subtract(cameraPosition), null, null, true);
			else{
				var matrix:Matrix = new Matrix(1, 0, 0, 1, position.x - cameraPosition.x, position.y - cameraPosition.y);
				canvas.draw(texture, matrix, null, blendMode);
			}
				
		}
		
		public function checkCollisions(gameObject:GameObject, alphaThreshold:uint):Boolean {
			
			for (var i:int = 0; i < collisionTestPoints.length; ++i) {
				if(gameObject.texture.hitTest(new Point(), alphaThreshold, new Point((collisionTestPoints[i].x + position.x) - gameObject.x, (collisionTestPoints[i].y + position.y) - gameObject.y))){		
					return(true);
				}
			}
			return false;
		}
		
		public function onCollision():void {
			
		}
		
	}

}