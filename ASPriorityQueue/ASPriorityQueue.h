#import <Foundation/Foundation.h>

@interface ASPriorityQueue : NSObject

#pragma mark - Init
- (id)initWithType:(Class)type andComparator:(NSComparator)compare;
- (void)changeComparator:(NSComparator)compare;

#pragma mark - Information
- (BOOL)isEmpty;
- (Class)containsType;
- (BOOL)contains:(NSObject *)object;
- (NSUInteger)size;
- (NSMutableArray *) asQueue;

#pragma mark - Changing
- (void)push:(NSObject *)object;
- (void)deleteObject:(NSObject *)object;

#pragma mark - Queue Functions
- (id)peek;
- (id)pop;

@end
