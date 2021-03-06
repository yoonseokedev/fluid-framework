//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/layout/View.java
//

#include "com/sponberg/fluid/FluidApp.h"
#include "com/sponberg/fluid/GlobalState.h"
#include "com/sponberg/fluid/layout/Constraints.h"
#include "com/sponberg/fluid/layout/DataModelManager.h"
#include "com/sponberg/fluid/layout/Layout.h"
#include "com/sponberg/fluid/layout/LayoutAction.h"
#include "com/sponberg/fluid/layout/View.h"
#include "com/sponberg/fluid/layout/ViewBehavior.h"
#include "java/lang/Boolean.h"
#include "java/lang/Double.h"
#include "java/lang/RuntimeException.h"
#include "java/util/ArrayList.h"

@implementation FFTView

- (id)initWithNSString:(NSString *)id_
          withNSString:(NSString *)key
          withNSString:(NSString *)visibleCondition
         withFFTLayout:(FFTLayout *)layout
    withFFTConstraints:(FFTConstraints *)givenConstraints
   withFFTViewBehavior:(FFTViewBehavior *)viewBehavior {
  if (self = [super init]) {
    portrait_ = [[FFTView_OrientationProperties alloc] init];
    landscape_ = [[FFTView_OrientationProperties alloc] init];
    currentLayout_ = portrait_;
    visible_ = YES;
    self->id__ = id_;
    self->key_ = key;
    self->visibleCondition_ = visibleCondition;
    self->layout_ = layout;
    self->givenConstraints_ = givenConstraints;
    self->viewBehavior_ = viewBehavior;
  }
  return self;
}

- (void)addActionXWithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionX_)) addWithId:a];
}

- (void)addActionX2WithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionX2_)) addWithId:a];
}

- (void)addActionYWithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionY_)) addWithId:a];
}

- (void)addActionY2WithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionY2_)) addWithId:a];
}

- (void)addActionWidthWithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionWidth_)) addWithId:a];
}

- (void)addActionHeightWithFFTLayoutAction:(id<FFTLayoutAction>)a {
  [((JavaUtilArrayList *) nil_chk(((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionHeight_)) addWithId:a];
}

- (void)runActionsWithJavaUtilArrayList:(JavaUtilArrayList *)actions {
  for (id<FFTLayoutAction> __strong action in nil_chk(actions)) {
    [((id<FFTLayoutAction>) nil_chk(action)) run];
  }
}

- (void)setXWithJavaLangDouble:(JavaLangDouble *)v {
  self->x_ = v;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionX_];
  if (width_ != nil && x2_ == nil) {
    [self setX2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(x_)) doubleValue] + [width_ doubleValue]]];
  }
  else if (x2_ != nil && width_ == nil) {
    [self setWidthWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[x2_ doubleValue] - [((JavaLangDouble *) nil_chk(x_)) doubleValue]]];
  }
}

- (void)setYWithJavaLangDouble:(JavaLangDouble *)v {
  self->y_ = v;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionY_];
  if (height_ != nil && y2_ == nil) {
    [self setY2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(y_)) doubleValue] + [height_ doubleValue]]];
  }
  else if (y2_ != nil && height_ == nil) {
    [self setHeightWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[y2_ doubleValue] - [((JavaLangDouble *) nil_chk(y_)) doubleValue]]];
  }
}

- (void)setMiddleXWithJavaLangDouble:(JavaLangDouble *)v {
  self->middleX_ = v;
  if (width_ != nil && x2_ == nil) {
    [self setX2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(middleX_)) doubleValue] + [width_ doubleValue] / 2]];
  }
  if (width_ != nil && x_ == nil) {
    [self setXWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(middleX_)) doubleValue] - [width_ doubleValue] / 2]];
  }
}

- (void)setX2WithJavaLangDouble:(JavaLangDouble *)v {
  self->x2_ = v;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionX2_];
  if (width_ != nil && x_ == nil) {
    [self setXWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(x2_)) doubleValue] - [width_ doubleValue]]];
  }
  else if (x_ != nil && width_ == nil) {
    [self setWidthWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(x2_)) doubleValue] - [x_ doubleValue]]];
  }
}

