#line 1 "Tweak.xm"
#include <stdlib.h>
#include <substrate.h>

@interface TLAlertConfiguration : NSObject
-(long long)type;
-(NSString *)audioCategory;
-(NSString *)topic;
-(NSString *)toneIdentifier;
-(BOOL)shouldIgnoreRingerSwitch;
-(NSURL *)externalToneFileURL;
-(void)setExternalToneFileURL:(NSURL *)arg1 ;
-(id)initWithType:(long long)arg1 ;
@end
@interface TLAlert : NSObject
-(NSString *)toneIdentifier;
-(TLAlertConfiguration *)configuration;
-(id)_initWithConfiguration:(id)arg1 toneIdentifier:(id)arg2 vibrationIdentifier:(id)arg3 ;

@end

@interface TLAlertSystemSoundController
-(NSURL *)randomURL;
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

@class TLAlert; @class TLAlertConfiguration; @class TLAlertSystemSoundController; 
static void (*_logos_orig$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$)(_LOGOS_SELF_TYPE_NORMAL TLAlertSystemSoundController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL TLAlertSystemSoundController* _LOGOS_SELF_CONST, SEL, id, id); static NSURL * _logos_method$_ungrouped$TLAlertSystemSoundController$randomURL(_LOGOS_SELF_TYPE_NORMAL TLAlertSystemSoundController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TLAlertConfiguration(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TLAlertConfiguration"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TLAlert(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TLAlert"); } return _klass; }
#line 25 "Tweak.xm"


static void _logos_method$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL TLAlertSystemSoundController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2)  {
	if ([[arg1 toneIdentifier] containsString:@"texttone"])
	{
		TLAlertConfiguration *newConfig = [[_logos_static_class_lookup$TLAlertConfiguration() alloc] initWithType:0];
		[newConfig setExternalToneFileURL:[self randomURL]];
		TLAlert *newAlert = [[_logos_static_class_lookup$TLAlert() alloc] _initWithConfiguration:newConfig toneIdentifier:nil vibrationIdentifier:nil];
		_logos_orig$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$(self, _cmd, newAlert, arg2);
	}
	else
	{
		_logos_orig$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$(self, _cmd, arg1, arg2);
	}
}


static NSURL * _logos_method$_ungrouped$TLAlertSystemSoundController$randomURL(_LOGOS_SELF_TYPE_NORMAL TLAlertSystemSoundController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return [NSURL URLWithString:@"/var/mobile/Media/yeet.mp3"];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$TLAlertSystemSoundController = objc_getClass("TLAlertSystemSoundController"); MSHookMessageEx(_logos_class$_ungrouped$TLAlertSystemSoundController, @selector(playAlert:withCompletionHandler:), (IMP)&_logos_method$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$, (IMP*)&_logos_orig$_ungrouped$TLAlertSystemSoundController$playAlert$withCompletionHandler$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSURL *), strlen(@encode(NSURL *))); i += strlen(@encode(NSURL *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$TLAlertSystemSoundController, @selector(randomURL), (IMP)&_logos_method$_ungrouped$TLAlertSystemSoundController$randomURL, _typeEncoding); }} }
#line 46 "Tweak.xm"
