//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/util/JsonUtil.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "com/eclipsesource/json/JsonArray.h"
#include "com/eclipsesource/json/JsonObject.h"
#include "com/eclipsesource/json/JsonValue.h"
#include "com/sponberg/fluid/util/JsonUtil.h"
#include "com/sponberg/fluid/util/MethodUtil.h"
#include "java/lang/Boolean.h"
#include "java/lang/Character.h"
#include "java/lang/Double.h"
#include "java/lang/Exception.h"
#include "java/lang/Float.h"
#include "java/lang/IllegalAccessException.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/lang/NoSuchMethodException.h"
#include "java/lang/RuntimeException.h"
#include "java/lang/StringBuffer.h"
#include "java/lang/reflect/Array.h"
#include "java/lang/reflect/Field.h"
#include "java/lang/reflect/InvocationTargetException.h"
#include "java/lang/reflect/Method.h"
#include "java/lang/reflect/Modifier.h"
#include "java/lang/reflect/Type.h"
#include "java/util/Collection.h"
#include "java/util/List.h"
#include "java/util/Map.h"
#include "java/util/Set.h"

@implementation FFTJsonUtil

BOOL FFTJsonUtil_underscoreSeparatesWords_ = YES;

+ (BOOL)isUnderscoreSeparatesWords {
  return FFTJsonUtil_underscoreSeparatesWords_;
}

+ (void)setUnderscoreSeparatesWordsWithBoolean:(BOOL)underscoreSeparatesWords {
  FFTJsonUtil_underscoreSeparatesWords_ = underscoreSeparatesWords;
}

+ (void)setValuesToWithId:(id)object
        withFFTJsonObject:(FFTJsonObject *)json {
  @try {
    [FFTJsonUtil setValuesToHelperWithId:object withFFTJsonObject:json];
  }
  @catch (JavaLangException *e) {
    @throw [[JavaLangRuntimeException alloc] initWithJavaLangThrowable:e];
  }
}

+ (void)setValuesToHelperWithId:(id)object
              withFFTJsonObject:(FFTJsonObject *)json {
  JavaLangReflectField *keyField = nil;
  IOSClass *clazz = [nil_chk(object) getClass];
  IOSObjectArray *methods = [clazz getMethods];
  {
    IOSObjectArray *a__ = methods;
    JavaLangReflectMethod * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    JavaLangReflectMethod * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      JavaLangReflectMethod *method = (*b__++);
      NSString *name = [((JavaLangReflectMethod *) nil_chk(method)) getName];
      if (![((NSString *) nil_chk(name)) hasPrefix:@"set"]) {
        continue;
      }
      if ((int) [((IOSObjectArray *) nil_chk([method getParameterTypes])) count] != 1) {
        continue;
      }
      NSString *fieldName = [NSString stringWithFormat:@"%@%@", [((NSString *) nil_chk([name substring:3 endIndex:4])) lowercaseString], [name substring:4]];
      [FFTJsonUtil invokeGetAndSetWithIOSClass:clazz withNSString:fieldName withId:object withJavaLangReflectMethod:method withFFTJsonObject:json];
    }
  }
}

+ (NSString *)iOSGetJsonNameWithId:(id)object
                      withNSString:(NSString *)name {
  SEL selector = NSSelectorFromString(name);
  if ([object respondsToSelector:selector]) {
    return [object performSelector:selector withObject:nil];
  } else {
    return nil;
  }
}

+ (void)invokeIOSNativeSetWithId:(id)object
                    withNSString:(NSString *)methodName
                          withId:(id)parameter {
  
  SEL selector = NSSelectorFromString(methodName);
  
  id ret;
  if ([methodName rangeOfString:@":"].location == NSNotFound) {
    id (*response)(id, SEL) = (id (*)(id, SEL)) objc_msgSend;
    ret = response(object, selector);
  } else {
    id (*response)(id, SEL, id) = (id (*)(id, SEL, id)) objc_msgSend;
    //ret = response(object, selector, parameter);
  }
}