- (void)setY2WithJavaLangDouble:(JavaLangDouble *)y {
  self->y2_ = y;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionY2_];
  if (height_ != nil && y == nil) {
    [self setYWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(y2_)) doubleValue] - [height_ doubleValue]]];
  }
  else if (y != nil && height_ == nil) {
    [self setHeightWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[((JavaLangDouble *) nil_chk(y2_)) doubleValue] - [y doubleValue]]];
  }
}

- (void)setWidthWithJavaLangDouble:(JavaLangDouble *)width {
  if ([((JavaLangDouble *) nil_chk(width)) doubleValue] < 0) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:[NSString stringWithFormat:@"Width cannot be < 0, %@", [self getId]]];
  }
  self->width_ = width;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionWidth_];
  if (middleX_ != nil && x_ == nil) {
    [self setXWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[middleX_ doubleValue] - [width doubleValue] / 2]];
  }
  if (middleX_ != nil && x2_ == nil) {
    [self setX2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[middleX_ doubleValue] + [width doubleValue] / 2]];
  }
  if (x_ != nil && x2_ == nil) {
    [self setX2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[x_ doubleValue] + [width doubleValue]]];
  }
  else if (x2_ != nil && x_ == nil) {
    [self setXWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[x2_ doubleValue] - [width doubleValue]]];
  }
}

- (void)setHeightWithJavaLangDouble:(JavaLangDouble *)height {
  self->height_ = height;
  [self runActionsWithJavaUtilArrayList:((FFTView_OrientationProperties *) nil_chk(currentLayout_))->actionHeight_];
  if (y_ != nil && y2_ == nil) {
    [self setY2WithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[y_ doubleValue] + [((JavaLangDouble *) nil_chk(height)) doubleValue]]];
  }
  else if (y2_ != nil && y_ == nil) {
    [self setYWithJavaLangDouble:[JavaLangDouble valueOfWithDouble:[y2_ doubleValue] - [((JavaLangDouble *) nil_chk(height)) doubleValue]]];
  }
}

- (BOOL)isEqual:(id)o {
  return [((NSString *) nil_chk(self->id__)) isEqual:((FFTView *) nil_chk(((FFTView *) check_class_cast(o, [FFTView class]))))->id__];
}

- (NSUInteger)hash {
  return ((int) [((NSString *) nil_chk(self->id__)) hash]);
}

- (NSString *)getValueWithNSString:(NSString *)prefix
                      withNSString:(NSString *)keys
                      withNSString:(NSString *)messageFormat {
  NSString *unkownText = [((FFTViewBehavior *) nil_chk(viewBehavior_)) getUnknownText];
  return [((FFTDataModelManager *) nil_chk([((FFTFluidApp *) nil_chk(FFTGlobalState_get_fluidApp__())) getDataModelManager])) getValueWithNSString:prefix withNSString:keys withNSString:messageFormat withNSString:unkownText];
}

- (void)setValueWithNSString:(NSString *)prefix
                withNSString:(NSString *)key
                      withId:(id)value {
  [((FFTDataModelManager *) nil_chk([((FFTFluidApp *) nil_chk(FFTGlobalState_get_fluidApp__())) getDataModelManager])) setValueWithNSString:prefix withNSString:key withId:value];
}

- (void)viewDidLoad {
}

- (NSString *)description {
  return [NSString stringWithFormat:@"View(id=%@, key=%@, visibleCondition=%@, givenConstraints=%@, viewBehavior=%@, x=%@, y=%@, x2=%@, y2=%@, width=%@, height=%@, middleX=%@, portrait=%@, landscape=%@, currentLayout=%@, visible=%@)", [self getId], [self getKey], [self getVisibleCondition], [self getGivenConstraints], [self getViewBehavior], [self getX], [self getY], [self getX2], [self getY2], [self getWidth], [self getHeight], [self getMiddleX], [self getPortrait], [self getLandscape], [self getCurrentLayout], [JavaLangBoolean toStringWithBoolean:[self isVisible]]];
}

- (NSString *)getId {
  return self->id__;
}

- (NSString *)getKey {
  return self->key_;
}

- (NSString *)getVisibleCondition {
  return self->visibleCondition_;
}

- (FFTConstraints *)getGivenConstraints {
  return self->givenConstraints_;
}

