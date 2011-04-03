package dee.moly.pixeroid.gameobjects.items 
{	
	import dee.moly.framework.GameSprite;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	/**
	 * A wall that moves relative to another object
	 * @author moly
	 */
	
	public class ParallaxWall extends GameSprite
	{	
		private var _startPosition:Point;
		private var _followObject:GameSprite;
		private var _movement:Number;
		
		public function ParallaxWall(texture:BitmapData, x:int, y:int, followObject:GameSprite, movement:Number)
		{	
			super(texture);
			blendMode = BlendMode.OVERLAY;
			this._startPosition = new Point(x, y);
			this._followObject = followObject;
			this._movement = movement;	
		}
		
		override public function update(dtSeconds:int):void 
		{	
			var centreX:int = (Main.SCREEN_WIDTH / 2) - (_followObject.width / 2);
			var centreY:int = (Main.SCREEN_HEIGHT / 2) - (_followObject.height / 2);
			
			_position.x = _startPosition.x + (centreX - _followObject.x) * _movement;
			_position.y = _startPosition.y + (centreY - _followObject.y) * _movement;	
		}
		
	}

}