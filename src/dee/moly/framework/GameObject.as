﻿package dee.moly.framework
{
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for game objects
	 * Don't instantiate directly
	 * @author moly
	 */
	
	public class GameObject
	{							
		public var exists:Boolean;
		
		public function GameObject() 
		{
			exists = true;
		}
		
		public function update(dtSeconds:int):void 
		{
			
		}
		
		public function draw(canvas:BitmapData, cameraPosition:Point = null):void 
		{
			
		}
		
	}

}