+ (void)invokeGetAndSetWithIOSClass:(IOSClass *)clazz
                       withNSString:(NSString *)name
                             withId:(id)object
          withJavaLangReflectMethod:(JavaLangReflectMethod *)setter
                  withFFTJsonObject:(FFTJsonObject *)json {
  NSString *jsonName = [FFTJsonUtil getJsonNameWithNSString:name];
  IOSClass *type = IOSObjectArray_Get(nil_chk([((JavaLangReflectMethod *) nil_chk(setter)) getParameterTypes]), 0);
  id value = [FFTJsonUtil getJsonValueWithNSString:jsonName withIOSClass:type withFFTJsonObject:json withId:object];
  if (value == nil) {
    return;
  }
  (void) [setter invokeWithId:object withNSObjectArray:[IOSObjectArray arrayWithObjects:(id[]){ value } count:1 type:[IOSClass classWithClass:[NSObject class]]]];
}

+ (NSString *)objectToJsonStringWithId:(id)object {
  FFTJsonObject *json = [FFTJsonUtil toJsonObjectWithId:object];
  return [((FFTJsonObject *) nil_chk(json)) description];
}

+ (NSString *)listToJsonStringWithJavaUtilList:(id<JavaUtilList>)list {
  FFTJsonArray *array = [FFTJsonUtil listToJsonArrayWithJavaUtilList:list];
  return [((FFTJsonArray *) nil_chk(array)) description];
}

+ (FFTJsonArray *)listToJsonArrayWithJavaUtilList:(id<JavaUtilList>)list {
  FFTJsonArray *array = [[FFTJsonArray alloc] init];
  for (id __strong o in nil_chk(list)) {
    FFTJsonObject *json = [FFTJsonUtil toJsonObjectWithId:o];
    if (json == nil) {
      (void) [array addWithNSString:(NSString *) check_class_cast(nil, [NSString class])];
    }
    else {
      (void) [array addWithFFTJsonValue:[json asObject]];
    }
  }
  return array;
}

+ (id)jsonArrayToObjectArrayWithNSString:(NSString *)jsonArrayString
                            withIOSClass:(IOSClass *)type {
  FFTJsonArray *jsonArray = [FFTJsonArray readFromWithNSString:jsonArrayString];
  return [FFTJsonUtil createArrayFromJsonObjectWithFFTJsonValue:jsonArray withIOSClass:type];
}

+ (id)jsonObjectToObjectWithNSString:(NSString *)jsonString
                        withIOSClass:(IOSClass *)type {
  FFTJsonObject *object = [FFTJsonObject readFromWithNSString:jsonString];
  return [FFTJsonUtil createObjectFromJsonObjectWithFFTJsonValue:object withIOSClass:type];
}

+ (id<JavaUtilMap>)jsonObjectToMapWithNSString:(NSString *)jsonMapString
                                  withIOSClass:(IOSClass *)mapType
                                  withIOSClass:(IOSClass *)type {
  FFTJsonObject *jsonObject = [FFTJsonObject readFromWithNSString:jsonMapString];
  return [FFTJsonUtil createMapFromJsonObjectWithFFTJsonValue:jsonObject withIOSClass:mapType withIOSClass:type];
}

+ (FFTJsonArray *)arrayToJsonArrayWithNSObjectArray:(IOSObjectArray *)list {
  FFTJsonArray *array = [[FFTJsonArray alloc] init];
  {
    IOSObjectArray *a__ = list;
    id const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    id const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      id o = (*b__++);
      FFTJsonObject *json = [FFTJsonUtil toJsonObjectWithId:o];
      if (json == nil) {
        (void) [array addWithNSString:(NSString *) check_class_cast(nil, [NSString class])];
      }
      else {
        (void) [array addWithFFTJsonValue:[json asObject]];
      }
    }
  }
  return array;
}

+ (FFTJsonObject *)mapToJsonObjectWithJavaUtilMap:(id<JavaUtilMap>)map {
  FFTJsonObject *object = [[FFTJsonObject alloc] init];
  for (NSString * __strong key in nil_chk([((id<JavaUtilMap>) nil_chk(map)) keySet])) {
    id value = [map getWithId:key];
    FFTJsonObject *jsonObject = [FFTJsonUtil toJsonObjectWithId:value];
    (void) [object addWithNSString:key withFFTJsonValue:jsonObject];
  }
  return object;
}

