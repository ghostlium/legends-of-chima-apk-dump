.class public Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;
.super Ljava/lang/Object;
.source "WhispersyncResponse.java"


# instance fields
.field private final date:Ljava/lang/String;

.field private final document:Ljava/lang/String;

.field private final versionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "document"    # Ljava/lang/String;
    .param p2, "versionId"    # Ljava/lang/String;
    .param p3, "date"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->document:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->versionId:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->date:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public getDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->date:Ljava/lang/String;

    return-object v0
.end method

.method public getDocument()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->document:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/network/WhispersyncResponse;->versionId:Ljava/lang/String;

    return-object v0
.end method
