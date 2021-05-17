.class public Lcom/amazon/ags/client/session/InitializeSessionResponse;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "InitializeSessionResponse.java"


# instance fields
.field private final authorizeResult:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/session/InitializeSessionResponse;->authorizeResult:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "authorizeResult"    # Ljava/lang/String;
    .param p2, "responseCode"    # I

    .prologue
    .line 16
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 17
    iput-object p1, p0, Lcom/amazon/ags/client/session/InitializeSessionResponse;->authorizeResult:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public getAuthorizeResult()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/amazon/ags/client/session/InitializeSessionResponse;->authorizeResult:Ljava/lang/String;

    return-object v0
.end method
