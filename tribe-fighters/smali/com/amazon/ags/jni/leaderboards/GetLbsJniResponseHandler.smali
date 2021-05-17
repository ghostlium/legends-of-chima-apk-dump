.class public Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;
.super Lcom/amazon/ags/jni/JniResponseHandler;
.source "GetLbsJniResponseHandler.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/jni/JniResponseHandler;",
        "Lcom/amazon/ags/api/AGResponseCallback",
        "<",
        "Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "RequestLbJniResponseHandler"

    sput-object v0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 0
    .param p1, "developerTag"    # I
    .param p2, "callbackPointer"    # J

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3}, Lcom/amazon/ags/jni/JniResponseHandler;-><init>(IJ)V

    .line 21
    return-void
.end method


# virtual methods
.method public bridge synthetic onComplete(Lcom/amazon/ags/api/RequestResponse;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/api/RequestResponse;

    .prologue
    .line 14
    check-cast p1, Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;

    .end local p1    # "x0":Lcom/amazon/ags/api/RequestResponse;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->onComplete(Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;)V
    .locals 4
    .param p1, "result"    # Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;

    .prologue
    .line 25
    invoke-interface {p1}, Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    sget-object v0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "jniRequestLeaderboards response - onFailure"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    iget-wide v0, p0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->m_CallbackPointer:J

    invoke-interface {p1}, Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;->getError()Lcom/amazon/ags/api/ErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/api/ErrorCode;->ordinal()I

    move-result v2

    iget v3, p0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->m_DeveloperTag:I

    invoke-static {v0, v1, v2, v3}, Lcom/amazon/ags/jni/leaderboards/LeaderboardsJni;->getLeaderboardsResponseFailure(JII)V

    .line 40
    :goto_0
    return-void

    .line 33
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "jniRequestLeaderboards response - onSuccess"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    iget-wide v0, p0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->m_CallbackPointer:J

    iget v2, p0, Lcom/amazon/ags/jni/leaderboards/GetLbsJniResponseHandler;->m_DeveloperTag:I

    invoke-static {p1, v0, v1, v2}, Lcom/amazon/ags/jni/leaderboards/LeaderboardsJni;->getLeaderboardsResponseSuccess(Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;JI)V

    goto :goto_0
.end method
