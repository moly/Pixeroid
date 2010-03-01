package dee.moly.utils {
	
	import flash.display.BitmapData;
	
	/**
	 * Stores all game content for easy access
	 * @author moly
	 */
	
	public class ContentManager{
		
		[Embed(source = "/Content/ship.png")] private static const ShipData:Class;
		private static const ship:BitmapData = new ShipData().bitmapData;
		
		[Embed(source = "/Content/shipSheet.png")] private static const ShipSheetData:Class;
		private static const shipSheet:BitmapData = new ShipSheetData().bitmapData;
		
		[Embed(source = "/Content/star.png")] private static const StarData:Class;
		private static const star:BitmapData = new StarData().bitmapData;
		
		[Embed(source = "/Content/level1/walls.png")] private static const WallsData:Class;
		private static const level1$walls:BitmapData = new WallsData().bitmapData;
		
		[Embed(source = "/Content/level1/walls2.png")] private static const Walls2Data:Class;
		private static const level1$walls2:BitmapData = new Walls2Data().bitmapData;
		
		[Embed(source = "/Content/level1/walls3.png")] private static const Walls3Data:Class;
		private static const level1$walls3:BitmapData = new Walls3Data().bitmapData;
		
		[Embed(source = "/Content/level1/bg.png")] private static const Level1BgData:Class;
		private static const level1$bg:BitmapData = new Level1BgData().bitmapData;
		
		[Embed(source = "/Content/level1/border.png")] private static const Level1BorderData:Class;
		private static const level1$border:BitmapData = new Level1BorderData().bitmapData;
		
		[Embed(source = "/Content/level1/skull.png")] private static const SkullData:Class;
		private static const level1$skull:BitmapData = new SkullData().bitmapData;
		
		[Embed(source = "/Content/level1/r1.png")] private static const R1Data:Class;
		private static const level1$r1:BitmapData = new R1Data().bitmapData;
		
		[Embed(source = "/Content/level1/r2.png")] private static const R2Data:Class;
		private static const level1$r2:BitmapData = new R2Data().bitmapData;
		
		[Embed(source = "/Content/level1/r3.png")] private static const R3Data:Class;
		private static const level1$r3:BitmapData = new R3Data().bitmapData;
		
		[Embed(source = "/Content/level2/border.png")] private static const Level2BorderData:Class;
		private static const level2$border:BitmapData = new Level2BorderData().bitmapData;
		
		[Embed(source = "/Content/level2/bg.png")] private static const Level2BGData:Class;
		private static const level2$bg:BitmapData = new Level2BGData().bitmapData;
		
		[Embed(source = "/Content/level2/enemy.png")] private static const Level2Enemy:Class;
		private static const level2$enemy:BitmapData = new Level2Enemy().bitmapData;
		
		[Embed(source = "/Content/level2/enemymini.png")] private static const Level2EnemyMini:Class;
		private static const level2$enemymini:BitmapData = new Level2EnemyMini().bitmapData;
		
		public function ContentManager() {
			throw new Error("ContentManager is a static class, please don't instantiate it.");
		}
		
		public static function load(path:String):*{
			
			path = path.replace(/\//g, "$");
			
			if (ContentManager[path] == null)
				throw new Error("Content not found: " + path);
			
			return ContentManager[path];
			
		}
		
	}

}