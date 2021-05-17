.class Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;
.super Ljava/lang/Object;
.source "ClientConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/html5/util/ClientConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigEntry"
.end annotation


# instance fields
.field private final max:J

.field private final min:J

.field private value:J


# direct methods
.method public constructor <init>(JJJ)V
    .locals 0
    .param p1, "min"    # J
    .param p3, "value"    # J
    .param p5, "max"    # J

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput-wide p1, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->min:J

    .line 126
    iput-wide p5, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->max:J

    .line 127
    invoke-virtual {p0, p3, p4}, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->setValue(J)V

    .line 128
    return-void
.end method


# virtual methods
.method public getValue()J
    .locals 2

    .prologue
    .line 131
    iget-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->value:J

    return-wide v0
.end method

.method public setValue(J)V
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 135
    iget-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->min:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 136
    invoke-static {}, Lcom/amazon/ags/html5/util/ClientConfig;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Config value too small: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iget-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->min:J

    iput-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->value:J

    .line 144
    :goto_0
    return-void

    .line 138
    :cond_0
    iget-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->max:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    .line 139
    invoke-static {}, Lcom/amazon/ags/html5/util/ClientConfig;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Config value too large: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->max:J

    iput-wide v0, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->value:J

    goto :goto_0

    .line 142
    :cond_1
    iput-wide p1, p0, Lcom/amazon/ags/html5/util/ClientConfig$ConfigEntry;->value:J

    goto :goto_0
.end method
