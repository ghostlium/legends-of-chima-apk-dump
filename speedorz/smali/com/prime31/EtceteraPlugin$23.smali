.class Lcom/prime31/EtceteraPlugin$23;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin;->askForReviewNow(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/EtceteraPlugin;

.field private final synthetic val$message:Ljava/lang/String;

.field private final synthetic val$prefs:Landroid/content/SharedPreferences;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$23;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/prime31/EtceteraPlugin$23;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/prime31/EtceteraPlugin$23;->val$prefs:Landroid/content/SharedPreferences;

    .line 1071
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;
    .locals 1

    .prologue
    .line 1071
    iget-object v0, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/16 v14, 0xa

    const/4 v13, 0x5

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1075
    new-instance v3, Landroid/app/Dialog;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v3, v10}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 1076
    .local v3, "dialog":Landroid/app/Dialog;
    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->val$title:Ljava/lang/String;

    invoke-virtual {v3, v10}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1077
    invoke-virtual {v3, v11}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 1078
    invoke-virtual {v3, v11}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 1080
    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v4, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1081
    .local v4, "ll":Landroid/widget/LinearLayout;
    invoke-virtual {v4, v13, v11, v13, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1082
    invoke-virtual {v4, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1084
    new-instance v7, Landroid/widget/TextView;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v7, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1085
    .local v7, "tv":Landroid/widget/TextView;
    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 1086
    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->val$message:Ljava/lang/String;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1087
    const/16 v10, 0x1f4

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setWidth(I)V

    .line 1088
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1091
    new-instance v8, Landroid/view/View;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v8, v10}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1092
    .local v8, "v":Landroid/view/View;
    new-instance v10, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v10, v14, v14}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1093
    invoke-virtual {v4, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1095
    new-instance v0, Landroid/widget/Button;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v0, v10}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1096
    .local v0, "b1":Landroid/widget/Button;
    const-string v10, "Yes, rate it!"

    invoke-virtual {v0, v10}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1097
    new-instance v10, Lcom/prime31/EtceteraPlugin$23$1;

    iget-object v11, p0, Lcom/prime31/EtceteraPlugin$23;->val$prefs:Landroid/content/SharedPreferences;

    invoke-direct {v10, p0, v11, v3}, Lcom/prime31/EtceteraPlugin$23$1;-><init>(Lcom/prime31/EtceteraPlugin$23;Landroid/content/SharedPreferences;Landroid/app/Dialog;)V

    invoke-virtual {v0, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1133
    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1135
    new-instance v1, Landroid/widget/Button;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v1, v10}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1136
    .local v1, "b2":Landroid/widget/Button;
    const-string v10, "Remind me later"

    invoke-virtual {v1, v10}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1137
    new-instance v10, Lcom/prime31/EtceteraPlugin$23$2;

    invoke-direct {v10, p0, v3}, Lcom/prime31/EtceteraPlugin$23$2;-><init>(Lcom/prime31/EtceteraPlugin$23;Landroid/app/Dialog;)V

    invoke-virtual {v1, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1145
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1147
    new-instance v2, Landroid/widget/Button;

    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v2, v10}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 1148
    .local v2, "b3":Landroid/widget/Button;
    const-string v10, "Don\'t ask again"

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1149
    new-instance v10, Lcom/prime31/EtceteraPlugin$23$3;

    iget-object v11, p0, Lcom/prime31/EtceteraPlugin$23;->val$prefs:Landroid/content/SharedPreferences;

    invoke-direct {v10, p0, v11, v3}, Lcom/prime31/EtceteraPlugin$23$3;-><init>(Lcom/prime31/EtceteraPlugin$23;Landroid/content/SharedPreferences;Landroid/app/Dialog;)V

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1161
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1163
    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 1164
    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    .line 1167
    iget-object v10, p0, Lcom/prime31/EtceteraPlugin$23;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-virtual {v10}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v10

    invoke-interface {v10}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Display;->getWidth()I

    move-result v6

    .line 1168
    .local v6, "screenWidth":I
    int-to-float v10, v6

    const v11, 0x3f4ccccd    # 0.8f

    mul-float v9, v10, v11

    .line 1170
    .local v9, "width":F
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0xb

    if-lt v10, v11, :cond_0

    .line 1171
    const/high16 v9, 0x43e10000    # 450.0f

    .line 1173
    :cond_0
    new-instance v5, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v5}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 1174
    .local v5, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/view/WindowManager$LayoutParams;->copyFrom(Landroid/view/WindowManager$LayoutParams;)I

    .line 1175
    float-to-int v10, v9

    iput v10, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 1177
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10, v5}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1178
    return-void
.end method