+ (FFTJsonObject *)toJsonObjectWithId:(id)object {
  if (object == nil) {
    return nil;
  }
  FFTJsonObject *json = [[FFTJsonObject alloc] init];
  JavaLangReflectField *keyField = nil;
  IOSClass *clazz = [nil_chk(object) getClass];
  IOSObjectArray *fields = [clazz getDeclaredFields];
  {
    IOSObjectArray *a__ = fields;
    JavaLangReflectField * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    JavaLangReflectField * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      JavaLangReflectField *f = (*b__++);
      if (([((JavaLangReflectField *) nil_chk(f)) getModifiers] & JavaLangReflectModifier_STATIC) == JavaLangReflectModifier_STATIC) {
        continue;
      }
      if (([f getModifiers] & JavaLangReflectModifier_TRANSIENT) == JavaLangReflectModifier_TRANSIENT) {
        continue;
      }
      if ([[IOSClass classWithProtocol:@protocol(JavaUtilCollection)] isAssignableFrom:[f getType]]) {
        continue;
      }
      else if ([[IOSClass classWithProtocol:@protocol(JavaUtilMap)] isAssignableFrom:[f getType]]) {
        continue;
      }
      NSString *name = [f getName];
      JavaLangReflectMethod *getter = nil;
      @try {
        getter = [FFTMethodUtil getGetterMethodWithIOSClass:clazz withNSString:[NSString stringWithFormat:@"%@JsonName", name]];
      }
      @catch (JavaLangNoSuchMethodException *e) {
      }
      NSString *jsonName;
      if (getter != nil) {
        jsonName = (NSString *) check_class_cast([getter invokeWithId:object withNSObjectArray:[IOSObjectArray arrayWithLength:0 type:[IOSClass classWithClass:[NSObject class]]]], [NSString class]);
      }
      else {
        jsonName = [FFTJsonUtil getJsonNameWithNSString:name];
      }
      getter = [FFTMethodUtil getGetterMethodWithIOSClass:clazz withNSString:name];
      id value = [((JavaLangReflectMethod *) nil_chk(getter)) invokeWithId:object withNSObjectArray:[IOSObjectArray arrayWithLength:0 type:[IOSClass classWithClass:[NSObject class]]]];
      if (value == nil) {
        continue;
      }
      [FFTJsonUtil setJsonValueWithNSString:jsonName withId:value withFFTJsonObject:json];
    }
  }
  return json;
}

+ (NSString *)getJsonNameWithNSString:(NSString *)name {
  if (!FFTJsonUtil_underscoreSeparatesWords_) {
    return name;
  }
  JavaLangStringBuffer *buf = [[JavaLangStringBuffer alloc] init];
  for (int index = 0; index < ((int) [((NSString *) nil_chk(name)) length]); index++) {
    unichar c = [name charAtWithInt:index];
    if ([JavaLangCharacter isUpperCaseWithChar:c]) {
      (void) [buf appendWithNSString:@"_"];
      (void) [buf appendWithChar:[JavaLangCharacter toLowerCaseWithChar:c]];
    }
    else {
      (void) [buf appendWithChar:c];
    }
  }
  return [buf description];
}

+ (id)getJsonValueWithNSString:(NSString *)name
                  withIOSClass:(IOSClass *)type
             withFFTJsonObject:(FFTJsonObject *)json
                        withId:(id)rootObject {
  IOSObjectArray *names = [((NSString *) nil_chk(name)) split:@":"];
  return [FFTJsonUtil getJsonValueWithNSStringArray:names withIOSClass:type withFFTJsonObject:json withInt:0 withId:rootObject];
}

