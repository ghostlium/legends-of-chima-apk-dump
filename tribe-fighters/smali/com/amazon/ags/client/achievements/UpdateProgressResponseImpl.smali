.class public Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "UpdateProgressResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/achievements/UpdateProgressResponse;


# instance fields
.field private final isNewlyUnlocked:Z


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;->isNewlyUnlocked:Z

    .line 25
    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0
    .param p1, "isNewlyUnlocked"    # Z
    .param p2, "responseCode"    # I

    .prologue
    .line 17
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 19
    iput-boolean p1, p0, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;->isNewlyUnlocked:Z

    .line 20
    return-void
.end method


# virtual methods
.method public isNewlyUnlocked()Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/amazon/ags/client/achievements/UpdateProgressResponseImpl;->isNewlyUnlocked:Z

    return v0
.end method
