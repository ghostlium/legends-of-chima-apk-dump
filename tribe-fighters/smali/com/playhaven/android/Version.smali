.class public final Lcom/playhaven/android/Version;
.super Ljava/lang/Object;
.source "Version.java"


# static fields
.field public static BANNER:Ljava/lang/String;

.field public static BANNER_FULL:Ljava/lang/String;

.field public static PLUGIN_BUILD_TIME:Ljava/lang/String;

.field public static PROJECT_ARTIFACT:Ljava/lang/String;

.field public static PROJECT_GROUP:Ljava/lang/String;

.field public static PROJECT_NAME:Ljava/lang/String;

.field public static PROJECT_VERSION:Ljava/lang/String;

.field public static SERVER_BUILD_ID:Ljava/lang/String;

.field public static SERVER_BUILD_PLAN:Ljava/lang/String;

.field public static SERVER_BUILD_TIME:Ljava/lang/String;

.field public static SOURCE_BRANCH:Ljava/lang/String;

.field public static SOURCE_DIRTY:Ljava/lang/Boolean;

.field public static SOURCE_VERSION:Ljava/lang/String;

.field public static SOURCE_WORKING_COPY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const-string v0, "2013-12-04 12:06"

    sput-object v0, Lcom/playhaven/android/Version;->PLUGIN_BUILD_TIME:Ljava/lang/String;

    .line 9
    const-string v0, "API"

    sput-object v0, Lcom/playhaven/android/Version;->PROJECT_NAME:Ljava/lang/String;

    .line 10
    const-string v0, "com.playhaven.android"

    sput-object v0, Lcom/playhaven/android/Version;->PROJECT_GROUP:Ljava/lang/String;

    .line 11
    const-string v0, "playhaven-api"

    sput-object v0, Lcom/playhaven/android/Version;->PROJECT_ARTIFACT:Ljava/lang/String;

    .line 12
    const-string v0, "2.1.4"

    sput-object v0, Lcom/playhaven/android/Version;->PROJECT_VERSION:Ljava/lang/String;

    .line 13
    const-string v0, "2.1.4-9-g9849864"

    sput-object v0, Lcom/playhaven/android/Version;->SOURCE_VERSION:Ljava/lang/String;

    .line 14
    const-string v0, "release"

    sput-object v0, Lcom/playhaven/android/Version;->SOURCE_BRANCH:Ljava/lang/String;

    .line 15
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/playhaven/android/Version;->SOURCE_DIRTY:Ljava/lang/Boolean;

    .line 16
    const-string v0, "/Volumes/Data/jenkins/workspace/sdk-android-2-internal"

    sput-object v0, Lcom/playhaven/android/Version;->SOURCE_WORKING_COPY:Ljava/lang/String;

    .line 18
    const-string v0, "sdk-android-2-internal"

    sput-object v0, Lcom/playhaven/android/Version;->SERVER_BUILD_PLAN:Ljava/lang/String;

    .line 19
    const-string v0, "475"

    sput-object v0, Lcom/playhaven/android/Version;->SERVER_BUILD_ID:Ljava/lang/String;

    .line 20
    const-string v0, "2013-12-04_12-04-45"

    sput-object v0, Lcom/playhaven/android/Version;->SERVER_BUILD_TIME:Ljava/lang/String;

    .line 22
    const-string v0, "Build info: API version 2.1.4 built on 2013-12-04 12:06 source version 2.1.4-9-g9849864, build id: sdk-android-2-internal-475."

    sput-object v0, Lcom/playhaven/android/Version;->BANNER_FULL:Ljava/lang/String;

    .line 23
    const-string v0, "2.1.4-2.1.4-9-g9849864 2013-12-04 12:06 "

    sput-object v0, Lcom/playhaven/android/Version;->BANNER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
