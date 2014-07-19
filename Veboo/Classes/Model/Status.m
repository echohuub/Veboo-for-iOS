//
//  Status.m
//  Veboo
//
//  Created by HeQingbao on 14-7-14.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.createdAt = dict[@"created_at"];
        self.idStr = dict[@"idstr"];
        self.text = dict[@"text"];
        self.source = dict[@"source"];
        
        self.repostsCount = [dict[@"reposts_count"] intValue];
        self.commentsCount = [dict[@"comments_count"] intValue];
        self.attitudesCount = [dict[@"attitudes_count"] intValue];
        
        self.picUrls = dict[@"pic_urls"];
        self.user = [[User alloc] initWithDict:dict[@"user"]];
        
        NSDictionary *retweetedDict = dict[@"retweeted_status"];
        if (retweetedDict) {
            self.retweetedStatus = [[Status alloc] initWithDict:retweetedDict];
        }
    }
    return self;
}

- (void)setSource:(NSString *)source
{
    // <a href="http://weibo.com/" rel="nofollow">微博 weibo.com</a>
    
    int start = [source rangeOfString:@"\">"].location + 2;
    int end = [source rangeOfString:@"</"].location;
    _source = [NSString stringWithFormat:@"来自%@", [source substringWithRange:NSMakeRange(start, end - start)]];
}

- (void)setPicUrls:(NSArray *)picUrls
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:picUrls.count];
    for (NSDictionary *dict in picUrls) {
        [array addObject:dict[@"thumbnail_pic"]];
    }
    _picUrls = array;
}

- (NSString *)createdAt
{
    // Sat Jul 19 12:25:03 +0800 2014
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"EEE MMM dd HH:mm:ss zzzz yyyy"];
    NSDate *date = [formatter dateFromString:_createdAt];
    
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [now timeIntervalSinceDate:date];
    
    if (interval < 60) {
        return @"刚刚";
    } else if (interval < 60 * 60) {
        return [NSString stringWithFormat:@"%.f分钟前", interval/60];
    } else {
        formatter.dateFormat = @"MM-dd HH:mm";
        return [formatter stringFromDate:date];
    }
}

@end