+ (id)getJsonValueWithNSStringArray:(IOSObjectArray *)names
                       withIOSClass:(IOSClass *)type
                  withFFTJsonObject:(FFTJsonObject *)json
                            withInt:(int)i
                             withId:(id)rootObject {
  FFTJsonValue *value = [((FFTJsonObject *) nil_chk(json)) getWithNSString:IOSObjectArray_Get(nil_chk(names), i)];
  if (value == nil || [value isNull]) {
    return nil;
  }
  if (i < (int) [names count] - 1) {
    return [FFTJsonUtil getJsonValueWithNSStringArray:names withIOSClass:type withFFTJsonObject:[((FFTJsonValue *) nil_chk(value)) asObject] withInt:i + 1 withId:rootObject];
  }
  if ([((IOSClass *) nil_chk(type)) isEqual:[IOSClass classWithClass:[NSString class]]]) {
    return [((FFTJsonValue *) nil_chk(value)) asString];
  }
  else if (type == JavaLangBoolean_get_TYPE_() || [type isEqual:[IOSClass classWithClass:[JavaLangBoolean class]]]) {
    if ([((FFTJsonValue *) nil_chk(value)) isBoolean]) {
      return [JavaLangBoolean valueOfWithBoolean:[value asBoolean]];
    }
    else if ([value isNumber]) {
      return [JavaLangBoolean valueOfWithBoolean:[value asInt] != 0];
    }
    else {
      return [[JavaLangBoolean alloc] initWithNSString:[value asString]];
    }
  }
  else if (type == JavaLangInteger_get_TYPE_() || [type isEqual:[IOSClass classWithClass:[JavaLangInteger class]]]) {
    if ([((FFTJsonValue *) nil_chk(value)) isNumber]) {
      return [JavaLangInteger valueOfWithInt:[value asInt]];
    }
    else {
      return [[JavaLangInteger alloc] initWithNSString:[value asString]];
    }
  }
  else if (type == JavaLangLong_get_TYPE_() || [type isEqual:[IOSClass classWithClass:[JavaLangLong class]]]) {
    if ([((FFTJsonValue *) nil_chk(value)) isNumber]) {
      return [JavaLangLong valueOfWithLong:[value asLong]];
    }
    else {
      return [[JavaLangLong alloc] initWithNSString:[value asString]];
    }
  }
  else if (type == JavaLangDouble_get_TYPE_() || [type isEqual:[IOSClass classWithClass:[JavaLangDouble class]]]) {
    if ([((FFTJsonValue *) nil_chk(value)) isNumber]) {
      return [JavaLangDouble valueOfWithDouble:[value asDouble]];
    }
    else {
      return [[JavaLangDouble alloc] initWithNSString:[value asString]];
    }
  }
  else if (type == JavaLangFloat_get_TYPE_() || [type isEqual:[IOSClass classWithClass:[JavaLangFloat class]]]) {
    if ([((FFTJsonValue *) nil_chk(value)) isNumber]) {
      return [JavaLangFloat valueOfWithFloat:[value asFloat]];
    }
    else {
      return [[JavaLangFloat alloc] initWithNSString:[value asString]];
    }
  }
  else if ([type isArray]) {
    return [FFTJsonUtil createArrayFromJsonObjectWithFFTJsonValue:value withIOSClass:[type getComponentType]];
  }
  else if ([[IOSClass classWithProtocol:@protocol(JavaUtilList)] isAssignableFrom:type]) {
    if (!([rootObject conformsToProtocol: @protocol(FFTJsonUtil_TypeMapper)])) {
      @throw [[JavaLangRuntimeException alloc] initWithNSString:@"A class that uses this utility to set Map values must implement TypeMapper"];
    }
    return [FFTJsonUtil createListFromJsonObjectWithFFTJsonValue:value withIOSClass:type withIOSClass:[((id<FFTJsonUtil_TypeMapper>) nil_chk(((id<FFTJsonUtil_TypeMapper>) check_protocol_cast(rootObject, @protocol(FFTJsonUtil_TypeMapper))))) getTypeForFieldWithNSString:IOSObjectArray_Get(names, i)]];
  }
  else if ([[IOSClass classWithProtocol:@protocol(JavaUtilMap)] isAssignableFrom:type]) {
    if (!([rootObject conformsToProtocol: @protocol(FFTJsonUtil_TypeMapper)])) {
      @throw [[JavaLangRuntimeException alloc] initWithNSString:@"A class that uses this utility to set Map values must implement TypeMapper"];
    }
    return [FFTJsonUtil createMapFromJsonObjectWithFFTJsonValue:value withIOSClass:type withIOSClass:[((id<FFTJsonUtil_TypeMapper>) nil_chk(((id<FFTJsonUtil_TypeMapper>) check_protocol_cast(rootObject, @protocol(FFTJsonUtil_TypeMapper))))) getTypeForFieldWithNSString:IOSObjectArray_Get(names, i)]];
  }
  else {
    return [FFTJsonUtil createObjectFromJsonObjectWithFFTJsonValue:value withIOSClass:type];
  }
}

