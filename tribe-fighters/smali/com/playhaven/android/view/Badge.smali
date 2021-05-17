.class public Lcom/playhaven/android/view/Badge;
.super Landroid/graphics/drawable/Drawable;
.source "Badge.java"

# interfaces
.implements Lcom/playhaven/android/req/RequestListener;


# static fields
.field protected static DEFAULT_TEXT_COLOR:I


# instance fields
.field private background:Landroid/graphics/drawable/Drawable;

.field private badgeNum:Ljava/lang/String;

.field private compat:Lcom/playhaven/android/compat/VendorCompat;

.field private handler:Landroid/os/Handler;

.field private placementTag:Ljava/lang/String;

.field private size:I

.field private textColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, -0x1

    sput v0, Lcom/playhaven/android/view/Badge;->DEFAULT_TEXT_COLOR:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "placementTag"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 88
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 62
    sget v1, Lcom/playhaven/android/view/Badge;->DEFAULT_TEXT_COLOR:I

    iput v1, p0, Lcom/playhaven/android/view/Badge;->textColor:I

    .line 67
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    .line 72
    const/16 v1, 0x1e

    iput v1, p0, Lcom/playhaven/android/view/Badge;->size:I

    .line 89
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/playhaven/android/view/Badge;->handler:Landroid/os/Handler;

    .line 90
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/view/Badge;->compat:Lcom/playhaven/android/compat/VendorCompat;

    .line 93
    iget v1, p0, Lcom/playhaven/android/view/Badge;->size:I

    iget v2, p0, Lcom/playhaven/android/view/Badge;->size:I

    invoke-virtual {p0, v3, v3, v1, v2}, Lcom/playhaven/android/view/Badge;->setBounds(IIII)V

    .line 95
    iput-object p2, p0, Lcom/playhaven/android/view/Badge;->placementTag:Ljava/lang/String;

    .line 96
    iget-object v1, p0, Lcom/playhaven/android/view/Badge;->compat:Lcom/playhaven/android/compat/VendorCompat;

    sget-object v2, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->playhaven_badge:Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    invoke-virtual {v1, p1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getDrawableId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;)I

    move-result v0

    .line 97
    .local v0, "drawableId":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/view/Badge;->background:Landroid/graphics/drawable/Drawable;

    .line 98
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 130
    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->background:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 136
    :cond_1
    invoke-virtual {p0}, Lcom/playhaven/android/view/Badge;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v3

    .line 137
    .local v3, "width":I
    invoke-virtual {p0}, Lcom/playhaven/android/view/Badge;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v1

    .line 139
    .local v1, "height":I
    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v6, v6, v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 140
    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 142
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 143
    .local v2, "paint":Landroid/graphics/Paint;
    iget v4, p0, Lcom/playhaven/android/view/Badge;->textColor:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 145
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 146
    sget-object v4, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 156
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 157
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    iget-object v5, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v2, v4, v6, v5, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 158
    iget-object v4, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    div-int/lit8 v5, v3, 0x2

    int-to-float v5, v5

    div-int/lit8 v6, v1, 0x2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {p1, v4, v5, v6, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 188
    const/4 v0, -0x1

    return v0
.end method

.method public handleResponse(Lcom/playhaven/android/PlayHavenException;)V
    .locals 1
    .param p1, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 231
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    .line 232
    invoke-virtual {p0}, Lcom/playhaven/android/view/Badge;->invalidateOnUiThread()V

    .line 233
    return-void
.end method

.method public handleResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 212
    :try_start_0
    const-string v1, "$.response.notification.value"

    invoke-static {p1, v1}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 213
    .local v0, "text":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 222
    .end local v0    # "text":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 215
    .restart local v0    # "text":Ljava/lang/String;
    :cond_1
    iput-object v0, p0, Lcom/playhaven/android/view/Badge;->badgeNum:Ljava/lang/String;

    .line 216
    invoke-virtual {p0}, Lcom/playhaven/android/view/Badge;->invalidateOnUiThread()V
    :try_end_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 217
    .end local v0    # "text":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected invalidateOnUiThread()V
    .locals 2

    .prologue
    .line 196
    iget-object v0, p0, Lcom/playhaven/android/view/Badge;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/playhaven/android/view/Badge$1;

    invoke-direct {v1, p0}, Lcom/playhaven/android/view/Badge$1;-><init>(Lcom/playhaven/android/view/Badge;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 202
    return-void
.end method

.method public load(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 107
    new-instance v0, Lcom/playhaven/android/req/MetadataRequest;

    iget-object v1, p0, Lcom/playhaven/android/view/Badge;->placementTag:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/playhaven/android/req/MetadataRequest;-><init>(Ljava/lang/String;)V

    .line 108
    .local v0, "req":Lcom/playhaven/android/req/MetadataRequest;
    invoke-virtual {v0, p0}, Lcom/playhaven/android/req/MetadataRequest;->setResponseHandler(Lcom/playhaven/android/req/RequestListener;)V

    .line 109
    invoke-virtual {v0, p1}, Lcom/playhaven/android/req/MetadataRequest;->send(Landroid/content/Context;)V

    .line 110
    return-void
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 169
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 179
    return-void
.end method

.method public setTextColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 119
    iput p1, p0, Lcom/playhaven/android/view/Badge;->textColor:I

    .line 120
    invoke-virtual {p0}, Lcom/playhaven/android/view/Badge;->invalidateSelf()V

    .line 121
    return-void
.end method
