.class Lcom/amazon/ags/client/LifecycleCallbacks$1;
.super Ljava/lang/Object;
.source "LifecycleCallbacks.java"

# interfaces
.implements Lcom/amazon/ags/api/AmazonGamesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/LifecycleCallbacks;->onActivityResumed(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/LifecycleCallbacks;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/LifecycleCallbacks;)V
    .locals 0

    .prologue
    .line 48
    iput-object p1, p0, Lcom/amazon/ags/client/LifecycleCallbacks$1;->this$0:Lcom/amazon/ags/client/LifecycleCallbacks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V
    .locals 0
    .param p1, "reason"    # Lcom/amazon/ags/api/AmazonGamesStatus;

    .prologue
    .line 54
    return-void
.end method

.method public onServiceReady(Lcom/amazon/ags/api/AmazonGamesClient;)V
    .locals 0
    .param p1, "amazonGamesClient"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 51
    return-void
.end method
