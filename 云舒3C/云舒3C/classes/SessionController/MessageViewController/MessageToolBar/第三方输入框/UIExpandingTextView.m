/*
 *  UIExpandingTextView.m
 *  
 *  Created by Brandon Hamilton on 2011/05/03.
 *  Copyright 2011 Brandon Hamilton.
 *  
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

/* 
 *  This class is based on growingTextView by Hans Pickaers 
 *  http://www.hanspinckaers.com/multi-line-uitextview-similar-to-sms
 */

#import "UIExpandingTextView.h"
#import <QuartzCore/QuartzCore.h>
#define kTextInsetX 4
#define kTextInsetBottom 0
#define MaxNums 1000

@implementation UIExpandingTextView

@synthesize internalTextView;
@synthesize delegate;

@synthesize text;
@synthesize font;
@synthesize textColor;
@synthesize textAlignment; 
@synthesize selectedRange;
@synthesize editable;
@synthesize dataDetectorTypes; 
@synthesize animateHeightChange;
@synthesize returnKeyType;
@synthesize textViewBackgroundImage;
@synthesize placeholder;

@synthesize dismissivePanGestureRecognizer;
@synthesize dismissiveTapGestureRecognizer;

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
- (void)setPlaceholder:(NSString *)placeholders
{
    placeholder = placeholders;
    placeholderLabel.text = placeholders;
}

- (int)minimumNumberOfLines
{
    return minimumNumberOfLines;
}

- (int)maximumNumberOfLines
{
    return maximumNumberOfLines;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) 
    {
        forceSizeUpdate = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		CGRect backgroundFrame = frame;
        backgroundFrame.origin.y = 0;
		backgroundFrame.origin.x = 0;
        
        CGRect textViewFrame = CGRectInset(backgroundFrame, kTextInsetX, kTextInsetX);

        /* Internal Text View component */
		internalTextView = [[UIExpandingTextViewInternal alloc] initWithFrame:textViewFrame];
		internalTextView.delegate        = self;
		internalTextView.font            = [UIFont systemFontOfSize:17.0];
		internalTextView.contentInset    = UIEdgeInsetsMake(-4,0,0,0);
        internalTextView.text            = @"-";
		internalTextView.scrollEnabled   = NO;
        internalTextView.opaque          = NO;
        internalTextView.backgroundColor = [UIColor clearColor];
        internalTextView.showsHorizontalScrollIndicator = NO;
        internalTextView.showsVerticalScrollIndicator = NO;
        [internalTextView sizeToFit];
        
        internalTextView.delegate = self;
        
//        internalTextView.layer.borderColor = RGBACOLOR(78, 51, 34, 0.8)  .CGColor;
//        internalTextView.layer.borderWidth =1.0;
        internalTextView.layer.cornerRadius =5.0;
        
        internalTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        /* set placeholder */
        
        placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8,3,self.bounds.size.width - 16,self.bounds.size.height)];
        placeholderLabel.text = placeholder;
        placeholderLabel.font = internalTextView.font;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.textColor = [UIColor grayColor];
        [internalTextView addSubview:placeholderLabel];
        
        /* Custom Background image */
        textViewBackgroundImage = [[UIImageView alloc] initWithFrame:backgroundFrame];
        textViewBackgroundImage.image          = [UIImage imageNamed:@"InputBack"];
        textViewBackgroundImage.contentMode    = UIViewContentModeScaleToFill;
//        UIEdgeInsets insets = UIEdgeInsetsMake(0.5, 0.5, 0, 0);
//        [textViewBackgroundImage setImage:[[UIImage imageNamed:@"keyBoardBack"] resizableImageWithCapInsets:insets]];
        textViewBackgroundImage.contentStretch = CGRectMake(0.5, 0.5, 0, 0);
        [self addSubview:textViewBackgroundImage];
        [self addSubview:internalTextView];

        /* Calculate the text view height */
		UIView *internal = (UIView*)[[internalTextView subviews] objectAtIndex:0];
		minimumHeight = internal.frame.size.height;
		[self setMinimumNumberOfLines:1];
		animateHeightChange = YES;
		internalTextView.text = @"";
		[self setMaximumNumberOfLines:3];
        
        [self sizeToFit];
    }
    return self;
}

-(void)sizeToFit
{
    CGRect r = self.frame;
    if ([self.text length] > 0) 
    {
        /* No need to resize is text is not empty */
        return;
    }
    r.size.height = minimumHeight + kTextInsetBottom;
    self.frame = r;
}

