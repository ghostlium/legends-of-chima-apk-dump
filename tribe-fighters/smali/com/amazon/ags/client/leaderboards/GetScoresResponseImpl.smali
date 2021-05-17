.class public Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "GetScoresResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/GetScoresResponse;


# instance fields
.field private final displayText:Ljava/lang/String;

.field private final leaderboardId:Ljava/lang/String;

.field private final leaderboardName:Ljava/lang/String;

.field private final numScores:I

.field private final scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

.field private final scores:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/Score;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 2
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 42
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scores:Ljava/util/List;

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->numScores:I

    .line 44
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->displayText:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    .line 46
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardName:Ljava/lang/String;

    .line 47
    iput-object v1, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardId:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>([Lcom/amazon/ags/api/leaderboards/Score;Ljava/lang/String;Lcom/amazon/ags/constants/ScoreFormat;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "scores"    # [Lcom/amazon/ags/api/leaderboards/Score;
    .param p2, "displayText"    # Ljava/lang/String;
    .param p3, "scoreFormat"    # Lcom/amazon/ags/constants/ScoreFormat;
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "uniqueId"    # Ljava/lang/String;
    .param p6, "responseCode"    # I

    .prologue
    .line 30
    invoke-direct {p0, p6}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 32
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scores:Ljava/util/List;

    .line 33
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scores:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->numScores:I

    .line 34
    iput-object p2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->displayText:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    .line 36
    iput-object p4, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardName:Ljava/lang/String;

    .line 37
    iput-object p5, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardId:Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public final getDisplayText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->displayText:Ljava/lang/String;

    return-object v0
.end method

.method public final getEventType()I
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x7

    return v0
.end method

.method public final getLeaderboardId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardId:Ljava/lang/String;

    return-object v0
.end method

.method public final getLeaderboardName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardName:Ljava/lang/String;

    return-object v0
.end method

.method public final getNumScores()I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->numScores:I

    return v0
.end method

.method public final getScoreFormat()Lcom/amazon/ags/constants/ScoreFormat;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    return-object v0
.end method

.method public final getScores()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/leaderboards/Score;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scores:Ljava/util/List;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 87
    invoke-super {p0}, Lcom/amazon/ags/client/RequestResponseImpl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n numScores: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->numScores:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n displayText: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->displayText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n dataFormat: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n leaderboardName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n leaderboardID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/leaderboards/GetScoresResponseImpl;->leaderboardId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 93
    return-object v0
.end method
