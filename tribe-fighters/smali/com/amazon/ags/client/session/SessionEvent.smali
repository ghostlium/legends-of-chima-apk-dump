.class public Lcom/amazon/ags/client/session/SessionEvent;
.super Ljava/lang/Object;
.source "SessionEvent.java"


# instance fields
.field private final actionCode:Ljava/lang/String;

.field private final timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "actionCode"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/ags/client/session/SessionEvent;->timestamp:J

    .line 18
    iput-object p1, p0, Lcom/amazon/ags/client/session/SessionEvent;->actionCode:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public getActionCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/amazon/ags/client/session/SessionEvent;->actionCode:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/amazon/ags/client/session/SessionEvent;->timestamp:J

    return-wide v0
.end method
