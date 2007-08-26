/**
 *   This file is a part of ActipsScript 3 library, written by Marco Müller.
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *	 
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.shortybmc.io.csv
{
	
	
	/**
	 *   TODO Package description ...
	 * 
	 *   @author Marco Müller / http://shorty-bmc.com
	 *   @see RFC 4180 / http://tools.ietf.org/html/rfc4180
	 *   
	 *   @langversion ActionScript 3.0
	 *   @tiptext
	 */
	import flash.events.*
	import com.shortybmc.utils.StringUtils
	
	public class CSVParser extends CSVLoader
	{
		
		
		/**
		 *   TODO Properties description ...
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		private var FieldSeperator		: String
		private var RecordsetDelimiter	: String
		
		private var QuoteTokens			: Array
		private var WhitespaceTokens	: Array
		
		private var Beautify			: Boolean
		private var TrimFieldWhitespace	: Boolean
		private var TrimFieldQuotes		: Boolean
		
		
		/**
		 *   TODO Constructor description ...
		 * 
		 *   @param no
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function CSVParser ()
		{
			
			// default for win/utf-8
			fieldSeperator = CSVTokens.FIELD_SEPERATOR
			recordsetDelimiter = CSVTokens.CRLF
			
			quoteTokens = CSVTokens.QUOTE_LIST
			whitespaceTokens = CSVTokens.WHITESPACE_LIST
			
			beautify = false
			trimFieldWhitespace = true
			trimFieldQuotes = true
			
			addEventListener ( Event.COMPLETE, parse )
			
		}
		
		
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return String that contains the recordset delimiter
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get recordsetDelimiter () : String
		{
			return RecordsetDelimiter
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return String that contains the field seperator
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get fieldSeperator () : String
		{
			return FieldSeperator
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return Array that contains a list of quote tokens
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get quoteTokens () : Array
		{
			return QuoteTokens
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return Array that contains a list of whitespace tokens
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get whitespaceTokens () : Array
		{
			return WhitespaceTokens
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return Boolean that represents the current beautify engine state. Enabled (true) or disabled (false)
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get beautify () : Boolean
		{
			return Beautify
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return Boolean
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get trimFieldWhitespace () : Boolean
		{
			return TrimFieldWhitespace
		}
		
		/**
		 *   TODO Getter description ...
		 * 
		 *   @param no
		 *   @return Boolean
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function get trimFieldQuotes () : Boolean
		{
			return TrimFieldQuotes
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param value String
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set recordsetDelimiter ( value : String ) : void
		{
			RecordsetDelimiter = value
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param value String
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set fieldSeperator ( value : String ) : void
		{
			FieldSeperator = value
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param list Array
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set quoteTokens ( list : Array ) : void
		{
			QuoteTokens = list
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param list Array
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set whitespaceTokens ( list : Array ) : void
		{
			WhitespaceTokens = list
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param value Boolean
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set beautify ( value : Boolean ) : void
		{
			Beautify = value
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param value Boolean
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set trimFieldWhitespace ( value : Boolean ) : void
		{
			TrimFieldWhitespace = value
		}
		
		/**
		 *   TODO Setter description ...
		 * 
		 *   @param value Boolean
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function set trimFieldQuotes ( value : Boolean ) : void
		{
			TrimFieldQuotes = value
		}
		
		/**
		 *   TODO Private method description ...
		 * 
		 *   @param event Event
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		private function parse ( event : Event ) : void
		{
			var tmp : Array = data.split('\n').join('').split( recordsetDelimiter );
			var result : Array = tmp.filter( isNotEmptyRow )
			result.forEach( row )
			data = result
		}
		
		/**
		 *   TODO Private method description ...
		 * 
		 *   @param element *
		 *   @param index int
		 *   @param arr Array
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		private function isNotEmptyRow ( element : *, index : int, arr : Array ) : Boolean
		{
			return Boolean ( StringUtils.trim ( element ) );
		}
		
		/**
		 *   TODO Private method description ...
		 * 
		 *   @param element *
		 *   @param index int
		 *   @param arr Array
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		private function row ( element : *, index : int, arr : Array ) : void
		{
			arr[ index ] = arr[ index ].split ( fieldSeperator )
			if ( beautify )
				 arr[ index ].forEach ( beautifier )
		}
		
		/**
		 *   TODO Private method description ...
		 * 
		 *   @param element *
		 *   @param index int
		 *   @param arr Array
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		private function beautifier ( element : *, index : int, arr : Array ) : void
		{
			if ( trimFieldWhitespace )
				 arr[ index ] = StringUtils.trim ( arr[ index ], whitespaceTokens )
			if ( trimFieldQuotes )
				 arr[ index ] = StringUtils.trim ( arr[ index ], quoteTokens )
		}
		
		
		
	}
}