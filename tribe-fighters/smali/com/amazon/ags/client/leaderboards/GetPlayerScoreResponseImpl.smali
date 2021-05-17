.class public Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "GetPlayerScoreResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;


# instance fields
.field private final rank:I

.field private final scoreValue:J


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 2
    .param p1, "responseCode"    # I
    .param p2, "error"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 26
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->scoreValue:J

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->rank:I

    .line 28
    return-void
.end method

.method public constructor <init>(JII)V
    .locals 0
    .param p1, "scoreValue"    # J
    .param p3, "rank"    # I
    .param p4, "responseCode"    # I

    .prologue
    .line 19
    invoke-direct {p0, p4}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 20
    iput-wide p1, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->scoreValue:J

    .line 21
    iput p3, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->rank:I

    .line 22
    return-void
.end method


# virtual methods
.method public final getEventType()I
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0xa

    return v0
.end method

.method public final getRank()I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->rank:I

    return v0
.end method

.method public final getScoreValue()J
    .locals 2

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->scoreValue:J

    return-wide v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 47
    invoke-super {p0}, Lcom/amazon/ags/client/RequestResponseImpl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n score: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->scoreValue:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n rank: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/amazon/ags/client/leaderboards/GetPlayerScoreResponseImpl;->rank:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    return-object v0
.end method
