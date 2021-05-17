.class public Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;
.super Lcom/amazon/ags/jni/JniResponseHandler;
.source "RequestLocalPlayerProfileJniResponseHandler.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/ags/jni/JniResponseHandler;",
        "Lcom/amazon/ags/api/AGResponseCallback",
        "<",
        "Lcom/amazon/ags/api/player/RequestPlayerResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->TAG:Ljava/lang/String;

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
    check-cast p1, Lcom/amazon/ags/api/player/RequestPlayerResponse;

    .end local p1    # "x0":Lcom/amazon/ags/api/RequestResponse;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->onComplete(Lcom/amazon/ags/api/player/RequestPlayerResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/api/player/RequestPlayerResponse;)V
    .locals 4
    .param p1, "result"    # Lcom/amazon/ags/api/player/RequestPlayerResponse;

    .prologue
    .line 25
    invoke-interface {p1}, Lcom/amazon/ags/api/player/RequestPlayerResponse;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    sget-object v0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->TAG:Ljava/lang/String;

    const-string v1, "jniRequestPlayerProfile response - onFailure"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    iget-wide v0, p0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->m_CallbackPointer:J

    invoke-interface {p1}, Lcom/amazon/ags/api/player/RequestPlayerResponse;->getError()Lcom/amazon/ags/api/ErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/api/ErrorCode;->ordinal()I

    move-result v2

    iget v3, p0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->m_DeveloperTag:I

    invoke-static {v0, v1, v2, v3}, Lcom/amazon/ags/jni/player/ProfilesJni;->getLocalPlayerProfileResponseFailure(JII)V

    .line 41
    :goto_0
    return-void

    .line 34
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->TAG:Ljava/lang/String;

    const-string v1, "jniRequestPlayerProfile response - onSuccess"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    iget-wide v0, p0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->m_CallbackPointer:J

    iget v2, p0, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;->m_DeveloperTag:I

    invoke-static {p1, v0, v1, v2}, Lcom/amazon/ags/jni/player/ProfilesJni;->getLocalPlayerProfileResponseSuccess(Lcom/amazon/ags/api/player/RequestPlayerResponse;JI)V

    goto :goto_0
.end method
