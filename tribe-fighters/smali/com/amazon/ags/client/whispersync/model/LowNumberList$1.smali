.class final Lcom/amazon/ags/client/whispersync/model/LowNumberList$1;
.super Ljava/lang/Object;
.source "LowNumberList.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/client/whispersync/model/LowNumberList;
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
        "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/amazon/ags/client/whispersync/model/NumberElement;Lcom/amazon/ags/client/whispersync/model/NumberElement;)I
    .locals 8
    .param p1, "o1"    # Lcom/amazon/ags/client/whispersync/model/NumberElement;
    .param p2, "o2"    # Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .prologue
    const-wide/16 v6, 0x0

    .line 16
    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    iget-object v3, p2, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v2, v3}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v2

    if-nez v2, :cond_2

    .line 19
    invoke-virtual {p2}, Lcom/amazon/ags/client/whispersync/model/NumberElement;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/NumberElement;->getTimestamp()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 20
    .local v0, "timeDifference":J
    cmp-long v2, v0, v6

    if-nez v2, :cond_0

    .line 21
    const/4 v2, 0x0

    .line 25
    .end local v0    # "timeDifference":J
    :goto_0
    return v2

    .line 23
    .restart local v0    # "timeDifference":J
    :cond_0
    cmp-long v2, v0, v6

    if-lez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    goto :goto_0

    .line 25
    .end local v0    # "timeDifference":J
    :cond_2
    iget-object v2, p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    iget-object v3, p2, Lcom/amazon/ags/client/whispersync/model/NumberElement;->value:Ljava/math/BigDecimal;

    invoke-virtual {v2, v3}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v2

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 13
    check-cast p1, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/model/LowNumberList$1;->compare(Lcom/amazon/ags/client/whispersync/model/NumberElement;Lcom/amazon/ags/client/whispersync/model/NumberElement;)I

    move-result v0

    return v0
.end method
