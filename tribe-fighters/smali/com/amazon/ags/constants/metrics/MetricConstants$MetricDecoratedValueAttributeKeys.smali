.class public final enum Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;
.super Ljava/lang/Enum;
.source "MetricConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/constants/metrics/MetricConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MetricDecoratedValueAttributeKeys"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum COUNTRY_SUPPORT:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum DEVICE_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum DEVICE_MANUFACTURER:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum DEVICE_MODEL:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum GAME_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum HIDDEN:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum JAVASCRIPT_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum NATIVE_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum PLATFORM:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum PLAYER_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

.field public static final enum PLAYING_ANONYMOUSLY:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 57
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "COUNTRY_SUPPORT"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->COUNTRY_SUPPORT:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 61
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "PLAYER_ID"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYER_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 65
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "GAME_ID"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->GAME_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 69
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "PLATFORM"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLATFORM:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 73
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "HIDDEN"

    invoke-direct {v0, v1, v7}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->HIDDEN:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 77
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "PLAYING_ANONYMOUSLY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYING_ANONYMOUSLY:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 81
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "NATIVE_VERSION"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->NATIVE_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 85
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "JAVASCRIPT_VERSION"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->JAVASCRIPT_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 89
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "DEVICE_ID"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 93
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "DEVICE_MANUFACTURER"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MANUFACTURER:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 97
    new-instance v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    const-string v1, "DEVICE_MODEL"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MODEL:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    .line 53
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->COUNTRY_SUPPORT:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYER_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->GAME_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLATFORM:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->HIDDEN:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->PLAYING_ANONYMOUSLY:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->NATIVE_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->JAVASCRIPT_VERSION:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MANUFACTURER:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_MODEL:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 53
    const-class v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->$VALUES:[Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    return-object v0
.end method
