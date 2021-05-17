.class public Lcom/amazon/ags/html5/content/GCVariationManager;
.super Ljava/lang/Object;
.source "GCVariationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;
    }
.end annotation


# static fields
.field private static final APPLICATION_KEY:Ljava/lang/String; = "M3CGOMO6ILJQ65"

.field private static final DEFAULT_MASTER_VARIATION_LIST_NAME:Ljava/lang/String; = "Universal Experiment List"

.field private static final DEFAULT_MASTER_VARIATION_LIST_VARIABLE:Ljava/lang/String; = "experiments"

.field private static final DEFAULT_VARIATION_VARIABLE:Ljava/lang/String; = "treatment"

.field private static final EMPTY_VARIATION_LIST_VALUE:Ljava/lang/String; = ""

.field private static final EXPERIMENT_DELIMITER:Ljava/lang/String; = ";;"

.field private static final NO_VARIABLE_FOUND:Ljava/lang/String; = "GCNoVariableFound"

.field private static final PRIVATE_KEY:Ljava/lang/String; = "jqyngW96w5vk9a3gLSPP0srNdRpFkRi2+Fjl6qMoPrg="

.field private static final TAG:Ljava/lang/String;

.field private static final TREATMENT_DELIMITER:Ljava/lang/String; = ";"

.field private static final VARIATION_LIST_DELIMITER:Ljava/lang/String; = ":"


# instance fields
.field private final credentials:Lcom/amazon/insights/InsightsCredentials;

.field private final masterVariationListName:Ljava/lang/String;

.field private final masterVariationListVariable:Ljava/lang/String;

.field private variationCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/content/GCVariationManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 40
    const-string v0, "Universal Experiment List"

    const-string v1, "experiments"

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/html5/content/GCVariationManager;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "masterVariationListName"    # Ljava/lang/String;
    .param p2, "masterVariationListVariable"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->masterVariationListName:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->masterVariationListVariable:Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->variationCache:Ljava/util/Map;

    .line 47
    const-string v0, "M3CGOMO6ILJQ65"

    const-string v1, "jqyngW96w5vk9a3gLSPP0srNdRpFkRi2+Fjl6qMoPrg="

    invoke-static {v0, v1}, Lcom/amazon/insights/AmazonInsights;->newCredentials(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/InsightsCredentials;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->credentials:Lcom/amazon/insights/InsightsCredentials;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/content/GCVariationManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->masterVariationListName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/content/GCVariationManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->masterVariationListVariable:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/content/GCVariationManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->variationCache:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public getCachedVariations()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->variationCache:Ljava/util/Map;

    return-object v0
.end method

.method public refreshVariations(Landroid/content/Context;Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    .prologue
    .line 51
    const/4 v2, 0x0

    .line 53
    .local v2, "insightsInstance":Lcom/amazon/insights/AmazonInsights;
    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->credentials:Lcom/amazon/insights/InsightsCredentials;

    invoke-static {v3}, Lcom/amazon/insights/AmazonInsights;->getInstance(Lcom/amazon/insights/InsightsCredentials;)Lcom/amazon/insights/AmazonInsights;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 57
    :goto_0
    if-nez v2, :cond_0

    .line 58
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->credentials:Lcom/amazon/insights/InsightsCredentials;

    invoke-static {v3, p1}, Lcom/amazon/insights/AmazonInsights;->newInstance(Lcom/amazon/insights/InsightsCredentials;Landroid/content/Context;)Lcom/amazon/insights/AmazonInsights;

    move-result-object v2

    .line 61
    :cond_0
    if-eqz v2, :cond_3

    .line 62
    invoke-virtual {v2}, Lcom/amazon/insights/AmazonInsights;->getABTestClient()Lcom/amazon/insights/ABTestClient;

    move-result-object v0

    .line 63
    .local v0, "abClient":Lcom/amazon/insights/ABTestClient;
    if-eqz v0, :cond_2

    .line 64
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/amazon/ags/html5/content/GCVariationManager;->masterVariationListName:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-interface {v0, v3}, Lcom/amazon/insights/ABTestClient;->getVariations([Ljava/lang/String;)Lcom/amazon/insights/InsightsHandler;

    move-result-object v3

    new-instance v4, Lcom/amazon/ags/html5/content/GCVariationManager$1;

    invoke-direct {v4, p0, v0, p2}, Lcom/amazon/ags/html5/content/GCVariationManager$1;-><init>(Lcom/amazon/ags/html5/content/GCVariationManager;Lcom/amazon/insights/ABTestClient;Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;)V

    invoke-interface {v3, v4}, Lcom/amazon/insights/InsightsHandler;->setCallback(Lcom/amazon/insights/InsightsCallback;)V

    .line 107
    .end local v0    # "abClient":Lcom/amazon/insights/ABTestClient;
    :cond_1
    :goto_1
    return-void

    .line 54
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/amazon/ags/html5/content/GCVariationManager;->TAG:Ljava/lang/String;

    const-string v4, "Unable to retrieve AmazonInsights instance.  No A/B tests will be available."

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 96
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "abClient":Lcom/amazon/insights/ABTestClient;
    :cond_2
    sget-object v3, Lcom/amazon/ags/html5/content/GCVariationManager;->TAG:Ljava/lang/String;

    const-string v4, "Unable to obtain reference to Insights ABTestClient"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    if-eqz p2, :cond_1

    .line 98
    invoke-interface {p2}, Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;->onRefreshCompleted()V

    goto :goto_1

    .line 102
    .end local v0    # "abClient":Lcom/amazon/insights/ABTestClient;
    :cond_3
    sget-object v3, Lcom/amazon/ags/html5/content/GCVariationManager;->TAG:Ljava/lang/String;

    const-string v4, "Unable to obtain reference to Insights"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    if-eqz p2, :cond_1

    .line 104
    invoke-interface {p2}, Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;->onRefreshCompleted()V

    goto :goto_1
.end method
