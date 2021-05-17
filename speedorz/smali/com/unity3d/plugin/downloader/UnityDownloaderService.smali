.class public Lcom/unity3d/plugin/downloader/UnityDownloaderService;
.super Lcom/unity3d/plugin/downloader/b/p;


# static fields
.field static BASE64_PUBLIC_KEY:Ljava/lang/String;

.field static SALT:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "REPLACE THIS WITH YOUR PUBLIC KEY - DONE FROM C#"

    sput-object v0, Lcom/unity3d/plugin/downloader/UnityDownloaderService;->BASE64_PUBLIC_KEY:Ljava/lang/String;

    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/unity3d/plugin/downloader/UnityDownloaderService;->SALT:[B

    return-void

    :array_0
    .array-data 1
        0x1t
        0x2bt
        -0xct
        -0x1t
        0x36t
        0x62t
        -0x64t
        -0xct
        0x2bt
        0x2t
        -0x8t
        -0x4t
        0x9t
        0x5t
        -0x6at
        -0x6ct
        -0x21t
        0x2dt
        -0x1t
        0x54t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/plugin/downloader/b/p;-><init>()V

    return-void
.end method


# virtual methods
.method public final h()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/unity3d/plugin/downloader/UnityDownloaderService;->BASE64_PUBLIC_KEY:Ljava/lang/String;

    return-object v0
.end method

.method public final i()[B
    .locals 1

    sget-object v0, Lcom/unity3d/plugin/downloader/UnityDownloaderService;->SALT:[B

    return-object v0
.end method

.method public final j()Ljava/lang/String;
    .locals 1

    const-class v0, Lcom/unity3d/plugin/downloader/UnityAlarmReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
