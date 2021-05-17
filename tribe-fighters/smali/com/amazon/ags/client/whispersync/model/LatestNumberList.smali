.class public Lcom/amazon/ags/client/whispersync/model/LatestNumberList;
.super Lcom/amazon/ags/client/whispersync/model/NumberList;
.source "LatestNumberList.java"


# static fields
.field private static final ITEM_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList$1;

    invoke-direct {v0}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList$1;-><init>()V

    sput-object v0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->ITEM_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/model/NumberList;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "maxSize"    # I
    .param p4, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;I",
            "Lcom/amazon/ags/client/whispersync/model/SyncState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/amazon/ags/client/whispersync/model/NumberList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    .line 34
    return-void
.end method


# virtual methods
.method public deepCopy()Lcom/amazon/ags/client/whispersync/model/LatestNumberList;
    .locals 5

    .prologue
    .line 38
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->name:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->copyElements()Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->maxSize:I

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->state:Lcom/amazon/ags/client/whispersync/model/SyncState;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 11
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->deepCopy()Lcom/amazon/ags/client/whispersync/model/LatestNumberList;

    move-result-object v0

    return-object v0
.end method

.method public getComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;->ITEM_COMPARATOR:Ljava/util/Comparator;

    return-object v0
.end method

.method public getSyncableType()Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    return-object v0
.end method
