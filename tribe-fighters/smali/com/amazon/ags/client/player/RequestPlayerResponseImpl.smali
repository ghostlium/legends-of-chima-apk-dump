.class public Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "RequestPlayerResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/player/RequestPlayerResponse;


# instance fields
.field private final player:Lcom/amazon/ags/api/player/Player;


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;->player:Lcom/amazon/ags/api/player/Player;

    .line 27
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/api/player/Player;I)V
    .locals 0
    .param p1, "player"    # Lcom/amazon/ags/api/player/Player;
    .param p2, "responseCode"    # I

    .prologue
    .line 20
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 21
    iput-object p1, p0, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;->player:Lcom/amazon/ags/api/player/Player;

    .line 22
    return-void
.end method


# virtual methods
.method public getEventType()I
    .locals 1

    .prologue
    .line 31
    const/16 v0, 0x12

    return v0
.end method

.method public getPlayer()Lcom/amazon/ags/api/player/Player;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;->player:Lcom/amazon/ags/api/player/Player;

    return-object v0
.end method
