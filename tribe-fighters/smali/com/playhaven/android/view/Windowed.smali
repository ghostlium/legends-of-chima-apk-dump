.class public Lcom/playhaven/android/view/Windowed;
.super Landroid/app/Dialog;
.source "Windowed.java"

# interfaces
.implements Lcom/playhaven/android/view/PlayHavenListener;


# static fields
.field private static final DEFAULT_THEME:I = 0x1030010


# instance fields
.field private orientation:Landroid/view/OrientationEventListener;

.field private phListener:Lcom/playhaven/android/view/PlayHavenListener;

.field private playHavenView:Lcom/playhaven/android/view/PlayHavenView;

.field private savedLeft:I

.field private savedTop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 52
    const v0, 0x1030010

    invoke-direct {p0, p1, v1, v1, v0}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0, v0, p2}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/playhaven/android/Placement;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 85
    const/4 v0, 0x0

    const v1, 0x1030010

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placement"    # Lcom/playhaven/android/Placement;
    .param p3, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;

    .prologue
    .line 111
    const v0, 0x1030010

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenListener;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placement"    # Lcom/playhaven/android/Placement;
    .param p3, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;
    .param p4, "theme"    # I

    .prologue
    const/4 v0, -0x1

    .line 140
    invoke-direct {p0, p1, p4}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 192
    iput v0, p0, Lcom/playhaven/android/view/Windowed;->savedLeft:I

    .line 193
    iput v0, p0, Lcom/playhaven/android/view/Windowed;->savedTop:I

    .line 141
    invoke-virtual {p0, p1}, Lcom/playhaven/android/view/Windowed;->configure(Landroid/content/Context;)V

    .line 142
    invoke-virtual {p0, p3}, Lcom/playhaven/android/view/Windowed;->setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V

    .line 143
    invoke-virtual {p0, p2}, Lcom/playhaven/android/view/Windowed;->setPlacement(Lcom/playhaven/android/Placement;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/playhaven/android/view/PlayHavenListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;

    .prologue
    .line 73
    const/4 v0, 0x0

    const v1, 0x1030010

    invoke-direct {p0, p1, v0, p2, v1}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 97
    const/4 v0, 0x0

    const v1, 0x1030010

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placementTag"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;

    .prologue
    .line 125
    const v0, 0x1030010

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/playhaven/android/view/Windowed;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V

    .line 126
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/playhaven/android/view/PlayHavenListener;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placementTag"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;
    .param p4, "theme"    # I

    .prologue
    const/4 v0, -0x1

    .line 158
    invoke-direct {p0, p1, p4}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 192
    iput v0, p0, Lcom/playhaven/android/view/Windowed;->savedLeft:I

    .line 193
    iput v0, p0, Lcom/playhaven/android/view/Windowed;->savedTop:I

    .line 159
    invoke-virtual {p0, p1}, Lcom/playhaven/android/view/Windowed;->configure(Landroid/content/Context;)V

    .line 160
    invoke-virtual {p0, p3}, Lcom/playhaven/android/view/Windowed;->setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V

    .line 161
    invoke-virtual {p0, p2}, Lcom/playhaven/android/view/Windowed;->setPlacementTag(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method static synthetic access$0(Lcom/playhaven/android/view/Windowed;)I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lcom/playhaven/android/view/Windowed;->savedLeft:I

    return v0
.end method

.method static synthetic access$1(Lcom/playhaven/android/view/Windowed;)I
    .locals 1

    .prologue
    .line 193
    iget v0, p0, Lcom/playhaven/android/view/Windowed;->savedTop:I

    return v0
.end method

.method static synthetic access$2(Lcom/playhaven/android/view/Windowed;I)V
    .locals 0

    .prologue
    .line 192
    iput p1, p0, Lcom/playhaven/android/view/Windowed;->savedLeft:I

    return-void
.end method

.method static synthetic access$3(Lcom/playhaven/android/view/Windowed;I)V
    .locals 0

    .prologue
    .line 193
    iput p1, p0, Lcom/playhaven/android/view/Windowed;->savedTop:I

    return-void
.end method


# virtual methods
.method protected configure(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->configureSize()V

    .line 170
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0, p0}, Lcom/playhaven/android/view/PlayHavenView;->setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V

    .line 171
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/Windowed;->setContentView(Landroid/view/View;)V

    .line 172
    new-instance v0, Lcom/playhaven/android/view/Windowed$1;

    invoke-direct {v0, p0, p1}, Lcom/playhaven/android/view/Windowed$1;-><init>(Lcom/playhaven/android/view/Windowed;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/playhaven/android/view/Windowed;->orientation:Landroid/view/OrientationEventListener;

    .line 178
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 179
    return-void
.end method

.method protected configureSize()V
    .locals 6

    .prologue
    .line 202
    iget v4, p0, Lcom/playhaven/android/view/Windowed;->savedLeft:I

    if-ltz v4, :cond_1

    iget v4, p0, Lcom/playhaven/android/view/Windowed;->savedTop:I

    if-ltz v4, :cond_1

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 204
    :cond_1
    iget-object v4, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    if-nez v4, :cond_2

    .line 206
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    .line 207
    .local v0, "compat":Lcom/playhaven/android/compat/VendorCompat;
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_dialog:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-virtual {v0, v4, v5}, Lcom/playhaven/android/compat/VendorCompat;->getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I

    move-result v1

    .line 208
    .local v1, "dialogLayoutId":I
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_dialog_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v0, v4, v5}, Lcom/playhaven/android/compat/VendorCompat;->getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I

    move-result v2

    .line 210
    .local v2, "dialogViewId":I
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 211
    .local v3, "layout":Landroid/view/View;
    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/playhaven/android/view/PlayHavenView;

    iput-object v4, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    .line 215
    .end local v0    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    .end local v1    # "dialogLayoutId":I
    .end local v2    # "dialogViewId":I
    .end local v3    # "layout":Landroid/view/View;
    :cond_2
    const-wide v4, 0x3feccccccccccccdL    # 0.9

    invoke-virtual {p0, v4, v5}, Lcom/playhaven/android/view/Windowed;->resetWindow(D)V

    .line 217
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_0

    .line 220
    iget-object v4, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    new-instance v5, Lcom/playhaven/android/view/Windowed$2;

    invoke-direct {v5, p0}, Lcom/playhaven/android/view/Windowed$2;-><init>(Lcom/playhaven/android/view/Windowed;)V

    invoke-virtual {v4, v5}, Lcom/playhaven/android/view/PlayHavenView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    goto :goto_0
.end method

.method public dismiss()V
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->orientation:Landroid/view/OrientationEventListener;

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->orientation:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 378
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 379
    return-void
.end method

.method public getDisplayOptions()I
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0}, Lcom/playhaven/android/view/PlayHavenView;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getPlacement()Lcom/playhaven/android/Placement;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0}, Lcom/playhaven/android/view/PlayHavenView;->getPlacement()Lcom/playhaven/android/Placement;

    move-result-object v0

    return-object v0
