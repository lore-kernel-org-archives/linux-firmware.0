Return-Path: <SRS0=7hAb=RI=gmail.com=mark.herbert42@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6E5C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Dec 2021 17:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06353C36AEB; Thu, 23 Dec 2021 17:24:41 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 787C4C36AE5
	for <linux-firmware@kernel.org>; Thu, 23 Dec 2021 17:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 787C4C36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id 30so11060958uag.13
        for <linux-firmware@kernel.org>; Thu, 23 Dec 2021 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UsLqcN3VrQbiXiT9RYcDjkf3ZsyVZe1OV/46O03wtMQ=;
        b=qgRoOv8bIQlh2K3C1Wh8HtWe+wBsbJTdJTR+tlA30w/DXtKuzCxtp/PKQA7JhbBUHv
         alskGqrEGHgDtVTKIHqyPn+cbotGZXCy43HS51CKfksfPOWYFuh7sMw8/8HKF+5CpsId
         sm/qhbQPST0Um5NwmeDY19zFWG/GWMYmyt2xQ+o1nz0y8NNOj4M+aCU3OTl332YcD182
         6IkVXa6Ykzb0KpCG74jQPcm9ep9WdGQbtkTxbVRaOum4T7b+KtZaDflATz8mtCVt4m8g
         vLlwwejTxVaknS6SUvyTjUYLGuAFMYWc7KfQMYUmkScEXxypCBRr7oiyeurm6xsFbnA9
         CYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UsLqcN3VrQbiXiT9RYcDjkf3ZsyVZe1OV/46O03wtMQ=;
        b=F8ev6EzjJ83vM4CvGjFEiQe5vVbKYIqrNSEzMsdeb7JhLAAwrkNNHlhT3wqXBQAeTy
         3qey5O7iFDxouQV55IrIOeYQIf2akzmNYe1RzGTP0N1Fn3Kiq4vwyKYxKBmP0GVp3jGJ
         W3/CAFpw/OQ3wJ7LBRJ0ruSlbLaU0ihmBDJHfmA4I2+mGIyKgHrdPZLsUOVH+AYiKp0z
         7bOUUZGsC01RrguSfZRFDI4sBw/jbkYezNOzHKabCgd30tkYLlS1rjwxN/eIpDJOUL74
         W8qnEuq1RdsUyWTBnaiHGnEPHrwkrhC/IpE1yhE6EDG3TfdnPv716jjaJcMELvMwYZFl
         8lqw==
X-Gm-Message-State: AOAM530MdY5WYIw+7JJe5U/OPHr/4t6JA0n1U3L4aX/mYoF9uetkuIWU
	PSeGE0ezOpPNCX7ex1DX6jkDWJakFtDiUx/WchQ=
X-Google-Smtp-Source: ABdhPJzPNrXKOK4Or4V/ujir5wCf5tRqdHnqduLKQSmJhl/4E7SA4TwXGt5RheFiuJXeoL/jc4p9tiY8r1t8LnQooCw=
X-Received: by 2002:a67:f613:: with SMTP id k19mr569914vso.31.1640280278460;
 Thu, 23 Dec 2021 09:24:38 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Mark Herbert <mark.herbert42@gmail.com>
Date: Thu, 23 Dec 2021 20:24:25 +0300
Message-ID: <CAPFgQnGtdO+MNykM9xJ14E=rnE6_t+Zs+nV-TjNwEL+5g3wEdA@mail.gmail.com>
Subject: Re: [PULL] ath11k firmware 20211223
To: Kalle Valo <kvalo@qca.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Content-Type: multipart/alternative; boundary="000000000000546dab05d3d38306"

--000000000000546dab05d3d38306
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will there be a new firmware fo 6390? It is the oldest one in the
repository and buggy as hell. Hibernation is impossible uless the newer
firmware hacked from Windows drivers , and firmware is being updated for
all ath11k chips except this one. 14 month - still same buggy blob...


=D1=87=D1=82, 23 =D0=B4=D0=B5=D0=BA. 2021 =D0=B3., 17:03 Kalle Valo <kvalo@=
qca.qualcomm.com>:

