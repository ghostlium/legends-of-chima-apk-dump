.class Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;
.super Landroid/view/animation/Animation;
.source "MAPAuthzDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeekingAnimationView"
.end annotation


# static fields
.field private static final DURATION:I = 0x258


# instance fields
.field private final mPeekingView:Landroid/view/View;

.field private final mPeekingViewHeight:I

.field private final mShowState:Z

.field final synthetic this$0:Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;


# direct methods
.method public constructor <init>(Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;Landroid/view/View;Z)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "state"    # Z

    .prologue
    const/4 v2, 0x0

    .line 370
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->this$0:Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 371
    const-wide/16 v0, 0x258

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->setDuration(J)V

    .line 372
    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    .line 373
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    .line 374
    iput-boolean p3, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mShowState:Z

    .line 375
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mShowState:Z

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 377
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 379
    :cond_0
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 3
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 383
    invoke-super {p0, p1, p2}, Landroid/view/animation/Animation;->applyTransformation(FLandroid/view/animation/Transformation;)V

    .line 384
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 385
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mShowState:Z

    if-eqz v0, :cond_0

    .line 386
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    float-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 391
    :goto_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 405
    :goto_1
    return-void

    .line 389
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    iget v2, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_0

    .line 394
    :cond_1
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mShowState:Z

    if-eqz v0, :cond_2

    .line 395
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 396
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    goto :goto_1

    .line 399
    :cond_2
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 400
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 401
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 402
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog$PeekingAnimationView;->mPeekingViewHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1
.end method
