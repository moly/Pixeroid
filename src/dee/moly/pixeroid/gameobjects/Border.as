package dee.moly.pixeroid.gameobjects 
{
	import content.Content;
	import dee.moly.framework.GameSprite;
	import flash.display.BitmapData;
	
	/**
	 * Creates a border of specified width and height
	 * @author moly
	 */
	
	public class Border extends GameSprite
	{
		
		public function Border(width:int, height:int) 
		{
			super(new BitmapData(width, height, true, 0x00000000));
			createBorder();
		}
		
		private function createBorder():void
		{
			// TODO: Border creation		
		}
	}

}