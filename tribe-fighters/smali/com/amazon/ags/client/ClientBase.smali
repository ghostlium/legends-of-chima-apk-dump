.class public abstract Lcom/amazon/ags/client/ClientBase;
.super Ljava/lang/Object;
.source "ClientBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected isReady:Z

.field protected serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/ClientBase;->TAG:Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/ClientBase;->isReady:Z

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/service/ServiceHelper;)V
    .locals 2
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/ClientBase;->TAG:Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/ClientBase;->isReady:Z

    .line 38
    iput-object p1, p0, Lcom/amazon/ags/client/ClientBase;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/ClientBase;->isReady:Z

    .line 40
    return-void
.end method


# virtual methods
.method protected getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I
    .locals 4
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # I

    .prologue
    .line 71
    :try_start_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 72
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p3

    .line 77
    .end local p3    # "defaultValue":I
    :cond_0
    :goto_0
    return p3

    .line 74
    .restart local p3    # "defaultValue":I
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSON error, returning default value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected getLong(Lorg/json/JSONObject;Ljava/lang/String;J)J
    .locals 4
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # J

    .prologue
    .line 57
    :try_start_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 58
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p3

    .line 63
    .end local p3    # "defaultValue":J
    :cond_0
    :goto_0
    return-wide p3

    .line 60
    .restart local p3    # "defaultValue":J
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/amazon/ags/client/ClientBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSON error, returning default value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected isClientReady()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/amazon/ags/client/ClientBase;->isReady:Z

    return v0
.end method

.method public setServiceHelper(Lcom/amazon/ags/html5/service/ServiceHelper;)V
    .locals 1
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/amazon/ags/client/ClientBase;->serviceHelper:Lcom/amazon/ags/html5/service/ServiceHelper;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/ClientBase;->isReady:Z

    .line 45
    return-void
.end method
