.class public Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "WhispersyncEnabledResponse.java"


# instance fields
.field private final whispersyncEnabled:Z


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;->whispersyncEnabled:Z

    .line 18
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 0
    .param p1, "responseCode"    # I
    .param p2, "whispersyncEnabled"    # Z

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 22
    iput-boolean p2, p0, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;->whispersyncEnabled:Z

    .line 23
    return-void
.end method


# virtual methods
.method public isWhispersyncEnabled()Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/amazon/ags/client/session/WhispersyncEnabledResponse;->whispersyncEnabled:Z

    return v0
.end method
