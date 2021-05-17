.class public Lcom/playhaven/android/view/MoreGames;
.super Landroid/widget/Button;
.source "MoreGames.java"


# instance fields
.field private badge:Lcom/playhaven/android/view/Badge;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v3

    .line 60
    .local v3, "compat":Lcom/playhaven/android/compat/VendorCompat;
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_Badge:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v3, p1, p2, v4}, Lcom/playhaven/android/compat/VendorCompat;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 62
    .local v0, "arr":Landroid/content/res/TypedArray;
    :try_start_0
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v2

    .line 63
    .local v2, "badgeStyleableId":I
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_textColor:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v1

    .line 65
    .local v1, "badgeColorId":I
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/playhaven/android/view/MoreGames;->setPlacementTag(Ljava/lang/String;)V

    .line 66
    sget v4, Lcom/playhaven/android/view/Badge;->DEFAULT_TEXT_COLOR:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/playhaven/android/view/MoreGames;->setTextColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 70
    return-void

    .line 67
    .end local v1    # "badgeColorId":I
    .end local v2    # "badgeStyleableId":I
    :catchall_0
    move-exception v4

    .line 68
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 69
    throw v4
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 86
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v3

    .line 87
    .local v3, "compat":Lcom/playhaven/android/compat/VendorCompat;
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_Badge:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v3, p1, p2, v4}, Lcom/playhaven/android/compat/VendorCompat;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 89
    .local v0, "arr":Landroid/content/res/TypedArray;
    :try_start_0
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v2

    .line 90
    .local v2, "badgeStyleableId":I
    sget-object v4, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_textColor:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v3, p1, v4}, Lcom/playhaven/android/compat/VendorCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v1

    .line 92
    .local v1, "badgeColorId":I
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/playhaven/android/view/MoreGames;->setPlacementTag(Ljava/lang/String;)V

    .line 93
    sget v4, Lcom/playhaven/android/view/Badge;->DEFAULT_TEXT_COLOR:I

    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/playhaven/android/view/MoreGames;->setTextColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 97
    return-void

    .line 94
    .end local v1    # "badgeColorId":I
    .end local v2    # "badgeStyleableId":I
    :catchall_0
    move-exception v4

    .line 95
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 96
    throw v4
.end method


# virtual methods
.method public load(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    invoke-virtual {v0, p1}, Lcom/playhaven/android/view/Badge;->load(Landroid/content/Context;)V

    .line 131
    :cond_0
    return-void
.end method

.method public setPlacementTag(Ljava/lang/String;)V
    .locals 3
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 107
    new-instance v0, Lcom/playhaven/android/view/Badge;

    invoke-virtual {p0}, Lcom/playhaven/android/view/MoreGames;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/playhaven/android/view/Badge;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    .line 108
    iget-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    invoke-virtual {p0, v2, v2, v0, v2}, Lcom/playhaven/android/view/MoreGames;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 109
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/playhaven/android/view/MoreGames;->badge:Lcom/playhaven/android/view/Badge;

    invoke-virtual {v0, p1}, Lcom/playhaven/android/view/Badge;->setTextColor(I)V

    .line 120
    :cond_0
    return-void
.end method