+ (id)createArrayFromJsonObjectWithFFTJsonValue:(FFTJsonValue *)object
                                   withIOSClass:(IOSClass *)type {
  FFTJsonArray *jsonArray = [((FFTJsonValue *) nil_chk(object)) asArray];
  id array = [JavaLangReflectArray newInstanceWithIOSClass:type withInt:[((FFTJsonArray *) nil_chk(jsonArray)) size]];
  for (int index = 0; index < [jsonArray size]; index++) {
    id val = [((IOSClass *) nil_chk(type)) newInstance];
    [JavaLangReflectArray setWithId:array withInt:index withId:val];
    [FFTJsonUtil setValuesToWithId:val withFFTJsonObject:[((FFTJsonValue *) nil_chk([jsonArray getWithInt:index])) asObject]];
  }
  return array;
}

+ (id<JavaUtilMap>)createMapFromJsonObjectWithFFTJsonValue:(FFTJsonValue *)object
                                              withIOSClass:(IOSClass *)mapType
                                              withIOSClass:(IOSClass *)objectType {
  id<JavaUtilMap> map = (id<JavaUtilMap>) check_protocol_cast([((IOSClass *) nil_chk(mapType)) newInstance], @protocol(JavaUtilMap));
  if ([((FFTJsonValue *) nil_chk(object)) isArray] && [((FFTJsonArray *) nil_chk([object asArray])) size] == 0) {
    return map;
  }
  for (FFTJsonObject_Member * __strong member in nil_chk([object asObject])) {
    id val = [((IOSClass *) nil_chk(objectType)) newInstance];
    (void) [((id<JavaUtilMap>) nil_chk(map)) putWithId:[((FFTJsonObject_Member *) nil_chk(member)) getName] withId:val];
    [FFTJsonUtil setValuesToWithId:val withFFTJsonObject:[((FFTJsonValue *) nil_chk([member getValue])) asObject]];
  }
  return map;
}

+ (id)createListFromJsonObjectWithFFTJsonValue:(FFTJsonValue *)object
                                  withIOSClass:(IOSClass *)listType
                                  withIOSClass:(IOSClass *)objectType {
  id<JavaUtilList> list = (id<JavaUtilList>) check_protocol_cast([((IOSClass *) nil_chk(listType)) newInstance], @protocol(JavaUtilList));
  FFTJsonArray *jsonArray = [((FFTJsonValue *) nil_chk(object)) asArray];
  for (int index = 0; index < [((FFTJsonArray *) nil_chk(jsonArray)) size]; index++) {
    id val = [((IOSClass *) nil_chk(objectType)) newInstance];
    [((id<JavaUtilList>) nil_chk(list)) addWithId:val];
    [FFTJsonUtil setValuesToWithId:val withFFTJsonObject:[((FFTJsonValue *) nil_chk([jsonArray getWithInt:index])) asObject]];
  }
  return list;
}

+ (id)createObjectFromJsonObjectWithFFTJsonValue:(FFTJsonValue *)object
                                    withIOSClass:(IOSClass *)type {
  id newObject = [((IOSClass *) nil_chk(type)) newInstance];
  if ([((FFTJsonValue *) nil_chk(object)) isObject]) {
    [FFTJsonUtil setValuesToWithId:newObject withFFTJsonObject:[object asObject]];
  }
  return newObject;
}

+ (void)setJsonValueWithNSString:(NSString *)jsonName
                          withId:(id)value
               withFFTJsonObject:(FFTJsonObject *)json {
  id<JavaLangReflectType> type = [nil_chk(value) getClass];
  if (type == [IOSClass classWithClass:[JavaLangBoolean class]]) {
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withBoolean:[(JavaLangBoolean *) check_class_cast(value, [JavaLangBoolean class]) booleanValue]];
  }
  else if (type == [IOSClass classWithClass:[JavaLangInteger class]]) {
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withInt:[(JavaLangInteger *) check_class_cast(value, [JavaLangInteger class]) intValue]];
  }
  else if (type == [IOSClass classWithClass:[JavaLangLong class]]) {
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withLong:[(JavaLangLong *) check_class_cast(value, [JavaLangLong class]) longLongValue]];
  }
  else if (type == [IOSClass classWithClass:[JavaLangDouble class]]) {
    JavaLangDouble *v = (JavaLangDouble *) check_class_cast(value, [JavaLangDouble class]);
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withFloat:[v floatValue]];
  }
  else if (type == [IOSClass classWithClass:[JavaLangFloat class]]) {
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withFloat:[(JavaLangFloat *) check_class_cast(value, [JavaLangFloat class]) floatValue]];
  }
  else {
    (void) [((FFTJsonObject *) nil_chk(json)) addWithNSString:jsonName withNSString:[value description]];
  }
}

