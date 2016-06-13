//
//  FISPerson.m
//  ObjectOrientedPeople
//
//  Created by Matt Amerige on 6/13/16.
//  Copyright © 2016 al-tyus.com. All rights reserved.
//

#import "FISPerson.h"

@interface FISPerson ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSUInteger ageInYears;
@property (nonatomic, readwrite) NSUInteger heightInInches;
@property (strong, nonatomic, readwrite) NSMutableArray *skills;

@end

@implementation FISPerson

- (instancetype)init
{
	return [self initWithName:@"Matt" ageInYears:28 heightInInches:68];
}

- (instancetype)initWithName:(NSString *)name ageInYears:(NSUInteger)age
{
	return [self initWithName:name ageInYears:age heightInInches:68];
}

- (instancetype)initWithName:(NSString *)name ageInYears:(NSUInteger)age heightInInches:(NSUInteger)height
{
	self = [super init];
	if (self) {
		_name = name;
		_ageInYears = age;
		_heightInInches = height;
		_skills = [[NSMutableArray alloc] init];
	}
	return self;
}

- (NSString *)celebrateBirthday
{
	self.ageInYears++;
	NSString *ordinal = [self ordinalForInteger:self.ageInYears].uppercaseString;
	
	NSString *happyBirthdayString = [NSString stringWithFormat:@"HAPPY %li%@ BIRTHDAY, %@!!!",
																	 self.ageInYears, ordinal, self.name.uppercaseString];
	
	NSLog(@"%@", happyBirthdayString);
	
	return happyBirthdayString;
}

// helper method
- (NSString *)ordinalForInteger:(NSUInteger)integer
{
	NSString *ordinal = @"th";
	if (integer % 10 == 1 && integer % 100 != 11) {
		ordinal = @"st";
	} else if (integer % 10 == 2 && integer % 100 != 12) {
		ordinal = @"nd";
	} else if (integer % 10 == 3 && integer % 100 != 13) {
		ordinal = @"rd";
	}
	return ordinal;
}

/**
 Check whether the self.skills array already contains the string @"bash", and if not, to add it.
 */
- (void)learnSkillBash
{
	[self _learnSkill:@"bash"];
}

- (void)learnSkillXcode
{
	[self _learnSkill:@"Xcode"];
}

- (void)learnSkillObjectiveC
{
	[self _learnSkill:@"Objective-C"];
}

- (void)learnSkillObjectOrientedProgramming
{
	[self _learnSkill:@"Object-Oriented Programming"];
}

- (void)learnSkillInterfaceBuilder
{
	[self _learnSkill:@"Interface Builder"];
}

- (void)_learnSkill:(NSString *)skill
{
	if (![self.skills containsObject:skill]) {
		[self.skills addObject:skill];
	}
}

- (BOOL)isQualifiedTutor
{
	if (self.skills.count >= 4) {
		return YES;
	}
	
	return NO;
}

@end


























