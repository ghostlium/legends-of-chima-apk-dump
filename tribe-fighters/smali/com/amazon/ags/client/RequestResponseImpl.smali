.class public Lcom/amazon/ags/client/RequestResponseImpl;
.super Ljava/lang/Object;
.source "RequestResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/RequestResponse;


# instance fields
.field private final errorCode:Lcom/amazon/ags/api/ErrorCode;

.field private final responseCode:I

.field private userData:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "responseCode"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput p1, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    .line 36
    invoke-static {p1}, Lcom/amazon/ags/api/ErrorCode;->fromServiceResponseCode(I)Lcom/amazon/ags/api/ErrorCode;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/RequestResponseImpl;->errorCode:Lcom/amazon/ags/api/ErrorCode;

    .line 37
    return-void
.end method

.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 2
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    if-nez p2, :cond_0

    .line 27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "errorCode must be non-null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_0
    iput p1, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    .line 31
    iput-object p2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->errorCode:Lcom/amazon/ags/api/ErrorCode;

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    :try_start_0
    const-string v2, "RESPONSE_CODE"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 46
    .local v0, "code":I
    :goto_0
    iput v0, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    .line 47
    iget v2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    invoke-static {v2}, Lcom/amazon/ags/api/ErrorCode;->fromServiceResponseCode(I)Lcom/amazon/ags/api/ErrorCode;

    move-result-object v2

    iput-object v2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->errorCode:Lcom/amazon/ags/api/ErrorCode;

    .line 48
    return-void

    .line 43
    .end local v0    # "code":I
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Lorg/json/JSONException;
    const/16 v0, 0x18

    .restart local v0    # "code":I
    goto :goto_0
.end method


# virtual methods
.method public final getError()Lcom/amazon/ags/api/ErrorCode;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/amazon/ags/client/RequestResponseImpl;->errorCode:Lcom/amazon/ags/api/ErrorCode;

    return-object v0
.end method

.method public getEventType()I
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method

.method public final getResponseCode()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    return v0
.end method

.method public final getUserData()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/amazon/ags/client/RequestResponseImpl;->userData:[Ljava/lang/Object;

    return-object v0
.end method

.method public final isError()Z
    .locals 1

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/amazon/ags/client/RequestResponseImpl;->getError()Lcom/amazon/ags/api/ErrorCode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/api/ErrorCode;->isError()Z

    move-result v0

    return v0
.end method

.method public final setUserData([Ljava/lang/Object;)V
    .locals 0
    .param p1, "userData"    # [Ljava/lang/Object;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/amazon/ags/client/RequestResponseImpl;->userData:[Ljava/lang/Object;

    .line 75
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ResponseCode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->responseCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n ErrorCode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->errorCode:Lcom/amazon/ags/api/ErrorCode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/amazon/ags/client/RequestResponseImpl;->userData:[Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/client/RequestResponseImpl;->userData:[Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 57
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n requestType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/ags/client/RequestResponseImpl;->getEventType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    return-object v0
.end method
