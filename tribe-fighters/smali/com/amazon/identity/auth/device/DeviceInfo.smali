.class public Lcom/amazon/identity/auth/device/DeviceInfo;
.super Ljava/lang/Object;
.source "DeviceInfo.java"


# static fields
.field public static final EMPTY_FIELD:Ljava/lang/String; = "unknown"

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final board:Ljava/lang/String;

.field private static final bootloader:Ljava/lang/String;

.field private static final brand:Ljava/lang/String;

.field private static final codename:Ljava/lang/String;

.field private static final country:Ljava/lang/String;

.field private static final cpu_abi:Ljava/lang/String;

.field private static final cpu_api2:Ljava/lang/String;

.field private static final device:Ljava/lang/String;

.field private static final display:Ljava/lang/String;

.field private static final fingerprint:Ljava/lang/String;

.field private static final hardware:Ljava/lang/String;

.field private static final host:Ljava/lang/String;

.field private static final id:Ljava/lang/String;

.field private static final incremental:Ljava/lang/String;

.field private static final language:Ljava/lang/String;

.field public static final manufacturer:Ljava/lang/String;

.field public static final model:Ljava/lang/String;

.field private static final product:Ljava/lang/String;

.field private static final radio:Ljava/lang/String;

.field public static final release:Ljava/lang/String;

.field public static final sdk_version:I

.field private static final tags:Ljava/lang/String;

.field private static final time:J

.field private static final timezone:Ljava/lang/String;

.field private static type:Ljava/lang/String;

.field private static user:Ljava/lang/String;


# instance fields
.field private deviceId:Ljava/lang/String;

.field private final flags:I

.field private final processName:Ljava/lang/String;

.field private final targetSdkVersion:I

.field private final uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    const-class v0, Lcom/amazon/identity/auth/device/DeviceInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->LOG_TAG:Ljava/lang/String;

    .line 42
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->board:Ljava/lang/String;

    .line 46
    sget-object v0, Landroid/os/Build;->BOOTLOADER:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->bootloader:Ljava/lang/String;

    .line 50
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->brand:Ljava/lang/String;

    .line 54
    sget-object v0, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->cpu_abi:Ljava/lang/String;

    .line 58
    sget-object v0, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->cpu_api2:Ljava/lang/String;

    .line 62
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->device:Ljava/lang/String;

    .line 66
    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->display:Ljava/lang/String;

    .line 71
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->fingerprint:Ljava/lang/String;

    .line 75
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->hardware:Ljava/lang/String;

    .line 79
    sget-object v0, Landroid/os/Build;->HOST:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->host:Ljava/lang/String;

    .line 83
    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->id:Ljava/lang/String;

    .line 87
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->manufacturer:Ljava/lang/String;

    .line 91
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->model:Ljava/lang/String;

    .line 95
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->product:Ljava/lang/String;

    .line 99
    sget-object v0, Landroid/os/Build;->RADIO:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->radio:Ljava/lang/String;

    .line 109
    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->tags:Ljava/lang/String;

    .line 113
    sget-wide v0, Landroid/os/Build;->TIME:J

    sput-wide v0, Lcom/amazon/identity/auth/device/DeviceInfo;->time:J

    .line 117
    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->type:Ljava/lang/String;

    .line 121
    sget-object v0, Landroid/os/Build;->USER:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->user:Ljava/lang/String;

    .line 127
    sget-object v0, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->codename:Ljava/lang/String;

    .line 132
    sget-object v0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->incremental:Ljava/lang/String;

    .line 136
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->release:Ljava/lang/String;

    .line 140
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    sput v0, Lcom/amazon/identity/auth/device/DeviceInfo;->sdk_version:I

    .line 189
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->country:Ljava/lang/String;

    .line 193
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->language:Ljava/lang/String;

    .line 196
    invoke-static {}, Landroid/text/format/Time;->getCurrentTimezone()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/DeviceInfo;->timezone:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 202
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    iput-object v1, p0, Lcom/amazon/identity/auth/device/DeviceInfo;->processName:Ljava/lang/String;

    .line 203
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    iput v1, p0, Lcom/amazon/identity/auth/device/DeviceInfo;->targetSdkVersion:I

    .line 204
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->uid:I

    iput v1, p0, Lcom/amazon/identity/auth/device/DeviceInfo;->uid:I

    .line 205
    iget v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    iput v1, p0, Lcom/amazon/identity/auth/device/DeviceInfo;->flags:I

    .line 210
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
