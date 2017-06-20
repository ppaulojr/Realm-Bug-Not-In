//
//  RealmNotInBugTests.m
//  RealmNotInBugTests
//
//  Created by Pedro Paulo Oliveira Junior on 6/20/17.
//  Copyright © 2017 ppaulojr. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "FailObject.h"
@interface RealmNotInBugTests : XCTestCase

@end

@implementation RealmNotInBugTests

- (void)setUp {
    [super setUp];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    } error:nil];
    [realm transactionWithBlock:^{
        FailObject * obj1 = [[FailObject alloc] init];
        obj1.name = @"FACA";
        [realm addObject:obj1];
    } error:nil];
    [realm transactionWithBlock:^{
        FailObject * obj1 = [[FailObject alloc] init];
        obj1.name = @"FACB";
        [realm addObject:obj1];
    } error:nil];
    [realm transactionWithBlock:^{
        FailObject * obj1 = [[FailObject alloc] init];
        obj1.name = @"FACC";
        [realm addObject:obj1];
    } error:nil];
    [realm transactionWithBlock:^{
        FailObject * obj1 = [[FailObject alloc] init];
        obj1.name = @"FACA-C";
        [realm addObject:obj1];
    } error:nil];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    NSArray * not_in = @[@"FACC",@"FACA-C"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"NOT %K IN %@",@"name",not_in];
    RLMResults * results = [FailObject objectsWithPredicate:predicate];
    XCTAssert(results.count == 2);
}


@end
