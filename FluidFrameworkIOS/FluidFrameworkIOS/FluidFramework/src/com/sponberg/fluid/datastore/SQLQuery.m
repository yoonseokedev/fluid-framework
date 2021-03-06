//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: src-delomboked/com/sponberg/fluid/datastore/SQLQuery.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "com/sponberg/fluid/FluidApp.h"
#include "com/sponberg/fluid/GlobalState.h"
#include "com/sponberg/fluid/datastore/DatastoreException.h"
#include "com/sponberg/fluid/datastore/DatastoreService.h"
#include "com/sponberg/fluid/datastore/SQLParameterizedStatement.h"
#include "com/sponberg/fluid/datastore/SQLQuery.h"
#include "com/sponberg/fluid/datastore/SQLQueryResult.h"
#include "com/sponberg/fluid/datastore/SQLResultList.h"
#include "com/sponberg/fluid/datastore/SQLUtil.h"
#include "com/sponberg/fluid/datastore/SQLWhereClause.h"
#include "java/lang/Boolean.h"
#include "java/lang/Double.h"
#include "java/lang/IllegalAccessException.h"
#include "java/lang/InstantiationException.h"
#include "java/lang/Integer.h"
#include "java/lang/RuntimeException.h"
#include "java/lang/StringBuilder.h"
#include "java/util/ArrayList.h"
#include "java/util/Arrays.h"

@implementation FFTSQLQuery

- (id)initWithIOSClass:(IOSClass *)queryResultClass
     withNSStringArray:(IOSObjectArray *)selectColumns {
  if (self = [super init]) {
    whereClause_ = nil;
    selectStatement_ = nil;
    offset_ = 0;
    allowRefresh_ = YES;
    limit_ = nil;
    self->tableName_ = [FFTSQLUtil getTableNameWithIOSClass:queryResultClass];
    self->selectColumns_ = selectColumns;
    self->queryResultClass_ = (IOSClass *) check_class_cast(queryResultClass, [IOSClass class]);
    self->results_ = [[FFTSQLResultList alloc] initWithFFTSQLExecutableQuery:self];
  }
  return self;
}

- (id)initWithNSString:(NSString *)tableName
          withIOSClass:(IOSClass *)queryResultClass
     withNSStringArray:(IOSObjectArray *)selectColumns {
  if (self = [super init]) {
    whereClause_ = nil;
    selectStatement_ = nil;
    offset_ = 0;
    allowRefresh_ = YES;
    limit_ = nil;
    self->tableName_ = tableName;
    self->selectColumns_ = selectColumns;
    self->queryResultClass_ = queryResultClass;
    self->results_ = [[FFTSQLResultList alloc] initWithFFTSQLExecutableQuery:self];
  }
  return self;
}

- (void)setWhereClauseWithFFTSQLWhereClause:(FFTSQLWhereClause *)whereClause {
  self->whereClause_ = whereClause;
}

- (void)setWhereWithNSString:(NSString *)where {
  whereClause_ = [[FFTSQLWhereClause alloc] initWithNSString:where];
}

- (FFTSQLWhereClause *)getWhere {
  return whereClause_;
}

- (void)setSelectStatementWithNSString:(NSString *)selectStatement {
  if (selectColumns_ != nil && (int) [selectColumns_ count] > 0) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"May not call setSelectStatement if selectColumns was used during construction"];
  }
  self->selectStatement_ = selectStatement;
}

- (FFTSQLParameterizedStatement *)getParameterizedStatement {
  if (selectColumns_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"At least one column must be selected."];
  }
  JavaUtilArrayList *whereParams = nil;
  JavaLangStringBuilder *builder = [[JavaLangStringBuilder alloc] init];
  (void) [builder appendWithNSString:@"select "];
  if (selectStatement_ != nil) {
    (void) [builder appendWithNSString:selectStatement_];
  }
  else {
    BOOL first = YES;
    {
      IOSObjectArray *a__ = selectColumns_;
      NSString * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
      NSString * const *e__ = b__ + a__->size_;
      while (b__ < e__) {
        NSString *column = (*b__++);
        if (!first) {
          (void) [builder appendWithNSString:@","];
        }
        first = NO;
        (void) [builder appendWithNSString:column];
      }
    }
  }
  (void) [builder appendWithNSString:@" from "];
  (void) [builder appendWithNSString:tableName_];
  if (whereClause_ != nil) {
    (void) [builder appendWithNSString:@" where "];
    (void) [builder appendWithNSString:[whereClause_ getWhere]];
    whereParams = [whereClause_ getParameters];
  }
  if (orderBy_ != nil) {
    (void) [builder appendWithNSString:@" "];
    (void) [builder appendWithNSString:orderBy_];
  }
  if (limit_ != nil) {
    (void) [builder appendWithNSString:@" limit "];
    (void) [builder appendWithId:limit_];
    (void) [builder appendWithNSString:@" offset "];
    (void) [builder appendWithInt:offset_];
  }
  return [[FFTSQLParameterizedStatement alloc] initWithNSString:[builder description] withJavaUtilArrayList:nil withJavaUtilArrayList:whereParams];
}

