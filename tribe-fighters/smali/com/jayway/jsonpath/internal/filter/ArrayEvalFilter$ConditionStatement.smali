.class Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;
.super Ljava/lang/Object;
.source "ArrayEvalFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConditionStatement"
.end annotation


# instance fields
.field private expected:Ljava/lang/String;

.field private final field:Ljava/lang/String;

.field private final operator:Ljava/lang/String;

.field final synthetic this$0:Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;


# direct methods
.method private constructor <init>(Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p2, "field"    # Ljava/lang/String;
    .param p3, "operator"    # Ljava/lang/String;
    .param p4, "expected"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 109
    iput-object p1, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->this$0:Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p2, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->field:Ljava/lang/String;

    .line 111
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->operator:Ljava/lang/String;

    .line 112
    iput-object p4, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->expected:Ljava/lang/String;

    .line 114
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->expected:Ljava/lang/String;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->expected:Ljava/lang/String;

    invoke-virtual {p1, v0, v2, v2}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;->trim(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->expected:Ljava/lang/String;

    .line 117
    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$1;

    .prologue
    .line 104
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;-><init>(Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getExpected()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->expected:Ljava/lang/String;

    return-object v0
.end method

.method public getField()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->field:Ljava/lang/String;

    return-object v0
.end method

.method public getOperator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/jayway/jsonpath/internal/filter/ArrayEvalFilter$ConditionStatement;->operator:Ljava/lang/String;

    return-object v0
.end method
