//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/layout/LengthRelativeToParent.java
//

#include "com/sponberg/fluid/layout/LengthRelativeToParent.h"
#include "java/util/ArrayList.h"

@implementation FFTLengthRelativeToParent

- (id)initWithDouble:(double)ratio {
  if (self = [super init]) {
    self->ratio_ = ratio;
  }
  return self;
}

- (id)initWithDouble:(double)ratio
withJavaUtilArrayList:(JavaUtilArrayList *)subtractors {
  if (self = [super init]) {
    [super setSubtractorsWithJavaUtilArrayList:subtractors];
    self->ratio_ = ratio;
  }
  return self;
}

- (BOOL)relativeToParent {
  return YES;
}

- (double)getRatio {
  return ratio_;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"LengthRelativeToParent(ratio=%f)", [self getRatio]];
}

- (void)copyAllFieldsTo:(FFTLengthRelativeToParent *)other {
  [super copyAllFieldsTo:other];
  other->ratio_ = ratio_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithDouble:", "LengthRelativeToParent", NULL, 0x1, NULL },
    { "initWithDouble:withJavaUtilArrayList:", "LengthRelativeToParent", NULL, 0x1, NULL },
    { "relativeToParent", NULL, "Z", 0x1, NULL },
    { "getRatio", NULL, "D", 0x1, NULL },
    { "description", "toString", "Ljava.lang.String;", 0x1, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "ratio_", NULL, 0x10, "D", NULL,  },
  };
  static J2ObjcClassInfo _FFTLengthRelativeToParent = { "LengthRelativeToParent", "com.sponberg.fluid.layout", NULL, 0x1, 5, methods, 1, fields, 0, NULL};
  return &_FFTLengthRelativeToParent;
}

@end