- (void)addResult {
  result_ = [((IOSClass *) nil_chk([self getQueryResultClass])) newInstance];
  [((FFTSQLResultList *) nil_chk(results_)) addWithId:result_];
}

- (void)setNullWithInt:(int)columnIndex
          withNSString:(NSString *)columnName {
  [((id<FFTSQLQueryResult>) nil_chk(result_)) _setNullWithNSString:columnName];
}

- (void)setIntegerWithInt:(int)columnIndex
             withNSString:(NSString *)columnName
      withJavaLangInteger:(JavaLangInteger *)value {
  [((id<FFTSQLQueryResult>) nil_chk(result_)) _setIntegerWithNSString:columnName withJavaLangInteger:value];
}

- (void)setDoubleWithInt:(int)columnIndex
            withNSString:(NSString *)columnName
      withJavaLangDouble:(JavaLangDouble *)value {
  [((id<FFTSQLQueryResult>) nil_chk(result_)) _setDoubleWithNSString:columnName withJavaLangDouble:value];
}

- (void)setStringWithInt:(int)columnIndex
            withNSString:(NSString *)columnName
            withNSString:(NSString *)value {
  [((id<FFTSQLQueryResult>) nil_chk(result_)) _setStringWithNSString:columnName withNSString:value];
}

- (void)setBinaryWithInt:(int)columnIndex
            withNSString:(NSString *)columnName
           withByteArray:(IOSByteArray *)value {
  [((id<FFTSQLQueryResult>) nil_chk(result_)) _setBlobWithNSString:columnName withByteArray:value];
}

- (void)stepQuery {
  (void) [((id<FFTDatastoreService>) nil_chk([((FFTFluidApp *) nil_chk(FFTGlobalState_get_fluidApp__())) getDatastoreService])) queryWithFFTSQLQuery:self];
}

- (NSString *)getTableName {
  return self->tableName_;
}

- (IOSObjectArray *)getSelectColumns {
  return self->selectColumns_;
}

- (FFTSQLWhereClause *)getWhereClause {
  return self->whereClause_;
}

- (int)getOffset {
  return self->offset_;
}

- (BOOL)isAllowRefresh {
  return self->allowRefresh_;
}

- (JavaLangInteger *)getLimit {
  return self->limit_;
}

- (IOSClass *)getQueryResultClass {
  return self->queryResultClass_;
}

- (FFTSQLResultList *)getResults {
  return self->results_;
}

- (NSString *)getOrderBy {
  return self->orderBy_;
}

- (id)getResult {
  return self->result_;
}

- (void)setTableNameWithNSString:(NSString *)tableName {
  self->tableName_ = tableName;
}

- (void)setOffsetWithInt:(int)offset {
  self->offset_ = offset;
}

- (void)setAllowRefreshWithBoolean:(BOOL)allowRefresh {
  self->allowRefresh_ = allowRefresh;
}

- (void)setLimitWithJavaLangInteger:(JavaLangInteger *)limit {
  self->limit_ = limit;
}

- (void)setQueryResultClassWithIOSClass:(IOSClass *)queryResultClass {
  self->queryResultClass_ = queryResultClass;
}

- (void)setResultsWithFFTSQLResultList:(FFTSQLResultList *)results {
  self->results_ = results;
}

- (void)setOrderByWithNSString:(NSString *)orderBy {
  self->orderBy_ = orderBy;
}

- (void)setResultWithId:(id<FFTSQLQueryResult>)result {
  self->result_ = result;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"SQLQuery(tableName=%@, selectColumns=%@, whereClause=%@, selectStatement=%@, offset=%d, allowRefresh=%@, limit=%@, queryResultClass=%@, results=%@, orderBy=%@, result=%@)", [self getTableName], [JavaUtilArrays deepToStringWithNSObjectArray:[self getSelectColumns]], [self getWhereClause], self->selectStatement_, [self getOffset], [JavaLangBoolean toStringWithBoolean:[self isAllowRefresh]], [self getLimit], [self getQueryResultClass], [self getResults], [self getOrderBy], [self getResult]];
}

