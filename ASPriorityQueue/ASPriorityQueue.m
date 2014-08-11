#import "ASPriorityQueue.h"

@interface ASPriorityQueue()
    @property (nonatomic, strong) Class type;
    @property (nonatomic, strong) NSMutableArray *queue;
    @property (nonatomic, strong) NSComparator comparator;
@end

@implementation ASPriorityQueue

#pragma mark - Init
- (id) initWithType:(Class)type andComparator:(NSComparator)compare{
    self.type = type;
    self.comparator = compare;
    self.queue = [[NSMutableArray alloc] init];
    return self;
}

- (void)changeComparator:(NSComparator)compare{
    self.comparator = compare;
    [self.queue sortUsingComparator:self.comparator];
}

#pragma mark - Information
- (BOOL) isEmpty {
    return [self.queue count];
}

- (Class) containsType {
    return self.type;
}

- (BOOL)contains:(NSObject *)object{
    return [self.queue containsObject:object];
}

- (NSUInteger)size{
    return [self.queue count];
}

- (NSMutableArray *) asQueue {
    return self.queue;
}

#pragma mark - Changing
- (void) push:(NSObject *)object{
    [self.queue addObject:object];
    [self.queue sortUsingComparator:self.comparator];
}

- (void) deleteObject:(NSObject *)object{
    [self.queue removeObject:object];
    [self.queue sortUsingComparator:self.comparator];
}

#pragma mark - Queue Functions
- (id)peek{
    return [self.queue firstObject];
}

- (id)pop{
    id first = [self.queue firstObject];
    [self.queue removeObject:first];
    [self.queue sortUsingComparator:self.comparator];
    return first;
}

@end
