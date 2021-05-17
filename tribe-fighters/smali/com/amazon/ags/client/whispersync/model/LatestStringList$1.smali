.class final Lcom/amazon/ags/client/whispersync/model/LatestStringList$1;
.super Ljava/lang/Object;
.source "LatestStringList.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/client/whispersync/model/LatestStringList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/amazon/ags/client/whispersync/model/StringElement;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/amazon/ags/client/whispersync/model/StringElement;Lcom/amazon/ags/client/whispersync/model/StringElement;)I
    .locals 10
    .param p1, "o1"    # Lcom/amazon/ags/client/whispersync/model/StringElement;
    .param p2, "o2"    # Lcom/amazon/ags/client/whispersync/model/StringElement;

    .prologue
    const-wide/16 v8, 0x0

    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 48
    invoke-virtual {p2}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getTimestamp()J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 49
    .local v0, "timeDifference":J
    cmp-long v4, v0, v8

    if-nez v4, :cond_3

    .line 51
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 52
    invoke-virtual {p2}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const/4 v2, 0x0

    .line 61
    :cond_0
    :goto_0
    return v2

    .line 55
    :cond_1
    invoke-virtual {p2}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    move v2, v3

    .line 56
    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/amazon/ags/client/whispersync/model/StringElement;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 61
    :cond_3
    cmp-long v4, v0, v8

    if-lez v4, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 44
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/StringElement;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/amazon/ags/client/whispersync/model/StringElement;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/model/LatestStringList$1;->compare(Lcom/amazon/ags/client/whispersync/model/StringElement;Lcom/amazon/ags/client/whispersync/model/StringElement;)I

    move-result v0

    return v0
.end method
