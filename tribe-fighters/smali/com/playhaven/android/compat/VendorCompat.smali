.class public Lcom/playhaven/android/compat/VendorCompat;
.super Ljava/lang/Object;
.source "VendorCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/compat/VendorCompat$ATTR;,
        Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;,
        Lcom/playhaven/android/compat/VendorCompat$ID;,
        Lcom/playhaven/android/compat/VendorCompat$LAYOUT;,
        Lcom/playhaven/android/compat/VendorCompat$ResourceType;,
        Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ATTR:[I

.field private static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ID:[I

.field private static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I


# instance fields
.field private vendorId:Ljava/lang/String;


# direct methods
.method static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ATTR()[I
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ATTR:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->values()[Lcom/playhaven/android/compat/VendorCompat$ATTR;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_textColor:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_displayOptions:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ATTR:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ID()[I
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ID:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat$ID;->values()[Lcom/playhaven/android/compat/VendorCompat$ID;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit_button:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_LoadingAnimation:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Overlay:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_dialog_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ID:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE()[I
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->values()[Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_Badge:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    :try_start_1
    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_PlayHavenView:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v1}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    sput-object v0, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "vendorId"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p2}, Lcom/playhaven/android/compat/VendorCompat;-><init>(Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "vendorId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    if-nez p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 89
    :cond_0
    const-string v0, "[^A-Za-z0-9\\-\\.\\_\\~]*"

    .line 95
    .local v0, "replacePattern":Ljava/lang/String;
    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    .line 99
    .end local v0    # "replacePattern":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 101
    :cond_2
    const-string v1, "vendorId has no valid characters in it. Using default."

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    .line 106
    :cond_3
    iget-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    iget-object v2, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2a

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    .line 107
    return-void
.end method


# virtual methods
.method public getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Lcom/playhaven/android/compat/VendorCompat$ATTR;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 123
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ATTR()[I

    move-result-object v2

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 134
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->attr:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    move v0, v1

    .line 128
    goto :goto_0

    :pswitch_2
    move v0, v1

    .line 130
    goto :goto_0

    .line 123
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getDrawableId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "drawable"    # Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    .prologue
    .line 118
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->drawable:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Lcom/playhaven/android/compat/VendorCompat$ID;

    .prologue
    .line 144
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$ID()[I

    move-result-object v0

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ID;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 155
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->id:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ID;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    :goto_0
    return v0

    .line 147
    :pswitch_0
    sget v0, Lcom/playhaven/android/R$id;->com_playhaven_android_view_Exit:I

    goto :goto_0

    .line 149
    :pswitch_1
    sget v0, Lcom/playhaven/android/R$id;->com_playhaven_android_view_Exit_button:I

    goto :goto_0

    .line 151
    :pswitch_2
    sget v0, Lcom/playhaven/android/R$id;->com_playhaven_android_view_Overlay:I

    goto :goto_0

    .line 153
    :pswitch_3
    sget v0, Lcom/playhaven/android/R$id;->com_playhaven_android_view_LoadingAnimation:I

    goto :goto_0

    .line 144
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getLayoutId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$LAYOUT;)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .prologue
    .line 113
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->layout:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Lcom/playhaven/android/compat/VendorCompat$ResourceType;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getVendorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/playhaven/android/compat/VendorCompat;->vendorId:Ljava/lang/String;

    return-object v0
.end method

.method public obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;)Landroid/content/res/TypedArray;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "styleable"    # Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    .prologue
    const/4 v2, 0x0

    .line 172
    invoke-static {}, Lcom/playhaven/android/compat/VendorCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE()[I

    move-result-object v0

    invoke-virtual {p3}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 179
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 175
    :pswitch_0
    sget-object v0, Lcom/playhaven/android/R$styleable;->com_playhaven_android_view_Badge:[I

    invoke-virtual {p1, p2, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    goto :goto_0

    .line 177
    :pswitch_1
    sget-object v0, Lcom/playhaven/android/R$styleable;->com_playhaven_android_view_PlayHavenView:[I

    invoke-virtual {p1, p2, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    goto :goto_0

    .line 172
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
