.class public Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;
.super Ljava/lang/Object;
.source "SharedPrefsUniqueIdService.java"

# interfaces
.implements Lcom/amazon/insights/core/idresolver/UniqueIdService;


# static fields
.field protected static final PREFS_NAME:Ljava/lang/String;

.field protected static final UNIQUE_ID_KEY:Ljava/lang/String; = "UniqueId"

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final generator:Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->logger:Lcom/amazon/insights/core/log/Logger;

    .line 15
    const-class v0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->PREFS_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;)V
    .locals 0
    .param p1, "generator"    # Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->generator:Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;

    .line 34
    return-void
.end method

.method private getIdFromPreferences(Lcom/amazon/insights/core/system/Preferences;)Lcom/amazon/insights/core/idresolver/Id;
    .locals 4
    .param p1, "preferences"    # Lcom/amazon/insights/core/system/Preferences;

    .prologue
    .line 53
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    .line 55
    .local v0, "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    const-string v2, "UniqueId"

    const/4 v3, 0x0

    invoke-interface {p1, v2, v3}, Lcom/amazon/insights/core/system/Preferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "uniqueIdString":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 58
    new-instance v0, Lcom/amazon/insights/core/idresolver/Id;

    .end local v0    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    invoke-direct {v0, v1}, Lcom/amazon/insights/core/idresolver/Id;-><init>(Ljava/lang/String;)V

    .line 61
    .restart local v0    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    :cond_0
    return-object v0
.end method

.method public static newInstance()Lcom/amazon/insights/core/idresolver/UniqueIdService;
    .locals 2

    .prologue
    .line 25
    new-instance v0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;

    new-instance v1, Lcom/amazon/insights/core/idresolver/RandomUUIDGenerator;

    invoke-direct {v1}, Lcom/amazon/insights/core/idresolver/RandomUUIDGenerator;-><init>()V

    invoke-direct {v0, v1}, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;-><init>(Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;)V

    return-object v0
.end method

.method private storeUniqueId(Lcom/amazon/insights/core/system/Preferences;Lcom/amazon/insights/core/idresolver/Id;)V
    .locals 3
    .param p1, "preferences"    # Lcom/amazon/insights/core/system/Preferences;
    .param p2, "uniqueId"    # Lcom/amazon/insights/core/idresolver/Id;

    .prologue
    .line 66
    :try_start_0
    const-string v1, "UniqueId"

    invoke-virtual {p2}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lcom/amazon/insights/core/system/Preferences;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "There was an exception when trying to store the unique id into the Preferences"

    invoke-virtual {v1, v2, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public getUniqueId(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/core/idresolver/Id;
    .locals 2
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 38
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v1

    if-nez v1, :cond_2

    .line 39
    :cond_0
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    .line 49
    :cond_1
    :goto_0
    return-object v0

    .line 42
    :cond_2
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->getIdFromPreferences(Lcom/amazon/insights/core/system/Preferences;)Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    .line 43
    .local v0, "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 45
    new-instance v0, Lcom/amazon/insights/core/idresolver/Id;

    .end local v0    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    iget-object v1, p0, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->generator:Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;

    invoke-interface {v1}, Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;->generateUniqueIdString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/insights/core/idresolver/Id;-><init>(Ljava/lang/String;)V

    .line 46
    .restart local v0    # "uniqueId":Lcom/amazon/insights/core/idresolver/Id;
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v1

    invoke-interface {v1}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/amazon/insights/core/idresolver/SharedPrefsUniqueIdService;->storeUniqueId(Lcom/amazon/insights/core/system/Preferences;Lcom/amazon/insights/core/idresolver/Id;)V

    goto :goto_0
.end method
