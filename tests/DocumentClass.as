package
{
	
	import flash.events.Event
	import flash.display.Sprite
	import flash.net.URLRequest
	
	import com.shortybmc.io.csv.*;
	
	public class DocumentClass extends Sprite
	{
		
		private var csv : CSV
		
		public function DocumentClass ()
		{
			csv = new CSV ()
			csv.beautify = true
			csv.addEventListener ( Event.COMPLETE, completeHandler )
			csv.load( new URLRequest ( 'data-0.csv' ) )
		}
		
		private function completeHandler ( event : Event )
		{
			trace ( event.target.dump() )
		}
		
	}
}
