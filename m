Return-Path: <SRS0=FAd5=GG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D641C00A8F
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Oct 2023 01:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B94AC433C9; Tue, 24 Oct 2023 01:09:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 337E9C433C8
	for <linux-firmware@kernel.org>; Tue, 24 Oct 2023 01:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 337E9C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so57954611fa.2
        for <linux-firmware@kernel.org>; Mon, 23 Oct 2023 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698109796; x=1698714596; darn=kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A59lkny6U117ijkpwfd3oShppbzaFQI4d1CwP/wosk=;
        b=h/G2K03jg9lkBxWpTS159rjnsPYUyW1JYm+29IM1SjskSFrCIMblH1OX3lNiluBj1P
         LYCNmGDGcJ9CiGG6aXW28oINwOkq+m8Q4iaGISWADgbZp7n31D6iD6stxBwDub4emwxi
         ACLt4K1Y5umMKrZQ1OVb6a+rjVCTvgS1HcPqmbp1dt7dDX7j+D6g2sXGE2nlm82VZKCy
         xgyPrciMYp89CLGcFmh52Efmz3zSa5n7mErc8CmM+CpL9d/C1Gz/AaeczDHHn9efiiel
         y3TzDv6EEyE+vTpVaaaMJGclzupeq1e55uuZqXt/B/P/+XpnyCY3S/2CHVOY4iY9B9f+
         QwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698109796; x=1698714596;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A59lkny6U117ijkpwfd3oShppbzaFQI4d1CwP/wosk=;
        b=uxzt1Z8LohxqR63d1rpfrMICiAp9Mr5Qi+p0H9cpWxhsD85oJHCVY255eB0wblNwYt
         7kPXia5BNZ+56I2RV+50kCr+UZMf294CaLEDSM8V7KM66XBYy04sQzbEuoIEEcTh+o/X
         kVg3iQ/zhX2NsPUCXmxW5g9nf6BWs6n6lE92OdaHalHOF7UMxDiYd1V4vAdUwm087Clq
         6kSskdX4rqvRolt6KpuIIsi2z5qLhs+b5xGUPmqPgXh37q4YCdTMvpaf99/LnIahHMA1
         lmnkmPUBzPRoDTDp1nxbZrMEtumoGu6FW0boUk5vgorLG1/qF/jFnlZakIqb+H9wn241
         czag==
X-Gm-Message-State: AOJu0YxfwdQH8kfwvlvlstxcSafdBxRk2Le3tS2RNlmJ1vNOmecPLgR5
	VJ6ljSO39BAZyx6x0/PZBLlCPqBI5a/mJdwxndC715KZ8xfBTA==
X-Google-Smtp-Source: AGHT+IHbJiuoi9HFrUtkYvstTtjaZMY9KEqXTKv5Zg5lGhK5PbAqx/ykqagD6L67FQJOEIvH6fsJYgvtIpMmTw5GWhQ=
X-Received: by 2002:a2e:b00d:0:b0:2c5:260:1026 with SMTP id
 y13-20020a2eb00d000000b002c502601026mr7241732ljk.12.1698109795570; Mon, 23
 Oct 2023 18:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074559.445468-1-kiran.k@intel.com> <653700db.050a0220.66754.9e73@mx.google.com>
In-Reply-To: <653700db.050a0220.66754.9e73@mx.google.com>
From: Mario Limonciello <superm1@gmail.com>
Date: Mon, 23 Oct 2023 20:09:44 -0500
Message-ID: <CA+EcB1MTERVtMACWhr3mq6i1dQ0DVsbrPSvHHz1GTMd8W1JNLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Intel BT: Update firmware file for Intel Bluetooth BE200
List-Id: <linux-firmware.lore.kernel.org>
To: Kiran K <kiran.k@intel.com>, linux-firmware@kernel.org, 
	ravishankar.srivatsa@intel.com
Content-Type: multipart/alternative; boundary="000000000000279d2106086bff7c"

--000000000000279d2106086bff7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This particular one failed CI, please make sure you add a SoB.
robot/patch-1-1698103758 (!41) =C2=B7 Merge requests =C2=B7 kernel-firmware=
 / Linux
Firmware =C2=B7 GitLab
<https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/41>

On Mon, Oct 23, 2023 at 6:25=E2=80=AFPM <superm1@gmail.com> wrote:

> Your request has been forwarded by the Linux Firmware Kernel robot.
> Please follow up at
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests to
> ensure it gets merged
> Your request is 'robot/patch-1-1698103758'
>


--=20
Mario Limonciello
superm1@gmail.com

--000000000000279d2106086bff7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This particular one failed CI, please mak=
e sure you add a SoB.<div><a href=3D"https://gitlab.com/kernel-firmware/lin=
ux-firmware/-/merge_requests/41">robot/patch-1-1698103758 (!41) =C2=B7 Merg=
e requests =C2=B7 kernel-firmware / Linux Firmware =C2=B7 GitLab</a></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Oct 23, 2023 at 6:25=E2=80=AFPM &lt;<a href=3D"mailto:superm1@=
gmail.com">superm1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Your request has been forwarded by the Linux Fi=
rmware Kernel robot.<br>
Please follow up at <a href=3D"https://gitlab.com/kernel-firmware/linux-fir=
mware/-/merge_requests" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/kernel-firmware/linux-firmware/-/merge_requests</a> to ensure it gets =
merged<br>
Your request is &#39;robot/patch-1-1698103758&#39;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><s=
pan style=3D"font-size:x-small"><font color=3D"#666666">Mario Limonciello<b=
r><a href=3D"mailto:superm1@gmail.com" target=3D"_blank">superm1@gmail.com<=
/a></font></span></div>

--000000000000279d2106086bff7c--
