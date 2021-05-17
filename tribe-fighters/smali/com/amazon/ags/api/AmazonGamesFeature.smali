.class public final enum Lcom/amazon/ags/api/AmazonGamesFeature;
.super Ljava/lang/Enum;
.source "AmazonGamesFeature.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/api/AmazonGamesFeature;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/api/AmazonGamesFeature;

.field public static final enum Achievements:Lcom/amazon/ags/api/AmazonGamesFeature;

.field public static final enum Leaderboards:Lcom/amazon/ags/api/AmazonGamesFeature;

.field public static final enum Progress:Lcom/amazon/ags/api/AmazonGamesFeature;

.field public static final enum Whispersync:Lcom/amazon/ags/api/AmazonGamesFeature;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 20
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    const-string v1, "Leaderboards"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesFeature;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->Leaderboards:Lcom/amazon/ags/api/AmazonGamesFeature;

    .line 25
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    const-string v1, "Achievements"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/api/AmazonGamesFeature;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->Achievements:Lcom/amazon/ags/api/AmazonGamesFeature;

    .line 30
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    const-string v1, "Whispersync"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/api/AmazonGamesFeature;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->Whispersync:Lcom/amazon/ags/api/AmazonGamesFeature;

    .line 35
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    const-string v1, "Progress"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/api/AmazonGamesFeature;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->Progress:Lcom/amazon/ags/api/AmazonGamesFeature;

    .line 16
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/amazon/ags/api/AmazonGamesFeature;

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesFeature;->Leaderboards:Lcom/amazon/ags/api/AmazonGamesFeature;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesFeature;->Achievements:Lcom/amazon/ags/api/AmazonGamesFeature;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesFeature;->Whispersync:Lcom/amazon/ags/api/AmazonGamesFeature;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesFeature;->Progress:Lcom/amazon/ags/api/AmazonGamesFeature;

    aput-object v1, v0, v5

    sput-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->$VALUES:[Lcom/amazon/ags/api/AmazonGamesFeature;

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
    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static all()Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    const-class v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/AmazonGamesFeature;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 16
    const-class v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/AmazonGamesFeature;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/api/AmazonGamesFeature;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->$VALUES:[Lcom/amazon/ags/api/AmazonGamesFeature;

    invoke-virtual {v0}, [Lcom/amazon/ags/api/AmazonGamesFeature;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/api/AmazonGamesFeature;

    return-object v0
.end method