-(void)setFrame:(CGRect)aframe
{
    CGRect backgroundFrame   = aframe;
    backgroundFrame.origin.y = 0;
    backgroundFrame.origin.x = 0;
    CGRect textViewFrame = CGRectInset(backgroundFrame, kTextInsetX, kTextInsetX);
	internalTextView.frame   = textViewFrame;
//    backgroundFrame.size.height  -= 8;
    textViewBackgroundImage.frame = backgroundFrame;
    forceSizeUpdate = YES;
	[super setFrame:aframe];
}

-(void)clearText
{
    self.text = @"";
    [self textViewDidChange:self.internalTextView];
}

-(float)getTextViewHeight
{
    float height=internalTextView.contentSize.height;
    
    if ([Util systemVersion]>=7.0)
    {
       //height = [internalTextView sizeThatFits:CGSizeMake(internalTextView.frame.size.width, FLT_MAX)].height;
   
        CGRect txtFrame = internalTextView.frame;
        height = txtFrame.size.height =[[NSString stringWithFormat:@"%@\n ",internalTextView.text]
                                                       boundingRectWithSize:CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                       attributes:[NSDictionary dictionaryWithObjectsAndKeys:internalTextView.font,NSFontAttributeName, nil] context:nil].size.height;
    
    }
    
    return height;
}
     
-(void)setMaximumNumberOfLines:(int)n
{
    BOOL didChange            = NO;
    NSString *saveText        = internalTextView.text;
    NSString *newText         = @"-";
    internalTextView.hidden   = YES;
    internalTextView.delegate = nil;
    for (int i = 2; i < n; ++i)
    {
        newText = [newText stringByAppendingString:@"\n|W|"];
    }
    internalTextView.text     = newText;
    didChange = (maximumHeight != [self getTextViewHeight]);
    maximumHeight             = [self getTextViewHeight];
    maximumNumberOfLines      = n;
    internalTextView.text     = saveText;
    internalTextView.hidden   = NO;
    internalTextView.delegate = self;
    if (didChange) {
        forceSizeUpdate = YES;
        [self textViewDidChange:self.internalTextView];
    }
}

-(void)setMinimumNumberOfLines:(int)m
{
    NSString *saveText        = internalTextView.text;
    NSString *newText         = @"-";
    internalTextView.hidden   = YES;
    internalTextView.delegate = nil;
    for (int i = 2; i < m; ++i)
    {
        newText = [newText stringByAppendingString:@"\n|W|"];
    }
    internalTextView.text     = newText;
    minimumHeight             = [self getTextViewHeight];
    internalTextView.text     = saveText;
    internalTextView.hidden   = NO;
    internalTextView.delegate = self;
    [self sizeToFit];
    minimumNumberOfLines = m;
}


