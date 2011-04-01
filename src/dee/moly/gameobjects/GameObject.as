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
		
		//protected var texture:BitmapData
		public var texture:BitmapData;
		
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
		
		private var matrix:Matrix;
		
		public function get width():int {
			return texture.width;
		}
		
		public function get height():int {
			return texture.height;
		}
		
		protected var collisionTestPoints:Vector.<Point>;
		
		protected var velocity:Point;
		
		public function GameObject(texture:BitmapData, x:int = 0, y:int = 0) {
			
			this.texture = texture;
			position = new Point(x, y);
			velocity = new Point(0, 0);
			matrix = new Matrix();
		}
		
		public function update(dtSeconds:int):void {
			
		}
		
		public function draw(canvas:BitmapData, cameraPosition:Point, blendMode:String = ""):void {
		
			var positionOnScreen:Point = position.subtract(cameraPosition);
				
			if(blendMode == "")
				canvas.copyPixels(texture, texture.rect, positionOnScreen, null, null, true);
			else{
				matrix.tx = positionOnScreen.x
				matrix.ty = positionOnScreen.y;
				canvas.draw(texture, matrix, null, blendMode);
			}
				
		}
		
		public function checkCollision(gameObject:GameObject, alphaThreshold:uint):Boolean {
			
			if (gameObject.texture.hitTest(gameObject.position, alphaThreshold, this.texture, this.position, 0x22))
				return true;
				
			return false;
		}
		
		public function onCollision():void {
			
		}
		
	}

}