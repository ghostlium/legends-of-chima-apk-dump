.class public Lcom/playhaven/android/view/PlayHavenView;
.super Landroid/widget/FrameLayout;
.source "PlayHavenView.java"

# interfaces
.implements Lcom/playhaven/android/PlacementListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/view/PlayHavenView$DismissType;
    }
.end annotation


# static fields
.field public static final AUTO_DISPLAY_OPTIONS:I = 0x1

.field public static final BUNDLE_DATA:Ljava/lang/String; = "data"

.field public static final BUNDLE_DATA_OPTIN:Ljava/lang/String; = "data.optin"

.field public static final BUNDLE_DATA_PURCHASE:Ljava/lang/String; = "data.purchase"

.field public static final BUNDLE_DATA_REWARD:Ljava/lang/String; = "data.reward"

.field public static final BUNDLE_DISMISS_TYPE:Ljava/lang/String; = "dismissType"

.field public static final BUNDLE_DISPLAY_OPTIONS:Ljava/lang/String; = "displayOptions"

.field public static final BUNDLE_EXCEPTION:Ljava/lang/String; = "exception"

.field public static final BUNDLE_PLACEMENT:Ljava/lang/String; = "placement"

.field public static final BUNDLE_PLACEMENT_TAG:Ljava/lang/String; = "placementTag"

.field public static final DISPLAY_ANIMATION:I = 0x4

.field public static final DISPLAY_OVERLAY:I = 0x2

.field public static final NO_DISPLAY_OPTIONS:I


# instance fields
.field private childView:Lcom/playhaven/android/view/ChildView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/playhaven/android/view/ChildView",
            "<+",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private compat:Lcom/playhaven/android/compat/VendorCompat;

.field private displayOptions:I

.field private orientation:Landroid/view/OrientationEventListener;

.field private phListener:Lcom/playhaven/android/view/PlayHavenListener;

.field private placement:Lcom/playhaven/android/Placement;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 155
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 156
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    .line 157
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->createLayers()V

    .line 158
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 178
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 179
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v3

    iput-object v3, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    .line 180
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->createLayers()V

    .line 182
    iget-object v3, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_PlayHavenView:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v3, p1, p2, v4}, Lcom/playhaven/android/compat/VendorCompat;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 184
    .local v0, "arr":Landroid/content/res/TypedArray;
    :try_start_0
    iget-object v3, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v2

    .line 185
    .local v2, "viewStyleIdTag":I
    iget-object v3, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_displayOptions:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v1

    .line 187
    .local v1, "displayOptsId":I
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/playhaven/android/view/PlayHavenView;->setPlacementTag(Ljava/lang/String;)V

    .line 188
    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 192
    return-void

    .line 189
    .end local v1    # "displayOptsId":I
    .end local v2    # "viewStyleIdTag":I
    :catchall_0
    move-exception v3

    .line 190
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 191
    throw v3
.end method

