.class public Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;
.super Lcom/amazon/ags/client/RequestResponseImpl;
.source "GetAchievementsResponseImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/achievements/GetAchievementsResponse;


# instance fields
.field private achievements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation
.end field

.field private achievementsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/amazon/ags/api/ErrorCode;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "errorCode"    # Lcom/amazon/ags/api/ErrorCode;

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    .line 20
    iput-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    .line 21
    iput-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/util/List;I)V
    .locals 1
    .param p2, "responseCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "achievements":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/api/achievements/Achievement;>;"
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/RequestResponseImpl;-><init>(I)V

    .line 20
    iput-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    .line 21
    iput-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    .line 26
    iput-object p1, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    .line 27
    return-void
.end method


# virtual methods
.method public final getAchievementsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    return-object v0
.end method

.method public final getAchievementsMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/api/achievements/Achievement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    iget-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    if-nez v2, :cond_0

    .line 41
    const/4 v2, 0x0

    .line 50
    :goto_0
    return-object v2

    .line 43
    :cond_0
    iget-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    if-nez v2, :cond_1

    .line 44
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    .line 45
    iget-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/achievements/Achievement;

    .line 46
    .local v0, "a":Lcom/amazon/ags/api/achievements/Achievement;
    iget-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    invoke-interface {v0}, Lcom/amazon/ags/api/achievements/Achievement;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 50
    .end local v0    # "a":Lcom/amazon/ags/api/achievements/Achievement;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    iget-object v2, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievementsMap:Ljava/util/Map;

    goto :goto_0
.end method

.method public final getEventType()I
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x11

    return v0
.end method

.method public final getNumVisibleAchievements()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->achievements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 58
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 68
    invoke-super {p0}, Lcom/amazon/ags/client/RequestResponseImpl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "text":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n Number of AchievementsClient Returned: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/ags/client/achievements/GetAchievementsResponseImpl;->getNumVisibleAchievements()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    return-object v0
.end method
