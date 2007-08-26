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
	 *   
	 *   @langversion ActionScript 3.0
	 *   @tiptext
	 */
	public class CSV extends CSVParser
	{
		
		
		/**
		 *   TODO Constructor description ...
		 * 
		 *   @param request URLRequest object, [int = null]
		 *   @return no
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function CSV ( request : * = null )
		{
			if ( request )
				 load ( request )
		}
		
		/**
		 *   TODO Public method description ...
		 * 
		 *   @deprecated yes
		 *   @param no
		 *   @return String that contais the dumped array
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public function dump () : String
		{
			var result : String = 'data:Array -> [\r'
			for (var i : int = 0; i < data.length; i++ )
			{
				result += '\t[' + i + ']:Array -> [\r'
				for ( var j : uint = 0; j < data[i].length; j++ ) result += '\t\t[' + j + ']:String -> ' + data[ i ][ j ] + '\r'
				result += ( '\t]\r' )
			}
			result += ']\r'
			return result
		}
		
	}
}