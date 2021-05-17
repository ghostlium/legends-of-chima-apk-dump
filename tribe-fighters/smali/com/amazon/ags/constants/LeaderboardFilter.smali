.class public final enum Lcom/amazon/ags/constants/LeaderboardFilter;
.super Ljava/lang/Enum;
.source "LeaderboardFilter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/LeaderboardFilter;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/LeaderboardFilter;

.field private static final FEATURE_NAME:Ljava/lang/String; = "LB"

.field public static final enum FRIENDS_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

.field public static final enum GLOBAL_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

.field public static final enum GLOBAL_DAY:Lcom/amazon/ags/constants/LeaderboardFilter;

.field public static final enum GLOBAL_WEEK:Lcom/amazon/ags/constants/LeaderboardFilter;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    const-string v1, "GLOBAL_ALL_TIME"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/LeaderboardFilter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

    new-instance v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    const-string v1, "GLOBAL_WEEK"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/LeaderboardFilter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_WEEK:Lcom/amazon/ags/constants/LeaderboardFilter;

    new-instance v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    const-string v1, "GLOBAL_DAY"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/LeaderboardFilter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_DAY:Lcom/amazon/ags/constants/LeaderboardFilter;

    new-instance v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    const-string v1, "FRIENDS_ALL_TIME"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/constants/LeaderboardFilter;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->FRIENDS_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

    .line 8
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/amazon/ags/constants/LeaderboardFilter;

    sget-object v1, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_WEEK:Lcom/amazon/ags/constants/LeaderboardFilter;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/LeaderboardFilter;->GLOBAL_DAY:Lcom/amazon/ags/constants/LeaderboardFilter;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/constants/LeaderboardFilter;->FRIENDS_ALL_TIME:Lcom/amazon/ags/constants/LeaderboardFilter;

    aput-object v1, v0, v5

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->$VALUES:[Lcom/amazon/ags/constants/LeaderboardFilter;

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LB_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->TAG:Ljava/lang/String;

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

.method public static fromOrdinal(I)Lcom/amazon/ags/constants/LeaderboardFilter;
    .locals 2
    .param p0, "ord"    # I

    .prologue
    .line 15
    invoke-static {}, Lcom/amazon/ags/constants/LeaderboardFilter;->values()[Lcom/amazon/ags/constants/LeaderboardFilter;

    move-result-object v0

    .line 16
    .local v0, "values":[Lcom/amazon/ags/constants/LeaderboardFilter;
    array-length v1, v0

    if-ge p0, v1, :cond_0

    if-gez p0, :cond_1

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    return-object v1

    :cond_1
    aget-object v1, v0, p0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/LeaderboardFilter;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/LeaderboardFilter;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/LeaderboardFilter;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/LeaderboardFilter;->$VALUES:[Lcom/amazon/ags/constants/LeaderboardFilter;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/LeaderboardFilter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/LeaderboardFilter;

    return-object v0
.end method
