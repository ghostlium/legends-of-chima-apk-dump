.class public Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;
.super Ljava/lang/Object;
.source "WhispersyncRequest.java"


# instance fields
.field private final document:Ljava/lang/String;

.field private final priorVersionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "document"    # Ljava/lang/String;
    .param p2, "priorVersionId"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->document:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->priorVersionId:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public getDocument()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->document:Ljava/lang/String;

    return-object v0
.end method

.method public getPriorVersionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncRequest;->priorVersionId:Ljava/lang/String;

    return-object v0
.end method
