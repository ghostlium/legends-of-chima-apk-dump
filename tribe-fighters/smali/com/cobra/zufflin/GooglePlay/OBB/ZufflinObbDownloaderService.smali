.class public Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderService;
.super Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;
.source "ZufflinObbDownloaderService.java"


# static fields
.field public static final SALT:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 28
    sput-object v0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderService;->SALT:[B

    .line 29
    return-void

    :array_0
    .array-data 1
        0xbt
        0x2t
        -0x70t
        -0xbt
        0x4t
        0x8t
        -0xat
        -0x70t
        0x3t
        0xct
        -0x12t
        -0xet
        0x13t
        0xft
        -0x10t
        -0x11t
        -0xdt
        0x5t
        -0xbt
        0x8t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlarmReceiverClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-class v0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbAlarmReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublicKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->getPublicLicenseKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSALT()[B
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderService;->SALT:[B

    return-object v0
.end method