- (void)copyAllFieldsTo:(FFTSQLQuery *)other {
  [super copyAllFieldsTo:other];
  other->allowRefresh_ = allowRefresh_;
  other->limit_ = limit_;
  other->offset_ = offset_;
  other->orderBy_ = orderBy_;
  other->queryResultClass_ = queryResultClass_;
  other->result_ = result_;
  other->results_ = results_;
  other->selectColumns_ = selectColumns_;
  other->selectStatement_ = selectStatement_;
  other->tableName_ = tableName_;
  other->whereClause_ = whereClause_;
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "initWithIOSClass:withNSStringArray:", "SQLQuery", NULL, 0x81, NULL },
    { "initWithNSString:withIOSClass:withNSStringArray:", "SQLQuery", NULL, 0x84, NULL },
    { "setWhereClauseWithFFTSQLWhereClause:", "setWhereClause", "V", 0x4, NULL },
    { "setWhereWithNSString:", "setWhere", "V", 0x1, NULL },
    { "getWhere", NULL, "Lcom.sponberg.fluid.datastore.SQLWhereClause;", 0x1, NULL },
    { "setSelectStatementWithNSString:", "setSelectStatement", "V", 0x1, NULL },
    { "getParameterizedStatement", NULL, "Lcom.sponberg.fluid.datastore.SQLParameterizedStatement;", 0x1, NULL },
    { "addResult", NULL, "V", 0x1, "Ljava.lang.InstantiationException;Ljava.lang.IllegalAccessException;" },
    { "setNullWithInt:withNSString:", "setNull", "V", 0x1, NULL },
    { "setIntegerWithInt:withNSString:withJavaLangInteger:", "setInteger", "V", 0x1, NULL },
    { "setDoubleWithInt:withNSString:withJavaLangDouble:", "setDouble", "V", 0x1, NULL },
    { "setStringWithInt:withNSString:withNSString:", "setString", "V", 0x1, NULL },
    { "setBinaryWithInt:withNSString:withByteArray:", "setBinary", "V", 0x1, NULL },
    { "stepQuery", NULL, "V", 0x1, "Lcom.sponberg.fluid.datastore.DatastoreException;" },
    { "getTableName", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getSelectColumns", NULL, "[Ljava.lang.String;", 0x1, NULL },
    { "getWhereClause", NULL, "Lcom.sponberg.fluid.datastore.SQLWhereClause;", 0x1, NULL },
    { "getOffset", NULL, "I", 0x1, NULL },
    { "isAllowRefresh", NULL, "Z", 0x1, NULL },
    { "getLimit", NULL, "Ljava.lang.Integer;", 0x1, NULL },
    { "getQueryResultClass", NULL, "Ljava.lang.Class;", 0x1, NULL },
    { "getResults", NULL, "Lcom.sponberg.fluid.datastore.SQLResultList;", 0x1, NULL },
    { "getOrderBy", NULL, "Ljava.lang.String;", 0x1, NULL },
    { "getResult", NULL, "TT;", 0x1, NULL },
    { "setTableNameWithNSString:", "setTableName", "V", 0x1, NULL },
    { "setOffsetWithInt:", "setOffset", "V", 0x1, NULL },
    { "setAllowRefreshWithBoolean:", "setAllowRefresh", "V", 0x1, NULL },
    { "setLimitWithJavaLangInteger:", "setLimit", "V", 0x1, NULL },
    { "setQueryResultClassWithIOSClass:", "setQueryResultClass", "V", 0x1, NULL },
    { "setResultsWithFFTSQLResultList:", "setResults", "V", 0x1, NULL },
    { "setOrderByWithNSString:", "setOrderBy", "V", 0x1, NULL },
    { "setResultWithId:", "setResult", "V", 0x1, NULL },
    { "description", "toString", "Ljava.lang.String;", 0x1, NULL },
  };
  static J2ObjcFieldInfo fields[] = {
    { "tableName_", NULL, 0x0, "Ljava.lang.String;", NULL,  },
    { "selectColumns_", NULL, 0x10, "[Ljava.lang.String;", NULL,  },
    { "whereClause_", NULL, 0x0, "Lcom.sponberg.fluid.datastore.SQLWhereClause;", NULL,  },
    { "selectStatement_", NULL, 0x0, "Ljava.lang.String;", NULL,  },
    { "offset_", NULL, 0x0, "I", NULL,  },
    { "allowRefresh_", NULL, 0x0, "Z", NULL,  },
    { "limit_", NULL, 0x0, "Ljava.lang.Integer;", NULL,  },
    { "queryResultClass_", NULL, 0x0, "Ljava.lang.Class;", NULL,  },
    { "results_", NULL, 0x0, "Lcom.sponberg.fluid.datastore.SQLResultList;", NULL,  },
    { "orderBy_", NULL, 0x0, "Ljava.lang.String;", NULL,  },
    { "result_", NULL, 0x0, "TT;", NULL,  },
  };
  static J2ObjcClassInfo _FFTSQLQuery = { "SQLQuery", "com.sponberg.fluid.datastore", NULL, 0x1, 33, methods, 11, fields, 0, NULL};
  return &_FFTSQLQuery;
}

@end
