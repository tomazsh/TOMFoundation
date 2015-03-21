//
//  NSString+TOMFoundation.h
//  TOMFoundation
//
//  Copyright (c) 2015 Tomaz Nedeljko (http://nedeljko.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

/**
 The `NSString(TOMFoundation)` category extends `NSString` with a set of utility methods.
 */
@interface NSString (TOMFoundation)

///---------------------------------------
/// @name Removing and Trimming Characters
///---------------------------------------

/**
 Creates and returns a new string by trimming whitespace characters from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByTrimmingWhitespaceCharacters;

/**
 Creates and returns a new string by trimming newline characters from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByTrimmingNewlineCharacters;

/**
 Creates and returns a new string by trimming whitespace and newline characters from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByTrimmingWhitespaceAndNewlineCharacters;

/**
 Creates and returns a new string by removing all whitespace characters from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByRemovingWhitespaceCharacters;

/**
 Creates and returns a new string by removing all newline characters from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByRemovingNewlineCharacters;

/**
 Creates and returns a new string by removing all whitespace and newline characters from the receiver.

 @return A `NSString` object.
*/
- (NSString *)tom_stringByRemovingWhitespaceAndNewlineCharacters;

/**
 Creates and returns a new string by removing all whitespace and newline characters from the receiver.
 
 @param characterSet A character set. This value must not be `nil`.
 @param joiningString A string to join remaining parts with.
 
 @return A `NSString` object.
 */
- (NSString *)tom_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet
                                   joinedByString:(NSString *)joiningString;

///------------------------
/// @name Comparing Strings
///------------------------

/**
 Checks if the receiver's first character is a member of a character set.
 
 @param characterSet A character set to test. This value must not be `nil`.
 
 @return `YES` if the first character is a member of `characterSet`, otherwise `NO`.
 */
- (BOOL)tom_hasPrefixCharacterFromSet:(NSCharacterSet *)characterSet;

/**
 Checks if the receiver's last character is a member of a character set.
 
 @param characterSet A character set to test. This value must not be `nil`.
 
 @return `YES` if the last character is a member of `characterSet`, otherwise `NO`.
 */
- (BOOL)tom_hasSuffixCharacterFromSet:(NSCharacterSet *)characterSet;


///-------------------------
/// @name Working with Paths
///-------------------------

/**
 Creates and returns a new file system safe string from the receiver.
 
 @return A `NSString` object.
 */
- (NSString *)tom_fileSystemSafeString;

#if (defined __COREFOUNDATION__) && (defined __UTCORETYPES__)

/**
 Attempts to create a mime type representation string from the receiver's filename extension.
 
 @return A `NSString` object.
 */
- (NSString *)tom_mimeTypeForLastPathComponent;

#endif

@end
