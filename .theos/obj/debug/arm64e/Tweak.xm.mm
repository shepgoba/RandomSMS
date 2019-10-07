#line 1 "Tweak.xm"
#include <stdlib.h>
#include <substrate.h>

@interface TLAlert
-(NSURL *)randomURL;
@end

@interface TLAlertConfiguration : NSObject
-(void)setExternalToneFileURL:(NSURL *)arg1;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class TLAlert; 
static id (*_logos_orig$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$)(_LOGOS_SELF_TYPE_NORMAL TLAlert* _LOGOS_SELF_CONST, SEL, id, id, id); static id _logos_method$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$(_LOGOS_SELF_TYPE_NORMAL TLAlert* _LOGOS_SELF_CONST, SEL, id, id, id); static NSURL * _logos_method$_ungrouped$TLAlert$randomURL(_LOGOS_SELF_TYPE_NORMAL TLAlert* _LOGOS_SELF_CONST, SEL); 

#line 12 "Tweak.xm"


static id _logos_method$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$(_LOGOS_SELF_TYPE_NORMAL TLAlert* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3)  {
	if ([[arg1 description] containsString:@"text message"])
		[(TLAlertConfiguration *)arg1 setExternalToneFileURL:[self randomURL]];
	return _logos_orig$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$(self, _cmd, arg1, arg2, arg3);
}


static NSURL * _logos_method$_ungrouped$TLAlert$randomURL(_LOGOS_SELF_TYPE_NORMAL TLAlert* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSString *tonesPath = @"/var/mobile/Media/iTunes_Control/Ringtones/";
	NSArray* allFilesAtTonesPath = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:tonesPath error:NULL];
	NSMutableArray *m4rFiles = [[NSMutableArray alloc] init];
	[allFilesAtTonesPath enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) 
	{
		NSString *filename = (NSString *)obj;
		NSString *extension = [[filename pathExtension] lowercaseString];
		if ([extension isEqualToString:@"m4r"] || [extension isEqualToString:@"mp3"]) 
		{
			[m4rFiles addObject:[tonesPath stringByAppendingPathComponent:filename]];
		}
	}];
	int randomIndex = arc4random_uniform([m4rFiles count]);
	return [NSURL URLWithString: [m4rFiles objectAtIndex:randomIndex]];
}



























































static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$TLAlert = objc_getClass("TLAlert"); MSHookMessageEx(_logos_class$_ungrouped$TLAlert, @selector(_initWithConfiguration:toneIdentifier:vibrationIdentifier:), (IMP)&_logos_method$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$, (IMP*)&_logos_orig$_ungrouped$TLAlert$_initWithConfiguration$toneIdentifier$vibrationIdentifier$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSURL *), strlen(@encode(NSURL *))); i += strlen(@encode(NSURL *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$TLAlert, @selector(randomURL), (IMP)&_logos_method$_ungrouped$TLAlert$randomURL, _typeEncoding); }} }
#line 96 "Tweak.xm"
