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
			example9()
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
		
		private function example7() : void
		{
			csv = new CSV();
			csv.embededHeader = false
			csv.header = ['label 1', 'label 2', 'label 3', 'label 4']
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load ( new URLRequest('example-8.csv') );
		}
		
		private function example8() : void
		{
			csv = new CSV();
			csv.headerOverwrite = true
			csv.header = ['My Year', 'My Make', 'My Model']
			csv.addEventListener( Event.COMPLETE, completeHandler );
			csv.load ( new URLRequest('example-7.csv') );
		}
		
		private function example9() : void
		{
			csv = new CSV();
			csv.embededHeader = false
			csv.addEventListener( Event.COMPLETE, sortExample );
			csv.load ( new URLRequest('example-8.csv') );
		}
		
		private function sortExample ( event : Event )
		{
			csv.sort( 0);
			trace ( csv.data.join('\n') )
			
			trace ( '-----------------' )
			
			csv.sort( 0, 'DES');
			trace ( csv.data.join('\n') )
			
			trace ( '-----------------' )
			
			
			csv.header = ['year', 'name', 'surname', 'friends' ]
			csv.sort('friends' );
			trace (csv.data.join('\n'));
			
			trace ( '-----------------' )
			
			csv.sort('friends', 'DES' );
			trace (csv.data.join('\n'));
		}
		
		private function example10() : void
		{
			csv = new CSV();
			csv.embededHeader = false
			csv.header = ['label 1', 'label 2', 'label 3', 'label 4' ]
			csv.addRecordSet( ['1','b','c','k'] )
			csv.addRecordSet( ['0','b','g','d'], -1 )
			csv.addRecordSet( ['2','b','c','d'],  3 )
			csv.addRecordSet( ['3','b','j','d'] )
			
			trace ( csv.header );
			trace ( csv.data.join('\n') );
			
			trace ( '-----------------' ) ;
			
			csv.deleteRecordSet( 0 )
			trace ( csv.data.join('\n') );
			
			trace ( '-----------------' ) ;
			
			var filtered : Array = csv.search( ['1', 'k', 'k', '3'], false )
			trace( filtered.join('\n') )
			
			
		}
		
		
		private function completeHandler ( event : Event )
		{
			trace ( csv.dump() )
		}
		
	}
	
}