Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA1C43458
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jun 2026 18:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AD441F000E9; Tue, 30 Jun 2026 18:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39891F00ADB
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 18:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782844513;
	bh=sI0lt3lHxBAyqRmSehiS+aCcgT00y2uM5aAS6/uPF+c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=YBYkOyGD6+FPGCuPFCBeKSuHtOIli6u1Go6335jsHsaNbH3P6O7ny3DkcG5Vi+Qqj
	 0m0H5KitHEkEYEgqxNeDz4GCBoRQTswv5jszKZ0gbKVTzBB35Jh2bhWL1kibFhy7cp
	 xd2BDaa/4s7CwxJFKfQf3y0uCYOqguK9S8ql3MkkYliB6Ypra24P/3rTAKvEIwISio
	 NoblvW999QCaDW6Jn5pVMWKQF6nQuiZDao8QouKTcYptlB6bO8iNOIX3UZYzKZlZNg
	 Qav0qhcFAZOMgX2WxFro43wjmoHZYy1vAm2UrtTc6JJWrL/7X7ooW3+L3y/iwM1c8B
	 QxtRcVE9MyXjg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-665153dfd24so221645d50.2
        for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 11:35:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDJf+P49lZbntFiCBl2yaT8/qKW6YaiB3S7NM4Q9DgPT/cDHT+15dwtG8bcABVz0HffPkCAfM+jQ0XWutJ2g==@kernel.org
X-Gm-Message-State: AOJu0YxYQyvnOmLXb7o82Icpbxaslmw4h4TdIcCrW0ypw1z+O4I83SX9
	53lPckdT9wE1LJIJdWstgevgPlHDkTKe+j0e4uSwzVaHec950tX3Z01ow0ERnVzULEmxPb9vllT
	WVStAksPzowJhCy3JQuItFMU6cplxeLQ=
X-Received: by 2002:a05:690e:588:b0:664:e430:cb8a with SMTP id
 956f58d0204a3-664f9828a4dmr3821866d50.37.1782844513138; Tue, 30 Jun 2026
 11:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <CO1PR02MB85698F560E017D2B9DAD0B31F9EB2@CO1PR02MB8569.namprd02.prod.outlook.com>
 <uppnuvd6qxtusromxs3yk4e2bl3fe3s2ab2umtusz2nnmfzs6h@ov5sltjdczld>
In-Reply-To: <uppnuvd6qxtusromxs3yk4e2bl3fe3s2ab2umtusz2nnmfzs6h@ov5sltjdczld>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 30 Jun 2026 14:35:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7JP=BuOHfbPRQ=aQ5FNXgv5gY1KRj+s1emaz2=rSyjaQ@mail.gmail.com>
X-Gm-Features: AVVi8CdAUfzzE3WFMkQfolQoTGymtW2wHjdwVg-GozASGiB6_j9jP7ilB7WmuY8
Message-ID: <CA+5PVA7JP=BuOHfbPRQ=aQ5FNXgv5gY1KRj+s1emaz2=rSyjaQ@mail.gmail.com>
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srikanth Katakam <skatakam@qti.qualcomm.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>, 
	Raghukanth Joshi <raghukan@qti.qualcomm.com>, Raju Panga <rajup@qti.qualcomm.com>, 
	Venkata Kota <vkasinat@qti.qualcomm.com>, Komal Bajaj <kbajaj@qti.qualcomm.com>, 
	Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 4:22=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jun 26, 2026 at 05:23:50PM +0000, Srikanth Katakam wrote:
> > The following changes since commit 1bd9b36771d9087ea76588812995587fc002=
4245:
> >
> >   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53=
:01 +0000)
> >
> > are available in the git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git* modem=
-fw-shikra6
> >
> > for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744=
:
> >
> >   qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:5=
2 +0530)
>
> This is still being ignored by the robot (as was the previous one).
>
> Josh, Mario, do you know why?

I don't.  The bot runs somewhere else and I haven't tried to run it
locally.  There are a few other common senders where it doesn't pick
up the patch/MR but I haven't dug into why.

josh

>
> Srikanth, could you please check, what is wrong / different? I see that
> you are still sending the MRs from the outlook. Could you please switch
> to Gmail or to any other, normal^W friendly email provider?
>
> --
> With best wishes
> Dmitry
