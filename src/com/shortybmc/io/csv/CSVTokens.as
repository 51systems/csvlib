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
	public class CSVTokens
	{
		
		
		/**
		 *   TODO Properties description ...
		 *   
		 *   @langversion ActionScript 3.0
		 *   @tiptext
		 */
		public static var CRLF : String = '\r'
		public static var FIELD_SEPERATOR : String = ','
		public static var QUOTE_LIST : Array = new Array ( '\'','"' );
		public static var WHITESPACE_LIST : Array = new Array ( ' ', '\t' );
		
	}
}