+ (JavaLangReflectMethod *)getSetterMethodWithIOSClass:(IOSClass *)object
                                          withNSString:(NSString *)name
                                          withIOSClass:(IOSClass *)type {
  if ([((NSString *) nil_chk(name)) hasPrefix:@"is"]) {
    name = [name substring:2];
  }
  name = [NSString stringWithFormat:@"%@%@", [((NSString *) nil_chk([((NSString *) nil_chk(name)) substring:0 endIndex:1])) uppercaseString], [name substring:1]];
  NSString *mName = [NSString stringWithFormat:@"set%@", name];
  return [FFTMethodUtil getMethodWithIOSClass:object withNSString:mName withIOSClassArray:[IOSObjectArray arrayWithObjects:(id[]){ type } count:1 type:[IOSClass classWithClass:[IOSClass class]]]];
}

+ (FFTJsonObject *)getJsonObjectWithFFTJsonObject:(FFTJsonObject *)object
                                     withNSString:(NSString *)key {
  FFTJsonValue *value = [((FFTJsonObject *) nil_chk(object)) getWithNSString:key];
  if (![((FFTJsonValue *) nil_chk(value)) isObject]) {
    return [[FFTJsonObject alloc] init];
  }
  else {
    return [value asObject];
  }
}

+ (NSString *)getStringWithFFTJsonObject:(FFTJsonObject *)object
                            withNSString:(NSString *)key {
  return [FFTJsonUtil getStringWithFFTJsonObject:object withNSString:key withNSString:nil];
}

+ (NSString *)getStringWithFFTJsonObject:(FFTJsonObject *)object
                            withNSString:(NSString *)key
                            withNSString:(NSString *)defaultValue {
  FFTJsonValue *value = [((FFTJsonObject *) nil_chk(object)) getWithNSString:key];
  if ([((FFTJsonValue *) nil_chk(value)) isNull] || ![value isString]) {
    return defaultValue;
  }
  else {
    return [value asString];
  }
}