.method static synthetic access$0(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/ChildView;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView;->childView:Lcom/playhaven/android/view/ChildView;

    return-void
.end method

.method static synthetic access$1(Lcom/playhaven/android/view/PlayHavenView;)Lcom/playhaven/android/view/ChildView;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->childView:Lcom/playhaven/android/view/ChildView;

    return-object v0
.end method

.method private setFullscreen(Lcom/playhaven/android/Placement;)V
    .locals 3
    .param p1, "pl"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 617
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isFullscreenCompatible()Z

    move-result v2

    if-nez v2, :cond_0

    .line 618
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 619
    .local v0, "context":Landroid/content/Context;
    instance-of v2, v0, Lcom/playhaven/android/view/FullScreen;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 620
    check-cast v1, Lcom/playhaven/android/view/FullScreen;

    .line 621
    .local v1, "hostActivity":Lcom/playhaven/android/view/FullScreen;
    new-instance v2, Lcom/playhaven/android/view/PlayHavenView$7;

    invoke-direct {v2, p0, v1}, Lcom/playhaven/android/view/PlayHavenView$7;-><init>(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/FullScreen;)V

    invoke-virtual {v1, v2}, Lcom/playhaven/android/view/FullScreen;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 630
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "hostActivity":Lcom/playhaven/android/view/FullScreen;
    :cond_0
    return-void
.end method

.method private updateLoading()V
    .locals 1

    .prologue
    .line 406
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    invoke-virtual {v0}, Lcom/playhaven/android/Placement;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 408
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isOverlaySet()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setOverlayVisible(Z)V

    .line 409
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isAnimationSet()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setAnimationVisible(Z)V

    .line 410
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setExitVisible(Z)V

    .line 412
    :cond_0
    return-void
.end method


# virtual methods
.method public contentDismissed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 657
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    if-eqz v0, :cond_0

    .line 658
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    invoke-interface {v0, p0, p2, p3}, Lcom/playhaven/android/view/PlayHavenListener;->viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V

    .line 659
    :cond_0
    return-void
.end method

.method public contentFailed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 641
    invoke-virtual {p0, p2}, Lcom/playhaven/android/view/PlayHavenView;->failView(Lcom/playhaven/android/PlayHavenException;)V

    .line 642
    return-void
.end method

.method public contentLoaded(Lcom/playhaven/android/Placement;)V
    .locals 1
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    const/4 v0, 0x0

    .line 577
    invoke-direct {p0, p1}, Lcom/playhaven/android/view/PlayHavenView;->setFullscreen(Lcom/playhaven/android/Placement;)V

    .line 578
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setAnimationVisible(Z)V

    .line 579
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setOverlayVisible(Z)V

    .line 582
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$6;

    invoke-direct {v0, p0, p1}, Lcom/playhaven/android/view/PlayHavenView$6;-><init>(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/Placement;)V

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->post(Ljava/lang/Runnable;)Z

    .line 614
    return-void
.end method

.method protected createExitListener()Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 201
    new-instance v0, Lcom/playhaven/android/view/PlayHavenView$1;

    invoke-direct {v0, p0}, Lcom/playhaven/android/view/PlayHavenView$1;-><init>(Lcom/playhaven/android/view/PlayHavenView;)V

    return-object v0
.end method

.method protected createLayers()V
    .locals 14

    .prologue
    .line 214
    invoke-static {}, Lcom/playhaven/android/util/MemoryReporter;->report()V

    .line 216
    iget-object v9, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_overlay:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-virtual {v9, v10, v11}, Lcom/playhaven/android/compat/VendorCompat;->getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I

    move-result v8

    .line 217
    .local v8, "overlayId":I
    iget-object v9, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_loadinganim:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-virtual {v9, v10, v11}, Lcom/playhaven/android/compat/VendorCompat;->getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I

    move-result v1

    .line 218
    .local v1, "animationId":I
    iget-object v9, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_exit:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-virtual {v9, v10, v11}, Lcom/playhaven/android/compat/VendorCompat;->getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I

    move-result v5

    .line 219
    .local v5, "exitId":I
    iget-object v9, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit_button:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v9, v10, v11}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v4

    .line 220
    .local v4, "exitBtnId":I
    if-lez v8, :cond_0

    if-lez v1, :cond_0

    if-lez v5, :cond_0

    if-gtz v4, :cond_1

    .line 222
    :cond_0
    new-instance v9, Lcom/playhaven/android/PlayHavenException;

    const-string v10, "createLayers was unable to locate a resource: %d / %d / %d / %d"

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-direct {v9, v10, v11}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0, v9}, Lcom/playhaven/android/view/PlayHavenView;->failView(Lcom/playhaven/android/PlayHavenException;)V

    .line 249
    :goto_0
    return-void

    .line 226
    :cond_1
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Lcom/playhaven/android/view/PlayHavenView;->setMeasureAllChildren(Z)V

    .line 228
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "layout_inflater"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    .line 231
    .local v6, "inflater":Landroid/view/LayoutInflater;
    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    .line 232
    .local v7, "overlay":Landroid/widget/LinearLayout;
    const/16 v9, 0x8

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 233
    invoke-virtual {p0, v7}, Lcom/playhaven/android/view/PlayHavenView;->addView(Landroid/view/View;)V

    .line 236
    const/4 v9, 0x0

    invoke-virtual {v6, v1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 237
    .local v0, "animation":Landroid/widget/RelativeLayout;
    const/16 v9, 0x8

    invoke-virtual {v0, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 238
    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->addView(Landroid/view/View;)V

    .line 241
    new-instance v9, Landroid/view/View;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v9}, Lcom/playhaven/android/view/PlayHavenView;->addView(Landroid/view/View;)V

    .line 244
    const/4 v9, 0x0

    invoke-virtual {v6, v5, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 245
    .local v2, "exit":Landroid/widget/LinearLayout;
    const/4 v9, 0x0

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 246
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 247
    .local v3, "exitBtn":Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->createExitListener()Landroid/view/View$OnClickListener;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    invoke-virtual {p0, v2}, Lcom/playhaven/android/view/PlayHavenView;->addView(Landroid/view/View;)V

    goto :goto_0
.end method

.method protected dismissView(Lcom/playhaven/android/view/PlayHavenView$DismissType;)V
    .locals 2
    .param p1, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .prologue
    .line 663
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    if-nez v1, :cond_0

    .line 669
    :goto_0
    return-void

    .line 664
    :cond_0
    const/4 v0, 0x0

    .line 665
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView;->childView:Lcom/playhaven/android/view/ChildView;

    if-eqz v1, :cond_1

    .line 666
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView;->childView:Lcom/playhaven/android/view/ChildView;

    invoke-interface {v1}, Lcom/playhaven/android/view/ChildView;->generateResponseBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 668
    :cond_1
    iget-object v1, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    invoke-interface {v1, p0, p1, v0}, Lcom/playhaven/android/view/PlayHavenListener;->viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method protected failView(Lcom/playhaven/android/PlayHavenException;)V
    .locals 1
    .param p1, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 472
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    .line 474
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    if-eqz v0, :cond_0

    .line 475
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    invoke-interface {v0, p0, p1}, Lcom/playhaven/android/view/PlayHavenListener;->viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V

    .line 476
    :cond_0
    return-void
.end method

.method public getDisplayOptions()I
    .locals 1

    .prologue
    .line 332
    iget v0, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    return v0
.end method

.method public getPlacement()Lcom/playhaven/android/Placement;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    return-object v0
.end method

.method public getPlacementTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    invoke-virtual {v0}, Lcom/playhaven/android/Placement;->getPlacementTag()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPlayHavenListener()Lcom/playhaven/android/view/PlayHavenListener;
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    return-object v0
.end method

.method public isAnimationSet()Z
    .locals 2

    .prologue
    .line 377
    iget v0, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    or-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isAutoDisplayOptionSet()Z
    .locals 2

    .prologue
    .line 365
    iget v0, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    or-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOverlaySet()Z
    .locals 2

    .prologue
    .line 389
    iget v0, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    or-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 397
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 398
    invoke-direct {p0}, Lcom/playhaven/android/view/PlayHavenView;->updateLoading()V

    .line 399
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 676
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->orientation:Landroid/view/OrientationEventListener;

    if-eqz v0, :cond_0

    .line 677
    iget-object v0, p0, Lcom/playhaven/android/view/PlayHavenView;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 679
    :cond_0
    invoke-static {}, Lcom/playhaven/android/util/MemoryReporter;->report()V

    .line 680
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 681
    return-void
.end method

.method public reload()V
    .locals 1

    .prologue
    .line 319
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getPlacementTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setPlacementTag(Ljava/lang/String;)V

    .line 320
    return-void
.end method

.method protected setAnimationVisible(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    .line 438
    iget-object v2, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_LoadingAnimation:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v2, v3, v4}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v1

    .line 439
    .local v1, "animationId":I
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/PlayHavenView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 440
    .local v0, "animation":Landroid/view/View;
    new-instance v2, Lcom/playhaven/android/view/PlayHavenView$3;

    invoke-direct {v2, p0, v0, p1}, Lcom/playhaven/android/view/PlayHavenView$3;-><init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/view/View;Z)V

    invoke-virtual {p0, v2}, Lcom/playhaven/android/view/PlayHavenView;->post(Ljava/lang/Runnable;)Z

    .line 446
    return-void
.end method

.method public setDisplayOptions(I)V
    .locals 4
    .param p1, "displayOptions"    # I

    .prologue
    .line 346
    iput p1, p0, Lcom/playhaven/android/view/PlayHavenView;->displayOptions:I

    .line 348
    const-string v1, "displayOptions = %d (%s %s)"

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 349
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v3, 0x1

    .line 350
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isAnimationSet()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "animation"

    :goto_0
    aput-object v0, v2, v3

    const/4 v3, 0x2

    .line 351
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isOverlaySet()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "overlay"

    :goto_1
    aput-object v0, v2, v3

    .line 347
    invoke-static {v1, v2}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 354
    invoke-direct {p0}, Lcom/playhaven/android/view/PlayHavenView;->updateLoading()V

    .line 355
    return-void

    .line 350
    :cond_0
    const-string v0, ""

    goto :goto_0

    .line 351
    :cond_1
    const-string v0, ""

    goto :goto_1
.end method

.method protected setExitVisible(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    .line 455
    iget-object v2, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v2, v3, v4}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v1

    .line 456
    .local v1, "exitViewId":I
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/PlayHavenView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 457
    .local v0, "exit":Landroid/view/View;
    new-instance v2, Lcom/playhaven/android/view/PlayHavenView$4;

    invoke-direct {v2, p0, v0, p1}, Lcom/playhaven/android/view/PlayHavenView$4;-><init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/view/View;Z)V

    invoke-virtual {p0, v2}, Lcom/playhaven/android/view/PlayHavenView;->post(Ljava/lang/Runnable;)Z

    .line 463
    return-void
