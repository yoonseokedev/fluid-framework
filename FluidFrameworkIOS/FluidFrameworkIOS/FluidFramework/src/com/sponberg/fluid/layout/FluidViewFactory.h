//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/layout/FluidViewFactory.java
//

#ifndef _FFTFluidViewFactory_H_
#define _FFTFluidViewFactory_H_

@class FFTViewPosition;
@class JavaUtilHashMap;
@protocol FFTFluidViewFactory_FluidViewBuilder;

#import "JreEmulation.h"

@interface FFTFluidViewFactory : NSObject {
 @public
  JavaUtilHashMap *registeredViewTypes_;
}

- (void)registerViewWithNSString:(NSString *)type
withFFTFluidViewFactory_FluidViewBuilder:(id<FFTFluidViewFactory_FluidViewBuilder>)builder;

- (id)createViewWithNSString:(NSString *)type
         withFFTViewPosition:(FFTViewPosition *)view
                      withId:(id)userInfo;

- (void)updateViewWithNSString:(NSString *)type
                        withId:(id)fluidView
           withFFTViewPosition:(FFTViewPosition *)view
                        withId:(id)userInfo;

- (void)cleanupViewWithNSString:(NSString *)type
                         withId:(id)fluidView;

- (id)init;

- (void)copyAllFieldsTo:(FFTFluidViewFactory *)other;

@end

__attribute__((always_inline)) inline void FFTFluidViewFactory_init() {}

J2OBJC_FIELD_SETTER(FFTFluidViewFactory, registeredViewTypes_, JavaUtilHashMap *)

typedef FFTFluidViewFactory ComSponbergFluidLayoutFluidViewFactory;

@protocol FFTFluidViewFactory_FluidViewBuilder < NSObject, JavaObject >

- (id)createFluidViewWithFFTViewPosition:(FFTViewPosition *)view
                                  withId:(id)userInfo;

- (void)updateFluidViewWithId:(id)fluidView
          withFFTViewPosition:(FFTViewPosition *)view
                       withId:(id)userInfo;

- (void)cleanupFluidViewWithId:(id)fluidView;

@end

__attribute__((always_inline)) inline void FFTFluidViewFactory_FluidViewBuilder_init() {}

#endif // _FFTFluidViewFactory_H_
