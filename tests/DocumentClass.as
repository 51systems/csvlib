package
{
	
	import flash.events.Event
	import flash.net.URLRequest
	import flash.display.Sprite
	import com.shortybmc.data.parser.CSV;
	
	public class DocumentClass extends Sprite
	{
		
		private var csv : CSV
		
		public function DocumentClass()
		{
			example1()
		}
		
		private function example1() : void
		{
			csv = new CSV( new URLRequest('example-1.csv') );
			csv.addEventListener( Event.COMPLETE, completeHandler );
		}
		
		private function example2() : void
		{
			csv = new CSV();
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load( new URLRequest('example-2.csv') )
		}
		
		private function example3() : void
		{
			csv = new CSV();
			csv.fieldSeperator = ';'
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load( new URLRequest('example-3.csv') )
		}
		
		private function example4() : void
		{
			csv = new CSV();
			csv.fieldEnclosureToken= '\''
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load( new URLRequest('example-4.csv') )
		}
		
		private function example5() : void
		{
			csv = new CSV();
			csv.recordsetDelimiter= '#'
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load( new URLRequest('example-5.csv') )
		}
		
		private function example6() : void
		{
			csv = new CSV();
			csv.fieldSeperator = ';'
			csv.fieldEnclosureToken= '\''
			csv.recordsetDelimiter= '#'
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load( new URLRequest('example-6.csv') )
		}
		
		private function completeHandler ( event : Event )
		{
			trace ( csv.dump() )
		}
		
	}
	
}