- (FFTViewBehavior *)getViewBehavior {
  return self->viewBehavior_;
}

- (JavaLangDouble *)getX {
  return self->x_;
}

- (JavaLangDouble *)getY {
  return self->y_;
}

- (JavaLangDouble *)getX2 {
  return self->x2_;
}

- (JavaLangDouble *)getY2 {
  return self->y2_;
}

- (JavaLangDouble *)getWidth {
  return self->width_;
}

- (JavaLangDouble *)getHeight {
  return self->height_;
}

- (JavaLangDouble *)getMiddleX {
  return self->middleX_;
}

- (FFTView_OrientationProperties *)getPortrait {
  return self->portrait_;
}

- (FFTView_OrientationProperties *)getLandscape {
  return self->landscape_;
}

- (FFTView_OrientationProperties *)getCurrentLayout {
  return self->currentLayout_;
}

- (FFTLayout *)getLayout {
  return self->layout_;
}

- (BOOL)isVisible {
  return self->visible_;
}

- (void)setPortraitWithFFTView_OrientationProperties:(FFTView_OrientationProperties *)portrait {
  self->portrait_ = portrait;
}

- (void)setLandscapeWithFFTView_OrientationProperties:(FFTView_OrientationProperties *)landscape {
  self->landscape_ = landscape;
}

- (void)setCurrentLayoutWithFFTView_OrientationProperties:(FFTView_OrientationProperties *)currentLayout {
  self->currentLayout_ = currentLayout;
}

- (void)setVisibleWithBoolean:(BOOL)visible {
  self->visible_ = visible;
}

