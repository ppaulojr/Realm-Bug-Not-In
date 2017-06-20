//
//  FailObject.h
//  RealmNotInBug
//
//  Created by Pedro Paulo Oliveira Junior on 6/20/17.
//  Copyright © 2017 ppaulojr. All rights reserved.
//

#import <Realm/Realm.h>

@interface FailObject : RLMObject
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * description;
@end