- (void)textViewDidChange:(UITextView *)textView
{
    
    if ([Util systemVersion]>=7.0)
    {
        CGRect line = [textView caretRectForPosition:textView.selectedTextRange.start];
        CGFloat overflow = line.origin.y + line.size.height - ( textView.contentOffset.y + textView.bounds.size.height
                                                               - textView.contentInset.bottom - textView.contentInset.top );
        
        if ( overflow > 0 )
        {
            // We are at the bottom of the visible text and introduced a line feed, scroll down (iOS 7 does not do it)
            // Scroll caret to visible area
            CGPoint offset = textView.contentOffset;
            offset.y += overflow + 7; // leave 7 pixels margin
            // Cannot animate with setContentOffset:animated: or caret will not appear
            [UIView animateWithDuration:.2 animations:^{
                [textView setContentOffset:offset];
            }];
        }
    }
 
    
    
    
   // NSLog(@"走textViewDidChange%@",textView);
    if(textView.text.length == 0)
        placeholderLabel.alpha = 1;
    else
        placeholderLabel.alpha = 0;
    
	NSInteger newHeight = [self getTextViewHeight];
    
	if(newHeight < minimumHeight || !internalTextView.hasText)
    {
        newHeight = minimumHeight;
    }
    
	if (internalTextView.frame.size.height != newHeight || forceSizeUpdate)
	{
        forceSizeUpdate = NO;
        if (newHeight > maximumHeight && internalTextView.frame.size.height <= maximumHeight)
        {
            newHeight = maximumHeight;
        }
		if (newHeight <= maximumHeight)
		{
			if(animateHeightChange)
            {
				[UIView beginAnimations:@""  context:nil];
				[UIView setAnimationDelegate:self];
				[UIView setAnimationDidStopSelector:@selector(growDidStop)];
				[UIView setAnimationBeginsFromCurrentState:YES];
			}
			
			if ([delegate respondsToSelector:@selector(expandingTextView:willChangeHeight:)]) 
            {
				[delegate expandingTextView:self willChangeHeight:(newHeight+ kTextInsetBottom)];
			}
			
			/* Resize the frame */
			CGRect r = self.frame;
			r.size.height = newHeight + kTextInsetBottom;
			self.frame = r;
			r.origin.y = 0;
			r.origin.x = 0;
            internalTextView.frame = CGRectInset(r, kTextInsetX, kTextInsetX);
//            r.size.height -= 8;
            textViewBackgroundImage.frame = r;
			if(animateHeightChange)
            {
				[UIView commitAnimations];
			}
            else if ([delegate respondsToSelector:@selector(expandingTextView:didChangeHeight:)]) 
            {
                [delegate expandingTextView:self didChangeHeight:(newHeight+ kTextInsetBottom)];
            }
		}
		
		if (newHeight >= maximumHeight)
		{
            /* Enable vertical scrolling */
			if(!internalTextView.scrollEnabled)
            {
				internalTextView.scrollEnabled = YES;
				[internalTextView flashScrollIndicators];
			}
		} 
        else 
        {
            /* Disable vertical scrolling */
			internalTextView.scrollEnabled = NO;
		}
	}
	
	if ([delegate respondsToSelector:@selector(expandingTextViewDidChange:)]) 
    {
		[delegate expandingTextViewDidChange:self];
	}

    
    if ([Util systemVersion]>=7.0)
    {//解决在输入框中粘贴后，无法看到最后一个字符，只能通过点击删除键，光标才移到最后
         /* Enable vertical scrolling */
			if(!internalTextView.scrollEnabled)
            {
				internalTextView.scrollEnabled = YES;
				[internalTextView flashScrollIndicators];
			}
    }
    
}

-(void)growDidStop
{
	if ([delegate respondsToSelector:@selector(expandingTextView:didChangeHeight:)]) 
    {
		[delegate expandingTextView:self didChangeHeight:self.frame.size.height];
	}
}
-(BOOL)becomeFirstResponder{
    [super becomeFirstResponder];
    return [internalTextView becomeFirstResponder];
}
-(BOOL)resignFirstResponder
{
	[super resignFirstResponder];
	return [internalTextView resignFirstResponder];
}


#pragma mark UITextView properties

-(void)setText:(NSString *)atext
{
	internalTextView.text = atext;
    [self performSelector:@selector(textViewDidChange:) withObject:internalTextView];
}

-(NSString*)text
{
	return internalTextView.text;
}

-(void)setFont:(UIFont *)afont
{
	internalTextView.font= afont;
	[self setMaximumNumberOfLines:maximumNumberOfLines];
	[self setMinimumNumberOfLines:minimumNumberOfLines];
}

-(UIFont *)font
{
	return internalTextView.font;
}	

-(void)setTextColor:(UIColor *)color
{
	internalTextView.textColor = color;
}

-(UIColor*)textColor
{
	return internalTextView.textColor;
}

-(void)setTextAlignment:(UITextAlignment)aligment
{
	internalTextView.textAlignment = (NSTextAlignment)aligment;
}

-(UITextAlignment)textAlignment
{
	return internalTextView.textAlignment;
}

-(void)setSelectedRange:(NSRange)range
{
	internalTextView.selectedRange = range;
}

-(NSRange)selectedRange
{
	return internalTextView.selectedRange;
}

-(void)setEditable:(BOOL)beditable
{
	internalTextView.editable = beditable;
}

-(BOOL)isEditable
{
	return internalTextView.editable;
}

-(void)setReturnKeyType:(UIReturnKeyType)keyType
{
	internalTextView.returnKeyType = keyType;
}

-(UIReturnKeyType)returnKeyType
{
	return internalTextView.returnKeyType;
}

-(void)setDataDetectorTypes:(UIDataDetectorTypes)datadetector
{
	internalTextView.dataDetectorTypes = datadetector;
}

-(UIDataDetectorTypes)dataDetectorTypes
{
	return internalTextView.dataDetectorTypes;
}

