package dee.moly.gameobjects 
{
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
		
		protected var _matrix:Matrix;
		
		protected var _blendMode:String;
		public function set blendMode(value:String):void {
			_blendMode = value;
		}
		
		protected var collisionTestPoints:Vector.<Point>;
				
		public function GameSprite(texture:BitmapData, x:int = 0, y:int = 0) 
		{
			_texture = texture;
			_position = new Point(x, y);
			_matrix = new Matrix();
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point):void 
		{
			if (_blendMode == BlendMode.NORMAL)
			{
				canvas.copyPixels(_texture, _texture.rect, _position.subtract(cameraPosition), null, null, true);
			}
			else
			{
				_matrix.identity();
				_matrix.tx = _position.x - cameraPosition.x;
				_matrix.ty = _position.y - cameraPosition.y;
				canvas.draw(_texture, _matrix, null, _blendMode);
			}
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