.class public Lcom/playhaven/android/compat/UnityCompat;
.super Lcom/playhaven/android/compat/VendorCompat;
.source "UnityCompat.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I = null

.field private static final r_styleable:Ljava/lang/String; = ".R$styleable"


# direct methods
.method static synthetic $SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE()[I
    .locals 3

    .prologue
    .line 25
    sget-object v0, Lcom/playhaven/android/compat/UnityCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I

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
    sput-object v0, Lcom/playhaven/android/compat/UnityCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "vendorId"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/playhaven/android/compat/VendorCompat;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method private getResourceStyleableArray(Landroid/content/Context;Ljava/lang/String;)[I
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 73
    sget-object v2, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_PlayHavenView:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v2}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 75
    new-array v2, v3, [I

    .line 76
    sget-object v3, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {p0, p1, v3}, Lcom/playhaven/android/compat/UnityCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v3

    aput v3, v2, v4

    .line 77
    sget-object v3, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_PlayHavenView_displayOptions:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {p0, p1, v3}, Lcom/playhaven/android/compat/UnityCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v3

    aput v3, v2, v5

    .line 95
    :goto_0
    return-object v2

    .line 81
    :cond_0
    sget-object v2, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->com_playhaven_android_view_Badge:Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    invoke-virtual {v2}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 83
    new-array v2, v3, [I

    .line 84
    sget-object v3, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_placementTag:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {p0, p1, v3}, Lcom/playhaven/android/compat/UnityCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v3

    aput v3, v2, v4

    .line 85
    sget-object v3, Lcom/playhaven/android/compat/VendorCompat$ATTR;->com_playhaven_android_view_Badge_textColor:Lcom/playhaven/android/compat/VendorCompat$ATTR;

    invoke-virtual {p0, p1, v3}, Lcom/playhaven/android/compat/UnityCompat;->getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I

    move-result v3

    aput v3, v2, v5

    goto :goto_0

    .line 90
    :cond_1
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".R$styleable"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 91
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 92
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    .line 95
    new-array v2, v4, [I

    goto :goto_0
.end method


# virtual methods
.method public getAttrId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ATTR;)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Lcom/playhaven/android/compat/VendorCompat$ATTR;

    .prologue
    .line 49
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->attr:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ATTR;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/UnityCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Lcom/playhaven/android/compat/VendorCompat$ID;

    .prologue
    .line 57
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->id:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ID;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/playhaven/android/compat/UnityCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ID;)I
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Lcom/playhaven/android/compat/VendorCompat$ID;

    .prologue
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p2}, Lcom/playhaven/android/compat/VendorCompat$ID;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->id:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    invoke-virtual {v2}, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;)Landroid/content/res/TypedArray;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "styleable"    # Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;

    .prologue
    const/4 v2, 0x0

    .line 37
    invoke-static {}, Lcom/playhaven/android/compat/UnityCompat;->$SWITCH_TABLE$com$playhaven$android$compat$VendorCompat$STYLEABLE()[I

    move-result-object v0

    invoke-virtual {p3}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 43
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 41
    :pswitch_0
    invoke-virtual {p3}, Lcom/playhaven/android/compat/VendorCompat$STYLEABLE;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/playhaven/android/compat/UnityCompat;->getResourceStyleableArray(Landroid/content/Context;Ljava/lang/String;)[I

    move-result-object v0

    invoke-virtual {p1, p2, v0, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    goto :goto_0

    .line 37
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