- (id)init {
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "isUnderscoreSeparatesWords", NULL, "Z", 0x9, NULL },
    { "setUnderscoreSeparatesWordsWithBoolean:", "setUnderscoreSeparatesWords", "V", 0x9, NULL },
    { "setValuesToWithId:withFFTJsonObject:", "setValuesTo", "V", 0x9, NULL },
    { "setValuesToHelperWithId:withFFTJsonObject:", "setValuesToHelper", "V", 0x8, "Ljava.lang.Exception;" },
    { "iOSGetJsonNameWithId:withNSString:", "iOSGetJsonName", "Ljava.lang.String;", 0x10a, NULL },
    { "invokeIOSNativeSetWithId:withNSString:withId:", "invokeIOSNativeSet", "V", 0x10a, NULL },
    { "invokeGetAndSetWithIOSClass:withNSString:withId:withJavaLangReflectMethod:withFFTJsonObject:", "invokeGetAndSet", "V", 0x9, "Ljava.lang.Exception;" },
    { "objectToJsonStringWithId:", "objectToJsonString", "Ljava.lang.String;", 0x9, "Ljava.lang.Exception;" },
    { "listToJsonStringWithJavaUtilList:", "listToJsonString", "Ljava.lang.String;", 0x9, "Ljava.lang.Exception;" },
    { "listToJsonArrayWithJavaUtilList:", "listToJsonArray", "Lcom.eclipsesource.json.JsonArray;", 0x9, "Ljava.lang.Exception;Ljava.lang.IllegalAccessException;Ljava.lang.reflect.InvocationTargetException;" },
    { "jsonArrayToObjectArrayWithNSString:withIOSClass:", "jsonArrayToObjectArray", "Ljava.lang.Object;", 0x9, "Ljava.lang.Exception;" },
    { "jsonObjectToObjectWithNSString:withIOSClass:", "jsonObjectToObject", "Ljava.lang.Object;", 0x9, "Ljava.lang.Exception;" },
    { "jsonObjectToMapWithNSString:withIOSClass:withIOSClass:", "jsonObjectToMap", "Ljava.util.Map;", 0x9, "Ljava.lang.Exception;" },
    { "arrayToJsonArrayWithNSObjectArray:", "arrayToJsonArray", "Lcom.eclipsesource.json.JsonArray;", 0x9, "Ljava.lang.Exception;Ljava.lang.IllegalAccessException;Ljava.lang.reflect.InvocationTargetException;" },
    { "mapToJsonObjectWithJavaUtilMap:", "mapToJsonObject", "Lcom.eclipsesource.json.JsonObject;", 0x9, "Ljava.lang.Exception;" },
    { "toJsonObjectWithId:", "toJsonObject", "Lcom.eclipsesource.json.JsonObject;", 0x9, "Ljava.lang.Exception;Ljava.lang.IllegalAccessException;Ljava.lang.reflect.InvocationTargetException;" },
    { "getJsonNameWithNSString:", "getJsonName", "Ljava.lang.String;", 0x9, NULL },
    { "getJsonValueWithNSString:withIOSClass:withFFTJsonObject:withId:", "getJsonValue", "Ljava.lang.Object;", 0x9, "Ljava.lang.Exception;" },
    { "getJsonValueWithNSStringArray:withIOSClass:withFFTJsonObject:withInt:withId:", "getJsonValue", "Ljava.lang.Object;", 0x9, "Ljava.lang.Exception;" },
    { "createArrayFromJsonObjectWithFFTJsonValue:withIOSClass:", "createArrayFromJsonObject", "Ljava.lang.Object;", 0xc, "Ljava.lang.Exception;" },
    { "createMapFromJsonObjectWithFFTJsonValue:withIOSClass:withIOSClass:", "createMapFromJsonObject", "Ljava.util.Map;", 0xc, "Ljava.lang.Exception;" },
    { "createListFromJsonObjectWithFFTJsonValue:withIOSClass:withIOSClass:", "createListFromJsonObject", "Ljava.lang.Object;", 0xc, "Ljava.lang.Exception;" },
    { "createObjectFromJsonObjectWithFFTJsonValue:withIOSClass:", "createObjectFromJsonObject", "Ljava.lang.Object;", 0xc, "Ljava.lang.Exception;" },
    { "setJsonValueWithNSString:withId:withFFTJsonObject:", "setJsonValue", "V", 0x9, NULL },
    { "getSetterMethodWithIOSClass:withNSString:withIOSClass:", "getSetterMethod", "Ljava.lang.reflect.Method;", 0x9, "Ljava.lang.Exception;" },
    { "getJsonObjectWithFFTJsonObject:withNSString:", "getJsonObject", "Lcom.eclipsesource.json.JsonObject;", 0x9, NULL },
    { "getStringWithFFTJsonObject:withNSString:", "getString", "Ljava.lang.String;", 0x9, NULL },
    { "getStringWithFFTJsonObject:withNSString:withNSString:", "getString", "Ljava.lang.String;", 0x9, NULL },
    { "init", NULL, NULL, 0x1, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "underscoreSeparatesWords_", NULL, 0x8, "Z", &FFTJsonUtil_underscoreSeparatesWords_,  },
  };
  static J2ObjcClassInfo _FFTJsonUtil = { "JsonUtil", "com.sponberg.fluid.util", NULL, 0x1, 29, methods, 1, fields, 0, NULL};
  return &_FFTJsonUtil;
}

@end

@interface FFTJsonUtil_TypeMapper : NSObject
@end

@implementation FFTJsonUtil_TypeMapper

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "getTypeForFieldWithNSString:", "getTypeForField", "Ljava.lang.Class;", 0x401, NULL },
  };
  static J2ObjcClassInfo _FFTJsonUtil_TypeMapper = { "TypeMapper", "com.sponberg.fluid.util", "JsonUtil", 0x209, 1, methods, 0, NULL, 0, NULL};
  return &_FFTJsonUtil_TypeMapper;
}

@end
