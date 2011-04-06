package dee.moly.framework
{
	import dee.moly.framework.graphics.Canvas;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	
	/**
	 * A drawable sprite
	 * @author moly
	 */
	
	public class GameSprite extends GameObject
	{
		protected var _texture:BitmapData;
		
		protected var _position:Point;
		public function get x():int {
			return _position.x;
		}
		public function set x(value:int):void {
			_position.x = value;
		}
		public function get y():int {
			return _position.y;
		}
		public function set y(value:int):void {
			_position.y = value;
		}
		
		public function get width():int {
			return _texture.width;
		}
		
		public function get height():int {
			return _texture.height;
		}
		
		protected var _rotation:Number;
		public function set rotation(value:Number):void {
			_rotation = value;
		}
		public function get rotation():Number {
			return _rotation;
		}
		
		protected var _origin:Point;
		
		protected var _blendMode:String;
		public function set blendMode(value:String):void {
			_blendMode = value;
		}
		
		protected var _collisionTestPoints:Vector.<Point>;
				
		public function GameSprite(texture:BitmapData, x:int = 0, y:int = 0) 
		{
			_texture = texture;
			_position = new Point(x, y);
			_rotation = 0;
			_origin = new Point();
			_blendMode = BlendMode.NORMAL;
		}
		
		override public function draw(canvas:Canvas, cameraPosition:Point = null):void 
		{
			canvas.draw(_texture, _position.subtract(cameraPosition), _blendMode, _rotation, _origin);
		}
		
		public function checkCollision(gameObject:GameSprite, alphaThreshold:uint):Boolean 
		{	
			if (gameObject._texture.hitTest(gameObject._position, alphaThreshold, _texture, _position, 0x22))
				return true;
				
			return false;
		}
		
		public function onCollision():void 
		{
			
		}
		
	}

}