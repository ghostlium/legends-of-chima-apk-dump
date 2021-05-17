.class final Lcom/flurry/android/az;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic cZ:Ljava/lang/String;

.field private synthetic da:J

.field private synthetic db:Lcom/flurry/android/bo;


# direct methods
.method constructor <init>(Lcom/flurry/android/bo;Ljava/lang/String;J)V
    .locals 0

    .prologue
    .line 284
    iput-object p1, p0, Lcom/flurry/android/az;->db:Lcom/flurry/android/bo;

    iput-object p2, p0, Lcom/flurry/android/az;->cZ:Ljava/lang/String;

    iput-wide p3, p0, Lcom/flurry/android/az;->da:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleResponse(Lcom/flurry/android/AppCloudResponse;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 288
    iget-object v0, p0, Lcom/flurry/android/az;->db:Lcom/flurry/android/bo;

    iget-object v1, p0, Lcom/flurry/android/az;->cZ:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flurry/android/bo;->a(Lcom/flurry/android/bo;Lcom/flurry/android/AppCloudResponse;Ljava/lang/String;)Z

    .line 289
    iget-object v0, p0, Lcom/flurry/android/az;->db:Lcom/flurry/android/bo;

    iget-object v1, p0, Lcom/flurry/android/az;->cZ:Ljava/lang/String;

    iget-wide v2, p0, Lcom/flurry/android/az;->da:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/bo;->a(Ljava/lang/String;Ljava/lang/Long;)V

    .line 290
    return-void
.end method
