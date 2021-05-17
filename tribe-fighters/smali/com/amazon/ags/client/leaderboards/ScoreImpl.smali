.class public Lcom/amazon/ags/client/leaderboards/ScoreImpl;
.super Ljava/lang/Object;
.source "ScoreImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/Score;


# static fields
.field private static final FEATURE_NAME:Ljava/lang/String; = "LB"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final leaderboard:Ljava/lang/String;

.field private final player:Lcom/amazon/ags/api/player/Player;

.field private final rank:I

.field private final scoreValue:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LB_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/client/leaderboards/ScoreImpl;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(JLcom/amazon/ags/api/player/Player;ILjava/lang/String;)V
    .locals 3
    .param p1, "scoreValue"    # J
    .param p3, "player"    # Lcom/amazon/ags/api/player/Player;
    .param p4, "rank"    # I
    .param p5, "leaderboard"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    sget-object v0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating score with score value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " player "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " rank "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " leaderboard "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    iput-wide p1, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->scoreValue:J

    .line 29
    iput-object p3, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->player:Lcom/amazon/ags/api/player/Player;

    .line 30
    iput p4, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->rank:I

    .line 31
    iput-object p5, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->leaderboard:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public final getLeaderboard()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->leaderboard:Ljava/lang/String;

    return-object v0
.end method

.method public final getPlayer()Lcom/amazon/ags/api/player/Player;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->player:Lcom/amazon/ags/api/player/Player;

    return-object v0
.end method

.method public final getRank()I
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->rank:I

    return v0
.end method

.method public final getScoreString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    iget-wide v0, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->scoreValue:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getScoreValue()J
    .locals 2

    .prologue
    .line 49
    iget-wide v0, p0, Lcom/amazon/ags/client/leaderboards/ScoreImpl;->scoreValue:J

    return-wide v0
.end method
