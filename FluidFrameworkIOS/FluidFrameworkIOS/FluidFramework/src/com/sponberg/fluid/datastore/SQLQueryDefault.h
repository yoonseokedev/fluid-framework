//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/datastore/SQLQueryDefault.java
//

#ifndef _FFTSQLQueryDefault_H_
#define _FFTSQLQueryDefault_H_

@class IOSObjectArray;

#import "JreEmulation.h"
#include "com/sponberg/fluid/datastore/SQLQuery.h"

@interface FFTSQLQueryDefault : FFTSQLQuery {
}

- (id)initWithNSString:(NSString *)tableName
     withNSStringArray:(IOSObjectArray *)selectColumns;

- (NSString *)description;

@end

__attribute__((always_inline)) inline void FFTSQLQueryDefault_init() {}

typedef FFTSQLQueryDefault ComSponbergFluidDatastoreSQLQueryDefault;

#endif // _FFTSQLQueryDefault_H_
