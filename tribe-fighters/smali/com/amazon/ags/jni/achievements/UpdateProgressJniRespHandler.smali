.class public Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;
.super Lcom/amazon/ags/jni/JniResponseHandler;
.source "UpdateProgressJniRespHandler.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/jni/JniResponseHandler;",
        "Lcom/amazon/ags/api/AGResponseCallback",
        "<",
        "Lcom/amazon/ags/api/achievements/UpdateProgressResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static LOG_TAG:Ljava/lang/String;


# instance fields
.field private m_AchievementId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "UpdateProgressJniRespHandler"

    sput-object v0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .param p1, "achievementId"    # Ljava/lang/String;
    .param p2, "developerTag"    # I
    .param p3, "callbackPointer"    # J

    .prologue
    .line 22
    invoke-direct {p0, p2, p3, p4}, Lcom/amazon/ags/jni/JniResponseHandler;-><init>(IJ)V

    .line 23
    iput-object p1, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_AchievementId:Ljava/lang/String;

    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic onComplete(Lcom/amazon/ags/api/RequestResponse;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/api/RequestResponse;

    .prologue
    .line 14
    check-cast p1, Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    .end local p1    # "x0":Lcom/amazon/ags/api/RequestResponse;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->onComplete(Lcom/amazon/ags/api/achievements/UpdateProgressResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/api/achievements/UpdateProgressResponse;)V
    .locals 4
    .param p1, "result"    # Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    .prologue
    .line 28
    invoke-interface {p1}, Lcom/amazon/ags/api/achievements/UpdateProgressResponse;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    sget-object v0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "jniUpdateProgress response - onFailure"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget-wide v0, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_CallbackPointer:J

    invoke-interface {p1}, Lcom/amazon/ags/api/achievements/UpdateProgressResponse;->getError()Lcom/amazon/ags/api/ErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/api/ErrorCode;->ordinal()I

    move-result v2

    iget v3, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_DeveloperTag:I

    invoke-static {v0, v1, v2, v3}, Lcom/amazon/ags/jni/achievements/AchievementsJni;->updateProgressResponseFailure(JII)V

    .line 44
    :goto_0
    return-void

    .line 36
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "jniUpdateProgress response - onSuccess"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    iget-object v0, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_AchievementId:Ljava/lang/String;

    iget-wide v1, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_CallbackPointer:J

    iget v3, p0, Lcom/amazon/ags/jni/achievements/UpdateProgressJniRespHandler;->m_DeveloperTag:I

    invoke-static {p1, v0, v1, v2, v3}, Lcom/amazon/ags/jni/achievements/AchievementsJni;->updateProgressResponseSuccess(Lcom/amazon/ags/api/achievements/UpdateProgressResponse;Ljava/lang/String;JI)V

    goto :goto_0
.end method
