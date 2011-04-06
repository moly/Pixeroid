package dee.moly.framework 
{
	import dee.moly.framework.graphics.Canvas;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A collection of GameObjects
	 * @author moly
	 */
	
	public class GameGroup extends GameObject
	{
		private var _members:Vector.<GameObject>;
		public function get members():Vector.<GameObject>
		{
			return _members;
		}
		
		// number of members in the group
		public function get count():int
		{
			return _members.length;
		}
		
		public function GameGroup() 
		{
			_members = new Vector.<GameObject>();
		}
		
		// update all members
		override public function update(dtSeconds:int):void 
		{
			for each(var gameObject:GameObject in _members)
				gameObject.update(dtSeconds);
				
			_members = _members.filter(filterFunction);
		}
		
		private function filterFunction(gameObject:GameObject, index:int, vector:Vector.<GameObject>):Boolean
		{
			return gameObject.exists;
		}
		
		// draw all members
		override public function draw(canvas:Canvas, cameraPosition:Point = null):void 
		{
			for each(var gameObject:GameObject in _members)
				gameObject.draw(canvas, cameraPosition);
		}
		
		// add a new member to the group
		public function add(...args):void
		{
			for each(var gameObject:GameObject in args)
				_members.push(gameObject);
		}
		
		// get the top member
		public function top():GameObject
		{
			if (_members.length < 1)
				return null;
			else
				return _members[_members.length - 1];
		}
		
	}

}