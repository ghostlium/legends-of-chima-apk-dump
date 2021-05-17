.class public Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;
.super Ljava/lang/Object;
.source "LeaderboardPercentileItemImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;


# instance fields
.field private final percentile:I

.field private final player:Lcom/amazon/ags/api/player/Player;

.field private final playerScore:J


# direct methods
.method public constructor <init>(Lcom/amazon/ags/api/player/Player;JI)V
    .locals 0
    .param p1, "player"    # Lcom/amazon/ags/api/player/Player;
    .param p2, "playerScore"    # J
    .param p4, "percentile"    # I

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->player:Lcom/amazon/ags/api/player/Player;

    .line 17
    iput-wide p2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->playerScore:J

    .line 18
    iput p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->percentile:I

    .line 19
    return-void
.end method


# virtual methods
.method public getPercentile()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->percentile:I

    return v0
.end method

.method public getPlayer()Lcom/amazon/ags/api/player/Player;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->player:Lcom/amazon/ags/api/player/Player;

    return-object v0
.end method

.method public getPlayerScore()J
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardPercentileItemImpl;->playerScore:J

    return-wide v0
.end method