.end method

.method protected setFrame()V
    .locals 14

    .prologue
    .line 499
    :try_start_0
    iget-object v12, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    invoke-virtual {v12}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v12

    const-string v13, "$.response.frame"

    invoke-static {v12, v13}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnet/minidev/json/JSONObject;

    .line 500
    .local v1, "frame":Lnet/minidev/json/JSONObject;
    if-eqz v1, :cond_3

    .line 502
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v12

    const-string v13, "window"

    invoke-virtual {v12, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/WindowManager;

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 503
    .local v0, "display":Landroid/view/Display;
    const/4 v5, 0x1

    .line 505
    .local v5, "portrait":Z
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0xb

    if-lt v12, v13, :cond_5

    .line 508
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v8

    .line 509
    .local v8, "rotation":I
    rem-int/lit16 v12, v8, 0xb4

    if-nez v12, :cond_4

    const/4 v5, 0x1

    .line 516
    .end local v8    # "rotation":I
    :goto_0
    if-eqz v5, :cond_7

    const-string v12, "$.PH_PORTRAIT"

    :goto_1
    invoke-static {v1, v12}, Lcom/playhaven/android/util/JsonUtil;->getPath(Lnet/minidev/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnet/minidev/json/JSONObject;

    .line 519
    .local v4, "ph":Lnet/minidev/json/JSONObject;
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 520
    .local v3, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    const-string v12, "$.x"

    const/4 v13, 0x0

    invoke-static {v4, v12, v13}, Lcom/playhaven/android/util/JsonUtil;->asInt(Lnet/minidev/json/JSONObject;Ljava/lang/String;I)I

    move-result v10

    .line 521
    .local v10, "x":I
    const-string v12, "$.y"

    const/4 v13, 0x0

    invoke-static {v4, v12, v13}, Lcom/playhaven/android/util/JsonUtil;->asInt(Lnet/minidev/json/JSONObject;Ljava/lang/String;I)I

    move-result v11

    .line 522
    .local v11, "y":I
    const-string v12, "$.w"

    const/4 v13, 0x0

    invoke-static {v4, v12, v13}, Lcom/playhaven/android/util/JsonUtil;->asInt(Lnet/minidev/json/JSONObject;Ljava/lang/String;I)I

    move-result v9

    .line 523
    .local v9, "w":I
    const-string v12, "$.h"

    const/4 v13, 0x0

    invoke-static {v4, v12, v13}, Lcom/playhaven/android/util/JsonUtil;->asInt(Lnet/minidev/json/JSONObject;Ljava/lang/String;I)I

    move-result v2

    .line 525
    .local v2, "h":I
    if-nez v10, :cond_0

    iget v12, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-nez v12, :cond_0

    if-nez v11, :cond_0

    iget v12, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-eqz v12, :cond_2

    .line 529
    :cond_0
    iput v2, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 530
    iput v9, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 531
    iput v10, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 532
    iput v11, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 534
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0xa

    if-ne v12, v13, :cond_1

    .line 538
    instance-of v12, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v12, :cond_8

    .line 540
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .end local v3    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v12, 0x30

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 546
    :cond_1
    :goto_2
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->requestLayout()V

    .line 549
    :cond_2
    iget-object v12, p0, Lcom/playhaven/android/view/PlayHavenView;->orientation:Landroid/view/OrientationEventListener;

    if-nez v12, :cond_3

    .line 551
    new-instance v12, Lcom/playhaven/android/view/PlayHavenView$5;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, p0, v13}, Lcom/playhaven/android/view/PlayHavenView$5;-><init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/content/Context;)V

    iput-object v12, p0, Lcom/playhaven/android/view/PlayHavenView;->orientation:Landroid/view/OrientationEventListener;

    .line 557
    iget-object v12, p0, Lcom/playhaven/android/view/PlayHavenView;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v12}, Landroid/view/OrientationEventListener;->enable()V

    .line 565
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "frame":Lnet/minidev/json/JSONObject;
    .end local v2    # "h":I
    .end local v4    # "ph":Lnet/minidev/json/JSONObject;
    .end local v5    # "portrait":Z
    .end local v9    # "w":I
    .end local v10    # "x":I
    .end local v11    # "y":I
    :cond_3
    :goto_3
    return-void

    .line 509
    .restart local v0    # "display":Landroid/view/Display;
    .restart local v1    # "frame":Lnet/minidev/json/JSONObject;
    .restart local v5    # "portrait":Z
    .restart local v8    # "rotation":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_0

    .line 511
    .end local v8    # "rotation":I
    :cond_5
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v6

    .line 512
    .local v6, "realX":I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v7

    .line 513
    .local v7, "realY":I
    if-ge v6, v7, :cond_6

    const/4 v5, 0x1

    :goto_4
    goto :goto_0

    :cond_6
    const/4 v5, 0x0

    goto :goto_4

    .line 516
    .end local v6    # "realX":I
    .end local v7    # "realY":I
    :cond_7
    const-string v12, "$.PH_LANDSCAPE"

    goto :goto_1

    .line 541
    .restart local v2    # "h":I
    .restart local v3    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v4    # "ph":Lnet/minidev/json/JSONObject;
    .restart local v9    # "w":I
    .restart local v10    # "x":I
    .restart local v11    # "y":I
    :cond_8
    instance-of v12, v3, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v12, :cond_1

    .line 542
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .end local v3    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v12, 0x30

    iput v12, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 560
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "frame":Lnet/minidev/json/JSONObject;
    .end local v2    # "h":I
    .end local v4    # "ph":Lnet/minidev/json/JSONObject;
    .end local v5    # "portrait":Z
    .end local v9    # "w":I
    .end local v10    # "x":I
    .end local v11    # "y":I
    :catch_0
    move-exception v12

    goto :goto_3

    .line 562
    :catch_1
    move-exception v12

    goto :goto_3
