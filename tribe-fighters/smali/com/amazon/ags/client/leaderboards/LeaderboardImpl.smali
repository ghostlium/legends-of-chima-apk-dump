.class public Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;
.super Ljava/lang/Object;
.source "LeaderboardImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/Leaderboard;


# instance fields
.field private final displayText:Ljava/lang/String;

.field private final id:Ljava/lang/String;

.field private final imageURL:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/amazon/ags/constants/ScoreFormat;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "displayText"    # Ljava/lang/String;
    .param p4, "scoreFormat"    # Lcom/amazon/ags/constants/ScoreFormat;
    .param p5, "imageURL"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->id:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->name:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->displayText:Ljava/lang/String;

    .line 25
    iput-object p4, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    .line 26
    iput-object p5, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->imageURL:Ljava/lang/String;

    .line 27
    return-void
.end method


# virtual methods
.method public getDisplayText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->displayText:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->imageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getScoreFormat()Lcom/amazon/ags/constants/ScoreFormat;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Leaderboard{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "displayText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->displayText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", scoreFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->scoreFormat:Lcom/amazon/ags/constants/ScoreFormat;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imageURL = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/leaderboards/LeaderboardImpl;->imageURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
