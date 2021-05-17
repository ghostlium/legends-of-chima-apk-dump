.class public final enum Lcom/amazon/ags/constants/metrics/EventNames;
.super Ljava/lang/Enum;
.source "EventNames.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/metrics/EventNames;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/metrics/EventNames;

.field public static final enum GameCircleInitialization:Lcom/amazon/ags/constants/metrics/EventNames;

.field public static final enum GameCircleReinitialization:Lcom/amazon/ags/constants/metrics/EventNames;

.field public static final enum GameCircleServiceCall:Lcom/amazon/ags/constants/metrics/EventNames;

.field public static final enum GameSession:Lcom/amazon/ags/constants/metrics/EventNames;

.field public static final enum OfflineCacheAccess:Lcom/amazon/ags/constants/metrics/EventNames;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/metrics/EventNames;

    const-string v1, "GameCircleReinitialization"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/metrics/EventNames;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleReinitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    .line 10
    new-instance v0, Lcom/amazon/ags/constants/metrics/EventNames;

    const-string v1, "GameCircleInitialization"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/metrics/EventNames;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleInitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    .line 11
    new-instance v0, Lcom/amazon/ags/constants/metrics/EventNames;

    const-string v1, "GameCircleServiceCall"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/metrics/EventNames;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleServiceCall:Lcom/amazon/ags/constants/metrics/EventNames;

    .line 12
    new-instance v0, Lcom/amazon/ags/constants/metrics/EventNames;

    const-string v1, "OfflineCacheAccess"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/constants/metrics/EventNames;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->OfflineCacheAccess:Lcom/amazon/ags/constants/metrics/EventNames;

    .line 13
    new-instance v0, Lcom/amazon/ags/constants/metrics/EventNames;

    const-string v1, "GameSession"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/constants/metrics/EventNames;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->GameSession:Lcom/amazon/ags/constants/metrics/EventNames;

    .line 8
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/amazon/ags/constants/metrics/EventNames;

    sget-object v1, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleReinitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleInitialization:Lcom/amazon/ags/constants/metrics/EventNames;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/metrics/EventNames;->GameCircleServiceCall:Lcom/amazon/ags/constants/metrics/EventNames;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/constants/metrics/EventNames;->OfflineCacheAccess:Lcom/amazon/ags/constants/metrics/EventNames;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/constants/metrics/EventNames;->GameSession:Lcom/amazon/ags/constants/metrics/EventNames;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->$VALUES:[Lcom/amazon/ags/constants/metrics/EventNames;

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
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/metrics/EventNames;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/metrics/EventNames;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/metrics/EventNames;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/metrics/EventNames;->$VALUES:[Lcom/amazon/ags/constants/metrics/EventNames;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/metrics/EventNames;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/metrics/EventNames;

    return-object v0
.end method
