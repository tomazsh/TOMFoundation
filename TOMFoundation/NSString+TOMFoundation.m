//
//  NSString+TOMFoundation.m
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

#import "NSString+TOMFoundation.h"

@implementation NSString (TOMFoundation)

#pragma mark -
#pragma mark Instance Methods

- (NSString *)tom_stringByTrimmingWhitespaceCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)tom_stringByTrimmingNewlineCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (NSString *)tom_stringByTrimmingWhitespaceAndNewlineCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)tom_stringByRemovingWhitespaceCharacters
{
    return [self tom_stringByRemovingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] joinedByString:@""];
}

- (NSString *)tom_stringByRemovingNewlineCharacters
{
    return [self tom_stringByRemovingCharactersInSet:[NSCharacterSet newlineCharacterSet] joinedByString:@""];
}

- (NSString *)tom_stringByRemovingWhitespaceAndNewlineCharacters
{
    return [self tom_stringByRemovingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] joinedByString:@""];
}

// Adopted from http://stackoverflow.com/questions/758212/how-can-i-strip-all-the-whitespaces-from-a-string-in-objective-c
- (NSString *)tom_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet joinedByString:(NSString *)joiningString
{
    NSArray *parts = [self componentsSeparatedByCharactersInSet:characterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    NSArray *filteredParts = [parts filteredArrayUsingPredicate:noEmptyStrings];
    return [filteredParts componentsJoinedByString:joiningString];
}

- (BOOL)tom_hasPrefixCharacterFromSet:(NSCharacterSet *)characterSet
{
	if (![self length]) {
		return NO;
	}
	
	unichar firstChar = [self characterAtIndex:0];
	return [characterSet characterIsMember:firstChar];
}

- (BOOL)tom_hasSuffixCharacterFromSet:(NSCharacterSet *)characterSet
{
	if (![self length]) {
		return NO;
	}
	
	unichar lastChar = [self characterAtIndex:[self length]-1];
	return [characterSet characterIsMember:lastChar];
}

- (NSString *)tom_fileSystemSafeString
{
    static NSString *FileSystemSafeCharacters = @"-_.() abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSCharacterSet *characterSet = [[NSCharacterSet characterSetWithCharactersInString:FileSystemSafeCharacters] invertedSet];
    return [self tom_stringByRemovingCharactersInSet:characterSet joinedByString:@"_"];
}

#if (defined __COREFOUNDATION__) && (defined __UTCORETYPES__)

- (NSString *)tom_mimeTypeForLastPathComponent
{
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[self pathExtension], NULL);
    CFStringRef mimeType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!mimeType) {
        return @"application/octet-stream";
    } else {
        return (__bridge_transfer NSString *)mimeType;
    }
}

#endif

@end