.end method

.method protected setOverlayVisible(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    .line 421
    iget-object v2, p0, Lcom/playhaven/android/view/PlayHavenView;->compat:Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Overlay:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v2, v3, v4}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v1

    .line 422
    .local v1, "overlayId":I
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/PlayHavenView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 423
    .local v0, "overlay":Landroid/view/View;
    new-instance v2, Lcom/playhaven/android/view/PlayHavenView$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/playhaven/android/view/PlayHavenView$2;-><init>(Lcom/playhaven/android/view/PlayHavenView;Landroid/view/View;Z)V

    invoke-virtual {p0, v2}, Lcom/playhaven/android/view/PlayHavenView;->post(Ljava/lang/Runnable;)Z

    .line 429
    return-void
.end method

.method public setPlacement(Lcom/playhaven/android/Placement;)V
    .locals 2
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    const/4 v1, 0x6

    .line 289
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView;->placement:Lcom/playhaven/android/Placement;

    .line 291
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->reset()V

    .line 294
    :cond_0
    invoke-virtual {p1, p0}, Lcom/playhaven/android/Placement;->setListener(Lcom/playhaven/android/PlacementListener;)V

    .line 295
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isDisplayable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 297
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isAutoDisplayOptionSet()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 298
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V

    .line 300
    :cond_1
    invoke-virtual {p0, p1}, Lcom/playhaven/android/view/PlayHavenView;->contentLoaded(Lcom/playhaven/android/Placement;)V

    .line 312
    :cond_2
    :goto_0
    return-void

    .line 301
    :cond_3
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 302
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isAutoDisplayOptionSet()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 303
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V

    .line 305
    :cond_4
    invoke-direct {p0}, Lcom/playhaven/android/view/PlayHavenView;->updateLoading()V

    goto :goto_0

    .line 306
    :cond_5
    invoke-virtual {p1}, Lcom/playhaven/android/Placement;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_2

    .line 307
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->isAutoDisplayOptionSet()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 308
    invoke-virtual {p0, v1}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V

    .line 310
    :cond_6
    invoke-virtual {p0}, Lcom/playhaven/android/view/PlayHavenView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/playhaven/android/Placement;->preload(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public setPlacementTag(Ljava/lang/String;)V
    .locals 3
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 267
    if-nez p1, :cond_0

    .line 271
    :goto_0
    return-void

    .line 269
    :cond_0
    new-instance v0, Lcom/playhaven/android/Placement;

    invoke-direct {v0, p1}, Lcom/playhaven/android/Placement;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/PlayHavenView;->setPlacement(Lcom/playhaven/android/Placement;)V

    .line 270
    const-string v0, "placementTag = %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;

    .prologue
    .line 493
    iput-object p1, p0, Lcom/playhaven/android/view/PlayHavenView;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    .line 494
    return-void
.end method
