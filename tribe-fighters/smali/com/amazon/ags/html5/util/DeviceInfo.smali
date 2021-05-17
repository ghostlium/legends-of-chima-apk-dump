.class public Lcom/amazon/ags/html5/util/DeviceInfo;
.super Ljava/lang/Object;
.source "DeviceInfo.java"


# static fields
.field private static final DEVICE_TYPE_ANDROID:Ljava/lang/String; = "A1K0FT6QT4HWL9"

.field private static final DEVICE_TYPE_KINDLE:Ljava/lang/String; = "AXRZR9ASDFH6P"


# instance fields
.field private final kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/KindleFireProxy;)V
    .locals 0
    .param p1, "kindleFireProxy"    # Lcom/amazon/ags/client/KindleFireProxy;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/amazon/ags/html5/util/DeviceInfo;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    .line 23
    return-void
.end method

.method public static getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 31
    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 36
    :goto_0
    return-object v0

    .line 33
    :cond_0
    const-string v0, "android_id"

    if-eqz v0, :cond_1

    const-string v0, "android_id"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 34
    const-string v0, "android_id"

    goto :goto_0

    .line 36
    :cond_1
    const-string v0, "UNKNOWN"

    goto :goto_0
.end method

.method public static getManufacturer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method public static getModel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 44
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 45
    .local v0, "manufacturer":Ljava/lang/String;
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 46
    .local v1, "model":Ljava/lang/String;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 48
    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 51
    :cond_0
    return-object v1
.end method


# virtual methods
.method public getDeviceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/amazon/ags/html5/util/DeviceInfo;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v0}, Lcom/amazon/ags/client/KindleFireProxy;->isKindle()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AXRZR9ASDFH6P"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "A1K0FT6QT4HWL9"

    goto :goto_0
.end method
