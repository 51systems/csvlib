package com.shortybmc.utils
{



	public class StringUtils
	{

		public static var NEWLINE_TOKENS : Array = new Array (
			'\n',
			'\r'
		);
		
		public static var WHITESPACE_TOKENS : Array = new Array (
			' ',
			'\t'
		);
		
		public static var QUOTE_TOKENS : Array = new Array (
			'\'',
			'"'
		);
		
		public static var ESCAPE_MAP : Array = new Array (
			'\'',
			'"',
			'\\'
		);

		public static var HTML_SPECIALCHARS:Array = new Array (
			['&gt;'  , '>' ],
			['&lt;'  , '<' ],
			['&#039;', '\''],
			['&quot;', '"' ],
			['&amp;' , '&' ]
		);

		/**
		 * Finds whether a variable is a string. <br />
		 * {@code trace (StringUtils.isString ('hello world')); // true
		 * }
		 * @param target :Object
		 * @return true/false.
		 */
		public static function isString ( obj : * ) : Boolean
		{
			return (obj is String);
		}
		
		/**
		 * Evaluates if the passed-in stirng starts with the searchString. <br />
		 * @param string the string to check
		 * @param searchString the search string that may be at the beginning of string
		 * @return true false
		 */
		public static function startsWith ( str : String, search : String ) : Boolean
		{
			if ( str.indexOf ( search ) == 0 )
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Tests whether the string ends with earchString. <br />
		 * @param string the string to check
		 * @param searchString the string that may be at the end of string
		 * @return true false
		 */
		public static function endsWith ( str : String, search : String ) : Boolean
		{
			if ( str.lastIndexOf( search ) == ( str.length - search.length ) )
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Returns the first character of the passed-in string.<br />
		 * @param string the string to return the first character of
		 * @return the first character of the string
		 */
		public static function firstChar ( str : String ) : String
		{
			return str.charAt( 0 );
		}
		/**
		 * Returns the last character of the passed-in string.<br />
		 * @param string the string to return the last character of
		 * @return the last character of the string
		 */
		public static function lastChar ( str : String ) : String
		{
			return str.charAt( str.length - 1 );
		}
		
		private static function getCharValue ( char : String ) : Number
		{
			var code:Number = char.toUpperCase().charCodeAt( 0 );
			if ( code > 47 && code < 58 )
			{
				return code - 48;
			}
			if ( code > 64 && code < 91 )
			{
				return code - 55;
			}
			return 0;
		}
		
		/**
		 * Find position of first occurrence of a string. <br />
		 * {@code trace (StringUtils.position ('Hello world!', 'world', 0, true)); // 6
		 * }
		 * @param haystack :String
		 * @param needle :String
		 * @param offset :Number (optional)
		 * @param caseSensitive :Boolean (optional)
		 * @return The numeric position of the first occurrence of needle in
		 * the haystack string.
		 */
		public static function position (haystack : String, needle : String, offset : Number, caseSensitive : Boolean = true ) : Number
		{
			if ( caseSensitive == false )
			{
				needle = needle.toLowerCase();
				haystack = haystack.toLowerCase();
			}
			var result:Number = haystack.indexOf( needle, offset );
			return result != -1 ? result : 0;
		}

		/**
		 * Repeat a string. <br />
		 * {@code trace (StringUtils.repeat ('Foo ', 3)); // Foo Foo Foo
		 * }
		 * @param str :String
		 * @param multiplier :Number
		 * @return Str repeated multiplier times. Multiplier has to be greater
		 * than or equal to 0. If the multiplier is set to 0, the return is an
		 * empty string.
		 */
		public static function repeat ( str : String, multiplier : Number ) : String
		{
			var result : String = '';
			while ( multiplier > 0 && multiplier-- )
			{
				result += str;
			}
			return result;
		}

		/**
		 * Reverse a string. <br />
		 * {@code trace (StringUtils.reverse ('0123456789 abcdefgh')); // hgfedcba 9876543210
		 * }
		 * @param str :String
		 * @return str, reversed.
		 */
		public static function reverse ( str : String ) : String
		{
			var result : String = '';
			var i : Number = str.length;
			while ( i-- )
			{
				result += str.slice ( i, i + 1 );
			}
			return result;
		}

		/**
		 * Replace all occurrences of the search string with the replacement string. <br />
		 * {@code trace (StringUtils.replace ('world', 'shorty', 'hello world!'));
		 * // hello shorty!
		 * }
		 * @param search :String
		 * @param replacement :String
		 * @param str :String
		 * @return A string with all occurrences of search in str, replaced with the given replace value.
		 */
		public static function replace (search : String, replacement : String, str : String ) : String
		{
			return str.split( search ).join( replacement || '' );
		}
		/**
		 * Replace text within a portion of a string. <br />
		 * {@code trace (StringUtils.substringReplace ('hello world, my name is foo', 'you, shorty', 6, 20));
		 * // hello you, shorty is foo
		 * }
		 * @param str :String
		 * @param replacement :String
		 * @param offset :Number
		 * @param length :Number (optional)
		 * @return A string with all occurrences of str, replaced with the given replacement value.
		 */
		public static function substringReplace ( str : String, replacement : String, offset : Number, length : Number) : String
		{
			return str.split ( str.slice ( offset, length ) ).join( replacement || '' );
		}

		/**
		 * Translate certain characters. <br />
		 * {@code trace (StringUtils.translate ('hello world', 'world', 'shorty')); // hello shorty
		 * // or use with replace pair array
		 * var list:Array = new Array ();
		 * list[0] = ['from', 'to'];
		 * list[1] = ['to', 'you'];
		 * trace (StringUtils.translate ('translate from to', list));
		 * // translate to you
		 * }
		 * @param str :String
		 * @param from :String or :Array
		 * @param to :String (optional)
		 * @return A copy of str, translating all occurrences of each character
		 * in from to the corresponding character in to. May be called with only
		 * two arguments. If called with two arguments it behaves in a new way:
		 * from then has to be an array that contains string -> string pairs that
		 * will be replaced in the source string.
		 */
		public static function translate ( str : String, from : * = '', to : String = '') : String
		{
			if ( from is Array )
			{
				for ( var i : String in from )
				{
					str = str.split( from[ i ][ 0 ] || '' ).join( from[ i ][ 1 ] || '' );
				}
			}
			else
			{
				str = str.split( from.toString() ).join( to );
			}
			return str;
		}

		 /**
		 * Counts the occurrences of needle in haystack. <br />
		 * {@code trace (StringUtils.count ('hello world!', 'o')); // 2
		 * }
		 * @param haystack :String
		 * @param needle :String
		 * @param offset :Number (optional)
		 * @param length :Number (optional)
		 * @return The number of times the needle substring occurs in the
		 * haystack string. Please note that needle is case sensitive.
		 */
		public static function count ( haystack : String, needle : String, offset : Number, length : Number) : Number
		{
			var result : Number = 0;
			haystack = haystack.slice( offset, length );
			while ( haystack.length > 0 && haystack.indexOf( needle ) != -1 )
			{
				haystack = haystack.slice( ( haystack.indexOf( needle ) + needle.length ) );
				result++;
			}
			return result;
		}
		
		/**
		 * Case in/sensitive comparison of 2 strings from an offset, up to length charactersk. <br />
		 * {@code trace (StringUtils.compare ('aA', 'aa')); // false
		 * trace (StringUtils.compare ('aA', 'aa', 0, 2, true)); // true
		 * trace (StringUtils.compare ('aA', 'aa', 1, 2)); // false
		 * }
		 * @param strA :String
		 * @param strB :String
		 * @param offset :Number (optional)
		 * @param length :Number (optional)
		 * @param caseSensitive :Boolean (optional)
		 * @return true or false
		 */
		public static function compare ( strA : String, strB : String, offset : Number, length : Number, caseSensitive : Boolean = true ) : Boolean
		{
			strA = strA.slice( offset, length || strA.length );
			strB = strB.slice( offset, length || strB.length );
			if ( caseSensitive == false )
			{
				strA = strA.toLowerCase();
				strB = strB.toLowerCase();
			}
			return ( strA == strB );
		}
		
		/**
		 * Join array elements to a string. <br />
		 * {@code trace (StringUtils.implode ('|', ['a', [0, 10], 'b', true])); // a|0|10|b|true
		 * }
		 * @param delimiter :String
		 * @param arr :Array
		 * @return A string containing a string representation of all the array
		 * elements in the same order, with the glue string between each element.
		 */
		public static function implode ( delimiter : String, arr : Array ) : String
		{
			return arr.toString().split( ',' ).join( delimiter );
		}
		
		/**
		 * Split a string by delimiter, in a array. <br />
		 * {@code var a:Array = StringUtils.explode ('|', 'a|0|10|b|true', 2);
		 * // - de.bug view -
		 * // Variable _level0.a = [Objekt #9, Klasse 'Array'] [
		     * // 0:"a",
		     * // 1:"0,10,b,true"
		 * // ]
		 * }
		 * @param delimiter :String
		 * @param str :String
		 * @param limit :Number (optional)
		 * @return An array of strings, each of which is a substring of str
		 * formed by splitting it on boundaries formed by the delimiter. If
		 * limit is set, the returned array will contain a maximum of limit
		 * elements with the last element containing the rest of str.
		 */
		public static function explode ( delimiter : String, str : String, limit : Number = 0 ) : Array
		{
			var result : Array = str.split ( delimiter );
			if ( limit && result.length >= limit )
			{
				result[ limit - 1 ] = result.slice( limit - 1 ).toString();
				result.length = limit;
			}
			return result;
		}
		
		/**
		 * Convert a string's first character to uppercase. <br />
		 * {@code trace (StringUtils.ucfirst ('hello world!')); // Hello world!
		 * }
		 * @param str :String
		 * @return A string with the first character of str capitalized, if that character is alphabetic.
		 */
		public static function ucfirst ( str : String) : String
		{
			return str.slice( 0, 1 ).toUpperCase() + str.substring( 1 );
		}
		
		/**
		 * Uppercase the first character of each word in a string. <br />
		 * {@code trace (StringUtils.ucwords ('hello w o r l d!')); // Hello W O R L D!
		 * }
		 * @param str :String
		 * @return A string with the first character of each word in str capitalized, if that character is alphabetic.
		 */
		public static function ucwords ( str : String, count : Number = 0) : String
		{
			var result : String = '';
			var ID : Number = count;
			var a : Array = str.split( ',' ).join( '&#44;' ).toString().split ( WHITESPACE_TOKENS[ ID ] );
			for (var i:String in a)
			{
				a[i] = ucfirst(a[i]);
			}
			result = a.toString().split( ',' ).join( WHITESPACE_TOKENS[ ID ] ).split( '&#44;' ).join( ',' );
			if ( !count || count < WHITESPACE_TOKENS.length - 1 )
			{
				return ucwords( result, ++ID );
			}
			else
			{
				return result;
			}
		}

		/**
		 * Format a number with grouped thousands. <br />
		 * {@code trace (StringUtils.numberFormat ('1145045234')); // 1,145,045,234.00
		 * trace (StringUtils.numberFormat (1145045234.00, 3, 4, "^", '°')); // 1°145°045°234^0000
		 * }
		 * @param float :String or :Number
		 * @param preDecimals :Number (optional)
		 * @param afterDecimals :Number (optional)
		 * @param decimalDelimiter :String (optional)
		 * @param thousandsDelimiter :String (optional)
		 * @return A formatted version of number, as string. 
		 */
		public static function numberFormat ( float : *, preDecimals : Number = 3, afterDecimals : Number = 2, decimalDelimiter : String = '.', thousandsDelimiter : String = ',' ) : String
		{
			var result : String = '';
			var pD:Number = preDecimals;
			var aD:Number = afterDecimals;
			var a:Array = Math.floor ( ( Number( float ) * Math.pow ( 10, aD ) ) ).toString ().split ('');
			while ( a.length > 0 )
			{
				var o:Object = a.pop ();
				if ( --aD >= 0 )
				{
					result = o + result;
				}
				if ( aD == 0 )
				{
					result = ( decimalDelimiter ) + result;
				}
				if ( aD < 0 )
				{
					if ( --pD > 0 || a.length == 0 )
					{
						result = o + result;
					}
					else
					{
						pD = ( preDecimals );
						result = ( thousandsDelimiter ) + o + result;
					}
				}
			}
			return result;
		}
		
		/**
		 * Strip whitespace and newline (or other) from the beginning and end of a string. <br />
		 * {@code trace (StringUtils.trim ('hello world! ')); // hello world!
		 * }
		 * @param str :String
		 * @param charList :Array (optional)
		 * @return A string with whitespace stripped from the beginning and end
		 * of str. Without the second parameter, trim() will strip characters that
		 * defined in WHITESPACE_TOKENS and NEWLINE_TOKENS array.
		 */
		public static function trim ( str : String, charList : Array = null ) : String
		{
			var list:Array;
			if ( charList )
			{
				list = charList;
			}
			else
			{
				list = WHITESPACE_TOKENS.concat( NEWLINE_TOKENS );
			}
			str = trimLeft( str, list );
			str = trimRight( str, list );
			return str;
		}
		
		/**
		 * Does the same how trim method, but only on left-side. <br />
		 * {@code trace (StringUtils.trimLeft ('hello world!')); // hello world!
		 * }
		 * @param str :String
		 * @param charList :Array (optional)
		 * @return A string with whitespace stripped from the start of str.
		 * Without the second parameter, trimLeft() will strip haracters of
		 * WHITESPACE_TOKENS + NEWLINE_TOKENS.
		 */
		public static function trimLeft ( str : String, charList : Array = null ) : String
		{
			var list:Array;
			if ( charList )
				 list = charList;
			else
				 list = WHITESPACE_TOKENS.concat( NEWLINE_TOKENS );
			
			while ( list.toString().indexOf ( str.substr ( 0, 1 ) ) > -1 && str.length > 0 )
			{
				str = str.substr ( 1 );
			}
			return str;
		}
		
		/**
		 * Does the same how trim method, but only on right-side. <br />
		 * {@code trace (StringUtils.trimRight ('hello world!')); // hello world!
		 * }
		 * @param str :String
		 * @param charList :Array (optional)
		 * @return A string with whitespace stripped from the end of str.
		 * Without the second parameter, trimRight() will strip haracters of
		 * WHITESPACE_TOKENS + NEWLINE_TOKENS.
		 */
		public static function trimRight ( str:String, charList : Array = null ) : String
		{
			var list : Array;
			if ( charList )
				 list = charList;
			else
				 list = WHITESPACE_TOKENS.concat( NEWLINE_TOKENS );
			
			while ( list.toString().indexOf ( str.substr ( str.length - 1 ) ) > -1 && str.length > 0)
			{
				str = str.substr ( 0, str.length - 1 );
			}
			return str;
		}
		
		/**
		 * Pad a string to a certain length with another string, on both sides. <br />
		 * {@code trace (StringUtils.pad ('hello world!', 15, '_')); // _hello world!__
		 * }
		 * @param str :String
		 * @param length :Number
		 * @param pad :String (optional)
		 * @return The input str padded on both sides to the specified padding length.
		 * If the optional argument pad is not supplied, the input is padded with spaces,
		 * otherwise it is padded with characters from pad up to the limit.
		 */
		public static function pad ( str : String, length : Number, pad : String ) : String
		{
			var fill:String = '';
			var l:Number = Math.floor ( (length - str.length) / 2 );
			var r:Number = Math.round ( (length - str.length) / 2 );
			if (arguments[2].length > 0)
			{
				fill = pad;
			}
			else
			{
				fill = ' ';
			}
			return repeat( fill, l ).slice( 0, l ) + str + repeat( fill, r ).slice( 0, r );
		}
		
		/**
		 * Does the same how pad method, but only on left side of string. <br />
		 * {@code trace (StringUtils.padLeft ('hello world!', 30, '_')); // ___hello world!
		 * }
		 * @param str :String
		 * @param length :Number
		 * @param pad :String (optional)
		 * @return The input str padded on left side to the specified padding length.
		 * If the optional argument pad is not supplied, the input is padded with spaces,
		 * otherwise it is padded with characters from pad up to the limit.
		 */
		public static function padLeft ( str : String, length : Number, pad : String ) : String
		{
			var fill:String = '';
			var l:Number = length - str.length;
			if ( pad.length > 0 )
			{
				fill = pad;
			}
			else
			{
				fill = ' ';
			}
			return repeat( fill, l ).slice( 0, l ) + str;
		}
		
		/**
		 * Does the same how pad method, but only on right side of string. <br />
		 * {@code trace (StringUtils.padRight ('hello world!', 15, '_')); // hello world!___
		 * }
		 * @param str :String
		 * @param length :Number
		 * @param pad :String (optional)
		 * @return The input str padded on right side to the specified padding length.
		 * If the optional argument pad is not supplied, the input is padded with spaces,
		 * otherwise it is padded with characters from pad up to the limit.
		 */
		public static function padRight ( str : String , length : Number, pad : String ) : String
		{
			var fill:String = '';
			var r:Number = length - str.length;
			if ( pad.length > 0 )
			{
				fill = pad;
			}
			else
			{
				fill = ' ';
			}
			return str + repeat( fill, r ).slice( 0, r );
		}
		
		/**
		 * Quote string with slashes. <br />
		 * {@code trace (StringUtils.addSlashes('<hello foo="world" />')); // <hello foo=\"world\" />
		 * }
		 * @param str :String
		 * @return A string with backslashes before characters that need to
		 * be quoted in database queries etc. These characters are single quote ('),
		 * double quote ("), backslash (\). Characters defined in ESCAPE_MAP array.
		 */
		public static function addSlashes ( str : String ) : String
		{
			for ( var i : String in ESCAPE_MAP )
			{
				str = str.split( ESCAPE_MAP[ i ]).join( '\\' + ESCAPE_MAP[ i ] );
			}
			return str;
		}
		
		/**
		 * Un-quote string quoted with addSlashes. <br />
		 * {@code trace (StringUtils.stripSlashes ('<foo atrib=\"hello\">\'world\'</foo>'));
		 * // <foo atrib="hello">'world'</foo>
		 * }
		 * @param str :String
		 * @return A string with backslashes stripped off. (\' becomes ' and so on.) 
		 * Double backslashes (\\) are made into a single backslash (\). These
		 * characters are single quote ('), double quote ("), backslash (\). Characters
		 * defined in ESCAPE_MAP array.
		 */
		public static function stripSlashes ( str : String ) : String
		{
			for ( var i : String in ESCAPE_MAP )
			{
				str = str.split( '\\' + ESCAPE_MAP[ i ] ).join( ESCAPE_MAP[ i ] );
			}
			return str;
		}
		
		/**
		 * URL-encodes string. <br />
		 * {@code trace (StringUtils.URLEncode ('hello world')); // hello%20world%21
		 * }
		 * @param str :String
		 * @return A URL-encoded String.
		 */
		public static function URLEncode ( str : String ) : String
		{
			return escape( str );
		}
		
		/**
		 * Decodes URL-encoded string. <br />
		 * {@code trace (StringUtils.URLDecode ('hello%20world%21')); // hello world
		 * }
		 * @param str :String
		 * @return A URL-decoded String.
		 */
		public static function URLDecode ( str : String) : String
		{
			return unescape(str);
		}
		
		/**
		  * Validates the passed-in emailadress.
		  * 
		  * @param email the email to check whether it is well-formatted
		  * @return true or false
		  */
		public static function isEmail ( email : String ) : Boolean
		{
			if ( email.length < 6)
			{
				return false;
			}
			if ( email.split( '@' ).length > 2 || email.indexOf( '@' ) < 0 )
			{
				return false;
			}
			if ( email.lastIndexOf( '@' ) > email.lastIndexOf( '.') )
			{
				return false;
			}
			if ( email.lastIndexOf( '.' ) > email.length - 3 )
			{
				return false;
			}
			if ( email.lastIndexOf( '.' ) <= email.lastIndexOf( '@' ) + 1 )
			{
				return false;
			}
			return true;
		}
		
		/**
		 * Inserts HTML line breaks before all newlines in a string. <br />
		 * {@code trace (StringUtils.nl2br ('hello world\r\n' + newline)); 
		 * // hello world<br /><br /><br />
		 * }
		 * @param str :String
		 * @return A string with '<br />' inserted before all newlines.
		 */
		public static function nl2br ( str : String ) : String
		{
			for ( var i : String in NEWLINE_TOKENS )
			{
				str = str.split( NEWLINE_TOKENS[ i ] ).join( '<br />' + NEWLINE_TOKENS[ i ] );
			}
			return str;
		}
		
		/**
		 * Convert special characters from str string to HTML entities. <br />
		 * {@code trace (StringUtils.HTMLSpecialCharsEncode ('<foo a=\'hello\' b="world" />'));
		 * // &lt;foo a=&#039;hello&#039; b=&quot;world&quot; /&gt;
		 * }
		 * @param str :String
		 * @return A string, with converted characters to special HTML entities.
		 */
		public static function HTMLSpecialCharsEncode ( str:String ) : String
		{
			for ( var i : String in HTML_SPECIALCHARS )
			{
				str = str.split( HTML_SPECIALCHARS[ i ][ 1 ] ).join( HTML_SPECIALCHARS[ i ][ 0 ]);
			}
			return str;
		}
		
		/**
		 * Convert special HTML entities from str string, back to characters. <br />
		 * {@code trace (StringUtils.HTMLSpecialCharsDecode ('&lt;hello foo=&quot;world&quot; /&gt;'));
		 * // <hello foo="world" />
		 * }
		 * @param str :String
		 * @return A string, with converted special HTML entities back to characters.
		 */
		public static function HTMLSpecialCharsDecode ( str : String) : String
		{
			for ( var i : String in HTML_SPECIALCHARS )
			{
				str = str.split( HTML_SPECIALCHARS[ i ][ 0 ] ).join( HTML_SPECIALCHARS[ i ][ 1 ] );
			}
			return str;
		}
		
		/**
		 *
		 * import com.shortybmc.utils.*;
		 * var i = 1000;
		 * while (i > 0 && i--)
		 * {
		 * 		trace (StringUtils.randomString (64));
		 * }
		 *
		 */
		public static function randomString ( length : Number ) : String
		{
			var str : String = '';
			while ( length > 0 && length-- )
			{
				var num : Number = Math.round( Math.random() * 61 );
				if ( num < 10 )
				{
					str += String.fromCharCode ( num + 48 );
				}
				else if ( num < 36 )
				{
					str += String.fromCharCode ( num + 55 );
				}
				else
				{
					str += String.fromCharCode ( num + 61 );
				}
			}
			return str;
		}

	}
}