- (BOOL)hasText
{
	return [internalTextView hasText];
}

- (void)scrollRangeToVisible:(NSRange)range
{
	[internalTextView scrollRangeToVisible:range];
}

#pragma mark -
#pragma mark UIExpandingTextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView 
{
	if ([delegate respondsToSelector:@selector(expandingTextViewShouldBeginEditing:)]) 
    {
		return [delegate expandingTextViewShouldBeginEditing:self];
	} 
    else 
    {
		return YES;
	}
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView 
{
	if ([delegate respondsToSelector:@selector(expandingTextViewShouldEndEditing:)]) 
    {
		return [delegate expandingTextViewShouldEndEditing:self];
	} 
    else 
    {
		return YES;
	}
}

- (void)textViewDidBeginEditing:(UITextView *)textView 
{
	if ([delegate respondsToSelector:@selector(expandingTextViewDidBeginEditing:)]) 
    {
		[delegate expandingTextViewDidBeginEditing:self];
	}
}

- (void)textViewDidEndEditing:(UITextView *)textView 
{		
	if ([delegate respondsToSelector:@selector(expandingTextViewDidEndEditing:)]) 
    {
		[delegate expandingTextViewDidEndEditing:self];
	}
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)atext 
{
	if(![textView hasText] && [atext isEqualToString:@""]) 
    {
        return NO;
	}
    
	if ([atext isEqualToString:@"\n"]) 
    {
		if ([delegate respondsToSelector:@selector(expandingTextViewShouldReturn:)]) 
        {
			if (![delegate performSelector:@selector(expandingTextViewShouldReturn:) withObject:self]) 
            {
				return YES;
			} 
            else 
            {
//				[textView resignFirstResponder];
				return NO;
			}
		}
	}
    
    
    if(((int)[atext characterAtIndex:atext.length-1]) == 0)
    {
        if(range.length == 1)
        {
                //NSLog(@"text=%@",atext);
                //NSLog(@"   💔 ----- 发送 删除  ");
                [delegate expandingDeleteEvent];
            
                return NO;
        }
    }
    
    
    //让其识别中文编码 一个中文占2个字节
  //  NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    
   /**
    NSString * aString = [textView.text stringByReplacingCharactersInRange:range withString:atext];
    if (internalTextView == (UIExpandingTextViewInternal*)textView)
    {
        int length = [aString length];
        if (length > MaxNums)
        {
            textView.text = [aString substringToIndex:MaxNums];
            [self textViewDidChange:self.internalTextView];
            return NO;
        }
    }
    **/
	return YES;
}

#pragma mark 从一个字符串中提取指定位置的字符

- (NSString *)getNSString:(NSString *)_string atIndex:(int)_index
{
    NSString *tempString;
    
    tempString = nil;
    
    if((_string)&&(_index>=0))
    {
        //先计算索引值是否大于字符串的长度，如果大于字符串的长度则索引指向字符串的最后一个位置
        
        if(_index>=[_string length])
        {
            _index = (int)[_string length];
        }
        
        if(_index==0)  
        {
            _index = 1;
            tempString = [_string substringToIndex:_index];
        }
        else
        {
            tempString = [[_string substringToIndex:_index]substringFromIndex:(_index-1)];
        }
    }
    return tempString;
}

- (void)textViewDidChangeSelection:(UITextView *)textView 
{
	if ([delegate respondsToSelector:@selector(expandingTextViewDidChangeSelection:)]) 
    {
		[delegate expandingTextViewDidChangeSelection:self];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![internalTextView isExclusiveTouch]) {
        [internalTextView resignFirstResponder];
    }
}

#pragma mark - Setters
- (void)setDismissivePanGestureRecognizer:(UIPanGestureRecognizer *)pan
{
    dismissivePanGestureRecognizer = pan;
    [dismissivePanGestureRecognizer addTarget:self.superview action:@selector(handlePanGesture:)];
}

- (void)setDismissiveTapGestureRecognizer:(UITapGestureRecognizer *)pan
{
    dismissiveTapGestureRecognizer = pan;
    [dismissiveTapGestureRecognizer addTarget:self action:@selector(handleTapGesture:)];
}

#pragma mark - Gestures
- (void)handlePanGesture:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        [self.delegate expandingDismissKeyBoard];
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        [self.delegate expandingDismissKeyBoard];
    }
}

@end
