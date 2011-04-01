package dee.moly.gameobjects.items 
{	
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A wall that moves relative to another object
	 * @author moly
	 */
	
	public class ParallaxWall extends GameSprite
	{	
		private var startPosition:Point;
		private var followObject:GameSprite;
		private var movement:Number;
		
		public function ParallaxWall(texture:BitmapData, x:int, y:int, followObject:GameSprite, movement:Number)
		{	
			super(texture);
			this.startPosition = new Point(x, y);
			this.followObject = followObject;
			this.movement = movement;	
		}
		
		override public function update(dtSeconds:int):void 
		{	
			var centreX:int = (Main.SCREEN_WIDTH / 2) - (followObject.width / 2);
			var centreY:int = (Main.SCREEN_HEIGHT / 2) - (followObject.height / 2);
			
			_position.x = startPosition.x + (centreX - followObject.x) * movement;
			_position.y = startPosition.y + (centreY - followObject.y) * movement;	
		}
		
	}

}