.end method

.method public getPlacementTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0}, Lcom/playhaven/android/view/PlayHavenView;->getPlacementTag()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPlayHavenListener()Lcom/playhaven/android/view/PlayHavenListener;
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    return-object v0
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 327
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    if-eqz v0, :cond_0

    .line 328
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    sget-object v1, Lcom/playhaven/android/view/PlayHavenView$DismissType;->BackButton:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/PlayHavenView;->dismissView(Lcom/playhaven/android/view/PlayHavenView$DismissType;)V

    .line 330
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 331
    return-void
.end method

.method public onContentChanged()V
    .locals 0

    .prologue
    .line 370
    invoke-super {p0}, Landroid/app/Dialog;->onContentChanged()V

    .line 371
    return-void
.end method

.method protected resetWindow(D)V
    .locals 4
    .param p1, "factor"    # D

    .prologue
    .line 183
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 184
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 185
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 186
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    const v2, 0x3f19999a    # 0.6f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 187
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-double v2, v2

    mul-double/2addr v2, p1

    double-to-int v2, v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 188
    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-double v2, v2

    mul-double/2addr v2, p1

    double-to-int v2, v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 189
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 190
    return-void
.end method

.method public setDisplayOptions(I)V
    .locals 1
    .param p1, "displayOptions"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0, p1}, Lcom/playhaven/android/view/PlayHavenView;->setDisplayOptions(I)V

    .line 269
    return-void
.end method

.method public setPlacement(Lcom/playhaven/android/Placement;)V
    .locals 1
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0, p1}, Lcom/playhaven/android/view/PlayHavenView;->setPlacement(Lcom/playhaven/android/Placement;)V

    .line 280
    return-void
.end method

.method public setPlacementTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 290
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->playHavenView:Lcom/playhaven/android/view/PlayHavenView;

    invoke-virtual {v0, p1}, Lcom/playhaven/android/view/PlayHavenView;->setPlacementTag(Ljava/lang/String;)V

    .line 291
    return-void
.end method

.method public setPlayHavenListener(Lcom/playhaven/android/view/PlayHavenListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/playhaven/android/view/PlayHavenListener;

    .prologue
    .line 319
    iput-object p1, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    return-void
.end method

.method public viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->dismiss()V

    .line 356
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/playhaven/android/view/PlayHavenListener;->viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V

    .line 358
    :cond_0
    return-void
.end method

.method public viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V
    .locals 1
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 341
    invoke-virtual {p0}, Lcom/playhaven/android/view/Windowed;->dismiss()V

    .line 342
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    if-eqz v0, :cond_0

    .line 343
    iget-object v0, p0, Lcom/playhaven/android/view/Windowed;->phListener:Lcom/playhaven/android/view/PlayHavenListener;

    invoke-interface {v0, p1, p2}, Lcom/playhaven/android/view/PlayHavenListener;->viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V

    .line 344
    :cond_0
    return-void
.end method
