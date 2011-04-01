package dee.moly.gameobjects.items {
	
	import dee.moly.gameobjects.GameObject;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A wall that moves relative to another object
	 * @author moly
	 */
	
	public class ParallaxWall extends GameObject{
		
		private var startPosition:Point;
		private var followObject:GameObject;
		private var movement:Number;
		
		public function ParallaxWall(x:int, y:int, texture:BitmapData, followObject:GameObject, movement:Number) {
			
			super(texture);
			this.startPosition = new Point(x, y);
			this.followObject = followObject;
			this.movement = movement;
			
		}
		
		override public function update(dtSeconds:int):void {
			
			var centreX:int = (Main.SCREEN_WIDTH / 2) - (followObject.width / 2);
			var centreY:int = (Main.SCREEN_HEIGHT / 2) - (followObject.height / 2);
			
			position.x = startPosition.x + (centreX - followObject.x) * movement;
			position.y = startPosition.y + (centreY - followObject.y) * movement;
			
		}
		
	}

}