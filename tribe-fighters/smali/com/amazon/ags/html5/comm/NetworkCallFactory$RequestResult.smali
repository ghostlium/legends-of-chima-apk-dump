.class Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;
.super Ljava/lang/Object;
.source "NetworkCallFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/comm/NetworkCallFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RequestResult"
.end annotation


# instance fields
.field private final responseCode:Ljava/lang/String;

.field private final responseJSON:Ljava/lang/String;

.field final synthetic this$0:Lcom/amazon/ags/html5/comm/NetworkCallFactory;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/html5/comm/NetworkCallFactory;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "responseJSON"    # Ljava/lang/String;
    .param p3, "responseCode"    # Ljava/lang/String;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->this$0:Lcom/amazon/ags/html5/comm/NetworkCallFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 265
    iput-object p2, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->responseJSON:Ljava/lang/String;

    .line 266
    iput-object p3, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->responseCode:Ljava/lang/String;

    .line 267
    return-void
.end method


# virtual methods
.method public getResponseCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->responseCode:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseJSON()Ljava/lang/String;
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lcom/amazon/ags/html5/comm/NetworkCallFactory$RequestResult;->responseJSON:Ljava/lang/String;

    return-object v0
.end method