- (void)copyAllFieldsTo:(FFTView *)other {
  [super copyAllFieldsTo:other];
  other->currentLayout_ = currentLayout_;
  other->givenConstraints_ = givenConstraints_;
  other->height_ = height_;
  other->id__ = id__;
  other->key_ = key_;
  other->landscape_ = landscape_;
  other->layout_ = layout_;
  other->middleX_ = middleX_;
  other->portrait_ = portrait_;
  other->viewBehavior_ = viewBehavior_;
  other->visible_ = visible_;
  other->visibleCondition_ = visibleCondition_;
  other->width_ = width_;
  other->x_ = x_;
  other->x2_ = x2_;
  other->y_ = y_;
  other->y2_ = y2_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withNSString:withNSString:withFFTLayout:withFFTConstraints:withFFTViewBehavior:", "View", NULL, 0x1, NULL },
    { "addActionXWithFFTLayoutAction:", "addActionX", "V", 0x1, NULL },
    { "addActionX2WithFFTLayoutAction:", "addActionX2", "V", 0x1, NULL },
    { "addActionYWithFFTLayoutAction:", "addActionY", "V", 0x1, NULL },
    { "addActionY2WithFFTLayoutAction:", "addActionY2", "V", 0x1, NULL },
    { "addActionWidthWithFFTLayoutAction:", "addActionWidth", "V", 0x1, NULL },
    { "addActionHeightWithFFTLayoutAction:", "addActionHeight", "V", 0x1, NULL },
    { "runActionsWithJavaUtilArrayList:", "runActions", "V", 0x1, NULL },
    { "setXWithJavaLangDouble:", "setX", "V", 0x1, NULL },
    { "setYWithJavaLangDouble:", "setY", "V", 0x1, NULL },
    { "setMiddleXWithJavaLangDouble:", "setMiddleX", "V", 0x1, NULL },
    { "setX2WithJavaLangDouble:", "setX2", "V", 0x1, NULL },
    { "setY2WithJavaLangDouble:", "setY2", "V", 0x1, NULL },
    { "setWidthWithJavaLangDouble:", "setWidth", "V", 0x1, NULL },
    { "setHeightWithJavaLangDouble:", "setHeight", "V", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
    { "getValueWithNSString:withNSString:withNSString:", "getValue", "Ljava.lang.String;", 0x1, NULL },
    { "setValueWithNSString:withNSString:withId:", "setValue", "V", 0x1, NULL },
    { "viewDidLoad", NULL, "V", 0x4, NULL },
    { "description", "toString", "Ljava.lang.String;", 0x1, NULL },
    { "getId", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getKey", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getVisibleCondition", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getGivenConstraints", NULL, "Lcom.sponberg.fluid.layout.Constraints;", 0x1, NULL },
    { "getViewBehavior", NULL, "Lcom.sponberg.fluid.layout.ViewBehavior;", 0x1, NULL },
    { "getX", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getY", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getX2", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getY2", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getWidth", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getHeight", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getMiddleX", NULL, "Ljava.lang.Double;", 0x1, NULL },
    { "getPortrait", NULL, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", 0x1, NULL },
    { "getLandscape", NULL, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", 0x1, NULL },
    { "getCurrentLayout", NULL, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", 0x1, NULL },
    { "getLayout", NULL, "Lcom.sponberg.fluid.layout.Layout;", 0x1, NULL },
    { "isVisible", NULL, "Z", 0x1, NULL },
    { "setPortraitWithFFTView_OrientationProperties:", "setPortrait", "V", 0x1, NULL },
    { "setLandscapeWithFFTView_OrientationProperties:", "setLandscape", "V", 0x1, NULL },
    { "setCurrentLayoutWithFFTView_OrientationProperties:", "setCurrentLayout", "V", 0x1, NULL },
    { "setVisibleWithBoolean:", "setVisible", "V", 0x1, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "id__", "id", 0x10, "Ljava.lang.String;", NULL,  },
    { "key_", NULL, 0x10, "Ljava.lang.String;", NULL,  },
    { "visibleCondition_", NULL, 0x10, "Ljava.lang.String;", NULL,  },
    { "givenConstraints_", NULL, 0x10, "Lcom.sponberg.fluid.layout.Constraints;", NULL,  },
    { "viewBehavior_", NULL, 0x10, "Lcom.sponberg.fluid.layout.ViewBehavior;", NULL,  },
    { "x_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "y_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "x2_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "y2_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "width_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "height_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "middleX_", NULL, 0x4, "Ljava.lang.Double;", NULL,  },
    { "portrait_", NULL, 0x4, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", NULL,  },
    { "landscape_", NULL, 0x4, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", NULL,  },
    { "currentLayout_", NULL, 0x4, "Lcom.sponberg.fluid.layout.View$OrientationProperties;", NULL,  },
    { "layout_", NULL, 0x12, "Lcom.sponberg.fluid.layout.Layout;", NULL,  },
    { "visible_", NULL, 0x4, "Z", NULL,  },
  };
  static J2ObjcClassInfo _FFTView = { "View", "com.sponberg.fluid.layout", NULL, 0x1, 42, methods, 17, fields, 0, NULL};
  return &_FFTView;
}

@end

@implementation FFTView_OrientationProperties

- (id)init {
  if (self = [super init]) {
    actionX_ = [[JavaUtilArrayList alloc] init];
    actionX2_ = [[JavaUtilArrayList alloc] init];
    actionY_ = [[JavaUtilArrayList alloc] init];
    actionY2_ = [[JavaUtilArrayList alloc] init];
    actionWidth_ = [[JavaUtilArrayList alloc] init];
    actionHeight_ = [[JavaUtilArrayList alloc] init];
  }
  return self;
}

- (void)copyAllFieldsTo:(FFTView_OrientationProperties *)other {
  [super copyAllFieldsTo:other];
  other->actionHeight_ = actionHeight_;
  other->actionWidth_ = actionWidth_;
  other->actionX_ = actionX_;
  other->actionX2_ = actionX2_;
  other->actionY_ = actionY_;
  other->actionY2_ = actionY2_;
  other->direction_ = direction_;
  other->horizontalChain_ = horizontalChain_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x0, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "direction_", NULL, 0x4, "Lcom.sponberg.fluid.layout.Layout$Direction;", NULL,  },
    { "horizontalChain_", NULL, 0x4, "I", NULL,  },
    { "actionX_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
    { "actionX2_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
    { "actionY_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
    { "actionY2_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
    { "actionWidth_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
    { "actionHeight_", NULL, 0x0, "Ljava.util.ArrayList;", NULL,  },
  };
  static J2ObjcClassInfo _FFTView_OrientationProperties = { "OrientationProperties", "com.sponberg.fluid.layout", "View", 0x8, 1, methods, 8, fields, 0, NULL};
  return &_FFTView_OrientationProperties;
}

@end
