//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/app/domain/WeatherDataPoint.java
//

#ifndef _FAWeatherDataPoint_H_
#define _FAWeatherDataPoint_H_

@class JavaLangDouble;
@class JavaLangLong;

#import "JreEmulation.h"
#include "com/sponberg/fluid/layout/TableRowWithId.h"

@interface FAWeatherDataPoint : NSObject < FFTTableRowWithId > {
 @public
  long long int time_;
  NSString *icon_;
  double precipProbability_;
  double temperatureMax_;
  double temperatureMin_;
  NSString *summary_;
}

- (JavaLangDouble *)getTemperatureMaxC;

- (JavaLangDouble *)getTemperatureMinC;

- (double)getFtoCWithDouble:(double)f;

- (JavaLangLong *)getTimeInMillis;

- (JavaLangLong *)getFluidTableRowObjectId;

- (id)init;

- (long long int)getTime;

- (NSString *)getIcon;

- (double)getPrecipProbability;

- (double)getTemperatureMax;

- (double)getTemperatureMin;

- (NSString *)getSummary;

- (void)setTimeWithLong:(long long int)time;

- (void)setIconWithNSString:(NSString *)icon;

- (void)setPrecipProbabilityWithDouble:(double)precipProbability;

- (void)setTemperatureMaxWithDouble:(double)temperatureMax;

- (void)setTemperatureMinWithDouble:(double)temperatureMin;

- (void)setSummaryWithNSString:(NSString *)summary;

- (NSString *)description;

- (BOOL)isEqual:(id)o;

- (BOOL)canEqualWithId:(id)other;

- (NSUInteger)hash;

- (void)copyAllFieldsTo:(FAWeatherDataPoint *)other;

@end

__attribute__((always_inline)) inline void FAWeatherDataPoint_init() {}

J2OBJC_FIELD_SETTER(FAWeatherDataPoint, icon_, NSString *)
J2OBJC_FIELD_SETTER(FAWeatherDataPoint, summary_, NSString *)

typedef FAWeatherDataPoint ComSponbergAppDomainWeatherDataPoint;

#endif // _FAWeatherDataPoint_H_
