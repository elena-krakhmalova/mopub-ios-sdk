//
//  FakeInterstitialCustomEvent.m
//  MoPub
//
//  Copyright (c) 2013 MoPub. All rights reserved.
//

#import "FakeInterstitialCustomEvent.h"

@implementation FakeInterstitialCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info
{
    self.customEventInfo = info;
}

- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController
{
    [self.delegate interstitialCustomEventWillAppear:self];
    self.presentingViewController = rootViewController;
}

- (void)customEventDidUnload
{
    self.didUnload = YES;
    [super customEventDidUnload];
}

- (void)simulateInterstitialFinishedAppearing
{
    if (self.presentingViewController) {
        [self.delegate interstitialCustomEventDidAppear:self];
    }
}

- (void)simulateInterstitialFinishedDisappearing
{
    [self.delegate interstitialCustomEventDidDisappear:self];
}

- (void)simulateLoadingAd
{
    [self.delegate interstitialCustomEvent:self didLoadAd:nil];
}

- (void)simulateFailingToLoad
{
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
}

- (void)simulateUserTap
{
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

- (void)simulateUserDismissingAd
{
    [self.delegate interstitialCustomEventWillDisappear:self];
    self.presentingViewController = nil;
}

@end