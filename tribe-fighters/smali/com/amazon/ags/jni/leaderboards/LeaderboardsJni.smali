.class public Lcom/amazon/ags/jni/leaderboards/LeaderboardsJni;
.super Ljava/lang/Object;
.source "LeaderboardsJni.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native getLeaderboardsResponseFailure(JII)V
.end method

.method public static native getLeaderboardsResponseSuccess(Lcom/amazon/ags/api/leaderboards/GetLeaderboardsResponse;JI)V
.end method

.method public static native getPercentilesResponseFailure(JII)V
.end method

.method public static native getPercentilesResponseSuccess(Lcom/amazon/ags/api/leaderboards/GetLeaderboardPercentilesResponse;JI)V
.end method

.method public static native getPlayerScoreResponseFailure(JII)V
.end method

.method public static native getPlayerScoreResponseSuccess(Lcom/amazon/ags/api/leaderboards/GetPlayerScoreResponse;Ljava/lang/String;JI)V
.end method

.method public static native getScoresResponseFailure(JII)V
.end method

.method public static native getScoresResponseSuccess(Lcom/amazon/ags/api/leaderboards/GetScoresResponse;JI)V
.end method

.method public static native submitScoreResponseFailure(JII)V
.end method

.method public static native submitScoreResponseSuccess(Lcom/amazon/ags/api/leaderboards/SubmitScoreResponse;JI)V
.end method
