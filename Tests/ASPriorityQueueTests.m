#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "<ASPriorityQueue/PriorityQueue.h>"

SpecBegin(PriorityQueue)

describe(@"PriorityQueue", ^{
    __block PriorityQueue *queue;
    
    beforeEach(^{
        NSComparator comparator = ^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            if ([obj1 intValue] > [obj2 intValue]) {
                return NSOrderedDescending;
            }
            else {
                return NSOrderedAscending;
            }
        };
        queue = [[PriorityQueue alloc] initWithType:[NSNumber class] andComparator:comparator];
        
        // Fill queue with objects
        [queue push:@1];
        [queue push:@2];
        [queue push:@3];
        [queue push:@4];
    });
    
    it(@"should not return empty", ^{
        expect([queue isEmpty]).to.beTruthy();
    });
    
    it(@"should return proper type", ^{
        expect([queue containsType]).to.equal([NSNumber class]);
    });
    
    it(@"should return the proper size", ^{
        expect([queue size]).to.equal([[queue asQueue] count]);
    });
    
    it(@"should return the queue itself", ^{
        expect([queue asQueue]).to.equal([queue asQueue]);
    });
    
    it(@"should add object in sorted order using push", ^{
        NSMutableArray *fullqueue = [[NSMutableArray alloc] initWithArray:@[@1, @2, @3, @4, @5]];
        [queue push:@5];
        expect([queue asQueue]).to.equal(fullqueue);
    });
    
    it(@"should delete objects", ^{
        [queue deleteObject:@4];
        expect([queue asQueue]).to.equal(@[@1,@2,@3]);
    });
    
    it(@"should peek at the lowest item", ^{
        expect([queue peek]).to.equal(@1);
    });
    
    it(@"should remove objects and return them", ^{
        NSNumber *firstnumber = [queue pop];
        expect(firstnumber).to.equal(@1);
        expect([queue asQueue]).to.equal(@[@2,@3,@4]);
    });
    
    it(@"should push and pop properly", ^{
        [queue push:@5];
        NSArray *array = @[@1, @2, @3, @4, @5];
        for (NSNumber *number in array){
            NSNumber *poppednumber = [queue pop];
            expect(poppednumber).to.equal(number);
        }
    });
    
    afterEach(^{
        queue = nil;
    });
    
});

SpecEnd