> Hi linux-firmware maintainers,
>
> here's a pull request to update ath11k firmware images. We have new
> hardware support WCN6855 and QCN9074, but also updates to existing hardwa=
re.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit
> f682ecb015df087613f91872712eb6c0f6c998a8:
>
>   Merge https://github.com/pkshih/linux-firmware into main (2021-12-16
> 09:42:51 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git
> ath10k-20211223
>
> for you to fetch changes up to 0f161f385f3854086b4fdae2dae786ab6bd3efa5:
>
>   ath11k: WCN6855 hw2.0: add to
> WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2 (2021-12-23 12:40:55
> +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (5):
>       ath11k: IPQ6018 hw1.0: update to
> WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>       ath11k: IPQ8074 hw2.0: update to
> WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>       ath11k: QCN9074 hw1.0: add to
> WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>       ath11k: WCN6855 hw2.0: add to
> WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
>
>  WHENCE                           |   14 +-
>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-
>  ath11k/IPQ6018/hw1.0/m3_fw.b01   |  Bin 6712 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b02   |  Bin 294912 -> 294912 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt   |  Bin 6860 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00   |  Bin 340 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01   |  Bin 7000 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03   |  Bin 2357712 -> 2557456 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04   |  Bin 370560 -> 412192 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05   |  Bin 175588 -> 197988 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07   |  Bin 8936 -> 9408 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08   |  Bin 409914 -> 452780 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt   |  Bin 7340 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/Notice.txt  |   48 +-
>  ath11k/IPQ8074/hw2.0/m3_fw.b01   |  Bin 136 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02   |  Bin 327680 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt   |  Bin 284 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00   |  Bin 340 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01   |  Bin 328 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02   |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03   |  Bin 2589264 -> 2934416 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04   |  Bin 985504 -> 1009760 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05   |  Bin 387076 -> 243588 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07   |  Bin 7048 -> 9816 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08   |  Bin 424524 -> 485768 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt   |  Bin 668 -> 668 bytes
>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes
>  ath11k/WCN6855/hw2.0/Notice.txt  | 1504
> ++++++++++++++++++++++++++++++++++++++
>  ath11k/WCN6855/hw2.0/amss.bin    |  Bin 0 -> 4984832 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 0 -> 721328 bytes
>  ath11k/WCN6855/hw2.0/m3.bin      |  Bin 0 -> 266684 bytes
>  ath11k/WCN6855/hw2.0/regdb.bin   |  Bin 0 -> 24310 bytes
>  35 files changed, 2382 insertions(+), 34 deletions(-)
>  create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt
>  create mode 100644 ath11k/QCN9074/hw1.0/amss.bin
>  create mode 100644 ath11k/QCN9074/hw1.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k
>

--000000000000546dab05d3d38306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Will there be a new firmware fo 6390? It is the oldest on=
e in the repository and buggy as hell. Hibernation is impossible uless the =
newer firmware hacked from Windows drivers , and firmware is being updated =
for all ath11k chips except this one. 14 month - still same buggy blob...<d=
iv dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">=D1=87=D1=82, 23 =D0=B4=D0=B5=D0=BA. 2021 =D0=B3.=
, 17:03 Kalle Valo &lt;<a href=3D"mailto:kvalo@qca.qualcomm.com">kvalo@qca.=
qualcomm.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi linux-firm=
ware maintainers,<br>
<br>
here&#39;s a pull request to update ath11k firmware images. We have new har=
dware support WCN6855 and QCN9074, but also updates to existing hardware.<b=
r>
<br>
Please let me know if there are any problems.<br>
<br>
Kalle<br>
<br>
The following changes since commit f682ecb015df087613f91872712eb6c0f6c998a8=
:<br>
<br>
=C2=A0 Merge <a href=3D"https://github.com/pkshih/linux-firmware" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://github.com/pkshih/linux-firm=
ware</a> into main (2021-12-16 09:42:51 -0500)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git/kval=
o/linux-firmware.git" rel=3D"noreferrer noreferrer" target=3D"_blank">git.k=
ernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git</a> ath10k-2021=
1223<br>
<br>
for you to fetch changes up to 0f161f385f3854086b4fdae2dae786ab6bd3efa5:<br=
>
<br>
=C2=A0 ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SI=
LICONZ_LITE-2 (2021-12-23 12:40:55 +0200)<br>
<br>
----------------------------------------------------------------<br>
Kalle Valo (5):<br>
=C2=A0 =C2=A0 =C2=A0 ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01100=
-QCAHKSWPL_SILICONZ-1<br>
=C2=A0 =C2=A0 =C2=A0 ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01100=
-QCAHKSWPL_SILICONZ-1<br>
=C2=A0 =C2=A0 =C2=A0 ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01100-QC=
AHKSWPL_SILICONZ-1<br>
=C2=A0 =C2=A0 =C2=A0 ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin<b=
r>
=C2=A0 =C2=A0 =C2=A0 ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHS=
PSWPL_V1_V2_SILICONZ_LITE-2<br>
<br>
=C2=A0WHENCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +-<br>
=C2=A0ath11k/IPQ6018/hw1.0/Notice.txt=C2=A0 |=C2=A0 =C2=A048 +-<br>
=C2=A0ath11k/IPQ6018/hw1.0/m3_fw.b01=C2=A0 =C2=A0|=C2=A0 Bin 6712 -&gt; 671=
2 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/m3_fw.b02=C2=A0 =C2=A0|=C2=A0 Bin 294912 -&gt; 2=
94912 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/m3_fw.mdt=C2=A0 =C2=A0|=C2=A0 Bin 6860 -&gt; 686=
0 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b00=C2=A0 =C2=A0|=C2=A0 Bin 340 -&gt; 340 =
bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b01=C2=A0 =C2=A0|=C2=A0 Bin 7000 -&gt; 700=
0 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b02=C2=A0 =C2=A0|=C2=A0 Bin 4696 -&gt; 469=
6 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b03=C2=A0 =C2=A0|=C2=A0 Bin 2357712 -&gt; =
2557456 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b04=C2=A0 =C2=A0|=C2=A0 Bin 370560 -&gt; 4=
12192 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b05=C2=A0 =C2=A0|=C2=A0 Bin 175588 -&gt; 1=
97988 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b07=C2=A0 =C2=A0|=C2=A0 Bin 8936 -&gt; 940=
8 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.b08=C2=A0 =C2=A0|=C2=A0 Bin 409914 -&gt; 4=
52780 bytes<br>
=C2=A0ath11k/IPQ6018/hw1.0/q6_fw.mdt=C2=A0 =C2=A0|=C2=A0 Bin 7340 -&gt; 734=
0 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/Notice.txt=C2=A0 |=C2=A0 =C2=A048 +-<br>
=C2=A0ath11k/IPQ8074/hw2.0/m3_fw.b01=C2=A0 =C2=A0|=C2=A0 Bin 136 -&gt; 136 =
bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/m3_fw.b02=C2=A0 =C2=A0|=C2=A0 Bin 327680 -&gt; 3=
27680 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/m3_fw.mdt=C2=A0 =C2=A0|=C2=A0 Bin 284 -&gt; 284 =
bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b00=C2=A0 =C2=A0|=C2=A0 Bin 340 -&gt; 340 =
bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b01=C2=A0 =C2=A0|=C2=A0 Bin 328 -&gt; 328 =
bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b02=C2=A0 =C2=A0|=C2=A0 Bin 4696 -&gt; 469=
6 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b03=C2=A0 =C2=A0|=C2=A0 Bin 2589264 -&gt; =
2934416 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b04=C2=A0 =C2=A0|=C2=A0 Bin 985504 -&gt; 1=
009760 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b05=C2=A0 =C2=A0|=C2=A0 Bin 387076 -&gt; 2=
43588 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b07=C2=A0 =C2=A0|=C2=A0 Bin 7048 -&gt; 981=
6 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.b08=C2=A0 =C2=A0|=C2=A0 Bin 424524 -&gt; 4=
85768 bytes<br>
=C2=A0ath11k/IPQ8074/hw2.0/q6_fw.mdt=C2=A0 =C2=A0|=C2=A0 Bin 668 -&gt; 668 =
bytes<br>
=C2=A0ath11k/QCN9074/hw1.0/Notice.txt=C2=A0 |=C2=A0 802 +++++++++++++++++++=
+<br>
=C2=A0ath11k/QCN9074/hw1.0/amss.bin=C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 118976=
76 bytes<br>
=C2=A0ath11k/QCN9074/hw1.0/m3.bin=C2=A0 =C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 3=
40108 bytes<br>
=C2=A0ath11k/WCN6855/hw2.0/Notice.txt=C2=A0 | 1504 ++++++++++++++++++++++++=
++++++++++++++<br>
=C2=A0ath11k/WCN6855/hw2.0/amss.bin=C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 498483=
2 bytes<br>
=C2=A0ath11k/WCN6855/hw2.0/board-2.bin |=C2=A0 Bin 0 -&gt; 721328 bytes<br>
=C2=A0ath11k/WCN6855/hw2.0/m3.bin=C2=A0 =C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 2=
66684 bytes<br>
=C2=A0ath11k/WCN6855/hw2.0/regdb.bin=C2=A0 =C2=A0|=C2=A0 Bin 0 -&gt; 24310 =
bytes<br>
=C2=A035 files changed, 2382 insertions(+), 34 deletions(-)<br>
=C2=A0create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt<br>
=C2=A0create mode 100644 ath11k/QCN9074/hw1.0/amss.bin<br>
=C2=A0create mode 100644 ath11k/QCN9074/hw1.0/m3.bin<br>
=C2=A0create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt<br>
=C2=A0create mode 100644 ath11k/WCN6855/hw2.0/amss.bin<br>
=C2=A0create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin<br>
=C2=A0create mode 100644 ath11k/WCN6855/hw2.0/m3.bin<br>
=C2=A0create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin<br>
<br>
-- <br>
ath11k mailing list<br>
<a href=3D"mailto:ath11k@lists.infradead.org" target=3D"_blank" rel=3D"nore=
ferrer">ath11k@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/ath11k" rel=3D"noref=
errer noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/list=
info/ath11k</a><br>
</blockquote></div>

--000000000000546dab05d3d38306--
