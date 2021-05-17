.class public Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;
.super Ljava/lang/Object;
.source "ClickableToastImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ToastParams"
.end annotation


# static fields
.field private static final DEFAULT_DURATION:J = 0x5dcL

.field private static final DEFAULT_FADE_IN_DURATION:J = 0x1f4L

.field private static final DEFAULT_FADE_OUT_DURATION:J = 0x3e8L

.field private static final DEFAULT_HORIZONTAL_MARGIN_LANDSCAPE:F

.field private static final DEFAULT_HORIZONTAL_MARGIN_PORTRAIT:F

.field private static final DEFAULT_VERTICAL_MARGIN_LANDSCAPE:F

.field private static final DEFAULT_VERTICAL_MARGIN_PORTRAIT:F


# instance fields
.field private duration:J

.field private fadeInDuration:J

.field private fadeOutDuration:J

.field private hideAnimationResource:I

.field private horizontalMarginLandscape:F

.field private horizontalMarginPortrait:F

.field private popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field private showAnimationResource:I

.field private verticalMarginLandscape:F

.field private verticalMarginPortrait:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginPortrait:F

    .line 162
    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginLandscape:F

    .line 163
    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginLandscape:F

    .line 164
    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginPortrait:F

    .line 165
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeInDuration:J

    .line 166
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeOutDuration:J

    .line 167
    const-wide/16 v0, 0x5dc

    iput-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->duration:J

    .line 168
    const/high16 v0, 0x10a0000

    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->showAnimationResource:I

    .line 169
    const v0, 0x10a0001

    iput v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->hideAnimationResource:I

    .line 170
    sget-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->DEFAULT_POPUP_LOCATION:Lcom/amazon/ags/api/overlay/PopUpLocation;

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

    .line 171
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .prologue
    .line 238
    iget-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->duration:J

    return-wide v0
.end method

.method public getFadeInDuration()J
    .locals 2

    .prologue
    .line 230
    iget-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeInDuration:J

    return-wide v0
.end method

.method public getFadeOutDuration()J
    .locals 2

    .prologue
    .line 234
    iget-wide v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeOutDuration:J

    return-wide v0
.end method

.method public getHideAnimationResource()I
    .locals 1

    .prologue
    .line 246
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->hideAnimationResource:I

    return v0
.end method

.method public getHorizontalMarginLandscape()F
    .locals 1

    .prologue
    .line 226
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginLandscape:F

    return v0
.end method

.method public getHorizontalMarginPortrait()F
    .locals 1

    .prologue
    .line 222
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginPortrait:F

    return v0
.end method

.method public getPopUpLocation()Lcom/amazon/ags/api/overlay/PopUpLocation;
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

    return-object v0
.end method

.method public getShowAnimationResource()I
    .locals 1

    .prologue
    .line 242
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->showAnimationResource:I

    return v0
.end method

.method public getVerticalMarginLandscape()F
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginLandscape:F

    return v0
.end method

.method public getVerticalMarginPortrait()F
    .locals 1

    .prologue
    .line 214
    iget v0, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginPortrait:F

    return v0
.end method

.method public setDuration(J)V
    .locals 0
    .param p1, "duration"    # J

    .prologue
    .line 198
    iput-wide p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->duration:J

    .line 199
    return-void
.end method

.method public setFadeInDuration(J)V
    .locals 0
    .param p1, "fadeInDuration"    # J

    .prologue
    .line 190
    iput-wide p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeInDuration:J

    .line 191
    return-void
.end method

.method public setFadeOutDuration(J)V
    .locals 0
    .param p1, "fadeOutDuration"    # J

    .prologue
    .line 194
    iput-wide p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->fadeOutDuration:J

    .line 195
    return-void
.end method

.method public setHideAnimationResource(I)V
    .locals 0
    .param p1, "hideAnimationResource"    # I

    .prologue
    .line 206
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->hideAnimationResource:I

    .line 207
    return-void
.end method

.method public setHorizontalMarginLandscape(F)V
    .locals 0
    .param p1, "horizontalMarginLandscape"    # F

    .prologue
    .line 186
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginLandscape:F

    .line 187
    return-void
.end method

.method public setHorizontalMarginPortrait(F)V
    .locals 0
    .param p1, "horizontalMarginPortrait"    # F

    .prologue
    .line 182
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->horizontalMarginPortrait:F

    .line 183
    return-void
.end method

.method public setPopUpLocation(Lcom/amazon/ags/api/overlay/PopUpLocation;)V
    .locals 0
    .param p1, "popUpLocation"    # Lcom/amazon/ags/api/overlay/PopUpLocation;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->popUpLocation:Lcom/amazon/ags/api/overlay/PopUpLocation;

    .line 211
    return-void
.end method

.method public setShowAnimationResource(I)V
    .locals 0
    .param p1, "showAnimationResource"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->showAnimationResource:I

    .line 203
    return-void
.end method

.method public setVerticalMarginLandscape(F)V
    .locals 0
    .param p1, "verticalMarginLandscape"    # F

    .prologue
    .line 178
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginLandscape:F

    .line 179
    return-void
.end method

.method public setVerticalMarginPortrait(F)V
    .locals 0
    .param p1, "verticalMarginPortrait"    # F

    .prologue
    .line 174
    iput p1, p0, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastImpl$ToastParams;->verticalMarginPortrait:F

    .line 175
    return-void
.end method
