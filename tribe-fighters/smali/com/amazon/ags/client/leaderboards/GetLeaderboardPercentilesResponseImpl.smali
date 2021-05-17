.class public Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "GetLeaderboardPercentilesResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;


# instance fields
.field private final leaderboard:Lcom/amazon/ags/api/leaderboards/Leaderboard;

.field private final percentileList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;",
            ">;"
        }
    .end annotation
.end field

.field private final userIndex:I


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 2
    .param p1, "responseCode"    # I
    .param p2, "error"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->userIndex:I

    .line 38
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->leaderboard:Lcom/amazon/ags/api/leaderboards/Leaderboard;

    .line 39
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->percentileList:Ljava/util/List;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/api/leaderboards/Leaderboard;Ljava/util/List;II)V
    .locals 0
    .param p1, "leaderboard"    # Lcom/amazon/ags/api/leaderboards/Leaderboard;
    .param p3, "userIndex"    # I
    .param p4, "responseCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/api/leaderboards/Leaderboard;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "percentileList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;>;"
    invoke-direct {p0, p4}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 29
    iput p3, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->userIndex:I

    .line 30
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->leaderboard:Lcom/amazon/ags/api/leaderboards/Leaderboard;

    .line 31
    iput-object p2, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->percentileList:Ljava/util/List;

    .line 32
    return-void
.end method


# virtual methods
.method public getLeaderboard()Lcom/amazon/ags/api/leaderboards/Leaderboard;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->leaderboard:Lcom/amazon/ags/api/leaderboards/Leaderboard;

    return-object v0
.end method

.method public getPercentileList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/LeaderboardPercentileItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->percentileList:Ljava/util/List;

    return-object v0
.end method

.method public getUserIndex()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/amazon/ags/client/leaderboards/GetLeaderboardPercentilesResponseImpl;->userIndex:I

    return v0
.end method
